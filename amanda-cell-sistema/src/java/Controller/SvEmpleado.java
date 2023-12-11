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

                Empleado empleado = new Empleado();
                EmpleadoDAO empleadoDAO = new EmpleadoDAO();

                empleado.setNombres(nombres);
                empleado.setDni(dni);
                empleado.setCorreo(correo);
                empleado.setTelefono(telefono);
                empleado.setDireccion(direccion);
                empleado.setUsername(username);
                empleado.setPass(pass);
                empleado.setRol(rol);
                empleado.setFoto(inputStream);
                
                empleadoDAO.create(empleado);
                
                response.sendRedirect(request.getContextPath() + "/View/empleado.jsp");
                return;
            } else if (action.equals("update")) {
                int idEmpleado = Integer.parseInt(request.getParameter("txtIdEmpleado"));
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

                Empleado empleado = new Empleado();
                EmpleadoDAO empleadoDAO = new EmpleadoDAO();

                empleado.setIdEmpleado(idEmpleado);
                empleado.setNombres(nombres);
                empleado.setDni(dni);
                empleado.setCorreo(correo);
                empleado.setTelefono(telefono);
                empleado.setDireccion(direccion);
                empleado.setUsername(username);
                empleado.setPass(pass);
                empleado.setRol(rol);
                empleado.setFoto(inputStream);
                
                empleadoDAO.update(empleado);
                
                response.sendRedirect(request.getContextPath() + "/View/empleado.jsp");
                return;
                
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
