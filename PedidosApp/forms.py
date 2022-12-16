from pyexpat import model
from django import forms
from django.forms import fields, formset_factory, inlineformset_factory
from .models import Cliente, Plato, Pedido, Mesa, DetallePedido, DetallePlato
from ComprasApp.models import Insumo
from django.db.models import Q


class ClienteForm(forms.ModelForm):
    nroDocumento = forms.IntegerField()
    telefono = forms.IntegerField()
    class Meta:
        model=Cliente
        # fields=['nombres','apellidos','direccion','email','telefono','estado']
        fields=['tipoCliente', 'tipoDocumento', 'nroDocumento','nombre','direccion','email','telefono']

    def __init__(self, *args, **kwargs):
        super(ClienteForm, self).__init__(*args, **kwargs)
        self.fields['tipoCliente'].label = 'Tipo de cliente'
        self.fields['tipoDocumento'].label = 'Tipo de documento'
        self.fields['nroDocumento'].label = 'Número de documento'

class PlatoForm(forms.ModelForm):
    class Meta:
        model=Plato
        # fields=['nombre','categoria','precio','estado']
        fields=['nombre','categoria','precio']

class MesaForm(forms.ModelForm):
    class Meta:
        model = Mesa
        fields=['nombre']

class DetallePlatoForm(forms.ModelForm):
    class Meta:
        model = DetallePlato
        fields = ['insumo', 'cantidad']
    
    def __init__(self, plato, *args, **kwargs):
        self.plato = plato
        super(DetallePlatoForm, self).__init__(*args, **kwargs)
        insumos = DetallePlato.objects.filter(plato_id = self.plato.id).exclude(insumo_id = self.instance.insumo_id).values('insumo_id')
        self.fields['insumo'].queryset = Insumo.objects.filter(estado = True).exclude(id__in=insumos)

    def save(self, commit=True):
        instance = super(DetallePlatoForm, self).save(commit=False)
        instance.plato = self.plato # etc
        if commit:
            instance.save()
        return instance

class PedidoForm(forms.ModelForm):
    class Meta:
        model = Pedido
        fields = ['TipoPedido', 'cliente', 'mesa', 'direccion']

    def __init__(self, user, *args, **kwargs):
        self.user = user
        mesa = kwargs.pop('mesa', None)
        super(PedidoForm, self).__init__(*args, **kwargs)
        query1 = Mesa.objects.filter(enUso = 0)
        query2 = Mesa.objects.filter(id = self.instance.mesa_id)
        self.fields['mesa'].queryset = query2 | query1
        self.fields['mesa'].required = False
        if mesa:
            self.fields['mesa'].initial = mesa.id
        self.fields['TipoPedido'].label = 'Tipo de pedido'
        self.fields['TipoPedido'].widget.attrs['onChange'] = "actualizar()"
        self.fields['cliente'].queryset = Cliente.objects.filter(estado = True)

    def save(self, commit=True):
        instance = super(PedidoForm, self).save(commit=False)
        instance.usuarioRegistra = self.user # etc
        if commit:
            instance.save()
        return instance


class DetallePedidoForm(forms.ModelForm):
    class Meta:
        model = DetallePedido
        fields = ['plato', 'cantidad', 'indicaciones']
    
    def __init__(self, pedido, *args, **kwargs):
        self.pedido = pedido
        super(DetallePedidoForm, self).__init__(*args, **kwargs)
        platos = DetallePedido.objects.filter(pedido_id = self.pedido.id).exclude(plato_id = self.instance.plato_id).values('plato_id')
        self.fields['plato'].queryset = Plato.objects.filter(estado = True).exclude(id__in=platos).order_by('categoria')

    def save(self, commit=True):
        instance = super(DetallePedidoForm, self).save(commit=False)
        instance.pedido = self.pedido # etc
        instance.precio = Plato.objects.get(id = instance.plato.id).precio
        if commit:
            instance.save()
        return instance


