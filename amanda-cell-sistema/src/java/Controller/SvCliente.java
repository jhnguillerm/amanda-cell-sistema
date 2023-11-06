package Controller;

import Model.Cliente;
import ModelDAO.ClienteDAO;
import com.google.gson.JsonObject;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvCliente", urlPatterns = {"/SvCliente"})
public class SvCliente extends HttpServlet {

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

                Cliente cliente = new Cliente();

                cliente.setNombres(nombres);
                cliente.setDni(dni);
                cliente.setCorreo(correo);
                cliente.setTelefono(telefono);

                ClienteDAO clienteDAO = new ClienteDAO();
                if (clienteDAO.create(cliente)) {
                    response.sendRedirect(request.getContextPath() + "/View/cliente.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/View/error.jsp");
                }
            } else if (action.equals("update")) {
                int idCliente = Integer.parseInt(request.getParameter("txtIdCliente"));
                String nombres = request.getParameter("txtNombres");
                String dni = request.getParameter("txtDni");
                String correo = request.getParameter("txtCorreo");
                String telefono = request.getParameter("txtTelefono");

                Cliente cliente = new Cliente();

                cliente.setIdCliente(idCliente);
                cliente.setNombres(nombres);
                cliente.setDni(dni);
                cliente.setCorreo(correo);
                cliente.setTelefono(telefono);

                ClienteDAO clienteDAO = new ClienteDAO();
                if (clienteDAO.update(cliente)) {
                    response.sendRedirect(request.getContextPath() + "/View/cliente.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/View/error.jsp");
                }
            } else if (action.equals("delete")) {
                int idCliente = Integer.parseInt(request.getParameter("txtIdCliente"));

                Cliente cliente = new Cliente();

                cliente.setIdCliente(idCliente);

                ClienteDAO clienteDAO = new ClienteDAO();
                if (clienteDAO.delete(cliente)) {
                    response.sendRedirect(request.getContextPath() + "/View/cliente.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/View/error.jsp");
                }
            } else if (action.equals("search")) {
                int idCliente = Integer.parseInt(request.getParameter("cbCliente"));

                Cliente cliente = new Cliente();

                cliente.setIdCliente(idCliente);

                ClienteDAO clienteDAO = new ClienteDAO();
                if (clienteDAO.search(cliente)) {
                    // Crear un objeto JSON con los datos del cliente
                    JsonObject clienteJson = new JsonObject();
                    clienteJson.addProperty("dni", cliente.getDni());
                    clienteJson.addProperty("nombres", cliente.getNombres());

                    // Enviar la respuesta como JSON
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(clienteJson.toString());
                } else {
                    // Enviar una respuesta indicando que el cliente no se encontró
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                }
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
