<nav class="sidebar">
    <div id="leftside-navigation" class="nano">
        <!-- Logo -->
        <div>
            <a class="sidebar-brand" href="main.jsp">
                <h1 class="sidebar-title">Amanda Cell</h1>
            </a>
        </div>
        <!-- / Logo -->
        <ul class="sidebar-nav">
            <li class="active">
                <a href="main.jsp">
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
                        <a href="venta.jsp">Lista de ventas</a>
                    </li>
                    <li>
                        <a href="nuevaVenta.jsp">Nueva venta</a>
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
                        <a href="loadProducto.jsp">Nuevo producto</a>
                    </li>
                    <li>
                        <a href="error.jsp">Editar producto</a>
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
                        <a href="loadProveedor.jsp">Nuevo proveedor</a>
                    </li>
                    <li>
                        <a href="error.jsp">Editar proveedor</a>
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
                        <a href="loadCliente.jsp">Nuevo cliente</a>
                    </li>
                    <li>
                        <a href="error.jsp">Editar cliente</a>
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
                        <a href="loadEmpleado.jsp">Nuevo empleado</a>
                    </li>
                    <li>
                        <a href="error.jsp">Editar empleado</a>
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