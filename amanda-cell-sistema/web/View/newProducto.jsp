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
                <form action="/amanda-cell-sistema/SvProducto" method="post" class="m-0 needs-validation" novalidate enctype="multipart/form-data" id="formProducto">
                    <div class="d-flex flex-wrap justify-content-between align-items-center mb-3">
                        <div class="d-flex flex-column justify-content-center">
                            <h4 class="mb-1 mt-3">Agregar producto</h4>
                        </div>
                        <div class="d-flex align-content-center flex-wrap gap-3">
                            <button type="submit" class="btn btn-primary" id="btn-agregar" name="action" value="create">Agregar Producto</button>
                        </div>
                    </div>
                    <div class="row">
                        <!-- Primera columna-->
                        <div class="col-12 col-lg-8">
                            <!-- Información general -->
                            <div class="card mb-4 border-0 shadow-lg">
                                <div class="card-header border-0 bg-body">
                                    <h5 class="card-tile mb-0">Información general</h5>
                                </div>
                                <div class="card-body">
                                    <!-- Nombre -->
                                    <div class="row mb-3">
                                        <div class="col-8">
                                            <label class="form-label" for="txtNombre">Nombre</label>
                                            <input type="text" class="form-control" name="txtNombre" id="txtNombre" required>
                                            <div class="invalid-feedback">
                                                Nombre del producto requerido.
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <input name="txtIdProducto" type="hidden" id="txtIdProducto-hidden" class="form-control">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <!-- Stock -->
                                        <div class="col-4">
                                            <label class="form-label" for="txtStock">Stock</label>
                                            <input type="number" min="1" value="1" class="form-control" name="txtStock" id="txtStock">
                                            <div class="valid-feedback">
                                                Mínimo de stock 1.
                                            </div>
                                        </div>
                                        <!-- Tipo -->
                                        <div class="col-8">
                                            <label class="form-label" for="cbTipo">Tipo</label>
                                            <select class="form-select" name="cbTipo" id="cbTipo" required>
                                                <option disabled selected value="">Selecciona el tipo</option>
                                                <option value="Accesorio">Accesorio</option>
                                                <option value="Altavoz">Altavoz</option>
                                                <option value="Bateria">Batería</option>
                                                <option value="Boton">Botón</option>
                                                <option value="Camara">Cámara</option>
                                                <option value="Pantalla">Pantalla</option>
                                                <option value="Otro">Otro</option>
                                            </select>
                                            <div class="invalid-feedback">
                                                Tipo requerido.
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Description -->
                                    <div>
                                        <label class="form-label" for="areaDescripcion">Descripción</label>
                                        <textarea class="form-control" name="areaDescripcion" id="areaDescripcion" rows="4"></textarea>
                                        <div class="valid-feedback">
                                            Descripcion.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Información genenal -->
                            <!-- Imagenes -->
                            <div class="card mb-4 border-0 shadow-lg">
                                <div class="card-header d-flex justify-content-between align-items-center border-0 bg-body">
                                    <h5 class="mb-0 card-title">Imagenes</h5>
                                </div>
                                <div class="card-body">
                                    <div class="mb-3">
                                        <label class="form-label" for="fileImagen">Ingresa una imagen</label>
                                        <input type="file" class="form-control" id="fileImagen" name="fileImagen">
                                        <div class="valid-feedback">
                                            Imagen no obligatoria.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Media -->
                        </div>
                        <!-- /Primera columna -->
                        <!-- Segunda columna -->
                        <div class="col-12 col-lg-4">
                            <!-- Precios -->
                            <div class="card mb-4 border-0 shadow-lg">
                                <div class="card-header border-0 bg-body">
                                    <h5 class="card-title mb-0">Precios</h5>
                                </div>
                                <div class="card-body">
                                    <!-- Precio de compra -->
                                    <div class="mb-3">
                                        <label class="form-label" for="txtPrecioCompra">Precio de compra</label>
                                        <input type="number" class="form-control" id="txtPrecioCompra" name="txtPrecioCompra" step="any" required>
                                        <div class="invalid-feedback">
                                            Precio requerido.
                                        </div>
                                    </div>
                                    <!-- Precio de venta -->
                                    <div class="mb-3">
                                        <label class="form-label" for="txtPrecioVenta">Precio de venta</label>
                                        <input type="number" class="form-control" id="txtPrecioVenta" name="txtPrecioVenta" step="any" required>
                                        <div class="invalid-feedback">
                                            Precio requerido.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Precios -->
                            <!-- Proveedor -->
                            <div class="card mb-4 border-0 shadow-lg">
                                <div class="card-header border-0 bg-body">
                                    <h5 class="card-title mb-0">Proveedores</h5>
                                </div>
                                <div class="card-body">
                                    <div class="mb-3 col ecommerce-select2-dropdown">
                                        <div class="position-relative">
                                            <label class="form-label mb-1 d-flex justify-content-between align-items-center">
                                                <span>Proveedor</span><a href="proveedor.jsp" class="fw-medium">Agregar proveedor</a>
                                            </label>
                                            <select id="cbProveedor" class="form-select" name="cbProveedor" required>
                                                <option selected disabled value="">Selecciona el proveedor</option>
                                                <%
                                                    ProveedorDAO proveedorDAO = new ProveedorDAO();
                                                    List<Proveedor> listaProveedores = proveedorDAO.toList();
                                                    for (Proveedor proveedor : listaProveedores) {
                                                %>
                                                <option value="<%= proveedor.getIdProveedor()%>"><%= proveedor.getNombre()%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                            <div class="invalid-feedback">
                                                Seleccione un proveedor.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Proveedor -->
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
        <!-- / Bootstrap -->
        <script src="${pageContext.servletContext.contextPath}/js/script.js"></script>
        <script>
            document.getElementById('formProducto').addEventListener('submit', function (event) {
                if (!this.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                this.classList.add('was-validated');
            });
        </script>
    </body>
</html>