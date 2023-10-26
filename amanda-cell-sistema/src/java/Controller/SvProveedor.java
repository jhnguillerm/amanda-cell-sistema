package Controller;

import Model.Proveedor;
import ModelDAO.ProveedorDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvProveedor", urlPatterns = {"/SvProveedor"})
public class SvProveedor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProveedorDAO proveedorDAO = new ProveedorDAO();
        List<Proveedor> listaProveedores = proveedorDAO.toList();

        if (listaProveedores != null) {
            request.setAttribute("listaProveedores", listaProveedores);
        } else {
            request.setAttribute("error", "Error al cargar la lista de proveedores.");
        }

        request.getRequestDispatcher("/View/producto.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("action") != null) {
            String action = request.getParameter("action");
            
            if (action.equals("create")) {
                String nombre = request.getParameter("txtNombre");
                String direccion = request.getParameter("txtDireccion");
                String numero = request.getParameter("txtNumero");
                String correo = request.getParameter("txtCorreo");
                
                Proveedor proveedor = new Proveedor();
                
                proveedor.setNombre(nombre);
                proveedor.setDireccion(direccion);
                proveedor.setNumero(numero);
                proveedor.setCorreo(correo);
                
                ProveedorDAO proveedorDAO = new ProveedorDAO();
                if (proveedorDAO.create(proveedor)) {
                    response.sendRedirect(request.getContextPath() + "/View/proveedor.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/View/error.jsp");
                }
            } else if (action.equals("update")) {
                int idProveedor = Integer.parseInt(request.getParameter("txtIdProveedor"));
                String nombre = request.getParameter("txtNombre");
                String direccion = request.getParameter("txtDireccion");
                String numero = request.getParameter("txtNumero");
                String correo = request.getParameter("txtCorreo");
                
                Proveedor proveedor = new Proveedor();
                
                proveedor.setIdProveedor(idProveedor);
                proveedor.setNombre(nombre);
                proveedor.setDireccion(direccion);
                proveedor.setNumero(numero);
                proveedor.setCorreo(correo);
                
                ProveedorDAO proveedorDAO = new ProveedorDAO();
                if (proveedorDAO.update(proveedor)) {
                    response.sendRedirect(request.getContextPath() + "/View/proveedor.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/View/error.jsp");
                }
            } else if (action.equals("delete")) {
                int idProveedor = Integer.parseInt(request.getParameter("txtIdProveedor"));
                
                ProveedorDAO proveedorDAO = new ProveedorDAO();
                Proveedor proveedor = new Proveedor();
                proveedor.setIdProveedor(idProveedor);
                
                if (proveedorDAO.delete(proveedor)) {
                    response.sendRedirect(request.getContextPath() + "/View/proveedor.jsp");
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
