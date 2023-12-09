package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SvRutas extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "main":
                    response.sendRedirect(request.getContextPath() + "/View/main.jsp");
                    break;
                case "venta":
                    response.sendRedirect(request.getContextPath() + "/View/venta.jsp");
                    break;
                case "nuevaVenta":
                    //request.getRequestDispatcher("SvVenta").forward(request, response);
                    response.sendRedirect(request.getContextPath() + "/View/nuevaVenta.jsp");
                    break;
                case "servicio":
                    response.sendRedirect(request.getContextPath() + "/View/servicio.jsp");
                    break;
                case "producto":
                    response.sendRedirect(request.getContextPath() + "/View/producto.jsp");
                    break;
                case "loadProducto":
                    response.sendRedirect(request.getContextPath() + "/View/loadProducto.jsp");
                    break;
                case "proveedor":
                    response.sendRedirect(request.getContextPath() + "/View/proveedor.jsp");
                    break;
                case "loadProveedor":
                    response.sendRedirect(request.getContextPath() + "/View/loadProveedor.jsp");
                    break;
                case "cliente":
                    response.sendRedirect(request.getContextPath() + "/View/cliente.jsp");
                    break;
                case "loadCliente":
                    response.sendRedirect(request.getContextPath() + "/View/loadCliente.jsp");
                    break;
                case "empleado":
                    response.sendRedirect(request.getContextPath() + "/View/empleado.jsp");
                    break;
                case "loadEmpleado":
                    response.sendRedirect(request.getContextPath() + "/View/loadEmpleado.jsp");
                    break;
                case "web":
                    response.sendRedirect(request.getContextPath() + "/webpage/webPage.jsp");
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/View/error.jsp");
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/View/error.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
