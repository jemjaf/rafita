from django.shortcuts import render,redirect
from PedidosApp.models import Cliente,Plato, Pedido, Mesa, DetallePedido, DetallePlato
from ComprasApp.models import Insumo
from django.db.models import Q
from django.db import transaction
from .forms import ClienteForm, PlatoForm, PedidoForm, DetallePedidoForm, DetallePlatoForm, MesaForm
from django.core.paginator import Paginator
from django.contrib.auth.decorators import login_required, permission_required
from django.forms.models import inlineformset_factory
from django.db.models import Sum
from django.utils import timezone
from datetime import date


#Cliente
@login_required
@permission_required('PedidosApp.view_cliente', raise_exception=True)
def listarcliente(request):
    queryset=request.GET.get("buscar")
    cliente=Cliente.objects.filter(estado=True)
    paginator = Paginator(cliente,6)
    pagina = request.GET.get("page") or 1
    cliente = paginator.get_page(pagina)
    pagina_actual = int(pagina)
    paginas = range(1, cliente.paginator.num_pages + 1)
    if queryset:
        cliente=Cliente.objects.filter(
            Q(id__icontains=queryset),estado=True
            ).distinct()
    context={'cliente':cliente,'pagina':pagina,'paginas':paginas,'pagina_actual':pagina_actual}
    return render(request,"cliente/listar.html",context)

@login_required
@transaction.atomic
@permission_required('PedidosApp.add_cliente', raise_exception=True)
def agregarcliente(request):
    if request.method=="POST":
        form=ClienteForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("listarcliente")
    else:
        form=ClienteForm()
    context={'form':form}
    return render(request,"cliente/agregar.html",context)

@login_required
@transaction.atomic
@permission_required('PedidosApp.change_cliente', raise_exception=True)
def editarcliente(request,id):
    cliente=Cliente.objects.get(id=id)
    if request.method=="POST":
        form=ClienteForm(request.POST,instance=cliente)
        if form.is_valid():
            form.save()
            return redirect("listarcliente")
    else:
        form=ClienteForm(instance=cliente)
    context={"form":form}
    return render(request,"cliente/editar.html",context)

@login_required
@transaction.atomic
@permission_required('PedidosApp.delete_cliente', raise_exception=True)
def eliminarcliente(request,id):
    cliente=Cliente.objects.get(id=id)
    cliente.estado=False
    cliente.save()
    return redirect("listarcliente")

#Cliente
@login_required
@permission_required('PedidosApp.view_mesa', raise_exception=True)
def listarmesa(request):
    mesas = Mesa.objects.filter(estado=True).order_by('nombre')
    context={'mesas':mesas}
    return render(request,"mesa/listar.html",context)

@login_required
@transaction.atomic
@permission_required('PedidosApp.add_mesa', raise_exception=True)
def agregarmesa(request):
    if request.method=="POST":
        form=MesaForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("listarmesa")
    else:
        form=MesaForm()
    context={'form':form}
    return render(request,"mesa/agregar.html",context)

@login_required
@transaction.atomic
@permission_required('PedidosApp.change_mesa', raise_exception=True)
def editarmesa(request,id):
    mesa=Mesa.objects.get(id=id)
    if request.method=="POST":
        form=MesaForm(request.POST,instance=mesa)
        if form.is_valid():
            form.save()
            return redirect("listarmesa")
    else:
        form=MesaForm(instance=mesa)
    context={"form":form}
    return render(request,"mesa/editar.html",context)

@login_required
@transaction.atomic
@permission_required('PedidosApp.delete_mesa', raise_exception=True)
def eliminarmesa(request,id):
    mesa = Mesa.objects.get(id=id)
    mesa.estado=False
    mesa.save()
    return redirect("listarmesa")

@login_required
@transaction.atomic
@permission_required('PedidosApp.liberar_mesa', raise_exception=True)
def liberarmesa(request,id):
    mesa = Mesa.objects.get(id=id)
    mesa.enUso = False
    mesa.save()
    return redirect("listarmesa")

