<%@page import="ModelDAO.ProveedorDAO"%>
<%@page import="Model.Proveedor"%>
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
        <title>Clientes</title>
        <!-- Estilos -->
        <link rel="stylesheet" href="../css/style.css">
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
        <!-- Bootstrap icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
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
                        <li class="sidebar-item"><a class="sidebar-link" href="Producto.jsp"><ion-icon class="align-middle"
                                                                                                       name="cube"></ion-icon><span class="align-middle">Productos</span></a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="Proveedor.jsp"><ion-icon class="align-middle"
                                                                                                        name="people"></ion-icon><span class="align-middle">Proveedores</span></a>
                        </li>
                        <li class="sidebar-header">
                            Usuarios
                        </li>
                        <li class="sidebar-item active"><a class="sidebar-link" href="Cliente.jsp"><ion-icon class="align-middle"
                                                                                                   name="person-add"></ion-icon><span class="align-middle">Clientes</span></a>
                        </li>
                        <li class="sidebar-item"><a class="sidebar-link" href="Empleado.jsp"><ion-icon class="align-middle"
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
                <div class="d-flex align-items-center justify-content-center vh-100">
                    <div class="text-center">
                        <h1 class="display-1 fw-bold">404</h1>
                        <p class="fs-3"> <span class="text-danger">Opps!</span> Page not found.</p>
                        <p class="lead">
                            La página que estás buscando no existe.
                        </p>
                        <a href="../index.jsp" class="btn btn-primary">Volver</a>
                    </div>
                </div>
            </main>
        </div>

        <!-- Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#tablaProducto').DataTable({
                    "paging": true,
                    "lengthMenu": [10, 25, 50],
                    "searching": true
                });
            });
        </script>
        <!-- / Bootstrap -->
    </body>

</html>