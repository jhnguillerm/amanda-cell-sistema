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
        <title>Proveedores</title>
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
                        <li class="sidebar-item active"><a class="sidebar-link" href="Proveedor.jsp"><ion-icon class="align-middle"
                                                                                                               name="people"></ion-icon><span class="align-middle">Proveedores</span></a>
                        </li>
                        <li class="sidebar-header">
                            Usuarios
                        </li>
                        <li class="sidebar-item"><a class="sidebar-link" href="Cliente.jsp"><ion-icon class="align-middle"
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
                <h1 class="h3" style="grid-column: 1 / 5; grid-row: 1 / 2; height: 30px !important;">Panel de<strong> Proveedores</strong></h1>
                <div class="content-table">
                    <table id="tablaProducto" class="table table-striped" style="width:100%">
                        <thead>
                            <tr>
                                <th>#ID</th>
                                <th>Nombre</th>
                                <th>Dirección</th>
                                <th>Número</th>
                                <th>Correo</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ProveedorDAO proveedorDAO = new ProveedorDAO();
                                List<Proveedor> list = proveedorDAO.toList();
                                Iterator<Proveedor> iterador = list.iterator();
                                Proveedor proveedor = null;

                                while (iterador.hasNext()) {
                                    proveedor = iterador.next();
                            %>
                            <tr>
                                <td><%=proveedor.getIdProveedor()%></td>
                                <td><%=proveedor.getNombre()%></td>
                                <td><%=proveedor.getDireccion()%></td>
                                <td><%=proveedor.getNumero()%></td>
                                <td><%=proveedor.getCorreo()%></td>
                                <td>
                                    <!-- Boton para actualizar un producto -->
                                    <button type="button" class="btn align-middle"><i style="color: #7e7e7d; font-size: 18px;" class="bi bi-pencil-square"></i></button>
                                    <!-- Boton que abre el modal para confirmar si desea eliminarlo o no -->
                                    <button type="button" class="btn-close" data-bs-toggle="modal" data-bs-target="#btn-delete-producto"></button>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <!-- Buttons -->
                <div class="botones" style="grid-column: 1 / 5;">
                    <!-- Button - Agregar Producto -->
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#btn-create-producto">
                        Agregar Producto
                    </button>
                    <!-- / Button - Agregar Producto -->
                </div>
                <!-- / Buttons -->
                <!-- MODALES -->
                <!-- Modal - Agregar Producto -->
                <div class="modal fade" id="btn-create-producto" tabindex="-1" aria-labelledby="modal-create-producto"
                     aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="modal-create-producto">Agregar Producto</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <!-- Formulario - Agregar Producto -->
                                <form action="/amanda-cell-sistema/SvProducto" method="post" class="row g-3">
                                    <div class="col-12">
                                        <label for="txtNombre" class="form-label">Nombre</label>
                                        <input name="txtNombre" type="text" class="form-control" id="txtNombre" required>
                                    </div>
                                    <div class="col-12">
                                        <label for="areaDescripcion" class="form-label">Descripción</label>
                                        <textarea name="areaDescripcion" class="form-control" id="areaDescripcion"
                                                  rows="3" required></textarea>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txtPrecioCompra" class="form-label">Precio de compra</label>
                                        <input name="txtPrecioCompra" type="text" class="form-control" id="txtPrecioCompra" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txtPrecioVenta" class="form-label">Precio de venta</label>
                                        <input name="txtPrecioVenta" type="text" class="form-control" id="txtPrecioVenta" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txtStock" class="form-label">Stock</label>
                                        <input name="txtStock" type="text" class="form-control" id="txtStock" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txtTipo" class="form-label">Tipo</label>
                                        <input name="txtTipo" type="text" class="form-control" id="txtTipo" required>
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
                <!-- Modal - Eliminar Producto -->
                <div class="modal fade" id="btn-delete-producto" tabindex="-1" aria-labelledby="modal-delete-producto" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="modal-delete-producto">Eliminar producto</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                ¿Seguro que deseas eliminar este producto?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Conservar</button>
                                <!-- Boton que elimina definitivamente el producto -->
                                <a href="" class="btn btn-danger">Eliminar</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- / Modal - Eliminar Producto -->
                <!-- / MODALES-->
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