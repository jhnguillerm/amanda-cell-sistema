<%@page import="ModelDAO.ClienteDAO"%>
<%@page import="ModelDAO.ServicioDAO"%>
<%@page import="ModelDAO.VentaDAO"%>
<%@page import="ModelDAO.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page = "../components/head.jsp"/>
        <link rel="stylesheet" href="../css/main.css"/>
    </head>

    <body>
        <div class="wrapper">
            <!-- Nav vertical -->
            <jsp:include page = "../components/navbar_vertical.jsp"/>
            <main class="content">
                <!-- Nav horizontal -->
                <jsp:include page = "../components/navbar_horizontal.jsp"/>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <%
                                ProductoDAO productoDAO = new ProductoDAO();
                                int total = productoDAO.cantidadProductos();

                                VentaDAO ventasDAO = new VentaDAO();
                                int cantidadVenta = ventasDAO.cantidadVentas();

                                ServicioDAO servicioDAO = new ServicioDAO();
                                int cantidadServicios = servicioDAO.cantidadServicios();

                                ClienteDAO clienteDAO = new ClienteDAO();
                                int cantidadClientes = clienteDAO.cantidadClientes();
                            %>
                            <div class="col-xxl-3 col-md-6">
                                <div class="card info-card sales-card border-0 shadow-lg mb-3">
                                    <div class="card-body">
                                        <h5 class="card-title">Ventas</h5>
                                        <div class="d-flex align-items-center">
                                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center" style="background-color: #60d2ff; width:50px; height: 50px ">
                                                <i class="bi bi-bag" style="font-size: 22px"></i>
                                            </div>
                                            <div class="ps-3">
                                                <h6 class="m-0"><%= cantidadVenta%></h6>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xxl-3 col-md-6">
                                <div class="card info-card sales-card border-0 shadow-lg mb-3">
                                    <div class="card-body">
                                        <h5 class="card-title">Reparaciones</h5>
                                        <div class="d-flex align-items-center">
                                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center" style="background-color: #ff7053; width:50px; height: 50px">
                                                <i class="bi bi-tools" style="font-size: 22px"></i>
                                            </div>
                                            <div class="ps-3">
                                                <h6 class="m-0"><%= cantidadServicios%></h6>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xxl-3 col-md-6">
                                <div class="card info-card sales-card border-0 shadow-lg mb-3">
                                    <div class="card-body">
                                        <h5 class="card-title">Productos</h5>
                                        <div class="d-flex align-items-center">
                                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center" style="background-color: #6fdf8a; width:50px; height: 50px">
                                                <i class="bi bi-phone" style="font-size: 22px"></i>
                                            </div>
                                            <div class="ps-3">
                                                <h6 class="m-0"><%= total%></h6>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xxl-3 col-md-6">
                                <div class="card info-card sales-card border-0 shadow-lg mb-3">
                                    <div class="card-body">
                                        <h5 class="card-title">Clientes</h5>
                                        <div class="d-flex align-items-center">
                                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center" style="background-color: #f5db57; width:50px; height: 50px">
                                                <i class="bi bi-person" style="font-size: 22px"></i>
                                            </div>
                                            <div class="ps-3">
                                                <h6 class="m-0"><%= cantidadClientes%></h6>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 mb-4 order-0">
                        <div class="card bg-body border-0 shadow-lg">
                            <div id="chart2" class="chart">
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 mb-4 order-1">
                        <div class="card bg-body border-0 shadow-lg">
                            <div id="chart1" class="chart">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <!-- jquery -->
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <!-- Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <!-- Apache ECharts -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.3/echarts.min.js"></script>
        <!-- Scripts -->
        <script src="${pageContext.servletContext.contextPath}/js/script.js"></script>
        <script src="${pageContext.servletContext.contextPath}/js/graficos.js"></script>
    </body>

</html>