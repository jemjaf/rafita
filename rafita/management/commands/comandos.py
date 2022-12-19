from typing import Generic 
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.models import User, Group, Permission, ContentType
from django.db.models import Q
from django.core.exceptions import ObjectDoesNotExist

#Usuarios
#cuentaCaja
#cuentaCocina
#cuentaAdmin
#cuentaMozo
#cuentaRepartidor
#Contraseña: GRUPOis1

#SUPERUSUARIO
#admin
#1234

#Administrador
grupo = Group.objects.get_or_create(name ='Administrador')

try:
    user  = User.objects.get(username="cuentaAdmin")
except ObjectDoesNotExist:
    user = User.objects.create_user('cuentaAdmin', 'salvattore_25@hotmail.com', 'GRUPOis1')
    user.first_name = 'Carlo'
    user.last_name = 'Razzeto'
    user.save()

user.groups.clear()
grupo = Group.objects.get(name ='Administrador')
user.groups.add(grupo)

#Mozo
grupo = Group.objects.get_or_create(name ='Mozo')

try:
    user  = User.objects.get(username="cuentaMozo")
except ObjectDoesNotExist:
    user = User.objects.create_user('cuentaMozo', 'aaaaaa@hotmail.com', 'GRUPOis1')
    user.first_name = 'Anderson'
    user.last_name = 'Miguel'
    user.save()

user.groups.clear()
grupo = Group.objects.get(name ='Mozo')
user.groups.add(grupo)

#Mozo
grupo = Group.objects.get_or_create(name ='Mozo')

try:
    user  = User.objects.get(username="cuentaMozo")
except ObjectDoesNotExist:
    user = User.objects.create_user('cuentaMozo', 'aaaaaa@hotmail.com', 'GRUPOis1')
    user.first_name = 'Anderson'
    user.last_name = 'Miguel'
    user.save()

user.groups.clear()
grupo = Group.objects.get(name ='Mozo')
user.groups.add(grupo)

#Cocina
grupo = Group.objects.get_or_create(name ='Cocina')

try:
    user  = User.objects.get(username="cuentaCocina")
except ObjectDoesNotExist:
    user = User.objects.create_user('cuentaCocina', 'eeeeee@hotmail.com', 'GRUPOis1')
    user.first_name = 'Gerardo'
    user.last_name = 'Avalos'
    user.save()

user.groups.clear()
grupo = Group.objects.get(name ='Cocina')
user.groups.add(grupo)

#Cocina
grupo = Group.objects.get_or_create(name ='Caja')

try:
    user  = User.objects.get(username="cuentaCaja")
except ObjectDoesNotExist:
    user = User.objects.create_user('cuentaCaja', 'iiiiiii@hotmail.com', 'GRUPOis1')
    user.first_name = 'Alessandro'
    user.last_name = 'Venegas'
    user.save()

user.groups.clear()
grupo = Group.objects.get(name ='Caja')
user.groups.add(grupo)

#PERMISOS:
#ROL MOZO
group = Group.objects.get(name='Mozo')
group.permissions.clear()
#TODO PEDIDOS Y DETALLES
#VER PLATOS
#VER Y LIBERAR MESAS
#TODO CLIENTES

p = Permission.objects.get(codename='view_mesa')
group.permissions.add(p)
p = Permission.objects.get(codename='liberar_mesa')
group.permissions.add(p)

p = Permission.objects.get(codename='view_cliente')
group.permissions.add(p)
p = Permission.objects.get(codename='add_cliente')
group.permissions.add(p)
p = Permission.objects.get(codename='change_cliente')
group.permissions.add(p)
p = Permission.objects.get(codename='delete_cliente')
group.permissions.add(p)

p = Permission.objects.get(codename='view_pedido')
group.permissions.add(p)
p = Permission.objects.get(codename='add_pedido')
group.permissions.add(p)
p = Permission.objects.get(codename='change_pedido')
group.permissions.add(p)
p = Permission.objects.get(codename='delete_pedido')
group.permissions.add(p)

p = Permission.objects.get(codename='view_detallepedido')
group.permissions.add(p)
p = Permission.objects.get(codename='add_detallepedido')
group.permissions.add(p)
p = Permission.objects.get(codename='change_detallepedido')
group.permissions.add(p)
p = Permission.objects.get(codename='delete_detallepedido')
group.permissions.add(p)

p = Permission.objects.get(codename='view_plato')
group.permissions.add(p)
p = Permission.objects.get(codename='view_mesa')
group.permissions.add(p)
p = Permission.objects.get(codename='liberar_mesa')
group.permissions.add(p)

#ROL ADMINISTRADOR
group = Group.objects.get(name='Administrador')
group.permissions.clear()
#TODO PLATOS
#TODO PROVEEDORES
#TODO INSUMOS
#TODO MESAS
#TODO USUARIOS
#VER Y ANULAR COMPRAS
#ANULAR COMPROBANTES

p = Permission.objects.get(codename='view_proveedor')
group.permissions.add(p)
p = Permission.objects.get(codename='add_proveedor')
group.permissions.add(p)
p = Permission.objects.get(codename='change_proveedor')
group.permissions.add(p)
p = Permission.objects.get(codename='delete_proveedor')
group.permissions.add(p)

p = Permission.objects.get(codename='view_mesa')
group.permissions.add(p)
p = Permission.objects.get(codename='add_mesa')
group.permissions.add(p)
p = Permission.objects.get(codename='change_mesa')
group.permissions.add(p)
p = Permission.objects.get(codename='delete_mesa')
group.permissions.add(p)

