<%@page import="Model.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header id="nav-horizontal" class="p-3 mb-3 border-bottom rounded shadow-lg" style="background-color: #fff;">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="/amanda-cell-sistema/SvRutas?action=main" class="nav-link px-2 link-secondary">Inicio</a></li>
                <li><a href="#" class="nav-link px-2 link-body-emphasis">Servicios</a></li>
                <li><a href="#" class="nav-link px-2 link-body-emphasis">Materiales</a></li>
                <li><a href="#" class="nav-link px-2 link-body-emphasis">Usuarios</a></li>
                <li><a href="/amanda-cell-sistema/SvRutas?action=web" class="nav-link px-2 link-body-emphasis">Pagina Web</a></li>
            </ul>
            <div class="dropdown text-end">
                <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle"
                   data-bs-toggle="dropdown" aria-expanded="false">

                    <span class="align-middle px-1">${sessionScope.nombres}</span>
                    <img src="../images/profile.webp" alt="" width="32" height="32" class="rounded-circle">
                </a>
                <ul class="dropdown-menu text-small">
                    <li>
                        <a class="dropdown-item" href="pages-account-settings-account.html">
                            <div class="d-flex">
                                <div class="flex-shrink-0 me-3">
                                    <div class="avatar avatar-online">
                                        <img src="../images/profile.webp" width="40" height="40" alt="" class="w-px-40 h-auto rounded-circle">
                                    </div>
                                </div>
                                <div class="flex-grow-1">
                                    <span class="fw-medium d-block" style="color: #808d9b"> ${sessionScope.usuario}</span>
                                    <small class="text-muted" style="color: #a2b0bb"><!--Administrador--></small>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li><a class="dropdown-item" href="#">Settings</a></li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li>
                        <form action="${pageContext.request.contextPath}/SvLogin" method="post">
                            <button name="accion" value="salir" class="dropdown-item">Sign out</button>
                        </form>
                        <!-- <a class="dropdown-item" href="../View/login.jsp">Sign out</a> -->
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>