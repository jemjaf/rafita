"""rafita URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path,include 
from SeguridadApp.views import acceder, perfil,homePage, salir, listarusuario, agregarusuario, editarusuario, eliminarusuario
from django.contrib.auth import views
from PedidosApp.views import calcularplato, entregarpedido, liberarmesa, listarcliente, agregarcliente, editarcliente, eliminarcliente, listarplato, agregarplato, editarplato, eliminarplato, listarpedido, agregarpedido, editarpedido, eliminarpedido, eliminardetallepedido, editardetallepedido, eliminardetalleplato, editardetalleplato, agregardetalleplato, agregardetallepedido, listarmesa, agregarmesa, editarmesa, eliminarmesa, verreportepedidos
from CajaApp.views import generarcomprobante, mostrarcaja, pagarpedido, eliminarcomprobante, listarcomprobante
from ComprasApp.views import  listarproveedor, agregarproveedor,editarproveedor,eliminarproveedor, listarinsumo, agregarinsumo,editarinsumo,eliminarinsumo, listarcompra, agregarcompra, editarcompra, eliminarcompra, eliminardetallecompra, editardetallecompra, agregardetallecompra
"from VentasApp.views import listarcategoria, agregarcategoria, editarcategoria, eliminarcategoria"
urlpatterns = [ 
path('', acceder,name="login"),

path('home/',homePage ,name="home"),
path('logout/',salir,name="logout"),
#Usuario
path('perfil/', perfil, name="perfil"),
path('usuario/',listarusuario,name="listarusuario"),
path('usuario/agregar',agregarusuario ,name="agregarusuario"),
path('usuario/<int:id>/',editarusuario ,name="editarusuario"),
path('usuario/eliminar/<int:id>/',eliminarusuario ,name="eliminarusuario"),
#Cliente
path('cliente/',listarcliente,name="listarcliente"),
path('cliente/agregar',agregarcliente ,name="agregarcliente"),
path('cliente/<int:id>/',editarcliente ,name="editarcliente"),
path('cliente/eliminar/<int:id>/',eliminarcliente ,name="eliminarcliente"),
#Mesa
path('mesa/',listarmesa,name="listarmesa"),
path('mesa/agregar',agregarmesa ,name="agregarmesa"),
path('mesa/<int:id>/',editarmesa ,name="editarmesa"),
path('mesa/liberar/<int:id>/',liberarmesa ,name="liberarmesa"),
path('mesa/eliminar/<int:id>/',eliminarmesa ,name="eliminarmesa"),
#Plato
path('plato/',listarplato,name="listarplato"),
path('plato/agregar',agregarplato ,name="agregarplato"),
path('plato/<int:id>/',editarplato ,name="editarplato"),
path('plato/<int:id>/agregar/',agregardetalleplato ,name="agregardetalleplato"),
path('plato/detalle/<int:id>/',editardetalleplato ,name="editardetalleplato"),
path('plato/calcular/<int:id>/',calcularplato ,name="calcularplato"),
path('plato/eliminaringrediente/<int:id>/',eliminardetalleplato ,name="eliminardetalleplato"),
path('plato/eliminar/<int:id>/',eliminarplato ,name="eliminarplato"),
#Pedido
path('pedido/',listarpedido,name="listarpedido"),
path('pedido/agregar',agregarpedido ,name="agregarpedido"),
path('pedido/entregar/<int:id>',entregarpedido ,name="entregarpedido"),
path('pedido/pagar/<int:id>/',pagarpedido ,name="pagarpedido"),
path('pedido/<int:id>/',editarpedido ,name="editarpedido"),
path('pedido/<int:id>/agregar/',agregardetallepedido ,name="agregardetallepedido"),
path('pedido/detalle/<int:id>/',editardetallepedido ,name="editardetallepedido"),
path('pedido/eliminarplato/<int:id>/',eliminardetallepedido ,name="eliminardetallepedido"),
path('pedido/eliminar/<int:id>/',eliminarpedido ,name="eliminarpedido"),
path('pedido/reporte',verreportepedidos ,name="verreportepedidos"),
#Proveedor
path('proveedor/',listarproveedor,name="listarproveedor"),
path('proveedor/agregar',agregarproveedor ,name="agregarproveedor"),
path('proveedor/<int:id>/',editarproveedor ,name="editarproveedor"),
path('proveedor/eliminar/<int:id>/',eliminarproveedor ,name="eliminarproveedor"),
#Insumo
path('insumo/',listarinsumo,name="listarinsumo"),
path('insumo/agregar/',agregarinsumo ,name="agregarinsumo"),
path('insumo/<int:id>/',editarinsumo ,name="editarinsumo"),
path('insumo/eliminar/<int:id>/',eliminarinsumo ,name="eliminarinsumo"),
#Compra
path('compra/',listarcompra,name="listarcompra"),
path('compra/agregar',agregarcompra ,name="agregarcompra"),
path('compra/<int:id>/',editarcompra ,name="editarcompra"),
path('compra/<int:id>/agregar/',agregardetallecompra ,name="agregardetallecompra"),
path('compra/detalle/<int:id>/',editardetallecompra ,name="editardetallecompra"),
path('compra/eliminarinsumo/<int:id>/',eliminardetallecompra ,name="eliminardetallecompra"),
path('compra/eliminar/<int:id>/',eliminarcompra ,name="eliminarcompra"),
#Caja
path('caja/',mostrarcaja,name="mostrarcaja"),
#Comprobante
path('comprobante/',listarcomprobante,name="listarcomprobante"),
path('comprobante/<int:id>',generarcomprobante,name="generarcomprobante"),
path('comprobante/eliminar/<int:id>/',eliminarcomprobante,name="eliminarcomprobante"),
] 
