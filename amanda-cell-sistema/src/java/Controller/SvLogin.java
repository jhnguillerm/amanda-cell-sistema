package Controller;

import Model.Empleado;
import ModelDAO.EmpleadoDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        HttpSession session = request.getSession();
        String accion = request.getParameter("accion");
        if (accion != null && accion.equals("login")) {
            String usuario = request.getParameter("txtUsuario");
            String password = request.getParameter("txtPassword");
            String encryptedPassword = empleadoDAO.getMD5(password);
            empleado = empleadoDAO.login(usuario, encryptedPassword);
            if (empleado.getUsername() != null) {
                session.setAttribute("usuario", empleado.getUsername());
                session.setAttribute("nombres", empleado.getNombres());
                //request.getRequestDispatcher("View/main.jsp").forward(request, response);
                response.sendRedirect(request.getContextPath() + "/View/main.jsp");
                System.out.println("Si se validó");
            } else {
                request.getRequestDispatcher("index.jsp").forward(request, response);
                System.out.println("No se valido");
            }
        } else if (accion.equals("salir")) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
        else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
            System.out.println("No es igual");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
