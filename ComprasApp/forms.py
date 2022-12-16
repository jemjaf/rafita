from pyexpat import model
from django import forms
from django.forms import fields, formset_factory, inlineformset_factory
from .models import Proveedor, Insumo, Compra, DetalleCompra

class ProveedorForm(forms.ModelForm):
    RUC = forms.IntegerField()
    DNI_representante = forms.IntegerField()
    telefono = forms.IntegerField()
    class Meta: 
        model = Proveedor
        fields=['RUC', 'razon_social', 'direccion', 'telefono', 'DNI_representante']
        
class InsumoForm(forms.ModelForm):
    class Meta:
        model = Insumo
        fields=['descripcion', 'precio', 'unidad_medida','stock', 'proveedor']

    def __init__(self, *args, **kwargs):
        super(InsumoForm, self).__init__(*args, **kwargs)
        self.fields['proveedor'].queryset = Proveedor.objects.filter(estado = True).order_by('razon_social')

class CompraForm(forms.ModelForm):
    class Meta:
        model = Compra
        fields = ['motivo']

    def __init__(self, user, *args, **kwargs):
        self.user = user
        super(CompraForm, self).__init__(*args, **kwargs)

    def save(self, commit=True):
        instance = super(CompraForm, self).save(commit=False)
        instance.usuarioCompra = self.user # etc
        if commit:
            instance.save()
        return instance

class DetalleCompraForm(forms.ModelForm):
    class Meta:
        model = DetalleCompra
        fields = ['insumo', 'cantidad']
    
    def __init__(self, compra, *args, **kwargs):
        self.compra = compra
        super(DetalleCompraForm, self).__init__(*args, **kwargs)
        insumos = DetalleCompra.objects.filter(compra_id = self.compra.id).exclude(insumo_id = self.instance.insumo_id).values('insumo_id')
        self.fields['insumo'].queryset = Insumo.objects.filter(estado = True).exclude(id__in=insumos)

    def save(self, commit=True):
        instance = super(DetalleCompraForm, self).save(commit=False)
        instance.compra = self.compra # etc
        insumo = Insumo.objects.get(id=instance.insumo.id)
        instance.precio = insumo.precio
        detalle = DetalleCompra.objects.filter(compra_id = instance.compra.id, insumo_id = insumo.id).first()
        if detalle is not None:
            insumo.stock -= detalle.cantidad
        insumo.stock += instance.cantidad
        insumo.save()
        if commit:
            instance.save()
        return instance