#Plato
@login_required
@permission_required('PedidosApp.view_plato', raise_exception=True)
def listarplato(request):
    queryset=request.GET.get("buscar")
    plato=Plato.objects.filter(estado=True)
    paginator = Paginator(plato,6)
    pagina = request.GET.get("page") or 1
    plato = paginator.get_page(pagina)
    pagina_actual = int(pagina)
    paginas = range(1, plato.paginator.num_pages + 1)
    if queryset:
        plato=Plato.objects.filter(
            Q(nombre__icontains=queryset),estado=True
            ).distinct()
    context={'plato':plato,'pagina':pagina,'paginas':paginas,'pagina_actual':pagina_actual}
    return render(request,"plato/listar.html",context)

@login_required
@transaction.atomic
@permission_required('PedidosApp.add_plato', raise_exception=True)
def agregarplato(request):
    form = PlatoForm(request.POST or None)

    if form.is_valid():
        plato = form.save()
        insumos = request.POST.getlist('idinsumos[]')
        cantidades = request.POST.getlist('cantidad[]')
        num = 0
        for item in insumos:
            insumo = Insumo.objects.get(id=item)
            detalle = DetallePlato.objects.create(insumo = insumo, plato = plato, cantidad = cantidades[num])
            detalle.save()
            num += 1
        return redirect('listarplato')
    insumos = Insumo.objects.filter(estado=True)
    context={'form':form, 'insumos': insumos}
    return render(request,"plato/agregar.html",context)

@login_required
@transaction.atomic
@permission_required('PedidosApp.view_detalleplato', raise_exception=True)
def editarplato(request,id):
    plato=Plato.objects.get(id=id)
    insumos = DetallePlato.objects.filter(estado=True, plato = plato.id)
    form=PlatoForm(instance=plato)
    formDetalle = DetallePlatoForm(plato)
    if (request.user.has_perm('PedidosApp.change_plato')):
        if request.method=="POST":
            form = PlatoForm(request.POST,instance=plato)
            if form.is_valid():
                form.save()
            return redirect('editarplato', id)
    insumos = DetallePlato.objects.filter(estado=True, plato = plato.id)
    context={'insumos':insumos, 'form':form, 'formDetalle':formDetalle, 'idplato': id}
    return render(request,"plato/detalle.html",context)

@login_required
@transaction.atomic
@permission_required('PedidosApp.add_detalleplato', raise_exception=True)
def agregardetalleplato(request, id):
    if request.method=="POST":
        plato = Plato.objects.get(id = id)
        form = DetallePlatoForm(plato, request.POST)
        if form.is_valid():
            detalle = form.save()
            return redirect("editarplato", detalle.plato.id)
        else:
            form=ClienteForm()
    else:
        return redirect("listaplato")

@login_required
@transaction.atomic
@permission_required('PedidosApp.change_detalleplato', raise_exception=True)
def editardetalleplato(request,id):
    detalle=DetallePlato.objects.get(id=id)
    idplato = detalle.plato.id
    if request.method=="POST":
        form = DetallePlatoForm(detalle.plato, request.POST,instance=detalle)
        if form.is_valid():
            form.save()
        return redirect('editarplato', idplato)
    else:
        form=DetallePlatoForm(detalle.plato, instance=detalle)
    context={"form":form, "idplato": idplato}
    return render(request,"plato/detalleeditar.html",context)

@login_required
@transaction.atomic
@permission_required('PedidosApp.delete_plato', raise_exception=True)
def eliminarplato(request,id):
    plato=Plato.objects.get(id=id)
    plato.estado=False
    plato.save()
    return redirect("listarplato")

