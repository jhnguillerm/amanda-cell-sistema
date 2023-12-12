<%@page import="Model.DetalleVenta"%>
<%@page import="Model.Producto"%>
<%@page import="ModelDAO.ProductoDAO"%>
<%@page import="Model.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="ModelDAO.ClienteDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
                <form action="/amanda-cell-sistema/SvVenta" method="post" class="m-0 needs-validation" novalidate id="formVenta">
                    <div class="d-flex flex-wrap justify-content-between align-items-center mb-3">

                        <div class="d-flex flex-column justify-content-center">
                            <h4 class="mb-1 mt-3">Nueva venta</h4>
                        </div>
                        <div class="d-flex align-content-center flex-wrap gap-3">
                            <button type="submit" class="btn btn-danger" name="action" value="cancelar">Cancelar</button>
                            <button type="submit" class="btn btn-primary" name="action" value="create">Generar venta</button>
                        </div>
                    </div>

                    <div class="row">
                        <!-- Primera columna -->
                        <div class="col-12 col-lg-4">
                            <!-- Cliente -->
                            <div class="card mb-4 border-0 shadow-lg">
                                <div class="card-header border-0 bg-body d-flex justify-content-between align-items-center">
                                    <h5 class="card-title mb-0">Datos del cliente</h5>
                                    <a href="/amanda-cell-sistema/SvRutas?action=loadCliente" class="fw-medium">Nuevo cliente</a>
                                </div>
                                <div class="card-body">
                                    <div class="mb-3 col">
                                        <div class="input-group">
                                            <select id="cbCliente" class="form-select" name="cbCliente" required>
                                                <option disabled value="">Selecciona el cliente</option>
                                                <%
                                                    ClienteDAO clienteDAO = new ClienteDAO();
                                                    List<Cliente> listaClientes = clienteDAO.toList();
                                                    for (Cliente cliente : listaClientes) {
                                                %>
                                                <option selected value="<%= cliente.getIdCliente()%>"><%= cliente.getNombres()%></option>
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
                                            <input type="text" class="form-control" name="txtDni" id="txtDni" disabled value="${sessionScope.dniCliente}">
                                            <input name="txtDni" type="hidden" id="txtDni-hidden" class="form-control" value="${sessionScope.dniCliente}">
                                            <input type="hidden" class="form-control" name="txtIdCliente" value="${sessionScope.idCliente}">
                                        </div>
                                        <div class="col-8">
                                            <label class="form-label" for="txtNombres">Nombres</label>
                                            <input type="text" class="form-control" name="txtNombres" id="txtNombres" disabled value="${sessionScope.nombresCliente}">
                                            <input name="txtNombres" type="hidden" id="txtNombres-hidden" class="form-control" value="${sessionScope.nombresCliente}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Cliente -->
                            <!-- Producto -->
                            <div class="card mb-4 border-0 shadow-lg">
                                <div class="card-header border-0 bg-body d-flex justify-content-between align-items-center">
                                    <h5 class="card-title mb-0">Datos del producto</h5>
                                    <a href="/amanda-cell-sistema/SvRutas?action=loadProducto" class="fw-medium">Nuevo producto</a>
                                </div>
                                <div class="card-body">
                                    <div class="mb-3 col">
                                        <div class="input-group">
                                            <select id="cbProducto" class="form-select" name="cbProducto" required>
                                                <option disabled selected value="">Selecciona el producto</option>
                                                <%
                                                    ProductoDAO productoDAO = new ProductoDAO();
                                                    List<Producto> listaProductos = productoDAO.toList();
                                                    for (Producto producto : listaProductos) {
                                                %>
                                                <option selected value="<%= producto.getIdProducto()%>"><%= producto.getNombre()%></option>
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
                                            <input type="text" class="form-control" name="txtNombre" id="txtNombre" disabled value="${sessionScope.nombreProducto}">
                                            <input type="hidden" class="form-control" name="txtNombre" id="txtNombre-hidden" value="${sessionScope.nombreProducto}">
                                            <input type="hidden" class="form-control" name="txtIdProducto" id="txtIdProducto" value="${sessionScope.idProducto}">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-4">
                                            <label class="form-label" for="txtPrecio">Precio</label>
                                            <input type="text" class="form-control" name="txtPrecio" id="txtPrecio" disabled value="${sessionScope.precioProducto}">
                                            <input type="hidden" class="form-control" name="txtPrecio" id="txtPrecio-hidden" value="${sessionScope.precioProducto}">
                                        </div>
                                        <div class="col-4">
                                            <label class="form-label" for="txtStock">Stock</label>
                                            <input type="text" class="form-control" name="txtStock" id="txtStock" disabled value="${sessionScope.stockProducto}">
                                            <input type="hidden" class="form-control" name="txtStock" id="txtStock-hidden" value="${sessionScope.stockProducto}">
                                        </div>
                                        <div class="col-4">
                                            <label class="form-label" for="txtCantidad">Cantidad</label>
                                            <input type="number" min="1" max="${sessionScope.stockProducto}" class="form-control" name="txtCantidad" id="txtCantidad" value="1">
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
                                        <input type="text" class="form-control" value="${sessionScope.numSerie}" name="txtNumSerie" id="txtNumSerie" disabled>
                                        <input type="hidden" class="form-control" value="${sessionScope.numSerie}" name="txtNumSerie">
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
                                            <%
                                                List<DetalleVenta> listaDetalle = (List<DetalleVenta>) session.getAttribute("listaDetalle");

                                                if (listaDetalle != null) {
                                                    for (DetalleVenta detalle : listaDetalle) {
                                                        double subtotal = detalle.getSubtotal();
                                                        String roundedSubtotal = String.format("%.2f", subtotal);
                                            %>
                                            <tr>
                                                <td class="align-middle"><%= detalle.getNombreProducto()%></td>
                                                <td class="align-middle">S/.<%= detalle.getPrecioVenta()%></td>
                                                <td class="align-middle"><%= detalle.getCantidad()%></td>
                                                <td class="align-middle">S/.<%= roundedSubtotal%></td>
                                                <td class="align-middle">
                                                    <form action="/amanda-cell-sistema/SvVenta" method="post">
                                                        <input type="hidden" name="action" value="eliminarDetalle">
                                                        <input type="hidden" name="detalleIdProducto" value="<%= detalle.getIdProducto()%>">
                                                        <button type="submit" class="btn-close align-middle"></button>
                                                    </form>
                                                </td>
                                            </tr>
                                            <%
                                                    }
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="card-footer d-flex justify-content-end align-items-center border-0">
                                    <h5 class="card-tile mb-0">Total: S/.</h5>
                                    <div class="col-3 px-4">
                                        <input type="text" class="form-control" value="${total}" name="txtTotal" id="txtTotal" disabled>
                                        <input type="hidden" class="form-control" value="${total}" name="txtTotal">
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
        <script>
    // Verifica la validez del formulario al enviar
    document.getElementById('formVenta').addEventListener('submit', function (event) {
        if (!this.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
        }
        this.classList.add('was-validated');
    });

    // Establece el valor seleccionado en el selector de clientes
    var selectedClienteId = '<%= (session.getAttribute("idCliente") != null) ? session.getAttribute("idCliente") : "" %>';
    var cbCliente = document.getElementById('cbCliente');
    if (selectedClienteId) {
        cbCliente.value = selectedClienteId;
    }

    // Establece el valor seleccionado en el selector de productos
    var selectedProductoId = '<%= (session.getAttribute("idProducto") != null) ? session.getAttribute("idProducto") : "" %>';
    var cbProducto = document.getElementById('cbProducto');
    if (selectedProductoId) {
        cbProducto.value = selectedProductoId;
    }
</script>


    </body>
</html>
