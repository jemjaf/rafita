
from pyexpat import model
from django import forms
from django.forms import fields, formset_factory, inlineformset_factory
from .models import AperturaCaja, ComprobantePago

class AperturaCajaForm(forms.ModelForm):
    class Meta:
        model = AperturaCaja
        fields = ['importeInicial']

    def __init__(self, user, *args, **kwargs):
        self.user = user
        super(AperturaCajaForm, self).__init__(*args, **kwargs)
        self.fields['importeInicial'].label = 'Importe inicial'

    def save(self, commit=True):
        instance = super(AperturaCajaForm, self).save(commit=False)
        instance.cajero = self.user # etc
        if commit:
            instance.save()
        return instance

class ComprobantePagoForm(forms.ModelForm):
    class Meta:
        model = ComprobantePago
        fields = ['tipoPago', 'tipoComprobante']
    
    def __init__(self, *args, **kwargs):
        super(ComprobantePagoForm, self).__init__(*args, **kwargs)
        self.fields['tipoPago'].label = 'Tipo de pago'
        self.fields['tipoComprobante'].label = 'Tipo de comprobante'