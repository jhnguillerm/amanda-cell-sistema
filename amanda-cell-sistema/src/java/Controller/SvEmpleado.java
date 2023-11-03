package Controller;

import Model.Empleado;
import ModelDAO.EmpleadoDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvEmpleado", urlPatterns = {"/SvEmpleado"})
public class SvEmpleado extends HttpServlet {

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
        if (request.getParameter("action") != null) {
            String action = request.getParameter("action");

            if (action.equals("create")) {
                String nombres = request.getParameter("txtNombres");
                String dni = request.getParameter("txtDni");
                String correo = request.getParameter("txtCorreo");
                String telefono = request.getParameter("txtTelefono");
                String username = request.getParameter("txtUsername");
                String pass = request.getParameter("txtPass");

                Empleado empleado = new Empleado();

                empleado.setNombres(nombres);
                empleado.setDni(dni);
                empleado.setCorreo(correo);
                empleado.setTelefono(telefono);
                empleado.setUsername(username);
                empleado.setPass(pass);

                EmpleadoDAO empleadoDAO = new EmpleadoDAO();
                if (empleadoDAO.create(empleado)) {
                    response.sendRedirect(request.getContextPath() + "/View/empleado.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/View/error.jsp");
                }
            } else if (action.equals("update")) {
                int idEmpleado = Integer.parseInt(request.getParameter("txtIdEmpleado"));
                String nombres = request.getParameter("txtNombres");
                String dni = request.getParameter("txtDni");
                String correo = request.getParameter("txtCorreo");
                String telefono = request.getParameter("txtTelefono");
                String username = request.getParameter("txtUsername");
                String pass = request.getParameter("txtPass");

                Empleado empleado = new Empleado();

                empleado.setIdEmpleado(idEmpleado);
                empleado.setNombres(nombres);
                empleado.setDni(dni);
                empleado.setCorreo(correo);
                empleado.setTelefono(telefono);
                empleado.setUsername(username);
                empleado.setPass(pass);

                EmpleadoDAO empleadoDAO = new EmpleadoDAO();
                if (empleadoDAO.update(empleado)) {
                    response.sendRedirect(request.getContextPath() + "/View/empleado.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/View/error.jsp");
                }
            } else if (action.equals("delete")) {
                int idEmpleado = Integer.parseInt(request.getParameter("txtIdEmpleado"));
                Empleado empleado = new Empleado();
                empleado.setIdEmpleado(idEmpleado);
                EmpleadoDAO empleadoDAO = new EmpleadoDAO();
                if (empleadoDAO.delete(empleado)) {
                    response.sendRedirect(request.getContextPath() + "/View/empleado.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/View/error.jsp");
                }
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
