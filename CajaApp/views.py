from django.shortcuts import render,redirect
from PedidosApp.models import Cliente, Pedido, DetallePedido
from CajaApp.models import AperturaCaja, ComprobantePago
from django.db.models import Q
from django.db import transaction
from .forms import AperturaCajaForm, ComprobantePagoForm
from django.core.paginator import Paginator
from django.contrib.auth.decorators import login_required, permission_required
from django.forms.models import inlineformset_factory
from django.utils import timezone
from io import BytesIO
from xhtml2pdf import pisa  
from django.http import HttpResponse
from django.template.loader import get_template

# Create your views here.
@login_required
@transaction.atomic
@permission_required('CajaApp.view_aperturacaja', raise_exception=True)
def mostrarcaja(request):
    apertura = AperturaCaja.objects.filter(estadoApertura = True).first()
    if apertura is None:
        if request.method=="POST":
            form= AperturaCajaForm(request.user, request.POST)
            if form.is_valid():
                form.save()
            apertura = AperturaCaja.objects.filter(estadoApertura = True).first()
        else:
            form=AperturaCajaForm(request.user)
    else:
        if request.method=="POST":
            apertura.importeFinal = request.POST['importefinal']
            apertura.fechaCierre = timezone.now()
            apertura.estadoApertura = False
            apertura.save()
        apertura = AperturaCaja.objects.filter(estadoApertura = True).first()
        form=AperturaCajaForm(request.user)
    context={'apertura':apertura, 'form':form}
    return render(request,"caja/mostrar.html",context)

@login_required
@transaction.atomic
@permission_required('CajaApp.add_comprobantepago', raise_exception=True)
def pagarpedido(request, id):
    apertura = AperturaCaja.objects.filter(estadoApertura = True).first()
    if apertura is None:
        return redirect("mostrarcaja")
    else:
        form = ComprobantePagoForm()
        pedido = Pedido.objects.get(id=id)
        platos = DetallePedido.objects.filter(estado=True, pedido = pedido.id)
        total = 0
        for item in platos:
            total += item.precio * item.cantidad
        clientes = Cliente.objects.filter(estado=True)
        if request.method == "POST":
            cliente = Cliente.objects.get(id=request.POST['cliente'])
            tipoPago = request.POST['tipoPago']
            tipoComprobante = request.POST['tipoComprobante']
            comprobante = ComprobantePago.objects.create(pedido = pedido, cliente = cliente, importeTotal = total, apertura = apertura, tipoPago = tipoPago, tipoComprobante = tipoComprobante)
            comprobante.save()
            if tipoPago == "Efectivo":
                apertura.importe += total
                apertura.save()
            pedido.pagado = True
            pedido.save()
            return redirect("listarpedido")
        else:
            form = ComprobantePagoForm()
            context={'pedido':pedido, 'clientes': clientes, 'total':total, 'form':form}
            return render(request,"pedido/pagar.html",context)

@login_required
@permission_required('CajaApp.view_comprobantepago', raise_exception=True)
def listarcomprobante(request):
    queryset=request.GET.get("buscar")
    comprobantes=ComprobantePago.objects.filter(estado=True)
    paginator = Paginator(comprobantes,6)
    pagina = request.GET.get("page") or 1
    comprobantes = paginator.get_page(pagina)
    pagina_actual = int(pagina)
    paginas = range(1, comprobantes.paginator.num_pages + 1)
    if queryset:
        query = queryset.split("/")
        comprobantes=ComprobantePago.objects.filter(fecha__year=query[2], fecha__month=query[0], fecha__day = query[1], estado = True).distinct()
    context={'comprobantes':comprobantes,'pagina':pagina,'paginas':paginas,'pagina_actual':pagina_actual} 
    return render(request,"comprobante/listar.html",context)

@login_required
@transaction.atomic
@permission_required('CajaApp.delete_comprobantepago', raise_exception=True)
def eliminarcomprobante(request,id):
    comprobante=ComprobantePago.objects.get(id=id)
    comprobante.estado=False
    comprobante.save()
    apertura = AperturaCaja.objects.filter(estadoApertura = True).first()
    if apertura is not None:
        if comprobante.tipoPago == "Efectivo" and comprobante.apertura.id == apertura.id:
            apertura.importe -= comprobante.importeTotal
            apertura.save() 

    return redirect("listarcomprobante")

@login_required
@permission_required('CajaApp.view_comprobantepago', raise_exception=True)
def generarcomprobante(request, id):
    template_path = 'comprobante/detalle.html'
    comprobante = ComprobantePago.objects.filter(pedido_id = id, estado = True).first()
    pedido = Pedido.objects.get(id = id)
    detalle = DetallePedido.objects.filter(pedido_id = id)
    context = {'comprobante': comprobante, 'pedido': pedido, 'detalle': detalle}
    # Create a Django response object, and specify content_type as pdf
    response = HttpResponse(content_type='application/pdf')
    # find the template and render it.
    template = get_template(template_path)
    html = template.render(context)

    # create a pdf
    pisa_status = pisa.CreatePDF(
       html, dest=response)
    # if error then show some funny view
    if pisa_status.err:
       return HttpResponse('We had some errors <pre>' + html + '</pre>')
    return response


    