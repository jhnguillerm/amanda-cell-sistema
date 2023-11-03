<%@page import="Model.Producto"%>
<%@page import="ModelDAO.ProductoDAO"%>
<%@page import="Model.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="ModelDAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                <form action="/amanda-cell-sistema/SvProducto" method="post" class="m-0">
                    <div class="d-flex flex-wrap justify-content-between align-items-center mb-3">

                        <div class="d-flex flex-column justify-content-center">
                            <h4 class="mb-1 mt-3">Nueva venta</h4>
                        </div>
                        <div class="d-flex align-content-center flex-wrap gap-3">
                            <button type="submit" class="btn btn-primary" id="btn-agregar" name="action" value="create">Agregar Producto</button>
                            <button type="submit" class="btn btn-primary" id="btn-actualizar" name="action" value="update">Actualizar Producto</button>
                        </div>
                    </div>

                    <div class="row">
                        <!-- Primera columna -->
                        <div class="col-12 col-lg-4">
                            <!-- Cliente -->
                            <div class="card mb-4 border-0 shadow-lg">
                                <div class="card-header border-0 bg-body">
                                    <h5 class="card-title mb-0">Datos del cliente</h5>
                                </div>
                                <div class="card-body">
                                    <div class="mb-3 col">
                                        <div class="input-group">
                                            <select id="cbCliente" class="form-select" name="cbCliente">
                                                <option value="">Selecciona el cliente</option>
                                                <%
                                                    ClienteDAO clienteDAO = new ClienteDAO();
                                                    List<Cliente> listaClientes = clienteDAO.toList();
                                                    for (Cliente cliente : listaClientes) {
                                                %>
                                                <option value="<%= cliente.getIdCliente()%>"><%= cliente.getNombres()%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                            <button class="btn btn-primary">
                                                <i class="bi bi-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-4">
                                            <label class="form-label" for="txtDni">DNI</label>
                                            <input type="text" class="form-control" name="txtDni" id="txtDni" disabled>
                                        </div>
                                        <div class="col-8">
                                            <label class="form-label" for="txtNombres">Nombres</label>
                                            <input type="text" class="form-control" name="txtNombres" id="txtNombres" disabled>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Cliente -->
                            <!-- Producto -->
                            <div class="card mb-4 border-0 shadow-lg">
                                <div class="card-header border-0 bg-body">
                                    <h5 class="card-title mb-0">Datos del producto</h5>
                                </div>
                                <div class="card-body">
                                    <div class="mb-3 col">
                                        <div class="input-group">
                                            <select id="cbProducto" class="form-select" name="cbProducto">
                                                <option value="">Selecciona el producto</option>
                                                <%
                                                    ProductoDAO productoDAO = new ProductoDAO();
                                                    List<Producto> listaProductos = productoDAO.toList();
                                                    for (Producto producto : listaProductos) {
                                                %>
                                                <option value="<%= producto.getIdProducto()%>"><%= producto.getNombre()%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                            <button class="btn btn-primary">
                                                <i class="bi bi-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label class="form-label" for="txtNombre">Nombre</label>
                                            <input type="text" class="form-control" name="txtNombre" id="txtNombre" disabled>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-4">
                                            <label class="form-label" for="txtPrecio">Precio</label>
                                            <input type="text" class="form-control" name="txtPrecio" id="txtPrecio" disabled>
                                        </div>
                                        <div class="col-4">
                                            <label class="form-label" for="txtStock">Stock</label>
                                            <input type="text" class="form-control" name="txtStock" id="txtStock" disabled>
                                        </div>
                                        <div class="col-4">
                                            <label class="form-label" for="txtCantidad">Cantidad</label>
                                            <input type="number" class="form-control" name="txtCantidad" id="txtCantidad">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Producto -->
                        </div>
                        <!-- /Primera columna -->
                        <!-- Segunda columna-->
                        <div class="col-12 col-lg-8">
                            <!-- Información general -->
                            <div class="card mb-4 border-0 shadow-lg">
                                <div class="card-header border-0 bg-body d-flex align-items-center">
                                    <h5 class="card-tile mb-0">NRO. SERIE</h5>
                                    <div class="col-3 px-4">
                                        <input type="number" class="form-control" name="txtNumSerie" id="txtNumSerie" disabled>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table id="tablaVenta" class="table table-striped" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>Producto</th>
                                                <th>Precio</th>
                                                <th>Cantidad</th>
                                                <th>Total</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="align-middle"></td>
                                                <td class="align-middle"></td>
                                                <td class="align-middle">
                                                    <div class="col-2">
                                                        <input type="number" class="form-control" name="txtCantidad" id="txtNumSerie">
                                                    </div>
                                                </td>
                                                <td class="align-middle"></td>
                                                <td class="align-middle">
                                                    <!-- Boton para actualizar un proveedor -->
                                                    <a class="align-middle" href=""><i style="color: #7e7e7d; font-size: 18px;" class="bi bi-pencil-square"></i></a>
                                                    <!-- Boton que abre el modal para confirmar si desea eliminarlo o no -->
                                                    <button type="button" class="btn-close align-middle btn-modal-eliminar-proveedor" data-bs-toggle="modal" data-bs-target="#modal-eliminar"></button>

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
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- /Información genenal -->
                        </div>
                        <!-- /Segunda columna -->
                    </div>
                </form>
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
        <script src="${pageContext.servletContext.contextPath}/js/script.js"></script>
    </body>
</html>
