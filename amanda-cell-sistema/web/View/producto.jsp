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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Productos</title>
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
        <!-- Bootstrap icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <!-- Ionicons -->
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <!-- Estilos -->
        <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css">
    </head>

    <body>
        <div class="wrapper">
            <!-- Nav vertical -->
            <nav class="sidebar">
                <div id="leftside-navigation" class="nano">
                    <!-- Logo -->
                    <div>
                        <a class="sidebar-brand" href="../main.jsp">
                            <h1 class="sidebar-title">Amanda Cell</h1>
                        </a>
                    </div>
                    <!-- / Logo -->
                    <ul class="sidebar-nav">
                        <li class="active">
                            <a href="../main.jsp">
                                <span>Inicio</span>
                            </a>
                        </li>
                        <!-- Servicios -->
                        <li class="sidebar-header">
                            Servicios
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:void(0);">
                                <ion-icon class="align-middle" name="bag-handle"></ion-icon>
                                <span>Ventas</span>
                            </a>
                            <ul>
                                <li>
                                    <a href="venta.jsp">Nueva venta</a>
                                </li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:void(0);">
                                <ion-icon class="align-middle" name="construct"></ion-icon>
                                <span>Reparaciones</span>
                            </a>
                            <ul>
                                <li>
                                    <a href="servicio.jsp">Reparación</a>
                                </li>
                            </ul>
                        </li>
                        <!-- Materiales -->
                        <li class="sidebar-header">
                            Materiales
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:void(0);">
                                <ion-icon class="align-middle" name="cube"></ion-icon>
                                <span>Productos</span>
                            </a>
                            <ul>
                                <li>
                                    <a href="producto.jsp">Lista de productos</a>
                                </li>
                                <li>
                                    <a href="addProducto.jsp">Nuevo producto</a>
                                </li>
                                <li>
                                    <a href="updateProducto.jsp">Editar producto</a>
                                </li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:void(0);">
                                <ion-icon class="align-middle" name="people"></ion-icon>
                                <span>Proveedores</span>
                            </a>
                            <ul>
                                <li>
                                    <a href="proveedor.jsp">Lista de proveedores</a>
                                </li>
                                <li>
                                    <a href="addProveedor.jsp">Nuevo proveedor</a>
                                </li>
                                <li>
                                    <a href="updateProveedor.jsp">Editar proveedor</a>
                                </li>
                            </ul>
                        </li>
                        <!-- Usuarios -->
                        <li class="sidebar-header">
                            Usuarios
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:void(0);">
                                <ion-icon class="align-middle" name="cube"></ion-icon>
                                <span>Clientes</span>
                            </a>
                            <ul>
                                <li>
                                    <a href="cliente.jsp">Lista de clientes</a>
                                </li>
                                <li>
                                    <a href="addCliente.jsp">Nuevo cliente</a>
                                </li>
                                <li>
                                    <a href="updateCliente.jsp">Editar cliente</a>
                                </li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:void(0);">
                                <ion-icon class="align-middle" name="people"></ion-icon>
                                <span>Empleados</span>
                            </a>
                            <ul>
                                <li>
                                    <a href="empleado.jsp">Lista de empleados</a>
                                </li>
                                <li>
                                    <a href="addEmpleado">Nuevo empleado</a>
                                </li>
                                <li>
                                    <a href="updateEmpleado">Editar editar empleado</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- / Nav vertical -->

            <main class="content">
                <!-- Nav horizontal -->
                <header class="p-3 mb-3 border-bottom rounded shadow-lg" style="background-color: #fff;">
                    <div class="container">
                        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                                <li><a href="../main.jsp" class="nav-link px-2 link-secondary">Inicio</a></li>
                                <li><a href="#" class="nav-link px-2 link-body-emphasis">Servicios</a></li>
                                <li><a href="#" class="nav-link px-2 link-body-emphasis">Materiales</a></li>
                                <li><a href="#" class="nav-link px-2 link-body-emphasis">Usuarios</a></li>
                            </ul>
                            <div class="dropdown text-end">
                                <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                                    <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32"
                                         class="rounded-circle">
                                </a>
                                <ul class="dropdown-menu text-small">
                                    <li>
                                        <a class="dropdown-item" href="pages-account-settings-account.html">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0 me-3">
                                                    <div class="avatar avatar-online">
                                                        <img src="https://github.com/mdo.png" width="40" height="40" alt="" class="w-px-40 h-auto rounded-circle">
                                                    </div>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <span class="fw-medium d-block" style="color: #808d9b">${requestScope.usuario.nombres}</span>
                                                    <small class="text-muted" style="color: #a2b0bb">Admin</small>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li><a class="dropdown-item" href="#">Settings</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="View/login.jsp">Sign out</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </header>
                <!-- / Nav horizontal -->
                <h1 class="h3 my-4" style="grid-column: 1 / 5; grid-row: 1 / 2; height: 30px !important;">Panel de<strong> Productos</strong></h1>
                <div class="card border-0 shadow-lg mb-4">
                    <div class="card-widget-separator-wrapper">
                        <div class="card-body card-widget-separator">
                            <div class="row gy-4 gy-sm-1">
                                <div class="col-sm-6 col-lg-3">
                                    <div class="d-flex justify-content-between align-items-start card-widget-1 border-end pb-3 pb-sm-0">
                                        <div>
                                            <h6 class="mb-2">Ventas en tienda</h6>
                                            <h4 class="mb-2">S/5,345.43</h4>
                                            <p class="mb-0"><span class="text-muted me-2">5k orders</span><span class="badge bg-label-success">+5.7%</span></p>
                                        </div>
                                        <div class="avatar me-sm-4">
                                            <span class="avatar-initial rounded bg-label-secondary">
                                                <i class="bx bx-store-alt bx-sm"></i>
                                            </span>
                                        </div>
                                    </div>
                                    <hr class="d-none d-sm-block d-lg-none me-4">
                                </div>
                                <div class="col-sm-6 col-lg-3">
                                    <div class="d-flex justify-content-between align-items-start card-widget-2 border-end pb-3 pb-sm-0">
                                        <div>
                                            <h6 class="mb-2">Ventas en la web</h6>
                                            <h4 class="mb-2">S/0</h4>
                                            <p class="mb-0"><span class="text-muted me-2">0k orders</span><span class="badge bg-label-success">+12.4%</span></p>
                                        </div>
                                        <div class="avatar me-lg-4">
                                            <span class="avatar-initial rounded bg-label-secondary">
                                                <i class="bx bx-laptop bx-sm"></i>
                                            </span>
                                        </div>
                                    </div>
                                    <hr class="d-none d-sm-block d-lg-none">
                                </div>
                                <div class="col-sm-6 col-lg-3">
                                    <div class="d-flex justify-content-between align-items-start border-end pb-3 pb-sm-0 card-widget-3">
                                        <div>
                                            <h6 class="mb-2">Descuentos</h6>
                                            <h4 class="mb-2">S/235.12</h4>
                                            <p class="mb-0 text-muted">4k orders</p>
                                        </div>
                                        <div class="avatar me-sm-4">
                                            <span class="avatar-initial rounded bg-label-secondary">
                                                <i class="bx bx-gift bx-sm"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-lg-3">
                                    <div class="d-flex justify-content-between align-items-start">
                                        <div>
                                            <h6 class="mb-2">Total</h6>
                                            <h4 class="mb-2">S/8,345.23</h4>
                                            <p class="mb-0"><span class="text-muted me-2">150 orders</span><span class="badge bg-label-danger">-3.5%</span></p>
                                        </div>
                                        <div class="avatar">
                                            <span class="avatar-initial rounded bg-label-secondary">
                                                <i class="bx bx-wallet bx-sm"></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container-fluid p-3 rounded shadow-lg" style="background-color: #fff">
                    <div class="row w-100 justify-content-between mb-3">
                        <div class="col-5">
                            <h5 class="h5">Tabla de productos</h5>
                        </div>
                        <div class="col-auto">
                            <!-- Button - Agregar Producto -->
                            <button type="button" class="btn btn-primary" id="abrir-modal-producto" data-bs-toggle="modal" data-bs-target="#modal-producto">
                                Agregar Producto
                            </button>
                            <!-- / Button - Agregar Producto -->
                        </div>
                    </div>
                    <table id="tablaProducto" class="table table-striped" style="width:100%">
                        <thead>
                            <tr>
                                <th>#ID</th>
                                <th>Nombre</th>
                                <th>Descripción</th>
                                <th>Precio Compra</th>
                                <th>Precio Venta</th>
                                <th>Stock</th>
                                <th>Tipo</th>
                                <th>Proveedor</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ProductoDAO productoDAO = new ProductoDAO();
                                List<Producto> list = productoDAO.toList();
                                Iterator<Producto> iterador = list.iterator();
                                Producto producto = null;

                                while (iterador.hasNext()) {
                                    producto = iterador.next();
                                    int idProveedor = producto.getIdProveedor();
                                    ProveedorDAO proveedorDAO = new ProveedorDAO();
                                    Proveedor proveedor = new Proveedor();
                                    proveedor.setIdProveedor(idProveedor);
                                    boolean found = proveedorDAO.search(proveedor);
                            %>
                            <tr>
                                <td class="align-middle td_id_producto"><%=producto.getIdProducto()%></td>
                                <td class="td_nombre"><%=producto.getNombre()%></td>
                                <td class="td_descripcion"><%=producto.getDescripcion()%></td>
                                <td class="align-middle td_precio_compra"><%=producto.getPrecioCompra()%></td>
                                <td class="td_precio_venta"><%=producto.getPrecioVenta()%></td>
                                <td class="td_stock"><%=producto.getStock()%></td>
                                <td class="td_tipo"><%=producto.getTipo()%></td>
                                <td class="td_proveedor"><%=found ? proveedor.getNombre() : "Proveedor no encontrado"%></td>
                                <td>
                                    <!-- Boton para actualizar un producto -->
                                    <button type="button" class="btn align-middle btn-editar-producto" data-bs-toggle="modal" data-bs-target="#modal-producto"><i style="color: #7e7e7d; font-size: 18px;" class="bi bi-pencil-square"></i></button>
                                    <!-- Boton que abre el modal para confirmar si desea eliminarlo o no -->
                                    <button type="button" class="btn-close align-middle btn-modal-eliminar-producto" data-bs-toggle="modal" data-bs-target="#modal-confirmar-eliminar-producto" data-nombre="<%= producto.getNombre()%>" data-id="<%= producto.getIdProducto()%>"></button>
                                    <!-- Modal - Eliminar Producto -->
                                    <div class="modal fade" id="modal-confirmar-eliminar-producto" tabindex="-1" aria-labelledby="modal-delete-producto" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="modal-confirmar-eliminar-producto">Eliminar producto</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>¿Seguro que deseas eliminar este producto?</p>
                                                    <p>ID: <span id="producto-id"></span></p>
                                                    <p>Nombre: <span id="producto-nombre"></span></p>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Conservar Producto</button>
                                                        <!-- Botón para eliminar un producto -->
                                                        <button type="submit" class="btn btn-danger" id="btn-eliminar-producto" name="action" value="delete">Eliminar Producto</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- / Modal - Eliminar Producto -->
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <!-- MODALES -->
                <!-- Modal - Agregar Producto -->
                <div class="modal fade" id="modal-producto" tabindex="-1" aria-labelledby="modal-create-producto"
                     aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="modal-create-producto">Agregar Producto</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <!-- Formulario - Agregar Producto -->
                                <form action="/amanda-cell-sistema/SvProducto" method="post" class="row g-3">
                                    <div class="col-12" id="div-id_producto">
                                        <label for="txtIdProducto" class="form-label">ID</label>
                                        <input type="text" class="form-control" id="txtIdProducto" disabled>
                                        <input name="txtIdProducto" type="hidden" id="txtIdProducto-hidden" class="form-control">
                                    </div>
                                    <div class="col-12">
                                        <label for="txtNombre" class="form-label">Nombre</label>
                                        <input name="txtNombre" type="text" class="form-control" id="txtNombre" required>
                                    </div>
                                    <div class="col-12">
                                        <label for="areaDescripcion" class="form-label">Descripción</label>
                                        <textarea name="areaDescripcion" class="form-control" id="areaDescripcion"
                                                  rows="3" required></textarea>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txtPrecioCompra" class="form-label">Precio de compra</label>
                                        <input name="txtPrecioCompra" type="text" class="form-control" id="txtPrecioCompra" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txtPrecioVenta" class="form-label">Precio de venta</label>
                                        <input name="txtPrecioVenta" type="text" class="form-control" id="txtPrecioVenta" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txtStock" class="form-label">Stock</label>
                                        <input name="txtStock" type="text" class="form-control" id="txtStock" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txtTipo" class="form-label">Tipo</label>
                                        <input name="txtTipo" type="text" class="form-control" id="txtTipo" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="cbProveedor" class="form-label">Proveedor</label>
                                        <select id="cbProveedor" class="form-select" name="cbProveedor">
                                            <option value="">Selecciona un proveedor</option>
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
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary" id="btn-agregar-producto" name="action" value="create">Agregar Producto</button>
                                        <button type="submit" class="btn btn-primary" id="btn-actualizar-producto" name="action" value="update">Actualizar Producto</button>
                                    </div>
                                </form>
                                <!-- / Formulario - Agregar Producto -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- / Modal - Agregar Producto -->

                <!-- / MODALES-->
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
        <script>
            $(document).ready(function () {
                $('#tablaProducto').DataTable({
                    "paging": true,
                    "lengthMenu": [6, 10, 25, 50],
                    "searching": true
                });
            });
        </script>
        <!-- / Bootstrap -->
        <script src="${pageContext.servletContext.contextPath}/js/producto.js"></script>
        <script src="${pageContext.servletContext.contextPath}/js/script.js"></script>
    </body>

</html>