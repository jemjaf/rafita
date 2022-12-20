# 🆘 Guía de ayuda para desplegar el proyecto en www.render.com!

## 📚 Base de datos

Desde el panel de Render(https://dashboard.render.com/), haga clic en "Nuevo" en la parte superior derecha de la pantalla y luego en "PostgreSQL". Luego, crea una instancia de PostgreSQL con los siguientes parámetros:

 - Nombre: nombre personalizado
 - Base de datos: dejar en blanco
 - Usuario: Dejar en blanco
 - Región: La región más cercana a usted
 - Versión PostgreSQL: 15
 - Clave de API de Datadog: dejar en blanco
 - Tipo de Plan: Plan que se adapta a tus necesidades (Free)

## 📖 Servicio web

Una vez más, haga clic en "Nuevo" en la parte superior derecha de la pantalla, pero esta vez seleccione "Servicio web".

Conecte su cuenta de Render a su cuenta de GitHub o GitLab. Asegúrese de otorgar permisos de procesamiento a los repositorios que desea implementar. Una vez conectado seleccione su repositorio.

Ingrese los siguientes detalles:

 - Nombre: nombre personalizado
 - Región: La misma región que su base de datos
 - Rama: Su rama principal (p. ej., maestro/principal)
 - Directorio raíz: dejar vacío
 - Entorno: Python 3
 - Comando de compilación: sh build.sh
 - Comando de inicio: gunicorn core.wsgi:application
 - Tipo de Plan: Plan que se adapta a tus necesidades (Free)

Abra el menú desplegable "Avanzado" y agregue las siguientes variables ambientales:

 - PYTHON_VERSION: 3.9.9
 - SECRET_KEY: Haga clic en "Generar"
 - DEBUG: 1
 - ALLOWED_HOSTS: *
 - DATABASE_URL: <your_internal_database_url> (La obtienes de los datos de tu base creada en Render)


## Llenar datos de prueba
Luego con ayuda de pgadmin nos conectamos a la base de datos creada en render
y ejecutamos el script llamado "Datos-PostgreSQL.sql"

### Eso es todo, éxitos!