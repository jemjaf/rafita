#!/bin/bash
# Actualizar repositorios y paquetes
sudo apt-get update -y
sudo apt-get upgrade -y

# Instalar PostgreSQL
sudo apt-get install -y postgresql postgresql-contrib
sudo apt install -y postgresql

su - postgres <<'EOpostgres'
psql -U postgres -c "ALTER USER postgres WITH PASSWORD 'pass';"
psql -U postgres -c "CREATE DATABASE rafita;"
EOpostgres

# Permitir conexiones externas
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/*/main/postgresql.conf
sudo sed -i "s/127.0.0.1\/32/0.0.0.0\/0/" /etc/postgresql/*/main/pg_hba.conf
sudo sed -i "s/::1\/128/::\/0/" /etc/postgresql/*/main/pg_hba.conf

# Reiniciar el servicio PostgreSQL
sudo systemctl restart postgresql

# sudo systemctl status 'postgresql*'

# sudo -u postgres psql
# \l
# \c rafita
# \dt
# SELECT * FROM "ComprasApp_proveedor";
# \q