from django.shortcuts import render,redirect
from PedidosApp.models import Cliente, Pedido, DetallePedido
from CajaApp.models import AperturaCaja, ComprobantePago
from ComprasApp.models import Insumo, Proveedor, Compra, DetalleCompra
from django.db.models import Q
from django.db import transaction
from .forms import InsumoForm, ProveedorForm, CompraForm, DetalleCompraForm
from django.core.paginator import Paginator
from django.contrib.auth.decorators import login_required, permission_required
from django.forms.models import inlineformset_factory
from django.utils import timezone

# Create your views here.
#Insumo
@login_required
@permission_required('ComprasApp.view_insumo', raise_exception=True)
def listarinsumo(request):
    queryset=request.GET.get("buscar")
    insumo=Insumo.objects.filter(estado=True)
    paginator = Paginator(insumo,6)
    pagina = request.GET.get("page") or 1
    insumo = paginator.get_page(pagina)
    pagina_actual = int(pagina)
    paginas = range(1, insumo.paginator.num_pages + 1)
    if queryset:
        insumo=Insumo.objects.filter(
            Q(descripcion__icontains=queryset),estado=True
            ).distinct()
    context={'insumo':insumo,'pagina':pagina,'paginas':paginas,'pagina_actual':pagina_actual} 
    return render(request,"insumo/listar.html",context)

@login_required
@transaction.atomic
@permission_required('ComprasApp.add_insumo', raise_exception=True)
def agregarinsumo(request):
    if request.method=="POST":
        form=InsumoForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("listarinsumo")
    else:
        form=InsumoForm()
    context={'form':form}
    return render(request,"insumo/agregar.html",context)

@login_required
@transaction.atomic
@permission_required('ComprasApp.change_insumo', raise_exception=True)
def editarinsumo(request,id):
    insumo=Insumo.objects.get(id=id)
    if request.method=="POST":
        form=InsumoForm(request.POST,instance=insumo)
        if form.is_valid():
            form.save()
            return redirect("listarinsumo")
    else:
        form=InsumoForm(instance=insumo)
    context={"form":form}
    return render(request,"insumo/editar.html",context)
    
@login_required
@transaction.atomic
@permission_required('ComprasApp.delete_insumo', raise_exception=True)
def eliminarinsumo(request,id):
    insumo=Insumo.objects.get(id=id)
    insumo.estado=False
    insumo.save()
    return redirect("listarinsumo")

    #Proveedor

@login_required
@permission_required('ComprasApp.view_proveedor', raise_exception=True)
def listarproveedor(request):
    queryset=request.GET.get("buscar")
    proveedor = Proveedor.objects.filter(estado=True)
    paginator = Paginator(proveedor,6)
    pagina = request.GET.get("page") or 1
    proveedor = paginator.get_page(pagina)
    pagina_actual = int(pagina)
    paginas = range(1, proveedor.paginator.num_pages + 1)
    if queryset:
        proveedor=Proveedor.objects.filter(
            Q(razon_social__icontains=queryset), estado = True
            ).distinct()
    context={'proveedor': proveedor,'pagina':pagina,'paginas':paginas,'pagina_actual':pagina_actual}
    return render(request,"proveedor/listar.html",context)

@login_required
@transaction.atomic
@permission_required('ComprasApp.add_proveedor', raise_exception=True)
def agregarproveedor(request):
    if request.method=="POST":
        form= ProveedorForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("listarproveedor")
    else:
        form=ProveedorForm()
    context={'form':form}
    return render(request,"proveedor/agregar.html",context)

@login_required
@transaction.atomic
@permission_required('ComprasApp.change_proveedor', raise_exception=True)
def editarproveedor(request,id):
    proveedor=Proveedor.objects.get(id=id)
    if request.method=="POST":
        form=ProveedorForm(request.POST,instance=proveedor)
        if form.is_valid():
            form.save()
            return redirect("listarproveedor")
    else:
        form=ProveedorForm(instance=proveedor)
    context={"form":form}
    return render(request,"proveedor/editar.html",context)

@login_required
@transaction.atomic
@permission_required('ComprasApp.delete_proveedor', raise_exception=True)
def eliminarproveedor(request,id):
    proveedor=Proveedor.objects.get(id=id)
    proveedor.estado=False
    proveedor.save()
    return redirect("listarproveedor")

