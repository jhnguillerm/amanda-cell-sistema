package Controller;

import Model.Empleado;
import ModelDAO.EmpleadoDAO;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet(name = "SvEmpleado", urlPatterns = {"/SvEmpleado"})
public class SvEmpleado extends HttpServlet {

    private EmpleadoDAO empleadoDAO = new EmpleadoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
        empleadoDAO.toListImagen(idEmpleado, response);
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
                String direccion = request.getParameter("txtDireccion");
                String username = request.getParameter("txtUsername");
                String pass = request.getParameter("txtPass");
                String rol = request.getParameter("cbRol");
                Part filePart = request.getPart("fileFoto");
                InputStream inputStream = filePart.getInputStream();

                Empleado nuevoEmpleado = new Empleado();
                nuevoEmpleado.setNombres(nombres);
                nuevoEmpleado.setDni(dni);
                nuevoEmpleado.setCorreo(correo);
                nuevoEmpleado.setTelefono(telefono);
                nuevoEmpleado.setDireccion(direccion);
                nuevoEmpleado.setUsername(username);
                nuevoEmpleado.setPass(pass);
                nuevoEmpleado.setRol(rol);
                nuevoEmpleado.setFoto(inputStream);

                if (empleadoDAO.datosExisten(nuevoEmpleado.getCorreo(), "correo", 0)
                        || empleadoDAO.datosExisten(nuevoEmpleado.getDni(), "dni", 0)
                        || empleadoDAO.datosExisten(nuevoEmpleado.getUsername(), "username", 0)
                        || empleadoDAO.datosExisten(nuevoEmpleado.getTelefono(), "telefono", 0)) {

                    System.out.println("La información del empleado ya existe.");
                } else {
                    empleadoDAO.create(nuevoEmpleado);
                    response.sendRedirect(request.getContextPath() + "/View/empleado.jsp");
                    return;
                }
            } else if (action.equals("update")) {
                int idEmpleado = Integer.parseInt(request.getParameter("txtIdEmpleado"));
                Empleado empleado = empleadoDAO.getEmpleadoById(idEmpleado);

                empleado.setNombres(request.getParameter("txtNombres"));
                empleado.setDni(request.getParameter("txtDni"));
                empleado.setCorreo(request.getParameter("txtCorreo"));
                empleado.setTelefono(request.getParameter("txtTelefono"));
                empleado.setDireccion(request.getParameter("txtDireccion"));
                empleado.setUsername(request.getParameter("txtUsername"));
                empleado.setPass(request.getParameter("txtPass"));
                empleado.setRol(request.getParameter("cbRol"));
                Part filePart = request.getPart("fileFoto");
                InputStream inputStream = filePart.getInputStream();
                empleado.setFoto(inputStream);

                if (empleadoDAO.datosExisten(empleado.getCorreo(), "correo", empleado.getIdEmpleado())
                        || empleadoDAO.datosExisten(empleado.getDni(), "dni", empleado.getIdEmpleado())
                        || empleadoDAO.datosExisten(empleado.getUsername(), "username", empleado.getIdEmpleado())
                        || empleadoDAO.datosExisten(empleado.getTelefono(), "telefono", empleado.getIdEmpleado())) {
                    // Información duplicada, manejar según tus necesidades
                    System.out.println("La información del empleado ya existe para otro empleado.");
                } else {
                    empleadoDAO.update(empleado);
                    response.sendRedirect(request.getContextPath() + "/View/empleado.jsp");
                    return;
                }
            } else if (action.equals("delete")) {
                int idEmpleado = Integer.parseInt(request.getParameter("txtIdEmpleado"));

                Empleado empleado = new Empleado();
                EmpleadoDAO empleadoDAO = new EmpleadoDAO();

                empleado.setIdEmpleado(idEmpleado);

                empleadoDAO.delete(empleado);

                response.sendRedirect(request.getContextPath() + "/View/empleado.jsp");
                return;
            } else {
                response.sendRedirect(request.getContextPath() + "/View/error.jsp");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
