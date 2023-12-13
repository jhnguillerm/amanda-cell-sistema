<%@page import="ModelDAO.ProveedorDAO"%>
<%@page import="Model.Proveedor"%>
<%@page import="java.util.Iterator"%>
<%@page import="Model.Producto"%>
<%@page import="java.util.List"%>
<%@page import="ModelDAO.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idProductoUrl = request.getParameter("idProductoUrl");
    int idProducto = (idProductoUrl != null && !idProductoUrl.isEmpty()) ? Integer.parseInt(idProductoUrl) : 0;
    ProductoDAO productoDAO = new ProductoDAO();
    Producto producto = productoDAO.getProductoById(idProducto);

    ProveedorDAO proveedorDAO = new ProveedorDAO();
    Proveedor proveedor = new Proveedor();
    proveedor.setIdProveedor(producto.getIdProveedor());
    boolean found = proveedorDAO.search(proveedor);
%>
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
                <section class="py-5">
                    <div class="container px-4 px-lg-5 my-5">
                        <div class="row gx-4 gx-lg-5 align-items-center">
                            <div class="col-md-6" style="width: 600px;">
                                <%
                                    String imagePath = "/amanda-cell-sistema/SvProducto?idProducto=" + producto.getIdProducto();
                                    if (producto.getImagen() != null) {
                                %>
                                <img src="<%= imagePath%>" class="w-100 mb-md-0 rounded-5 object-fit-contain" alt="no-photo" />
                                <%
                                } else {
                                %>
                                <img src="../images/no-photo-product.jpg" class="mb-md-0 rounded-5 object-fit-contain" alt="no-photo" width="600px" />
                                <%
                                    }
                                %>
                            </div>
                            <div class="col-md-6">
                                <div class="small mb-1">Fecha: <%=producto.getFecha()%></div>
                                <h1 class="display-5 fw-bolder"><%=producto.getNombre()%></h1>
                                <p class="lead"><%=producto.getDescripcion()%></p>
                                <div class="fs-5 mb-2">
                                    <span>Precio de compra: s/<%=producto.getPrecioCompra()%></span>
                                </div>
                                <div class="fs-5 mb-2">
                                    <span>Precio de venta: s/<%=producto.getPrecioVenta()%></span>
                                </div>
                                <div class="fs-5 mb-2">
                                    <span>Stock: <%=producto.getStock()%></span>
                                </div>
                                <div class="fs-5 mb-5">
                                    <span>Proveedor: <%=found ? proveedor.getNombre() : "Proveedor no encontrado"%></span>
                                </div>
                                <div class="d-flex">
                                    <a class="btn btn-outline-dark flex-shrink-0" href="editarProducto.jsp?idProductoUrl=<%=producto.getIdProducto()%>">
                                        <i class="bi-cart-fill me-1"></i>
                                        Editar producto
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
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
        <!-- / Bootstrap -->
        <script src="${pageContext.servletContext.contextPath}/js/script.js"></script>
    </body>

</html>