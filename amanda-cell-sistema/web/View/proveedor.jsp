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
        <jsp:include page = "../components/head.jsp"/>
    </head>
    <body>
        <div class="wrapper">
            <!-- Nav vertical -->
            <jsp:include page = "../components/navbar_vertical.jsp"/>
            <!-- / Nav vertical -->

            <main class="content">
                <!-- Nav horizontal -->
                <jsp:include page = "../components/navbar_horizontal.jsp"/>
                <!-- / Nav horizontal -->
                <h1 class="h3" style="grid-column: 1 / 5; grid-row: 1 / 2; height: 30px !important;">Panel de<strong> Proveedores</strong></h1>
                
                <div class="container-fluid p-3 rounded shadow-lg" style="background-color: #fff">
                    <div class="row w-100 justify-content-between mb-3">
                        <div class="col-5">
                            <h5 class="h5">Tabla de proveedores</h5>
                        </div>
                        <div class="col-auto">
                            <!-- Button - Agregar Proveedor -->
                            <a href="loadProveedor.jsp?modo=agregar" class="btn btn-primary">Agregar Proveedor</a>
                        </div>
                    </div>
                    <table id="tablaProveedor" class="table table-striped" style="width:100%">
                        <thead>
                            <tr>
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
                                <td class="align-middletd_nombre"><%=proveedor.getNombre()%></td>
                                <td class="align-middle td_direccion"><%=proveedor.getDireccion()%></td>
                                <td class="align-middle td_numero"><%=proveedor.getNumero()%></td>
                                <td class="align-middle td_correo"><%=proveedor.getCorreo()%></td>
                                <td class="align-middle">
                                    <!-- Boton para actualizar un proveedor -->
                                    <a class="align-middle" href="loadProveedor.jsp?idProveedor=<%= proveedor.getIdProveedor()%>&nombre=<%= proveedor.getNombre() %>&direccion=<%= proveedor.getDireccion()%>&numero=<%= proveedor.getNumero()%>&correo=<%= proveedor.getCorreo()%>&modo=editar"><i style="color: #7e7e7d; font-size: 18px;" class="bi bi-pencil-square"></i></a>
                                    <!-- Boton que abre el modal para confirmar si desea eliminarlo o no -->
                                    <button type="button" class="btn-close align-middle btn-modal-eliminar-proveedor" data-bs-toggle="modal" data-bs-target="#modal-eliminar" data-nombre="<%= proveedor.getNombre()%>" data-id="<%= proveedor.getIdProveedor()%>"></button>
                                    
                                    <!-- Modal - Eliminar Proveedor -->
                                    <div class="modal fade" id="modal-eliminar" tabindex="-1" aria-labelledby="modal-delete-proveedor" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5">Eliminar proveedor</h1>
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
        <script src="${pageContext.servletContext.contextPath}/js/script.js"></script>
    </body>

</html>