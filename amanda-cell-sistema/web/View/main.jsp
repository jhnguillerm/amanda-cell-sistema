<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page = "../components/head.jsp"/>
    </head>

    <body>
        <div class="wrapper">
            <!-- Nav vertical -->
            <jsp:include page = "../components/navbar_vertical.jsp"/>
            <main class="content">
                <!-- Nav horizontal -->
                <jsp:include page = "../components/navbar_horizontal.jsp"/>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
                            <div id="chart1"></div>
                        </div>
                        <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
                            <div id="chart2"></div>
                        </div>
                    </div>
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
        <script src="../js/graficos.js"></script>
    </body>

</html>