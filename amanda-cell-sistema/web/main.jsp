<%@page import="ModelDAO.ProveedorDAO"%>
<%@page import="Model.Proveedor"%>
<%@page import="java.util.Iterator"%>
<%@page import="Model.Producto"%>
<%@page import="java.util.List"%>
<%@page import="ModelDAO.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pagina Principal</title>
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
        <!-- Estilos -->
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <div class="wrapper">
            <!-- Nav vertical -->
            <nav class="sidebar">
                <div id="leftside-navigation" class="nano">
                    <!-- Logo -->
                    <div>
                        <a class="sidebar-brand" href="main.jsp">
                            <h1 class="sidebar-title">Amanda Cell</h1>
                        </a>
                    </div>
                    <!-- / Logo -->
                    <ul class="sidebar-nav">
                        <li class="active">
                            <a href="main.jsp">
                                <span>Inicio</span>
                            </a>
                        </li>
                        <!-- Servicios -->
                        <li class="sidebar-header">
                            Servicios
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:void(0);">
                                <ion-icon class="align-middle" name="bag-handle"></ion-icon>
                                <span>Ventas</span>
                            </a>
                            <ul>
                                <li>
                                    <a href="View/venta.jsp">Nueva venta</a>
                                </li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:void(0);">
                                <ion-icon class="align-middle" name="construct"></ion-icon>
                                <span>Reparaciones</span>
                            </a>
                            <ul>
                                <li>
                                    <a href="View/servicio.jsp">Reparación</a>
                                </li>
                            </ul>
                        </li>
                        <!-- Materiales -->
                        <li class="sidebar-header">
                            Materiales
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:void(0);">
                                <ion-icon class="align-middle" name="cube"></ion-icon>
                                <span>Productos</span>
                            </a>
                            <ul>
                                <li>
                                    <a href="View/producto.jsp">Lista de productos</a>
                                </li>
                                <li>
                                    <a href="View/addProducto.jsp">Nuevo producto</a>
                                </li>
                                <li>
                                    <a href="View/updateProducto.jsp">Editar producto</a>
                                </li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:void(0);">
                                <ion-icon class="align-middle" name="people"></ion-icon>
                                <span>Proveedores</span>
                            </a>
                            <ul>
                                <li>
                                    <a href="View/proveedor.jsp">Lista de proveedores</a>
                                </li>
                                <li>
                                    <a href="View/addProveedor.jsp">Nuevo proveedor</a>
                                </li>
                                <li>
                                    <a href="View/updateProveedor.jsp">Editar proveedor</a>
                                </li>
                            </ul>
                        </li>
                        <!-- Usuarios -->
                        <li class="sidebar-header">
                            Usuarios
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:void(0);">
                                <ion-icon class="align-middle" name="cube"></ion-icon>
                                <span>Clientes</span>
                            </a>
                            <ul>
                                <li>
                                    <a href="View/cliente.jsp">Lista de clientes</a>
                                </li>
                                <li>
                                    <a href="View/addCliente.jsp">Nuevo cliente</a>
                                </li>
                                <li>
                                    <a href="View/updateCliente.jsp">Editar cliente</a>
                                </li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:void(0);">
                                <ion-icon class="align-middle" name="people"></ion-icon>
                                <span>Empleados</span>
                            </a>
                            <ul>
                                <li>
                                    <a href="View/empleado.jsp">Lista de empleados</a>
                                </li>
                                <li>
                                    <a href="View/addEmpleado">Nuevo empleado</a>
                                </li>
                                <li>
                                    <a href="View/updateEmpleado">Editar editar empleado</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- / Nav vertical -->

            <main class="content">
                <!-- Nav horizontal -->
                <header class="p-3 mb-3 border-bottom rounded shadow-lg" style="background-color: #fff;">
                    <div class="container">
                        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                                <li><a href="main.jsp" class="nav-link px-2 link-secondary">Inicio</a></li>
                                <li><a href="#" class="nav-link px-2 link-body-emphasis">Servicios</a></li>
                                <li><a href="#" class="nav-link px-2 link-body-emphasis">Materiales</a></li>
                                <li><a href="#" class="nav-link px-2 link-body-emphasis">Usuarios</a></li>
                            </ul>
                            <div class="dropdown text-end">
                                <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                                    <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32"
                                         class="rounded-circle">
                                </a>
                                <ul class="dropdown-menu text-small">
                                    <li>
                                        <a class="dropdown-item" href="pages-account-settings-account.html">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0 me-3">
                                                    <div class="avatar avatar-online">
                                                        <img src="https://github.com/mdo.png" width="40" height="40" alt="" class="w-px-40 h-auto rounded-circle">
                                                    </div>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <span class="fw-medium d-block" style="color: #808d9b">Jhon Moreno</span>
                                                    <small class="text-muted" style="color: #a2b0bb">Admin</small>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li><a class="dropdown-item" href="#">Settings</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="View/login.jsp">Sign out</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </header>
                <!-- / Nav horizontal -->
            </main>
        </div>
        <!-- jquery -->
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <!-- / jquery -->
        <!-- Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

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
        <script src="${pageContext.servletContext.contextPath}/js/producto.js"></script>
        <script src="${pageContext.servletContext.contextPath}/js/script.js"></script>
    </body>

</html>