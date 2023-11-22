<%@page import="Model.Producto"%>
<%@page import="ModelDAO.ProductoDAO"%>
<%@page import="Model.DetalleServicio"%>
<%@page import="java.util.List"%>
<%@page import="ModelDAO.DetalleServicioDAO"%>
<%@page import="Model.Empleado"%>
<%@page import="ModelDAO.EmpleadoDAO"%>
<%@page import="Model.Cliente"%>
<%@page import="ModelDAO.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Comprobante</title>
        <link rel="stylesheet" href="../css/detalleVenta.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <!-- Bootstrap icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    </head>
    <body>
        <div class="container mt-3 imprimir">
            <a class="icon-link icon-link-hover btn-imprimir" href="servicio.jsp">
                <i class="bi bi-arrow-bar-left"></i>
                Volver
            </a>
        </div>
        <div class="main">
            <div class="container mt-3">
                <div class="card animate__animated animate__fadeIn">
                    <div class="card-header">
                        <div>
                            N° serie: <strong><%= request.getParameter("numSerie")%></strong>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row mb-4">
                            <div class="col-6 col-md-6">
                                <%
                                    int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
                                    EmpleadoDAO empleadoDAO = new EmpleadoDAO();
                                    Empleado empleado = new Empleado();
                                    empleado.setIdEmpleado(idEmpleado);

                                    if (empleadoDAO.search(empleado)) {
                                        String nombreCliente = empleado.getNombres();
                                        String dniCliente = empleado.getDni();
                                %>
                                <div>
                                    <h6 class="mb-2">Empleado: <strong><%= nombreCliente%></strong></h6>
                                </div>
                                <%
                                } else {
                                %>
                                <strong>Cliente no encontrado</strong>
                                <%
                                    }
                                %>
                            </div>
                            <div class="col-6 col-md-6">
                                <%
                                    int idCliente = Integer.parseInt(request.getParameter("idCliente"));
                                    ClienteDAO clienteDAO = new ClienteDAO();
                                    Cliente cliente = new Cliente();
                                    cliente.setIdCliente(idCliente);

                                    if (clienteDAO.search(cliente)) {
                                        String nombreCliente = cliente.getNombres();
                                        String dniCliente = cliente.getDni();
                                %>
                                <div>
                                    <h6 class="mb-2">Cliente: <strong><%= nombreCliente%></strong></h6>
                                </div>
                                <div>DNI: <%= dniCliente%></div>
                                <%
                                } else {
                                %>
                                <strong>Cliente no encontrado</strong>
                                <div>DNI: Cliente no encontrado</div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <div class="row mb-4">
                            <div><strong>Problema: </strong><%= request.getParameter("problema")%></div>
                            <div><strong>Descripcion: </strong><%= request.getParameter("descripcion")%></div>
                            <div><strong>Estado: </strong><%= request.getParameter("estado")%></div>
                            <div><strong>Fecha de recepción: </strong><%= request.getParameter("fechaRecepcion")%></div>
                            <div><strong>Fecha de Entrega: </strong><%= request.getParameter("fechaEntrega")%></div>
                        </div>
                    </div>

                    <div class="table-responsive-sm">
                        <table class="table table-sm table-striped">
                            <thead>
                                <tr>
                                    <th scope="col" width="20%">Producto</th>
                                    <th scope="col" class="d-none d-sm-table-cell" width="50%">Descripción</th>
                                    <th scope="col" width="10%" class="text-right">P. Unidad</th>
                                    <th scope="col" width="8%" class="text-right">Cantidad</th>
                                    <th scope="col" width="10%" class="text-right">Subtotal</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int idServicio = Integer.parseInt(request.getParameter("idServicio"));
                                    DetalleServicioDAO detalleServicioDAO = new DetalleServicioDAO();
                                    List<DetalleServicio> detallesServicio = detalleServicioDAO.obtenerDetallesServicioPorServicio(idServicio);

                                    for (DetalleServicio detalle : detallesServicio) {
                                %>
                                <tr>
                                    <%
                                        int idProducto = detalle.getIdProducto();
                                        ProductoDAO productoDAO = new ProductoDAO();
                                        Producto producto = new Producto();
                                        producto.setIdProducto(idProducto);

                                        if (productoDAO.search(producto)) {
                                            String nombreProducto = producto.getNombre();
                                            String descripcionProducto = producto.getDescripcion();
                                    %>
                                    <td class="item_name"><%= nombreProducto%></td>
                                    <td class="item_desc d-none d-sm-table-cell"><%= descripcionProducto%></td>
                                    <%
                                    } else {
                                    %>
                                    <td class="item_name">Producto no encontrado</td>
                                    <td class="item_desc d-none d-sm-table-cell">Descripción no disponible</td>
                                    <%
                                        }
                                    %>
                                    <td class="text-right">S/.<%= detalle.getPrecioVenta()%></td>
                                    <td class="text-right"><%= detalle.getCantidad()%></td>
                                    <td class="text-right"><%= detalle.getPrecioVenta() * detalle.getCantidad()%></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                    <div class="row justify-content-end">
                        <div class="col-lg-4 col-sm-5">
                        </div>
                        <div class="col-lg-4 col-sm-5 ml-auto">
                            <table class="table table-sm table-clear">
                                <tbody>
                                    <tr>
                                        <td class="left">
                                            <strong>Reparación</strong>
                                        </td>
                                        <td class="text-right bg-light">
                                            <strong>S/.<%= request.getParameter("costo")%></strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="left">
                                            <strong>Total</strong>
                                        </td>
                                        <td class="text-right bg-light">
                                            <strong>S/.<%= request.getParameter("total")%></strong>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-3 imprimir">
        <button type="button" class="btn btn-outline-dark btn-imprimir" onclick="print()"><i class="bi bi-printer"></i> Imprimir</button>
    </div>
</body>
</html>

