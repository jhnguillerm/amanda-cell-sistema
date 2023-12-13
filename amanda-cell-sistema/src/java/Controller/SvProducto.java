package Controller;

import Model.Producto;
import ModelDAO.ProductoDAO;
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
@WebServlet(name = "SvProducto", urlPatterns = {"/SvProducto"})
public class SvProducto extends HttpServlet {

    ProductoDAO productoDAO = new ProductoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idProducto = Integer.parseInt(request.getParameter("idProducto"));
        productoDAO.toListImagen(idProducto, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("action") != null) {
            String action = request.getParameter("action");
            // CREATE ==============================================================================
            if (action.equals("create")) {
                //Producto
                String nombre = request.getParameter("txtNombre");
                String descripcion = request.getParameter("areaDescripcion");
                double precioCompra = Double.parseDouble(request.getParameter("txtPrecioCompra"));
                double precioVenta = Double.parseDouble(request.getParameter("txtPrecioVenta"));
                int stock = Integer.parseInt(request.getParameter("txtStock"));
                String tipo = request.getParameter("txtTipo");
                Part filePart = request.getPart("fileImagen");
                InputStream inputStream = filePart.getInputStream();
                int idProveedor = Integer.parseInt(request.getParameter("cbProveedor"));

                Producto producto = new Producto();
                ProductoDAO productoDAO = new ProductoDAO();

                producto.setNombre(nombre);
                producto.setDescripcion(descripcion);
                producto.setPrecioCompra(precioCompra);
                producto.setPrecioVenta(precioVenta);
                producto.setStock(stock);
                producto.setTipo(tipo);
                producto.setImagen(inputStream);
                producto.setIdProveedor(idProveedor);

                productoDAO.create(producto);

                response.sendRedirect(request.getContextPath() + "/View/producto.jsp");
                return;

                // UPDATE ==============================================================================
            } else if (action.equals("update")) {
                int idProducto = Integer.parseInt(request.getParameter("txtIdProducto"));
                String nombre = request.getParameter("txtNombre");
                String descripcion = request.getParameter("areaDescripcion");
                double precioCompra = Double.parseDouble(request.getParameter("txtPrecioCompra"));
                double precioVenta = Double.parseDouble(request.getParameter("txtPrecioVenta"));
                int stock = Integer.parseInt(request.getParameter("txtStock"));
                String tipo = request.getParameter("txtTipo");
                //Imagen
                Part filePart = request.getPart("fileImagen");
                InputStream inputStream = filePart.getInputStream();
                //ID proveedor
                int idProveedor = Integer.parseInt(request.getParameter("cbProveedor"));
                //Cambiar imagen o no
                String cambiarImagen = request.getParameter("cambiarImagen");
                boolean cambiarImagenVerificado = "on".equals(cambiarImagen);

                Producto producto = new Producto();
                ProductoDAO productoDAO = new ProductoDAO();

                producto.setIdProducto(idProducto);
                producto.setNombre(nombre);
                producto.setDescripcion(descripcion);
                producto.setPrecioCompra(precioCompra);
                producto.setPrecioVenta(precioVenta);
                producto.setStock(stock);
                producto.setTipo(tipo);
                if (cambiarImagenVerificado) {
                    producto.setImagen(inputStream);
                } else {
                    producto.setImagen(productoDAO.obtenerImagenExistente(idProducto));
                }
                producto.setIdProveedor(idProveedor);

                productoDAO.update(producto);

                response.sendRedirect(request.getContextPath() + "/View/producto.jsp");
                return;

                // DELETE ==============================================================================
            } else if (action.equals("delete")) {
                int idProducto = Integer.parseInt(request.getParameter("txtIdProducto"));

                ProductoDAO productoDAO = new ProductoDAO();
                Producto producto = new Producto();

                producto.setIdProducto(idProducto);

                productoDAO.delete(producto);

                response.sendRedirect(request.getContextPath() + "/View/producto.jsp");
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
