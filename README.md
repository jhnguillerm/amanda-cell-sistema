# Amanda Cell Sistema

Amanda Cell Sistema es una aplicación de control de inventario y ventas diseñada para la empresa de reparación de celulares Amanda Cell. Este proyecto se desarrolla en Java Web y utiliza el JDBC de MySQL para interactuar con la base de datos. Además, el proyecto se despliega en el servidor Tomcat y requiere la creación de una base de datos llamada "amanda_cell_database".

## Funcionalidades

- Gestión de inventario de productos.
- Registro de ventas y seguimiento de transacciones.
- Control de usuarios con diferentes roles (administrador, empleado, etc.).
- Interfaz de usuario amigable y fácil de usar.

## Requisitos

Antes de ejecutar la aplicación, asegúrate de tener instalados los siguientes componentes:

- [JDBC MYSQL](https://dev.mysql.com/downloads/connector/j/)
- [Tomcat Server](https://tomcat.apache.org/)
- [MySQL Workbench](https://www.mysql.com/products/workbench/)

Todos estos también se encuentran en la carpeta REQUERIDO.

## Configuración

Sigue estos pasos para configurar y ejecutar la aplicación:

1. Clona este repositorio en tu máquina local.
2. Importa el proyecto en tu IDE de Java.
3. Agrega el archivo JDBC de MySQL a la librería del proyecto siguiendo estos pasos:
   - Copia el archivo JAR del controlador descargado a la carpeta `lib` de tu proyecto.
   - Agrega el archivo JAR como una biblioteca al proyecto en tu IDE.
4. Inicia XAMPP y asegúrate de que el servicio MySQL esté en ejecución.
5. Crea la base de datos "amanda_cell_database" utilizando phpMyAdmin o la línea de comandos MySQL.
6. Configura la conexión a la base de datos en el archivo de configuración ( `amanda_cell`).
7. Ejecuta la aplicación en el servidor Tomcat.

## Problemas

Si encuentras el siguiente problema:

**"Deployment descriptor directory cannot be found netbeans."**

Debes crear la carpeta `WEB-INF` en la carpeta raíz del proyecto `amanda-cell-sistema\web`.

## Contribuir

Sigue estos pasos para contribuir:

1. Crea un fork del repositorio.
2. Crea una nueva rama para tu función o corrección.
3. Realiza tus cambios y asegúrate de que las pruebas pasen.
4. Envía un pull request a la rama principal del repositorio original.

---

© [Jhon]()
