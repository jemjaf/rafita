from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from pyexpat import model
from django import forms
from django.forms import fields

class UserForm(UserCreationForm):
    email = forms.EmailField(required=False)
    grupo_choices = [
        ('Administrador', 'Administrador'),
        ('Mozo', 'Mozo'),
        ('Caja', 'Caja'),
        ('Cocina', 'Cocina'),
        ('Repartidor', 'Repartidor'),
    ]
    grupo = forms.ChoiceField(required=True, choices = grupo_choices)
    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email', 'grupo' ]