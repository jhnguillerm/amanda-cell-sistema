<%@page import="Model.Empleado"%>
<%@page import="ModelDAO.EmpleadoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String userRole = (String) session.getAttribute("rol");

    String idEmpleadoUrl = request.getParameter("idEmpleadoUrl");
    int idEmpleado = (idEmpleadoUrl != null && !idEmpleadoUrl.isEmpty()) ? Integer.parseInt(idEmpleadoUrl) : 0;
    EmpleadoDAO empleadoDAO = new EmpleadoDAO();
    Empleado empleado = empleadoDAO.getEmpleadoById(idEmpleado);
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
                <form action="/amanda-cell-sistema/SvEmpleado" method="post" class="m-0 needs-validation" novalidate enctype="multipart/form-data" id="formEmpleado">
                    <div class="d-flex flex-wrap justify-content-between align-items-center mb-3">

                        <div class="d-flex flex-column justify-content-center">
                            <h4 class="mb-1 mt-3">Actualizar empleado</h4>
                        </div>
                        <div class="d-flex align-content-center flex-wrap gap-3">
                            <button type="submit" class="btn btn-primary" id="btn-actualizar" name="action" value="update">Actualizar empleado</button>
                        </div>
                    </div>
                    <div class="row">
                        <!-- Primera columna -->
                        <div class="col-12 col-lg-8">
                            <!-- Información general -->
                            <div class="card mb-4 border-0 shadow-lg">
                                <div class="card-header border-0 bg-body">
                                    <h5 class="card-tile mb-0">Información general</h5>
                                </div>
                                <div class="card-body">
                                    <!-- ID - Nombres -->
                                    <div class="row mb-3">
                                        <div class="col-4">
                                            <label class="form-label" for="txtIdEmpleado">ID</label>
                                            <input type="text" class="form-control" id="txtIdEmpleado" disabled value="<%=empleado.getIdEmpleado()%>">
                                            <input name="txtIdEmpleado" type="hidden" id="txtIdEmpleado-hidden" class="form-control" value="<%=empleado.getIdEmpleado()%>">
                                        </div>
                                        <div class="col-8">
                                            <label class="form-label" for="txtNombres">Nombres</label>
                                            <input type="text" class="form-control" name="txtNombres" id="txtNombres" value="<%=empleado.getNombres()%>" required>
                                            <div class="invalid-feedback">
                                                Nombres requeridos.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <!-- Correo -->
                                        <div class="col-6">
                                            <label class="form-label" for="txtCorreo">Correo</label>
                                            <input type="email" class="form-control" name="txtCorreo" id="txtCorreo" value="<%=empleado.getCorreo()%>" required>
                                            <div class="invalid-feedback">
                                                Correo incorrecto.
                                            </div>
                                        </div>
                                        <!-- Direccion -->
                                        <div class="col-6">
                                            <label class="form-label" for="txtDireccion">Dirección</label>
                                            <input type="text" class="form-control" name="txtDireccion" id="txtDireccion" value="<%=empleado.getDireccion()%>">
                                            <div class="valid-feedback">
                                                Dirección no obligatoria.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <!-- DNI -->
                                        <div class="col-4">
                                            <label class="form-label" for="txtDni">DNI</label>
                                            <input type="text" class="form-control" name="txtDni" id="txtDni" value="<%=empleado.getDni()%>" required pattern="[0-9]{8}" title="Debe contener 8 dígitos numéricos">
                                            <div class="invalid-feedback">
                                                DNI incorrecto.
                                            </div>
                                        </div>
                                        <!-- Telefono -->
                                        <div class="col-4">
                                            <label class="form-label" for="txtTelefono">Telefono</label>
                                            <input type="text" class="form-control" name="txtTelefono" id="txtTelefono" value="<%=empleado.getTelefono()%>" required>
                                            <div class="invalid-feedback">
                                                Télefono incorrecto.
                                            </div>
                                        </div>
                                        <!-- Rol -->
                                        <div class="col-4">
                                            <label class="form-label" for="cbRol">Rol</label>

                                            <%
                                                if ("Administrador".equals(userRole)) {
                                            %>
                                            <select id="cbRol" class="form-select" name="cbRol" required>
                                                <option disabled value="">Selecciona el rol</option>
                                                <option value="Administrador" ${empleado.getRol().equals("Administrador") ? "selected" : ""}>Administrador</option>
                                                <option value="Empleado" ${empleado.getRol().equals("Empleado") ? "selected" : ""}>Empleado</option>
                                            </select>
                                            <div class="invalid-feedback">
                                                Rol requerido.
                                            </div>
                                            <%
                                            } else if ("Empleado".equals(userRole)) {
                                            %>
                                            <input class="form-control" type="text" name="cbRol" value="Empleado" disabled>
                                            <input type="hidden" name="cbRol" value="Empleado">
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Información genenal -->
                        </div>
                        <!-- /Primera columna -->
                        <!-- Segunda columna -->
                        <div class="col-12 col-lg-4">
                            <!-- Login -->
                            <div class="card mb-4 border-0 shadow-lg">
                                <div class="card-header border-0 bg-body">
                                    <h5 class="card-title mb-0">Datos login</h5>
                                </div>
                                <div class="card-body">
                                    <!-- User -->
                                    <div class="mb-3">
                                        <label class="form-label" for="txtUsername">Username</label>
                                        <input type="text" class="form-control" id="txtUsername" name="txtUsername" value="<%=empleado.getUsername()%>" required>
                                        <div class="invalid-feedback">
                                            Username requerido.
                                        </div>
                                    </div>
                                    <!-- Pass -->
                                    <div class="mb-3">
                                        <label class="form-label" for="txtPass">Contraseña</label>
                                        <input type="password" class="form-control" id="txtPass" placeholder="Contraseña" name="txtPass" required>
                                        <div class="invalid-feedback">
                                            Password requerido.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Login -->
                            <!-- Foto -->
                            <div class="card mb-4 border-0 shadow-lg">
                                <div class="card-header border-0 bg-body">
                                    <h5 class="card-title mb-0">Foto de perfil</h5>
                                </div>
                                <div class="card-body">
                                    <div class="mb-3">
                                        <label class="form-label" for="fileFoto">Ingresa una foto</label>
                                        <input type="file" class="form-control" id="fileFoto" name="fileFoto">
                                        <div class="valid-feedback">
                                            Foto no guardada, vuelve a subirla.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /Foto -->
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
            document.getElementById('formEmpleado').addEventListener('submit', function (event) {
                if (!this.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                this.classList.add('was-validated');
            });
        </script>
    </body>
</html>