@login_required
@transaction.atomic
@permission_required('PedidosApp.delete_detalleplato', raise_exception=True)
def eliminardetalleplato(request,id):
    detalle=DetallePlato.objects.get(id=id)
    detalle.delete()
    return redirect("editarplato", detalle.plato.id)

@login_required
@permission_required('PedidosApp.view_detalleplato', raise_exception=True)
def calcularplato(request, id):
    if request.method=="POST":
        idplato = id
        plato = Plato.objects.get(id = id)
        cantidad = request.POST.get('calcular')
        detalle = DetallePlato.objects.filter(plato__id = id)
        qs = [{'insumo': x.insumo, 'unidad_medida': x.insumo.unidad_medida, 'cantidad': x.cantidad, 'precio': x.insumo.precio, 'total': x.total, 'proyeccion': x.calcular(int(cantidad))} for x in DetallePlato.objects.filter(plato__id = id)] 
        total = 0
        for q in qs:
            total += q['proyeccion']
        context = {"insumos":qs, "idplato": id, 'total':total}

        return render(request,"Plato/proyeccion.html",context)
    else:
        return redirect("editarplato", id)

#Pedidos

@login_required
@permission_required('PedidosApp.view_pedido', raise_exception=True)
def listarpedido(request):
    queryset=request.GET.get("buscar")
    if request.user.groups.filter(name='Repartidor').exists():
        pedidos = Pedido.objects.filter(estado=True, TipoPedido = 'Delivery').order_by('-Fecha')
    else:
        pedidos = Pedido.objects.filter(estado=True).order_by('-Fecha') 
    paginator = Paginator(pedidos,6)
    pagina = request.GET.get("page") or 1
    pedidos = paginator.get_page(pagina)
    pagina_actual = int(pagina)

    paginas = range(1, pedidos.paginator.num_pages + 1)
    if queryset:
        query = queryset.split("/")
        if request.user.groups.filter(name='Repartidor').exists():
            pedidos=Pedido.objects.filter(Fecha__year=query[2], Fecha__month=query[0], Fecha__day = query[1], estado = True, TipoPedido = 'Delivery').distinct()
        else:
            pedidos=Pedido.objects.filter(Fecha__year=query[2], Fecha__month=query[0], Fecha__day = query[1], estado = True).distinct()
        
    context={'pedidos': pedidos,'pagina':pagina,'paginas':paginas,'pagina_actual':pagina_actual}
    return render(request,"Pedido/listar.html",context)

@login_required
@transaction.atomic
@permission_required('PedidosApp.add_pedido', raise_exception=True)
def agregarpedido(request):
    form = PedidoForm(request.user, request.POST or None)
    mesa = request.GET.get("mesa")
    if mesa:
        mesa = Mesa.objects.filter(id = mesa).first()
        if mesa:
            if mesa.estado and not mesa.enUso:
                form = PedidoForm(request.user, request.POST or None, mesa = mesa)
    if form.is_valid():
        pedido = form.save()
        if pedido.TipoPedido == 'Salon':
            mesa = Mesa.objects.get(id = pedido.mesa.id)
            mesa.enUso = True
            mesa.save()
        platos = request.POST.getlist('idplatos[]')
        cantidades = request.POST.getlist('cantidad[]')
        indicaciones = request.POST.getlist('indicaciones[]')
        num = 0
        for item in platos:
            plato = Plato.objects.get(id=item)
            detalle = DetallePedido.objects.create(pedido = pedido, plato = plato, cantidad = cantidades[num], indicaciones = indicaciones[num], precio = plato.precio)
            detalle.save()
            num += 1
        return redirect('listarmesa')
    clientes=Cliente.objects.filter(estado=True)
    platos=Plato.objects.filter(estado=True)
    mesas=Mesa.objects.filter(estado=True)
    context={'form':form, 'clientes': clientes, 'platos': platos, 'mesas': mesas}
    return render(request,"pedido/agregar.html",context)