#Compra
@login_required
@permission_required('ComprasApp.view_compra', raise_exception=True)
def listarcompra(request):
    queryset=request.GET.get("buscar")
    compras=Compra.objects.filter(estado=True)
    paginator = Paginator(compras,6)
    pagina = request.GET.get("page") or 1
    compras = paginator.get_page(pagina)
    pagina_actual = int(pagina)
    paginas = range(1, compras.paginator.num_pages + 1)
    if queryset:
        query = queryset.split("/")
        compras=Compra.objects.filter(fecha__year=query[2], fecha__month=query[0], fecha__day = query[1], estado = True).distinct()
    context={'compras':compras,'pagina':pagina,'paginas':paginas,'pagina_actual':pagina_actual}
    return render(request,"compra/listar.html",context)

@login_required
@transaction.atomic
@permission_required('ComprasApp.add_compra', raise_exception=True)
def agregarcompra(request):
    form = CompraForm(request.user, request.POST or None)

    if form.is_valid():
        compra = form.save()
        insumos = request.POST.getlist('idinsumos[]')
        cantidades = request.POST.getlist('cantidad[]')
        num = 0
        for item in insumos:
            insumo = Insumo.objects.get(id=item)
            detalle = DetalleCompra.objects.create(insumo = insumo, compra = compra, cantidad = cantidades[num], precio = insumo.precio)
            detalle.save()
            insumo.stock += int(detalle.cantidad)
            insumo.save()
            num += 1
        return redirect('listarcompra')
    insumos = Insumo.objects.filter(estado=True)
    context={'form':form, 'insumos': insumos}
    return render(request,"compra/agregar.html",context)

@login_required
@transaction.atomic
@permission_required('ComprasApp.view_detallecompra', raise_exception=True)
def editarcompra(request,id):
    compra=Compra.objects.get(id=id)
    insumos = DetalleCompra.objects.filter(estado=True, compra = compra.id)
    form=CompraForm(request.user, instance=compra)
    formDetalle = DetalleCompraForm(compra)
    if (request.user.has_perm('ComprasApp.change_compra')):
        if request.method=="POST":
            form = CompraForm(request.user, request.POST,instance=compra)
            if form.is_valid():
                form.save()
            return redirect('editarcompra', id)
    insumos = DetalleCompra.objects.filter(estado=True, compra = compra.id)
    context={'insumos':insumos, 'form':form, 'formDetalle':formDetalle, 'idcompra': id}
    return render(request,"compra/detalle.html",context)

@login_required
@transaction.atomic
@permission_required('ComprasApp.add_detallecompra', raise_exception=True)
def agregardetallecompra(request, id):
    if request.method=="POST":
        compra = Compra.objects.get(id = id)
        form = DetalleCompraForm(compra, request.POST)
        if form.is_valid():
            detalle = form.save()
        return redirect("editarcompra", id)
    else:
        return redirect("listarcompra")

@login_required
@transaction.atomic
@permission_required('ComprasApp.change_detallecompra', raise_exception=True)
def editardetallecompra(request,id):
    detalle=DetalleCompra.objects.get(id=id)
    idcompra = detalle.compra.id
    if request.method=="POST":
        form = DetalleCompraForm(detalle.compra, request.POST,instance=detalle)
        if form.is_valid():
            form.save()
        return redirect('editarcompra', idcompra)
    else:
        form=DetalleCompraForm(detalle.compra, instance=detalle)
    context={"form":form, "idcompra": idcompra}
    return render(request,"compra/detalleeditar.html",context)

@login_required
@transaction.atomic
@permission_required('ComprasApp.delete_compra', raise_exception=True)
def eliminarcompra(request,id):
    compra=Compra.objects.get(id=id)
    compra.estado=False
    detalle = DetalleCompra.objects.filter(compra_id = id)
    for item in detalle:
        insumo = Insumo.objects.get(id = item.insumo_id)
        insumo.stock -= item.cantidad
        insumo.save()
    compra.save()
    return redirect("listarcompra")

@login_required
@transaction.atomic
@permission_required('ComprasApp.delete_detallecompra', raise_exception=True)
def eliminardetallecompra(request,id):
    detalle=DetalleCompra.objects.get(id=id)
    detalle.delete()
    return redirect("editarcompra", detalle.compra.id)