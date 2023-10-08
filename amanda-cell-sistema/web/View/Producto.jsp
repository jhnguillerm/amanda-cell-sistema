<%@page import="java.util.Iterator"%>
<%@page import="Model.Producto"%>
<%@page import="java.util.List"%>
<%@page import="ModelDAO.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema Principal</title>
    <link rel="stylesheet" href="../css/style.css"">
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!-- Ionicons -->
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>

<body>
    <div class="wrapper">
        <!-- Nav vertical -->
        <nav class="sidebar">
            <div class="sidebar-content">
                <!-- Logo -->
                <div>
                    <a class="sidebar-brand" href="index.html">
                        <h1 class="sidebar-title">Amanda Cell</h1>
                    </a>
                </div>
                <!-- / Logo -->
                <!-- Perfil -->
                <div class="sidebar-profile">
                    <img class="sidebar-photo" src="../images/profile.webp" alt="profile" style="width: 100px;">
                    <h5 class="sidebar-name">Jhon Moreno</h5>
                    <p class="sidebar-role">Administrador</p>
                </div>
                <!-- / Perfil -->
                <ul class="sidebar-nav">
                    <li class="sidebar-header">
                        Servicios
                    </li>
                    <li class="sidebar-item"><a class="sidebar-link" href="#"><ion-icon class="align-middle"
                                name="bag-handle"></ion-icon><span class="align-middle">Ventas</span></a></li>
                    <li class="sidebar-item"><a class="sidebar-link" href="#"><ion-icon class="align-middle"
                                name="construct"></ion-icon><span class="align-middle">Reparaciones</span></a>
                    </li>
                    <li class="sidebar-header">
                        Materiales
                    </li>
                    <li class="sidebar-item active"><a class="sidebar-link" href="#"><ion-icon class="align-middle"
                                name="cube"></ion-icon><span class="align-middle">Productos</span></a></li>
                    <li class="sidebar-item"><a class="sidebar-link" href="#"><ion-icon class="align-middle"
                                name="people"></ion-icon><span class="align-middle">Proveedores</span></a>
                    </li>
                    <li class="sidebar-header">
                        Usuarios
                    </li>
                    <li class="sidebar-item"><a class="sidebar-link" href="#"><ion-icon class="align-middle"
                                name="person-add"></ion-icon><span class="align-middle">Clientes</span></a>
                    </li>
                    <li class="sidebar-item"><a class="sidebar-link" href="#"><ion-icon class="align-middle"
                                name="person"></ion-icon class="align-middle"><span
                                class="align-middle">Empleados</span></a></li>
                    <li class="sidebar-header">
                        Otros
                    </li>
                    <li class="sidebar-item"><a class="sidebar-link" href="#"><ion-icon class="align-middle"
                                name="exit"></ion-icon><span class="align-middle">Log out</span></a>
                    </li>
                    <li class="sidebar-item"><a class="sidebar-link" href="#"><ion-icon class="align-middle"
                                name="options"></ion-icon><span class="align-middle">Settings</span></a></li>
                </ul>
            </div>
        </nav>
        <!-- / Nav vertical -->

        <main class="content">
            <h1 class="h3" style="grid-column: 1 / 3; grid-row: 1 / 2">Panel de<strong> Productos</strong></h1>
            <div class="content-table">
                <div class="scroll-table">
                    <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th scope="col">#ID</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Descripción</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Stock</th>
                            <th scope="col">Tipo</th>
                            <th scope="col">Proveedor</th>
                        </tr>
                    </thead>
                    <%
                        ProductoDAO productoDAO = new ProductoDAO();
                        List<Producto> list = productoDAO.toList();
                        Iterator<Producto> iterator = list.iterator();
                        Producto producto = null;
                        
                        while (iterator.hasNext()) {
                            producto = iterator.next();
                        
                    %>
                    <tbody>
                        <tr>
                            <td><%=producto.getIdProducto() %></td>
                            <td><%=producto.getNombre()%></td>
                            <td><%=producto.getDescripcion()%></td>
                            <td><%=producto.getPrecio()%></td>
                            <td><%=producto.getStock()%></td>
                            <td><%=producto.getTipo()%></td>
                            <td><%=producto.getIdProveedor()%></td>
                        </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
                </div>
            </div>
            <div class="summary-block">
                <div class="content-data">
                    productos totales
                    s/.400
                </div>
                <div class="content-data">
                    Gastos totales
                    s/.300
                </div>
            </div>
        </main>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>

</html>