<%@page import="ModelDAO.ProveedorDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <h1 class="h3" style="grid-column: 1 / 3; grid-row: 1 / 2; height: 30px !important;">Panel de<strong> Productos</strong></h1>
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
                                    <td><%=producto.getIdProducto()%></td>
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
                        <p class="content-data-title">STOCK TOTAL</p>
                        <span class="content-data-value">120</span>
                    </div>
                    <div class="content-data">
                        <p class="content-data-title">PRECIO TOTAL</p>
                        <span class="content-data-value">s/.12,300</span>
                    </div>
                </div>
                <!-- Buttons -->
                <div class="botones">
                    <!-- Button - Agregar Producto -->
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#btn-create">
                        Agregar Producto
                    </button>

                    <!-- / Button - Agregar Producto -->

                    <!-- Modal - Agregar Producto -->
                    <div class="modal fade" id="btn-create" tabindex="-1" aria-labelledby="model-create-producto"
                         aria-hidden="true">
                        <div class="modal-dialog modal-dialog-scrollable">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="model-create-producto">Agregar Producto</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <!-- Formulario - Agregar Producto -->
                                    <form action="/amanda-cell-sistema/SvProducto" method="post" class="row g-3">
                                        <div class="col-12">
                                            <label for="txtNombre" class="form-label">Nombre</label>
                                            <input name="txtNombre" type="text" class="form-control" id="txtNombre">
                                        </div>
                                        <div class="col-12">
                                            <label for="areaDescripcion" class="form-label">Descripción</label>
                                            <textarea name="areaDescripcion" class="form-control" id="areaDescripcion"
                                                      rows="3"></textarea>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="txtPrecio" class="form-label">Precio</label>
                                            <input name="txtPrecio" type="text" class="form-control" id="txtPrecio">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="txtStock" class="form-label">Stock</label>
                                            <input name="txtStock" type="text" class="form-control" id="txtStock">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="txtTipo" class="form-label">Tipo</label>
                                            <input name="txtTipo" type="text" class="form-control" id="txtTipo">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="txtIdProveedor" class="form-label">ID Proveedor</label>
                                            <input name="txtIdProveedor" type="text" class="form-control" id="txtIdProveedor">
                                        </div>
                                        <div class="col-12">
                                            <button type="submit" class="btn btn-primary">Agregar</button>
                                        </div>
                                    </form>
                                    <!-- / Formulario - Agregar Producto -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- / Modal - Agregar Producto -->
                </div>
                <!-- / Buttons -->
            </main>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    </body>

</html>