p = Permission.objects.get(codename='view_cliente')
group.permissions.add(p)
p = Permission.objects.get(codename='add_cliente')
group.permissions.add(p)
p = Permission.objects.get(codename='change_cliente')
group.permissions.add(p)
p = Permission.objects.get(codename='delete_cliente')
group.permissions.add(p)

p = Permission.objects.get(codename='view_user')
group.permissions.add(p)
p = Permission.objects.get(codename='add_user')
group.permissions.add(p)
p = Permission.objects.get(codename='change_user')
group.permissions.add(p)
p = Permission.objects.get(codename='delete_user')
group.permissions.add(p)

p = Permission.objects.get(codename='view_pedido')
group.permissions.add(p)
p = Permission.objects.get(codename='add_pedido')
group.permissions.add(p)
p = Permission.objects.get(codename='change_pedido')
group.permissions.add(p)
p = Permission.objects.get(codename='delete_pedido')
group.permissions.add(p)

p = Permission.objects.get(codename='view_detallepedido')
group.permissions.add(p)
p = Permission.objects.get(codename='add_detallepedido')
group.permissions.add(p)
p = Permission.objects.get(codename='change_detallepedido')
group.permissions.add(p)
p = Permission.objects.get(codename='delete_detallepedido')
group.permissions.add(p)

p = Permission.objects.get(codename='view_plato')
group.permissions.add(p)
p = Permission.objects.get(codename='add_plato')
group.permissions.add(p)
p = Permission.objects.get(codename='change_plato')
group.permissions.add(p)
p = Permission.objects.get(codename='delete_plato')
group.permissions.add(p)

p = Permission.objects.get(codename='view_detalleplato')
group.permissions.add(p)
p = Permission.objects.get(codename='add_detalleplato')
group.permissions.add(p)
p = Permission.objects.get(codename='change_detalleplato')
group.permissions.add(p)
p = Permission.objects.get(codename='delete_detalleplato')
group.permissions.add(p)

p = Permission.objects.get(codename='view_compra')
group.permissions.add(p)
p = Permission.objects.get(codename='add_compra')
group.permissions.add(p)
p = Permission.objects.get(codename='change_compra')
group.permissions.add(p)
p = Permission.objects.get(codename='delete_compra')
group.permissions.add(p)

p = Permission.objects.get(codename='view_detallecompra')
group.permissions.add(p)
p = Permission.objects.get(codename='add_detallecompra')
group.permissions.add(p)
p = Permission.objects.get(codename='change_detallecompra')
group.permissions.add(p)
p = Permission.objects.get(codename='delete_detallecompra')
group.permissions.add(p)

p = Permission.objects.get(codename='view_insumo')
group.permissions.add(p)
p = Permission.objects.get(codename='add_insumo')
group.permissions.add(p)
p = Permission.objects.get(codename='change_insumo')
group.permissions.add(p)
p = Permission.objects.get(codename='delete_insumo')
group.permissions.add(p)

p = Permission.objects.get(codename='view_aperturacaja')
group.permissions.add(p)
p = Permission.objects.get(codename='add_aperturacaja')
group.permissions.add(p)
p = Permission.objects.get(codename='change_aperturacaja')
group.permissions.add(p)
p = Permission.objects.get(codename='delete_aperturacaja')
group.permissions.add(p)

p = Permission.objects.get(codename='view_comprobantepago')
group.permissions.add(p)

p = Permission.objects.get(codename='delete_comprobantepago')
group.permissions.add(p)

#ROL CAJA
group = Group.objects.get(name='Caja')  
group.permissions.clear()  

#TODO APERTURACAJA
#VER COMPROBANTES
#VER PEDIDOS (PAGAR)

p = Permission.objects.get(codename='view_aperturacaja')
group.permissions.add(p)
p = Permission.objects.get(codename='add_aperturacaja')
group.permissions.add(p)
p = Permission.objects.get(codename='change_aperturacaja')
group.permissions.add(p)
p = Permission.objects.get(codename='delete_aperturacaja')
group.permissions.add(p)

p = Permission.objects.get(codename='view_comprobantepago')
group.permissions.add(p)
p = Permission.objects.get(codename='add_comprobantepago')
group.permissions.add(p)
p = Permission.objects.get(codename='view_pedido')
group.permissions.add(p)
p = Permission.objects.get(codename='view_detallepedido')
group.permissions.add(p)

#ROL COCINA
group = Group.objects.get(name='Cocina')   
group.permissions.clear() 

#VER, AÑADIR COMPRAS Y AGREGAR DETALLES
#VER INSUMOS
#VER PEDIDOS
p = Permission.objects.get(codename='view_compra')
group.permissions.add(p) 
p = Permission.objects.get(codename='add_compra')
group.permissions.add(p)
p = Permission.objects.get(codename='change_compra')
group.permissions.add(p)  
p = Permission.objects.get(codename='view_detallecompra')
group.permissions.add(p) 
p = Permission.objects.get(codename='add_detallecompra')
group.permissions.add(p) 
p = Permission.objects.get(codename='view_insumo')
group.permissions.add(p) 
p = Permission.objects.get(codename='view_pedido')
group.permissions.add(p) 
p = Permission.objects.get(codename='view_detallepedido')
group.permissions.add(p) 