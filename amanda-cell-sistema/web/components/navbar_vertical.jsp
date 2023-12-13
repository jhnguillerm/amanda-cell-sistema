<%
    String userRole = (String) session.getAttribute("rol");
%>
<nav class="sidebar">
    <div id="leftside-navigation" class="nano">
        <!-- Logo -->
        <div>
            <a class="sidebar-brand" href="/amanda-cell-sistema/SvRutas?action=main">
                <h1 class="sidebar-title">Amanda Cell</h1>
            </a>
        </div>
        <!-- / Logo -->
        <ul class="sidebar-nav">
            <li class="active">
                <a href="/amanda-cell-sistema/SvRutas?action=main">
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
                        <a href="/amanda-cell-sistema/SvRutas?action=venta">Lista de ventas</a>
                    </li>
                    <li>
                        <a href="../View/nuevaVenta.jsp">Nueva venta</a>
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
                        <a href="/amanda-cell-sistema/SvRutas?action=servicio">Lista reparaciones</a>
                    </li>
                    <li>
                        <a href="nuevoServicio.jsp">Nueva reparación</a>
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
                        <a href="/amanda-cell-sistema/SvRutas?action=producto">Lista de productos</a>
                    </li>
                    <li>
                        <a href="../View/newProducto.jsp">Nuevo producto</a>
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
                        <a href="/amanda-cell-sistema/SvRutas?action=proveedor">Lista de proveedores</a>
                    </li>
                    <li>
                        <a href="/amanda-cell-sistema/SvRutas?action=loadProveedor">Nuevo proveedor</a>
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
                        <a href="/amanda-cell-sistema/SvRutas?action=cliente">Lista de clientes</a>
                    </li>
                    <li>
                        <a href="/amanda-cell-sistema/SvRutas?action=loadCliente">Nuevo cliente</a>
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
                        <a href="/amanda-cell-sistema/SvRutas?action=empleado">Lista de empleados</a>
                    </li>
                    <li>
                        <%
                            if ("Administrador".equals(userRole)) {
                        %>
                        <a href="../View/newEmpleado.jsp">Nuevo empleado</a>
                        <%
                        } else {
                        %>
                        <a class="disabled" href="">Nuevo empleado</a>
                        <%
                            }
                        %>
                    </li>
                </ul>
            </li>
            <!-- Otros -->
            <li class="sidebar-header">
                Otros
            </li>
            <li class="sub-menu">
                <form action="${pageContext.request.contextPath}/SvLogin" method="post">
                    <button class="btn-salir" name="accion" value="salir">Sign out</button>
                </form>
            </li>
        </ul>
    </div>
</nav>