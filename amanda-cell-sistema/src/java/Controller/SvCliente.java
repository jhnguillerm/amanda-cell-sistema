/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Cliente;
import ModelDAO.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jhn_g
 */
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
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
