# Create your views here.
from typing import Generic 
from django.shortcuts import redirect,render 
from django.contrib.auth.forms import AuthenticationForm 
from django.contrib.auth import authenticate,login,logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required, permission_required
from .forms import UserForm
from django.contrib.auth.models import User, Group, Permission, ContentType
from django.db.models import Q
from django.core.paginator import Paginator
from django.forms.models import inlineformset_factory
from django.utils import timezone

# Create your views here. 
def acceder(request): 
    if request.method=="POST":
        form = AuthenticationForm(request,data=request.POST)
        if form.is_valid():
            nombre_usuario=form.cleaned_data.get("username")
            password=form.cleaned_data.get("password")
            usuario=authenticate(username=nombre_usuario,password=password)
            if usuario is not None:
                login(request,usuario)
                if request.user.groups.filter(name='Mozo').exists():
                    return redirect("listarmesa")
                else:
                    return redirect("home")
                    
            else: 
                messages.error(request,"Los datos son incorrectos")         
        else: 
            messages.error(request,"Los datos son incorrectos") 

    form=AuthenticationForm() 
    return render(request,"login.html",{"form":form})


@login_required
@permission_required('auth.view_user', raise_exception=True)
def listarusuario(request):

    queryset=request.GET.get("buscar")
    usuario=User.objects.filter(is_active=True)
    paginator = Paginator(usuario,6)
    pagina = request.GET.get("page") or 1
    usuario = paginator.get_page(pagina)
    pagina_actual = int(pagina)
    paginas = range(1, usuario.paginator.num_pages + 1)
    if queryset:
        usuario=User.objects.filter(
            Q(username__icontains=queryset),is_active=True
            ).distinct()
    context={'usuario':usuario,'pagina':pagina,'paginas':paginas,'pagina_actual':pagina_actual}
    return render(request,"usuario/listar.html",context)

@login_required
@permission_required('auth.add_user', raise_exception=True)
def agregarusuario(request):
    if request.method=="POST":
        form=UserForm(request.POST)
        if form.is_valid():
            usuario = form.save()
            grupo = Group.objects.get(name=request.POST['grupo'])
            usuario.groups.add(grupo)
            return redirect("home")
    else:
        form=UserForm()
    context={'form':form}
    return render(request,"usuario/agregar.html",context)

@login_required
@permission_required('auth.change_user', raise_exception=True)
def editarusuario(request,id):
    usuario=User.objects.get(id=id)
    if request.method=="POST":
        form=UserForm(request.POST,instance=usuario)
        if form.is_valid():
            usuario = form.save()
            usuario.groups.clear()
            grupo = Group.objects.get(name=request.POST['grupo'])
            usuario.groups.add(grupo)
            return redirect("listarusuario")
    else:
        form=UserForm(instance=usuario)
    context={"form":form}
    return render(request,"usuario/editar.html",context)

@login_required
@permission_required('auth.delete_user', raise_exception=True)
def eliminarusuario(request,id):
    usuario=User.objects.get(id=id)
    usuario.is_active=False
    usuario.save()
    return redirect("listarusuario")
    
@login_required
def homePage(request):
    context={} 
    return render(request,"bienvenido.html",context)

def salir(request):
    logout(request)
    messages.info(request,"Saliste exitosamente")
    return redirect("login")

@login_required
def perfil(request):
    p = Permission.objects.all()
    if request.method=="POST":
        usuario=authenticate(username=request.user.username,password=request.POST['conActual'])       
        if usuario is not None:
            if (request.POST['nuevaCon1'] == request.POST['nuevaCon2']):
                usuario.set_password(request.POST['nuevaCon1'])
                usuario.save()
                messages.info(request,"Contraseña cambiada")
            else:
                messages.error(request,"Las contraseñas no coinciden") 
        else:
            messages.error(request,"Contraseña erronea") 
    context={"p":p}
    return render(request,"perfil.html",context)