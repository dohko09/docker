# Utiliza la imagen oficial de MySQL como base
FROM mysql:latest

# Establece las variables de entorno para la configuración de MySQL
ENV MYSQL_ROOT_PASSWORD='elmaton20'
ENV MYSQL_USER='dohko09'
ENV MYSQL_PASSWORD='elmaton20'

# Copia el archivo SQL de inicialización a la carpeta de inicio de MySQL
COPY init.sql /docker-entrypoint-initdb.d/

# Expone el puerto 3306 para acceder a MySQL desde fuera del contenedor
EXPOSE 3306