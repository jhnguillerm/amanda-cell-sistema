package Controller;

import Config.GenerarNumSerie;
import Model.Cliente;
import Model.DetalleVenta;
import Model.Producto;
import Model.Venta;
import ModelDAO.ClienteDAO;
import ModelDAO.DetalleVentaDAO;
import ModelDAO.ProductoDAO;
import ModelDAO.VentaDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
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
    int idVenta;
    int numSerie;
    String nuevoNumSerie;
    String fechaVenta = "2023-11-22";
    double total;
    int idEmpleado;

    //DetalleVenta
    DetalleVenta detalleVenta = new DetalleVenta();
    DetalleVentaDAO detalleVentaDAO = new DetalleVentaDAO();
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

            numSerie = ventaDAO.generarNumSerie();
            GenerarNumSerie generarNumSerie = new GenerarNumSerie();
            nuevoNumSerie = generarNumSerie.generarNumeroSerieVenta(numSerie);

            request.setAttribute("numSerieVenta", nuevoNumSerie);
            request.setAttribute("numSerie", numSerie);

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
                total = 0;

                request.setAttribute("cliente", cliente);
                request.setAttribute("producto", producto);

                idProducto = Integer.parseInt(request.getParameter("txtIdProducto"));
                nombreProducto = request.getParameter("txtNombre");
                cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
                precioVenta = Double.parseDouble(request.getParameter("txtPrecio"));
                subtotal = cantidad * precioVenta;
                idVenta = numSerie;

                // Verificar si el producto ya está en la lista
                boolean productoExistente = false;
                for (DetalleVenta detalleExistente : listaDetalle) {
                    if (detalleExistente.getIdProducto() == idProducto) {
                        // Si el producto ya está en la lista, actualizar la cantidad y el subtotal
                        detalleExistente.setCantidad(detalleExistente.getCantidad() + cantidad);
                        detalleExistente.setSubtotal(detalleExistente.getSubtotal() + subtotal);
                        productoExistente = true;
                        break;
                    }
                }

                if (!productoExistente) {
                    // Si el producto no está en la lista, agregar uno nuevo
                    detalleVenta = new DetalleVenta();
                    detalleVenta.setCantidad(cantidad);
                    detalleVenta.setPrecioVenta(precioVenta);
                    detalleVenta.setSubtotal(subtotal);
                    detalleVenta.setIdProducto(idProducto);
                    detalleVenta.setNombreProducto(nombreProducto);
                    detalleVenta.setIdVenta(idVenta);
                    listaDetalle.add(detalleVenta);
                }

                // Recalcular el total
                for (int i = 0; i < listaDetalle.size(); i++) {
                    total += listaDetalle.get(i).getSubtotal();
                }

                request.setAttribute("total", total);
                request.setAttribute("listaDetalle", listaDetalle);

                //ELIMINAR DETALLE
            } else if (action.equals("eliminarDetalle")) {
                int detalleId = Integer.parseInt(request.getParameter("detalleId"));
                eliminarDetalle(detalleId, request);

            } else if (action.equals("create")) {
                //Actualizar stock
                for (int i = 0; i < listaDetalle.size(); i++) {
                    Producto producto = new Producto();
                    int idProducto = listaDetalle.get(i).getIdProducto();
                    int cantidad = listaDetalle.get(i).getCantidad();

                    producto.setIdProducto(idProducto);

                    ProductoDAO productoDAO = new ProductoDAO();
                    productoDAO.search(producto);

                    int newStock = producto.getStock() - cantidad;

                    productoDAO.updateStock(idProducto, newStock);
                }

                //Venta
                numSerie = Integer.parseInt(request.getParameter("txtNumSerie"));
                total = calcularTotal(listaDetalle);
                idCliente = Integer.parseInt(request.getParameter("txtIdCliente"));

                idEmpleado = (int) session.getAttribute("idEmpleado");

                venta = new Venta();

                venta.setNumSerie(nuevoNumSerie);
                venta.setFechaVenta(fechaVenta);
                venta.setMonto(total);
                venta.setIdCliente(idCliente);
                venta.setIdEmpleado(idEmpleado);

                ventaDAO = new VentaDAO();
                ventaDAO.create(venta);

                //DetalleVenta
                for (int i = 0; i < listaDetalle.size(); i++) {
                    detalleVenta = new DetalleVenta();

                    detalleVenta.setCantidad(listaDetalle.get(i).getCantidad());
                    detalleVenta.setPrecioVenta(listaDetalle.get(i).getPrecioVenta());
                    detalleVenta.setSubtotal(listaDetalle.get(i).getSubtotal());
                    detalleVenta.setIdProducto(listaDetalle.get(i).getIdProducto());
                    detalleVenta.setIdVenta(listaDetalle.get(i).getIdVenta());

                    detalleVentaDAO = new DetalleVentaDAO();
                    detalleVentaDAO.create(detalleVenta);
                }
                listaDetalle.clear();
                total = 0.0;
                response.sendRedirect(request.getContextPath() + "/View/venta.jsp");
                return;
            } else if (action.equals("cancelar")) {
                listaDetalle.clear();
                total = 0.0;
                response.sendRedirect(request.getContextPath() + "/View/venta.jsp");
                return;
            }
            request.getRequestDispatcher("View/nuevaVenta.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private double calcularTotal(List<DetalleVenta> listaDetalle) {
        double total = 0.0;
        for (DetalleVenta detalle : listaDetalle) {
            total += detalle.getSubtotal();
        }
        return total;
    }

    private void eliminarDetalle(int detalleId, HttpServletRequest request) {
        // Eliminar el detalle de la lista
        Iterator<DetalleVenta> iterator = listaDetalle.iterator();
        while (iterator.hasNext()) {
            DetalleVenta detalle = iterator.next();
            if (detalle.getIdDetalleVenta() == detalleId) {
                iterator.remove();
                break;
            }
        }

        // Recalcular el total
        total = calcularTotal(listaDetalle);

        // Actualizar los atributos en el request
        request.setAttribute("total", total);
        request.setAttribute("listaDetalle", listaDetalle);
    }

}
