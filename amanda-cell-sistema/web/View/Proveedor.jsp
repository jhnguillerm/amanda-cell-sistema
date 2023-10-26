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
                        <li class="sidebar-item"><a class="sidebar-link" href="venta.jsp"><ion-icon class="align-middle"
                                                                                            name="bag-handle"></ion-icon><span class="align-middle">Ventas</span></a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="reparacion.jsp"><ion-icon class="align-middle"
                                                                                            name="construct"></ion-icon><span class="align-middle">Reparaciones</span></a>
                        </li>
                        <li class="sidebar-header">
                            Materiales
                        </li>
                        <li class="sidebar-item"><a class="sidebar-link" href="producto.jsp"><ion-icon class="align-middle"
                                                                                                       name="cube"></ion-icon><span class="align-middle">Productos</span></a></li>
                        <li class="sidebar-item active"><a class="sidebar-link" href="proveedor.jsp"><ion-icon class="align-middle"
                                                                                                               name="people"></ion-icon><span class="align-middle">Proveedores</span></a>
                        </li>
                        <li class="sidebar-header">
                            Usuarios
                        </li>
                        <li class="sidebar-item"><a class="sidebar-link" href="cliente.jsp"><ion-icon class="align-middle"
                                                                                                      name="person-add"></ion-icon><span class="align-middle">Clientes</span></a>
                        </li>
                        <li class="sidebar-item"><a class="sidebar-link" href="empleado.jsp"><ion-icon class="align-middle"
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
                    <div class="row w-100 justify-content-between mb-3">
                        <div class="col-5">
                            <h5 class="h5">Tabla de proveedores</h5>
                        </div>
                        <div class="col-auto">
                            <!-- Button - Agregar proveedor -->
                            <button type="button" class="btn btn-primary" id="abrir-modal-proveedor" data-bs-toggle="modal" data-bs-target="#modal-proveedor">
                                Agregar Proveedor
                            </button>
                            <!-- / Button - Agregar proveedor -->
                        </div>
                    </div>
                    <table id="tablaProveedor" class="table table-striped" style="width:100%">
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
                                <td class="td_id_proveedor"><%=proveedor.getIdProveedor()%></td>
                                <td class="td_nombre"><%=proveedor.getNombre()%></td>
                                <td class="td_direccion"><%=proveedor.getDireccion()%></td>
                                <td class="td_numero"><%=proveedor.getNumero()%></td>
                                <td class="td_correo"><%=proveedor.getCorreo()%></td>
                                <td>
                                    <!-- Boton para actualizar un producto -->
                                    <button type="button" class="btn align-middle btn-editar-proveedor" data-bs-toggle="modal" data-bs-target="#modal-proveedor"><i style="color: #7e7e7d; font-size: 18px;" class="bi bi-pencil-square"></i></button>
                                    <!-- Boton que abre el modal para confirmar si desea eliminarlo o no -->
                                    <button type="button" class="btn-close align-middle btn-modal-eliminar-proveedor" data-bs-toggle="modal" data-bs-target="#modal-confirmar-eliminar-proveedor" data-nombre="<%= proveedor.getNombre()%>" data-id="<%= proveedor.getIdProveedor()%>"></button>
                                    <!-- Modal - Eliminar Proveedor -->
                                    <div class="modal fade" id="modal-confirmar-eliminar-proveedor" tabindex="-1" aria-labelledby="modal-delete-proveedor" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="modal-confirmar-eliminar-proveedor">Eliminar proveedor</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>¿Seguro que deseas eliminar este proveedor?</p>
                                                    <p>ID: <span id="proveedor-id"></span></p>
                                                    <p>Nombre: <span id="proveedor-nombre"></span></p>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Conservar Proveedor</button>
                                                        <!-- Botón para eliminar un proveedor -->
                                                        <button type="submit" class="btn btn-danger" id="btn-eliminar-proveedor" name="action" value="delete">Eliminar Proveedor</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- / Modal - Eliminar Proveedor -->
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <!-- MODALES -->
                <!-- Modal - Agregar Proveedor -->
                <div class="modal fade" id="modal-proveedor" tabindex="-1" aria-labelledby="modal-create-proveedor"
                     aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="modal-create-proveedor">Agregar Proveedor</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <!-- Formulario - Agregar Proveedor -->
                                <form action="/amanda-cell-sistema/SvProveedor" method="post" class="row g-3">
                                    <div class="col-12" id="div-id_proveedor">
                                        <label for="txtIdProveedor" class="form-label">ID</label>
                                        <input type="text" class="form-control" id="txtIdProveedor" disabled>
                                        <input name="txtIdProveedor" type="hidden" id="txtIdProveedor-hidden" class="form-control">
                                    </div>
                                    <div class="col-12">
                                        <label for="txtNombre" class="form-label">Nombre</label>
                                        <input name="txtNombre" type="text" class="form-control" id="txtNombre" required>
                                    </div>
                                    <div class="col-md-12">
                                        <label for="txtDireccion" class="form-label">Direccion</label>
                                        <input name="txtDireccion" type="text" class="form-control" id="txtDireccion" required>
                                    </div>
                                    <div class="col-md-12">
                                        <label for="txtNumero" class="form-label">Numero</label>
                                        <input name="txtNumero" type="text" class="form-control" id="txtNumero" required>
                                    </div>
                                    <div class="col-md-12">
                                        <label for="txtCorreo" class="form-label">Correo</label>
                                        <input name="txtCorreo" type="text" class="form-control" id="txtCorreo" required>
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary" id="btn-agregar-proveedor" name="action" value="create">Agregar Proveedor</button>
                                        <button type="submit" class="btn btn-primary" id="btn-actualizar-proveedor" name="action" value="update">Actualizar Proveedor</button>
                                    </div>
                                </form>
                                <!-- / Formulario - Agregar Proveedor -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- / Modal - Agregar Producto -->
                <!-- / MODALES-->
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
                $('#tablaProveedor').DataTable({
                    "paging": true,
                    "lengthMenu": [6, 10, 25, 50],
                    "searching": true
                });
            });
        </script>
        <!-- / Bootstrap -->
        <script src="${pageContext.servletContext.contextPath}/js/proveedor.js"></script>
    </body>

</html>