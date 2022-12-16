from django.db import models
from django.contrib.auth.models import User
from PedidosApp.models import Pedido, Cliente

# Create your models here.
class AperturaCaja(models.Model):
    cajero = models.ForeignKey(User, on_delete=models.CASCADE, null = True, related_name="cajero")
    estadoApertura = models.BooleanField(default = True)
    importeInicial = models.DecimalField(max_digits=5, decimal_places=2)
    importe = models.DecimalField(max_digits=5, decimal_places=2, default = 0)
    importeFinal = models.DecimalField(max_digits=5, decimal_places=2, null = True)
    fechaInicio = models.DateTimeField(auto_now_add = True)
    fechaCierre = models.DateTimeField(null = True)

class ComprobantePago(models.Model):
    pedido = models.ForeignKey(Pedido, on_delete=models.CASCADE)
    TIPOPAGO_CHOICES = [
        ('Efectivo', 'Efectivo'),
        ('Tarjeta al contado', 'Tarjeta al contado'),
        ('Tarjeta en cuotas', 'Tarjeta en cuotas'),
    ]
    TIPOCOMPROBANTE_CHOICES = [
        ('Boleta', 'Boleta'),
        ('Factura', 'Factura'),
    ]
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    apertura = models.ForeignKey(AperturaCaja, on_delete=models.CASCADE)
    tipoPago = models.CharField(max_length=20, choices = TIPOPAGO_CHOICES)
    tipoComprobante = models.CharField(max_length=20, choices = TIPOCOMPROBANTE_CHOICES)
    fecha = models.DateTimeField(auto_now_add = True)
    importeTotal = models.DecimalField(max_digits=4, decimal_places=2)
    estado = models.BooleanField(default = True)
    igv = models.DecimalField(max_digits=3, decimal_places=2, default = 0.18)