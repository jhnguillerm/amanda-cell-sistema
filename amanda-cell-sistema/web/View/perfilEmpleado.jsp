<%@page import="Model.Empleado"%>
<%@page import="ModelDAO.EmpleadoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sessionEmpleado = request.getSession();
    int idEmpleado = (int) sessionEmpleado.getAttribute("idEmpleado");
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
                <section>
                    <div class="container py-5">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="card mb-4 border-0 shadow-lg">
                                    <div class="card-body text-center">
                                        <%
                                            String imagePath = "/amanda-cell-sistema/SvEmpleado?idEmpleado=" + empleado.getIdEmpleado();
                                            if (empleado.getFoto() != null) {
                                        %>
                                        <img src="<%= imagePath%>" alt="no-photo" class="rounded-circle img-fluid" style="width: 150px;" />
                                        <%
                                        } else {
                                        %>
                                        <img src="../images/no-photo-user.png" alt="no-photo" class="rounded-circle img-fluid" style="width: 150px;" />
                                        <%
                                            }
                                        %>
                                        <h5 class="my-3"><%= empleado.getNombres()%></h5>
                                        <p class="text-muted mb-1"><%= empleado.getRol()%></p>
                                        <p class="text-muted mb-4"></p>
                                        <div class="d-flex justify-content-center mb-2">
                                            <a href="editarEmpleado.jsp?idEmpleadoUrl=<%=idEmpleado%>" class="btn btn-primary rounded-0">Editar perfil</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="card mb-4 border-0 shadow-lg">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Nombres</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><%= empleado.getNombres()%></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">DNI</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><%= empleado.getDni()%></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Email</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><%= empleado.getCorreo()%></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Telefono</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><%= empleado.getTelefono()%></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Dirección</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><%= empleado.getDireccion()%></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Username</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><%= empleado.getUsername()%></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <p class="mb-0">Rol</p>
                                            </div>
                                            <div class="col-sm-9">
                                                <p class="text-muted mb-0"><%= empleado.getRol()%></p>
                                            </div>
                                        </div>
                                    </div>
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