<%@page import="Model.Empleado"%>
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
                <jsp:include page = "../components/navbar_horizontal.jsp" />
                <!-- / Nav horizontal -->
                <h1 class="h3 my-4" style="grid-column: 1 / 5; grid-row: 1 / 2; height: 30px !important;">Panel de<strong> Productos</strong></h1>

                <div class="card border-0 shadow-lg mb-4">
                    <div class="card-widget-separator-wrapper">
                        <div class="card-body card-widget-separator">
                            <div class="row gy-4 gy-sm-1">
                                <%
                                    ProductoDAO productoDAOtotal = new ProductoDAO();
                                    int cantidad = productoDAOtotal.cantidadProductos();
                                    int totalStock = productoDAOtotal.totalStock();
                                    double totalCompra = productoDAOtotal.totalPrecioCompra();
                                %>
                                <div class="col-sm-6 col-lg-3">
                                    <div class="d-flex justify-content-between align-items-start card-widget-1 border-end pb-3 pb-sm-0">
                                        <div>
                                            <h6 class="mb-2">- - -</h6>
                                            <h4 class="mb-2">- - -</h4>
                                            <p class="mb-0"><span class="text-muted me-2">-</span></p>
                                        </div>
                                    </div>
                                    <hr class="d-none d-sm-block d-lg-none me-4">
                                </div>
                                <div class="col-sm-6 col-lg-3">
                                    <div class="d-flex justify-content-between align-items-start border-end pb-3 pb-sm-0 card-widget-3">
                                        <div>
                                            <h6 class="mb-2">Cantidad productos</h6>

                                            <h4 id="productCount"><%= cantidad%></h4>
                                            <p class="mb-0 text-muted">-</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-3">
                                    <div class="d-flex justify-content-between align-items-start card-widget-2 border-end pb-3 pb-sm-0">
                                        <div>
                                            <h6 class="mb-2">Total stock</h6>
                                            <h4 class="mb-2"><%= totalStock%></h4>
                                            <p class="mb-0 text-muted">-</p>
                                        </div>
                                        <hr class="d-none d-sm-block d-lg-none">
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-3">
                                    <div class="d-flex justify-content-between align-items-start">
                                        <div>
                                            <h6 class="mb-2">Total</h6>
                                            <h4 class="mb-2">S/<%= totalCompra%></h4>
                                            <p class="mb-0"><span class="text-muted me-2">-</span></p>
                                        </div>
                                        <div class="avatar">
                                            <span class="avatar-initial rounded bg-label-secondary">
                                                <i class="bx bx-wallet bx-sm"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container-fluid p-3 rounded shadow-lg" style="background-color: #fff">
                    <div class="row w-100 justify-content-between mb-3">
                        <div class="col-5">
                            <h5 class="h5">Tabla de productos</h5>
                        </div>
                        <div class="col-auto">
                            <!-- Button - Agregar Producto -->
                            <a href="newProducto.jsp" class="btn btn-primary">Agregar Producto</a>
                        </div>
                    </div>
                    <table id="tablaProducto" class="table table-striped" style="width:100%">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Descripción</th>
                                <th>Precio Compra</th>
                                <th>Precio Venta</th>
                                <th>Stock</th>
                                <th>Tipo</th>
                                <th>Proveedor</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ProductoDAO productoDAO = new ProductoDAO();
                                List<Producto> list = productoDAO.toList();
                                Iterator<Producto> iterador = list.iterator();
                                Producto producto = null;

                                while (iterador.hasNext()) {
                                    producto = iterador.next();
                                    int idProveedor = producto.getIdProveedor();
                                    ProveedorDAO proveedorDAO = new ProveedorDAO();
                                    Proveedor proveedor = new Proveedor();
                                    proveedor.setIdProveedor(idProveedor);
                                    boolean found = proveedorDAO.search(proveedor);
                            %>
                            <tr>
                                <td class="align-middle td_nombre d-flex align-items-center">
                                    <%
                                        String imagePath = "/amanda-cell-sistema/SvProducto?idProducto=" + producto.getIdProducto();
                                        if (producto.getImagen() != null) {
                                    %>
                                    <img src="<%= imagePath%>" alt="no-photo" width="50px" height="50px" />
                                    <%
                                    } else {
                                    %>
                                    <img src="../images/no-photo-product.jpg" alt="no-photo" width="50px" height="50px" />
                                    <%
                                        }
                                    %>
                                    <%=producto.getNombre()%>
                                </td>
                                <td class="align-middle td_descripcion"><%=producto.getDescripcion()%></td>
                                <td class="align-middle td_precio_compra"><%=producto.getPrecioCompra()%></td>
                                <td class="align-middle td_precio_venta"><%=producto.getPrecioVenta()%></td>
                                <td class="align-middle td_stock"><%=producto.getStock()%></td>
                                <td class="align-middle td_tipo"><%=producto.getTipo()%></td>
                                <td class="align-middle td_proveedor"><%=found ? proveedor.getNombre() : "Proveedor no encontrado"%></td>
                                <td class="align-middle">
                                    <!-- Boton para ver un producto -->
                                    <a class="align-middle" href="viewProducto.jsp?idProductoUrl=<%=producto.getIdProducto()%>">
                                        <i style="color: #7e7e7d; font-size: 18px;" class="bi bi-eye"></i>
                                    </a>
                                        <!-- Boton para actualizar un producto -->
                                    <a class="align-middle" href="editarProducto.jsp?idProductoUrl=<%=producto.getIdProducto()%>">
                                        <i style="color: #7e7e7d; font-size: 18px;" class="bi bi-pencil-square"></i>
                                    </a>
                                    <!-- Boton que abre el modal para confirmar si desea eliminarlo o no -->
                                    <button type="button" class="btn-close align-middle btn-modal-eliminar-producto" data-bs-toggle="modal" data-bs-target="#modal-confirmar-eliminar-producto" data-nombre="<%= producto.getNombre()%>" data-id="<%= producto.getIdProducto()%>"></button>

                                    <!-- Modal - Eliminar Producto -->
                                    <div class="modal fade" id="modal-confirmar-eliminar-producto" tabindex="-1" aria-labelledby="modal-delete-producto" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="modal-confirmar-eliminar-producto">Eliminar producto</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>¿Seguro que deseas eliminar este producto?</p>
                                                    <p>ID: <span id="producto-id"></span></p>
                                                    <p>Nombre: <span id="producto-nombre"></span></p>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Conservar Producto</button>
                                                        <!-- Botón para eliminar un producto -->
                                                        <button type="submit" class="btn btn-danger" id="btn-eliminar-producto" name="action" value="delete">Eliminar Producto</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- / Modal - Eliminar Producto -->
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
                $('#tablaProducto').DataTable({
                    "paging": true,
                    "lengthMenu": [6, 10, 25, 50],
                    "searching": true
                });
            });
        </script>
        <!-- / Bootstrap -->
        <script src="${pageContext.servletContext.contextPath}/js/producto.js"></script>
        <script src="${pageContext.servletContext.contextPath}/js/script.js"></script>
    </body>

</html>