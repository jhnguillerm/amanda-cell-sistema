<%@page import="Model.Venta"%>
<%@page import="ModelDAO.VentaDAO"%>
<%@page import="Model.Cliente"%>
<%@page import="ModelDAO.ClienteDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
                <h1 class="h3" style="grid-column: 1 / 5; grid-row: 1 / 2; height: 30px !important;">Panel de<strong> Ventas</strong></h1>

                <div class="container-fluid p-3 rounded shadow-lg" style="background-color: #fff">
                    <div class="row w-100 justify-content-between mb-3">
                        <div class="col-5">
                            <h5 class="h5">Tabla de ventas</h5>
                        </div>
                        <div class="col-auto">
                            <!-- Button - Agregar -->
                            <a href="nuevaVenta.jsp" class="btn btn-primary">Nueva venta</a>
                        </div>
                    </div>
                    <table id="tablaVenta" class="table table-striped" style="width:100%">
                        <thead>
                            <tr>
                                <th>N° serie</th>
                                <th>Fecha</th>
                                <th>Total</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                VentaDAO ventaDAO = new VentaDAO();
                                List<Venta> list = ventaDAO.toList();
                                Iterator<Venta> iterador = list.iterator();
                                Venta venta = null;

                                while (iterador.hasNext()) {
                                    venta = iterador.next();
                            %>
                            <tr>
                                <td class="align-middle"><%=venta.getNumSerie()%></td>
                                <td class="align-middle"><%=venta.getFechaVenta()%></td>
                                <td class="align-middle"><%=venta.getMonto()%></td>
                                <td class="align-middle">
                                    <!-- Boton para ver la venta -->
                                    <a class="align-middle btn" href="detalleVenta.jsp?idVenta=<%=venta.getIdVenta()%>&numSerie=<%=venta.getNumSerie()%>&fecha=<%=venta.getFechaVenta()%>&monto=<%=venta.getMonto()%>&idCliente=<%=venta.getIdCliente()%>&idEmpleado=<%=venta.getIdEmpleado()%>">
                                        <i style="color: #7e7e7d; font-size: 18px;" class="bi bi-eye"></i>
                                    </a>

                                    <!-- Boton que abre el modal para confirmar si desea eliminarlo o no -->
                                    <!--<button type="button" class="btn-close align-middle btn-modal-eliminar" data-bs-toggle="modal" data-bs-target="#modal-eliminar" data-nombre="<%= venta.getNumSerie()%>" data-id="<%= venta.getIdVenta()%>"></button>-->

                                    <!-- Modal - Eliminar -->
                                    <div class="modal fade" id="modal-eliminar" tabindex="-1" aria-labelledby="modal-delete" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5">Eliminar cliente</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>¿Seguro que deseas eliminar este proveedor?</p>
                                                    <p>ID: <span id="cliente-id"></span></p>
                                                    <p>Nombre: <span id="cliente-nombres"></span></p>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Conservar cliente</button>
                                                        <!-- Botón para eliminar un proveedor -->
                                                        <button type="submit" class="btn btn-danger" id="btn-eliminar" name="action" value="delete">Eliminar cliente</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /Modal - Eliminar -->
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
                $('#tablaVenta').DataTable({
                    "paging": true,
                    "lengthMenu": [6, 10, 25, 50],
                    "searching": true
                });
            });
        </script>
        <!-- / Bootstrap -->
        <script src="${pageContext.servletContext.contextPath}/js/cliente.js"></script>
        <script src="${pageContext.servletContext.contextPath}/js/script.js"></script>
    </body>

</html>