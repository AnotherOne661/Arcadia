>[!IMPORTANT]
> AWS temp website ec2-16-171-226-206.eu-north-1.compute.amazonaws.com

>[!TIP]
>Ahora puedes ejecutar desde la consola run.bat y lanzará la página automáticamente

# Para ejecutar en VSCode

## Ctrl+Shift+ñ

### `php -S localhost:8000` (o `php -t public -S localhost:8080` si se ejecuta desde el directorio raíz)

### **Si ni con esas funciona deberéis añadir "C:\xampp\" a PATH, podéis preguntarme**

>[!WARNING]
>Es necesario migrar la base de datos al ordenador antes de ejecutarlo

# Para migrar la base de datos

## El Script de creación e inserción se encuentra en /sql/arcadia[fecha más reciente].sql

### Desde el xampp, en phpmyadmin, en importar, y seleccionando el archivo






# English






>[!TIP]
>You can now launch the run.bat/run.sh and it will run directly locally

>[!NOTE]
>To launch the landing page of Arcadia's first sprint (without SQL) just download and extract `basic` and doble click `index.html`

# To launch the page in localhost

## xampp is required for running on local

## Open the terminal and launch `php -S localhost:8000 -t public/` or `php -S localhost:8000` if you're already in public`

### if this doesn't work, try adding "C:\xampp" to PATH 

>[!WARNING]
>It is required to import the database to xampp in order to run

# To import the database:

## The SQL script is located in sql/arcadia[most-recent-date].sql 

### Open phpmyadmin from xampp,click on import and select the file