@login_required
@transaction.atomic
@permission_required('PedidosApp.view_detallepedido', raise_exception=True)
def editarpedido(request,id):
    pedido=Pedido.objects.get(id=id)
    platos = DetallePedido.objects.filter(estado=True, pedido = pedido.id)
    form=PedidoForm(request.user, instance=pedido)
    formDetalle = DetallePedidoForm(pedido)
    if (request.user.has_perm('PedidosApp.change_pedido')):
        if request.method=="POST":
            form = PedidoForm(request.user, request.POST,instance=pedido)
            if form.is_valid():
                form.save()
            return redirect('editarpedido', id)
    platos = DetallePedido.objects.filter(estado=True, pedido = pedido.id)
    context={'pedido':pedido, 'platos':platos, 'form':form, 'formDetalle':formDetalle, 'idpedido': id}
    return render(request,"pedido/detalle.html",context)

@login_required
@transaction.atomic
@permission_required('PedidosApp.add_detallepedido', raise_exception=True)
def agregardetallepedido(request, id):
    if request.method=="POST":
        pedido = Pedido.objects.get(id = id)
        form = DetallePedidoForm(pedido, request.POST)
        if form.is_valid():
            detalle = form.save()
            return redirect("editarpedido", id)
    else:
        return redirect("listarpedido")

@login_required
@transaction.atomic
@permission_required('PedidosApp.change_detallepedido', raise_exception=True)
def editardetallepedido(request,id):
    detalle=DetallePedido.objects.get(id=id)
    idpedido = detalle.pedido.id
    if request.method=="POST":
        form = DetallePedidoForm(detalle.pedido, request.POST,instance=detalle)
        if form.is_valid():
            form.save()
        return redirect('editarpedido', idpedido)
    else:
        form=DetallePedidoForm(detalle.pedido, instance=detalle)
    context={"form":form, "idpedido": idpedido}
    return render(request,"pedido/detalleeditar.html",context)

@login_required
@transaction.atomic
@permission_required('PedidosApp.delete_pedido', raise_exception=True)
def eliminarpedido(request,id):
    pedido=Pedido.objects.get(id=id)
    pedido.estado=False
    pedido.save()
    return redirect("listarpedido")

@login_required
@transaction.atomic
@permission_required('PedidosApp.delete_detallepedido', raise_exception=True)
def eliminardetallepedido(request,id):
    detalle=DetallePedido.objects.get(id=id)
    detalle.delete()
    return redirect("editarpedido", detalle.pedido.id)

@login_required
@transaction.atomic
@permission_required('PedidosApp.can_entregar_pedido', raise_exception=True)
def entregarpedido(request, id):
    pedido=Pedido.objects.get(id=id)
    if pedido.TipoPedido == 'Delivery':
        pedido.usuarioReparte = request.user
        pedido.save()
    return redirect("listarpedido")

@login_required
@permission_required('PedidosApp.view_pedido', raise_exception=True)
def verreportepedidos(request):
    labels = []
    data = []
    fechaInicio=request.GET.get("buscarInicio")
    fechaFin=request.GET.get("buscarFin")
    if fechaInicio and fechaFin:
        query1 = fechaInicio.split("/")
        query2 = fechaFin.split("/")

        platos = DetallePedido.objects.filter(pedido__estado = True, pedido__Fecha__date__range=(date(int(query1[2]), int(query1[0]), int(query1[1])), date(int(query2[2]), int(query2[0]), int(query2[1])))).values('plato', 'plato__nombre').order_by('plato').annotate(total=Sum('cantidad'))
            
    else:
        platos = DetallePedido.objects.filter(pedido__estado = True, pedido__Fecha__date=date(2022,12,15)).values('plato', 'plato__nombre').order_by('plato').annotate(total=Sum('cantidad'))
    for p in platos:
        labels.append(p['plato__nombre'])
        data.append(p['total'])
    context = {"platos": platos, "labels": labels, "data": data}
    return render(request,"pedido/grafico.html",context)


