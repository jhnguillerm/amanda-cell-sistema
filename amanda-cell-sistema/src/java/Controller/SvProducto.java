package Controller;

import Model.Producto;
import ModelDAO.ProductoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvProducto", urlPatterns = {"/SvProducto"})
public class SvProducto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if (request.getParameter("action") != null) {
            String action = request.getParameter("action");
            
            if (action.equals("create")) {
                
                String nombre = request.getParameter("txtNombre");
                String descripcion = request.getParameter("areaDescripcion");
                double precioCompra = Double.parseDouble(request.getParameter("txtPrecioCompra"));
                double precioVenta = Double.parseDouble(request.getParameter("txtPrecioVenta"));
                int stock = Integer.parseInt(request.getParameter("txtStock"));
                String tipo = request.getParameter("txtTipo");
                int idProveedor = Integer.parseInt(request.getParameter("cbProveedor"));

                Producto producto = new Producto();
                
                producto.setNombre(nombre);
                producto.setDescripcion(descripcion);
                producto.setPrecioCompra(precioCompra);
                producto.setPrecioVenta(precioVenta);
                producto.setStock(stock);
                producto.setTipo(tipo);
                producto.setIdProveedor(idProveedor);

                ProductoDAO productoDAO = new ProductoDAO();
                if (productoDAO.create(producto)) {
                    response.sendRedirect(request.getContextPath() + "/View/Producto.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/View/Error.jsp");
                }
            } else if (action.equals("update")) {
                int idProducto = Integer.parseInt(request.getParameter("txtIdProducto"));
                String nombre = request.getParameter("txtNombre");
                String descripcion = request.getParameter("areaDescripcion");
                double precioCompra = Double.parseDouble(request.getParameter("txtPrecioCompra"));
                double precioVenta = Double.parseDouble(request.getParameter("txtPrecioVenta"));
                int stock = Integer.parseInt(request.getParameter("txtStock"));
                String tipo = request.getParameter("txtTipo");
                int idProveedor = Integer.parseInt(request.getParameter("cbProveedor"));

                Producto producto = new Producto();
                producto.setIdProducto(idProducto);
                producto.setNombre(nombre);
                producto.setDescripcion(descripcion);
                producto.setPrecioCompra(precioCompra);
                producto.setPrecioVenta(precioVenta);
                producto.setStock(stock);
                producto.setTipo(tipo);
                producto.setIdProveedor(idProveedor);

                ProductoDAO productoDAO = new ProductoDAO();
                if (productoDAO.update(producto)) {
                    response.sendRedirect(request.getContextPath() + "/View/Producto.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/View/Error.jsp");
                }
            } else if (action.equals("delete")) {
                int idProducto = Integer.parseInt(request.getParameter("txtIdProducto"));

                ProductoDAO productoDAO = new ProductoDAO();
                Producto producto = new Producto();
                producto.setIdProducto(idProducto);

                if (productoDAO.delete(producto)) {
                    response.sendRedirect(request.getContextPath() + "/View/Producto.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/View/Error.jsp");
                }
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
