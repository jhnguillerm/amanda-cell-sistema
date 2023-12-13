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
                <form action="/amanda-cell-sistema/SvCliente" method="post" class="m-0 needs-validation" novalidate id="formCliente">
                    <div class="d-flex flex-wrap justify-content-between align-items-center mb-3">

                        <div class="d-flex flex-column justify-content-center">
                            <h4 class="mb-1 mt-3">Agregar / Actualizar cliente</h4>
                        </div>
                        <div class="d-flex align-content-center flex-wrap gap-3">
                            <button type="submit" class="btn btn-primary" id="btn-agregar" name="action" value="create">Agregar cliente</button>
                            <button type="submit" class="btn btn-primary" id="btn-actualizar" name="action" value="update">Actualizar cliente</button>
                        </div>

                    </div>

                    <div class="row">
                        <!-- Primera columna -->
                        <div class="col-12 col-lg-12">
                            <!-- Información general -->
                            <div class="card mb-4 border-0 shadow-lg">
                                <div class="card-header border-0 bg-body">
                                    <h5 class="card-tile mb-0">Información general</h5>
                                </div>
                                <div class="card-body">
                                    <!-- ID - Nombres -->
                                    <div class="row mb-3">
                                        <div class="col-4">
                                            <label class="form-label" for="txtIdCliente">ID</label>
                                            <input type="text" class="form-control" id="txtIdCliente" disabled>
                                            <input name="txtIdCliente" type="hidden" id="txtIdCliente-hidden" class="form-control">
                                        </div>
                                        <div class="col-8">
                                            <label class="form-label" for="txtNombres">Nombres</label>
                                            <input type="text" class="form-control" name="txtNombres" id="txtNombres" placeholder="Nombre completo" required>
                                            <div class="invalid-feedback">
                                                Nombres requeridos.
                                            </div>
                                        </div>
                                    </div>
                                    <!-- DNI - Correo -->
                                    <div class="row mb-3">
                                        <div class="col-4">
                                            <label class="form-label" for="txtDni">DNI</label>
                                            <input type="text" class="form-control" name="txtDni" id="txtDni" placeholder="DNI" required pattern="[0-9]{8}" title="Debe contener 8 dígitos numéricos">
                                            <div class="invalid-feedback">
                                                DNI incorrecto.
                                            </div>
                                        </div>
                                        <div class="col-8">
                                            <label class="form-label" for="txtCorreo">Correo</label>
                                            <input type="email" class="form-control" name="txtCorreo" id="txtCorreo" placeholder="Correo" required>
                                            <div class="invalid-feedback">
                                                Correo incorrecto.
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Telefono -->
                                    <div class="row mb-3">
                                        <div class="col-4">
                                            <label class="form-label" for="txtTelefono">Télefono</label>
                                            <input type="text" class="form-control" name="txtTelefono" id="txtTelefono" placeholder="Telefono" required>
                                            <div class="invalid-feedback">
                                                Télefono incorrecto.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Información genenal -->
                        </div>
                        <!-- /Primera columna -->
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
            document.addEventListener("DOMContentLoaded", function () {
                // Obtener parámetros de la URL
                var params = new URLSearchParams(window.location.search);

                document.getElementById("txtIdCliente").value = params.get("idCliente");
                document.getElementById("txtIdCliente-hidden").value = params.get("idCliente");
                document.getElementById("txtNombres").value = params.get("nombres");
                document.getElementById("txtDni").value = params.get("dni");
                document.getElementById("txtCorreo").value = params.get("correo");
                document.getElementById("txtTelefono").value = params.get("telefono");
                
                const modoEditar = params.get("modo");
                if (modoEditar === "editar") {
                    $("#btn-agregar").hide();
                }
                
                const modoAgregar = params.get("modo");
                if (modoEditar === "agregar") {
                    $("#btn-actualizar").hide();
                }
            });
        </script>
        <script>
            document.getElementById('formCliente').addEventListener('submit', function (event) {
                if (!this.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                this.classList.add('was-validated');
            });
        </script>
    </body>

</html>