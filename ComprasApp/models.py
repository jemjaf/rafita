from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Proveedor(models.Model):
    RUC = models.CharField(max_length=11, unique=True)
    razon_social = models.CharField(max_length=45)
    direccion = models.CharField(max_length=45)
    telefono = models.CharField(max_length =10, blank = True)
    DNI_representante = models.CharField(max_length=8)
    estado = models.BooleanField(default=True)
    def __str__(self):
        return self.razon_social
    
class Insumo(models.Model):
    descripcion = models.CharField(max_length=40,unique=True)
    UNIDAD_CHOICES = [
        ('U', 'Unidades'),
        ('Kg', 'Kilogramos'),
        ('L', 'Litros'),
    ]
    proveedor = models.ForeignKey(Proveedor, on_delete=models.CASCADE)
    precio = models.DecimalField(max_digits=4, decimal_places=2)
    unidad_medida = models.CharField(max_length=20, choices = UNIDAD_CHOICES, default = 'U')
    stock = models.DecimalField(max_digits=4, decimal_places=2)
    estado = models.BooleanField(default=True)
    def __str__(self):
        return self.descripcion + " - " + self.proveedor.razon_social

class Compra(models.Model):
    usuarioCompra = models.ForeignKey(User, on_delete=models.CASCADE, related_name="usuarioCompra")
    fecha = models.DateTimeField(auto_now_add = True)
    motivo = models.CharField(max_length=200, blank = True)
    estado = models.BooleanField(default=True)

class DetalleCompra(models.Model):
    compra = models.ForeignKey(Compra, on_delete=models.CASCADE)
    insumo = models.ForeignKey(Insumo, on_delete=models.CASCADE)
    cantidad = models.IntegerField()
    precio = models.DecimalField(max_digits=4, decimal_places=2)
    estado = models.BooleanField(default = True)

    def total(self):
        return self.cantidad * self.precio