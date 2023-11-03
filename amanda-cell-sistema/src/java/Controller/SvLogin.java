package Controller;

import Model.Empleado;
import ModelDAO.EmpleadoDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SvLogin extends HttpServlet {

    Empleado empleado = new Empleado();
    EmpleadoDAO empleadoDAO = new EmpleadoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null && accion.equalsIgnoreCase("login")) {
            String usuario = request.getParameter("txtUsuario");
            String password = request.getParameter("txtPassword");
            empleado = empleadoDAO.login(usuario, password);
            if (empleado.getUsername() != null) {
                request.setAttribute("usuario", empleado);
                //request.getRequestDispatcher("View/main.jsp").forward(request, response);
                response.sendRedirect(request.getContextPath() + "/View/main.jsp");
                System.out.println("Si se validó");
            } else {
                request.getRequestDispatcher("/View/login.jsp").forward(request, response);
                System.out.println("No se valido");
            }
        } else {
            request.getRequestDispatcher("/View/login.jsp").forward(request, response);
            System.out.println("No es igual");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
