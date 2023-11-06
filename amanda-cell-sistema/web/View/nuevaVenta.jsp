<%@page import="Model.DetalleVenta"%>
<%@page import="Model.Producto"%>
<%@page import="ModelDAO.ProductoDAO"%>
<%@page import="Model.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="ModelDAO.ClienteDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                <form action="/amanda-cell-sistema/SvVenta" method="post" class="m-0">
                    <div class="d-flex flex-wrap justify-content-between align-items-center mb-3">

                        <div class="d-flex flex-column justify-content-center">
                            <h4 class="mb-1 mt-3">Nueva venta</h4>
                        </div>
                        <div class="d-flex align-content-center flex-wrap gap-3">
                            <button type="submit" class="btn btn-danger" id="btn-agregar" name="action" value="create">Cancelar</button>
                            <button type="submit" class="btn btn-primary" id="btn-actualizar" name="action" value="update">Generar venta</button>
                        </div>
                    </div>

                    <div class="row">
                        <!-- Primera columna -->
                        <div class="col-12 col-lg-4">
                            <!-- Cliente -->
                            <div class="card mb-4 border-0 shadow-lg">
                                <div class="card-header border-0 bg-body d-flex justify-content-between align-items-center">
                                    <h5 class="card-title mb-0">Datos del cliente</h5>
                                    <a href="loadCliente.jsp" class="fw-medium">Agregar cliente</a>
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

                                            <button class="btn btn-primary" name="action" value="searchCliente">
                                                <i class="bi bi-search"></i>
                                            </button>

                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-4">
                                            <label class="form-label" for="txtDni">DNI</label>
                                            <input type="text" class="form-control" name="txtDni" id="txtDni" disabled value="${cliente.getDni()}">
                                            <input name="txtDni" type="hidden" id="txtDni-hidden" class="form-control" value="${cliente.getDni()}">
                                        </div>
                                        <div class="col-8">
                                            <label class="form-label" for="txtNombres">Nombres</label>
                                            <input type="text" class="form-control" name="txtNombres" id="txtNombres" disabled value="${cliente.getNombres()}">
                                            <input name="txtNombres" type="hidden" id="txtNombres-hidden" class="form-control" value="${cliente.getNombres()}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Cliente -->
                            <!-- Producto -->
                            <div class="card mb-4 border-0 shadow-lg">
                                <div class="card-header border-0 bg-body d-flex justify-content-between align-items-center">
                                    <h5 class="card-title mb-0">Datos del producto</h5>
                                    <a href="loadProducto.jsp" class="fw-medium">Agregar producto</a>
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
                                            <button class="btn btn-primary" name="action" value="searchProducto">
                                                <i class="bi bi-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-12">
                                            <label class="form-label" for="txtNombre">Nombre</label>
                                            <input type="text" class="form-control" name="txtNombre" id="txtNombre" disabled value="${producto.getNombre()}">
                                            <input type="hidden" class="form-control" name="txtNombre" id="txtNombre-hidden" value="${producto.getNombre()}">
                                            <input type="hidden" class="form-control" name="txtIdProducto" id="txtIdProducto" value="${producto.getIdProducto()}">

                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-4">
                                            <label class="form-label" for="txtPrecio">Precio</label>
                                            <input type="text" class="form-control" name="txtPrecio" id="txtPrecio" disabled value="${producto.getPrecioVenta()}">
                                            <input type="hidden" class="form-control" name="txtPrecio" id="txtPrecio-hidden" value="${producto.getPrecioVenta()}">
                                        </div>
                                        <div class="col-4">
                                            <label class="form-label" for="txtStock">Stock</label>
                                            <input type="text" class="form-control" name="txtStock" id="txtStock" disabled value="${producto.getStock()}">
                                            <input type="hidden" class="form-control" name="txtStock" id="txtStock-hidden" value="${producto.getStock()}">
                                        </div>
                                        <div class="col-4">
                                            <label class="form-label" for="txtCantidad">Cantidad</label>
                                            <input type="number" value="1" class="form-control" name="txtCantidad" id="txtCantidad">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-4">
                                            <button class="btn btn-primary w-100" name="action" value="agregarTabla" >Agregar</button>
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
                                <div class="card-header border-0 d-flex align-items-center">
                                    <h5 class="card-tile mb-0">NRO. SERIE</h5>
                                    <div class="col-3 px-4">
                                        <input type="number" class="form-control" name="txtNumSerie" id="txtNumSerie" disabled>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table id="tablaVenta" class="table table-hover" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>Producto</th>
                                                <th>Precio</th>
                                                <th>Cantidad</th>
                                                <th>Subtotal</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody class="table-group-divider">
                                        <c:forEach items="${listaDetalle}" var="detalle">
                                            <tr>
                                                <td class="align-middle">${detalle.nombreProducto}</td>
                                                <td class="align-middle">${detalle.precioVenta}</td>
                                                <td class="align-middle">${detalle.cantidad}</td>
                                                <td class="align-middle">${detalle.subtotal}</td>
                                                <td class="align-middle">
                                                    <!-- Boton para actualizar un proveedor -->
                                                    <a class="align-middle" href=""><i style="color: #7e7e7d; font-size: 18px;" class="bi bi-pencil-square"></i></a>
                                                    <!-- Boton que abre el modal para confirmar si desea eliminarlo o no -->
                                                    <button type="button" class="btn-close align-middle"></button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="card-footer d-flex justify-content-end align-items-center border-0">
                                    <h5 class="card-tile mb-0">Total: </h5>
                                    <div class="col-3 px-4">
                                        <input type="number" class="form-control" value="${total}" name="txtTotal" id="txtTotal" disabled>
                                    </div>
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
        <script src="${pageContext.servletContext.contextPath}/js/script.js"></script>
    </body>
</html>
