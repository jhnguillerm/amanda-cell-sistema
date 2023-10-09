<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="View/Producto.jsp" method="post">
            <input type="submit" value="Enviar">
        </form>
        <a href="SvProducto?accion=listar">Listar</a>
    </body>
</html>
