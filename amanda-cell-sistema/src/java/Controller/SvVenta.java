package Controller;

import Model.Cliente;
import Model.DetalleVenta;
import Model.Producto;
import Model.Venta;
import ModelDAO.ClienteDAO;
import ModelDAO.ProductoDAO;
import ModelDAO.VentaDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SvVenta extends HttpServlet {

    //Cliente
    Cliente cliente = new Cliente();
    ClienteDAO clienteDAO = new ClienteDAO();
    int idCliente;

    //Producto
    Producto producto = new Producto();
    ProductoDAO productoDAO = new ProductoDAO();
    int idProducto;

    //Venta
    Venta venta = new Venta();
    VentaDAO ventaDAO = new VentaDAO();
    double total;

    //DetalleVenta
    DetalleVenta detalleVenta = new DetalleVenta();
    List<DetalleVenta> listaDetalle = new ArrayList<>();
    int cantidad;
    double precioVenta;
    double subtotal;
    String nombreProducto; //Para la tabla

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

        if (request.getParameter("action") != null) {
            String action = request.getParameter("action");

            if (action.equals("searchCliente")) {
                idCliente = Integer.parseInt(request.getParameter("cbCliente"));

                cliente.setIdCliente(idCliente);
                if (clienteDAO.search(cliente)) {
                    request.setAttribute("cliente", cliente);
                    request.setAttribute("producto", producto);
                    request.setAttribute("listaDetalle", listaDetalle);
                    request.setAttribute("total", total);
                } else {
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                }
            } else if (action.equals("searchProducto")) {

                idProducto = Integer.parseInt(request.getParameter("cbProducto"));

                producto.setIdProducto(idProducto);;
                if (productoDAO.search(producto)) {
                    request.setAttribute("cliente", cliente);
                    request.setAttribute("producto", producto);
                    request.setAttribute("listaDetalle", listaDetalle);
                    request.setAttribute("total", total);
                } else {
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                }
            } else if (action.equals("agregarTabla")) {
                total = 0.0;
                
                request.setAttribute("cliente", cliente);
                request.setAttribute("producto", producto);
                
                idProducto = Integer.parseInt(request.getParameter("txtIdProducto"));
                nombreProducto = request.getParameter("txtNombre");
                cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
                precioVenta = Double.parseDouble(request.getParameter("txtPrecio"));
                subtotal = cantidad * precioVenta;
                
                detalleVenta = new DetalleVenta();
                
                detalleVenta.setCantidad(cantidad);
                detalleVenta.setPrecioVenta(precioVenta);
                detalleVenta.setSubtotal(subtotal);
                detalleVenta.setIdProducto(idProducto);
                detalleVenta.setNombreProducto(nombreProducto);

                listaDetalle.add(detalleVenta);
                
                for (int i = 0; i < listaDetalle.size(); i++) {
                    total += listaDetalle.get(i).getSubtotal();
                }
                
                request.setAttribute("total", total);
                request.setAttribute("listaDetalle", listaDetalle);
            }
            request.getRequestDispatcher("View/nuevaVenta.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
