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
        //Listar productos.
        /*ProductoDAO productoDAO = new ProductoDAO();
        List<Producto> listaProductos = productoDAO.toList();
        
        request.setAttribute("productos", listaProductos);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(producto);
        dispatcher.forward(request, response);*/
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obteniendo los parámetros de los input del formulario
        String nombre = request.getParameter("txtNombre");
        String descripcion = request.getParameter("areaDescripcion");
        double precio = Double.parseDouble(request.getParameter("txtPrecio"));
        int stock = Integer.parseInt(request.getParameter("txtStock"));
        String tipo = request.getParameter("txtTipo");
        int idProveedor = Integer.parseInt(request.getParameter("txtIdProveedor"));

        Producto producto = new Producto();
        producto.setNombre(nombre);
        producto.setDescripcion(descripcion);
        producto.setPrecio(precio);
        producto.setStock(stock);
        producto.setTipo(tipo);
        producto.setIdProveedor(idProveedor);

        ProductoDAO productoDAO = new ProductoDAO();
        if (productoDAO.create(producto)) {
            response.sendRedirect(request.getContextPath() + "/View/Producto.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/View/Error.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
