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
                <form action="/amanda-cell-sistema/SvProveedor" method="post" class="m-0">
                    <div class="d-flex flex-wrap justify-content-between align-items-center mb-3">

                        <div class="d-flex flex-column justify-content-center">
                            <h4 class="mb-1 mt-3">Agregar / Actualizar proveedor</h4>
                        </div>
                        <div class="d-flex align-content-center flex-wrap gap-3">
                            <button type="submit" class="btn btn-primary" id="btn-agregar" name="action" value="create">Agregar proveedor</button>
                            <button type="submit" class="btn btn-primary" id="btn-actualizar" name="action" value="update">Actualizar proveedor</button>
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
                                    <!-- ID - Nombre -->
                                    <div class="row mb-3">
                                        <div class="col-4">
                                            <label class="form-label" for="txtIdProveedor">ID</label>
                                            <input type="text" class="form-control" id="txtIdProveedor" disabled>
                                            <input name="txtIdProveedor" type="hidden" id="txtIdProveedor-hidden" class="form-control">
                                        </div>
                                        <div class="col-8">
                                            <label class="form-label" for="txtNombre">Nombre</label>
                                            <input type="text" class="form-control" name="txtNombre" id="txtNombre" placeholder="Nombre del producto">
                                        </div>
                                    </div>
                                    <!-- Numero - Direccion -->
                                    <div class="row mb-3">
                                        <div class="col-4"><label class="form-label" for="txtNumero">Número</label>
                                            <input type="text" class="form-control" name="txtNumero" id="txtNumero" placeholder="Número"></div>
                                        <div class="col-8"><label class="form-label" for="txtDireccion">Dirección</label>
                                            <input type="text" class="form-control" name="txtDireccion" id="txtDireccion" placeholder="Dirección"></div>
                                    </div>
                                    <!-- Correo -->
                                    <div class="row mb-3">
                                        <div class="col-8"><label class="form-label" for="txtCorreo">Correo</label>
                                            <input type="email" class="form-control" name="txtCorreo" id="txtCorreo" placeholder="Correo"></div>
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

                document.getElementById("txtIdProveedor").value = params.get("idProveedor");
                document.getElementById("txtIdProveedor-hidden").value = params.get("idProveedor");
                document.getElementById("txtNombre").value = params.get("nombre");
                document.getElementById("txtDireccion").value = params.get("direccion");
                document.getElementById("txtNumero").value = params.get("numero");
                document.getElementById("txtCorreo").value = params.get("correo");
                
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

    </body>

</html>