package Controller;

import Model.Cliente;
import Model.DetalleServicio;
import Model.Producto;
import Model.Servicio;
import ModelDAO.ClienteDAO;
import ModelDAO.DetalleServicioDAO;
import ModelDAO.ProductoDAO;
import ModelDAO.ServicioDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SvServicio extends HttpServlet {

    //Cliente
    Cliente cliente = new Cliente();
    ClienteDAO clienteDAO = new ClienteDAO();
    int idCliente;

    //Producto
    Producto producto = new Producto();
    ProductoDAO productoDAO = new ProductoDAO();
    int idProducto;

    //Servicio
    Servicio servicio = new Servicio();
    ServicioDAO servicioDAO = new ServicioDAO();
    int idServicio;
    String numSerie = servicioDAO.generarNumSerie();
    String problema;
    String descripcion;
    double costo;
    double total = 0.0;
    String fechaRecepcion;
    String fechaEntrega;
    String estado;
    int idEmpleado;

    //Detalle servicio;
    DetalleServicio detalleServicio = new DetalleServicio();
    DetalleServicioDAO detalleServicioDAO = new DetalleServicioDAO();
    List<DetalleServicio> listaDetalle = new ArrayList<>();
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

            session.setAttribute("numSerie", numSerie);

            // BUSCAR CLIENTE ==============================================================================
            if (action.equals("searchCliente")) {
                idCliente = Integer.parseInt(request.getParameter("cbCliente"));

                cliente.setIdCliente(idCliente);
                if (clienteDAO.search(cliente)) {
                    session.setAttribute("idCliente", cliente.getIdCliente());
                    session.setAttribute("dniCliente", cliente.getDni());
                    session.setAttribute("nombresCliente", cliente.getNombres());
                } else {
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                }

                // BUSCAR PRODUCTO ==============================================================================
            } else if (action.equals("searchProducto")) {
                idProducto = Integer.parseInt(request.getParameter("cbProducto"));

                producto.setIdProducto(idProducto);
                if (productoDAO.search(producto)) {
                    session.setAttribute("idProducto", producto.getIdProducto());
                    session.setAttribute("nombreProducto", producto.getNombre());
                    session.setAttribute("precioProducto", producto.getPrecioVenta());
                    session.setAttribute("stockProducto", producto.getStock());
                } else {
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                }
                // AGREGAR PRODUCTO A LA TABLA ==============================================================================
            } else if (action.equals("agregarTabla")) {

                idProducto = Integer.parseInt(request.getParameter("txtIdProducto"));
                nombreProducto = request.getParameter("txtNombre");
                cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
                precioVenta = Double.parseDouble(request.getParameter("txtPrecio"));
                subtotal = cantidad * precioVenta;
                idServicio = servicioDAO.generarSiguienteId();

                // Verificar si el producto ya está en la lista
                boolean productoExistente = false;
                for (DetalleServicio detalleExistente : listaDetalle) {
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
                    detalleServicio = new DetalleServicio();
                    detalleServicio.setCantidad(cantidad);
                    detalleServicio.setPrecioVenta(precioVenta);
                    detalleServicio.setSubtotal(subtotal);
                    detalleServicio.setIdProducto(idProducto);
                    detalleServicio.setNombreProducto(nombreProducto);
                    detalleServicio.setIdServicio(idServicio);
                    listaDetalle.add(detalleServicio);
                }

                total = 0.0;

                // Recalcular el total
                for (int i = 0; i < listaDetalle.size(); i++) {
                    total += listaDetalle.get(i).getSubtotal();
                }
                session.setAttribute("listaDetalle", listaDetalle);
                
                // ELIMINAR DETALLE ==============================================================================
            } else if (action.equals("eliminarDetalle")) {
                int detalleIdProducto = Integer.parseInt(request.getParameter("detalleIdProducto"));

                Iterator<DetalleServicio> iterator = listaDetalle.iterator();
                while (iterator.hasNext()) {
                    DetalleServicio detalle = iterator.next();
                    if (detalle.getIdProducto() == detalleIdProducto) {
                        iterator.remove();
                        break;
                    }
                }

                total = calcularTotal(listaDetalle);
                session.setAttribute("listaDetalle", listaDetalle);
                session.setAttribute("total", total);
                response.sendRedirect(request.getContextPath() + "/View/nuevoServicio.jsp");
                return;
                // CREATE ==============================================================================
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

                //Servicio
                numSerie = request.getParameter("txtNumSerie");
                total = calcularTotal(listaDetalle);
                problema = request.getParameter("txtProblema");
                descripcion = request.getParameter("areaDescripcion");
                costo = Double.parseDouble(request.getParameter("txtCosto"));
                fechaRecepcion = request.getParameter("txtFechaRecepcion");
                fechaEntrega = request.getParameter("txtFechaEntrega");
                estado = request.getParameter("cbEstado");
                idCliente = Integer.parseInt(request.getParameter("txtIdCliente"));
                idEmpleado = (int) session.getAttribute("idEmpleado");

                servicio = new Servicio();

                servicio.setNumSerie(numSerie);
                servicio.setProblema(problema);
                servicio.setDescripcion(descripcion);
                servicio.setCosto(costo);
                servicio.setTotal(total + costo);
                servicio.setFechaRecepcion(fechaRecepcion);
                servicio.setFechaEntrega(fechaEntrega);
                servicio.setEstado(estado);
                servicio.setIdCliente(idCliente);
                servicio.setIdEmpleado(idEmpleado);

                servicioDAO = new ServicioDAO();
                servicioDAO.create(servicio);

                //DetalleServicio
                for (int i = 0; i < listaDetalle.size(); i++) {
                    detalleServicio = new DetalleServicio();

                    detalleServicio.setCantidad(listaDetalle.get(i).getCantidad());
                    detalleServicio.setPrecioVenta(listaDetalle.get(i).getPrecioVenta());
                    detalleServicio.setSubtotal(listaDetalle.get(i).getSubtotal());
                    detalleServicio.setIdProducto(listaDetalle.get(i).getIdProducto());
                    detalleServicio.setIdServicio(listaDetalle.get(i).getIdServicio());

                    detalleServicioDAO = new DetalleServicioDAO();
                    detalleServicioDAO.create(detalleServicio);
                }
                listaDetalle.clear();
                total = 0.0;
                session.removeAttribute("numSerie");
                session.removeAttribute("idCliente");
                session.removeAttribute("dniCliente");
                session.removeAttribute("nombresCliente");
                session.removeAttribute("idProducto");
                session.removeAttribute("nombreProducto");
                session.removeAttribute("precioProducto");
                session.removeAttribute("stockProducto");
                session.removeAttribute("listaDetalle");
                session.removeAttribute("total");

                response.sendRedirect(request.getContextPath() + "/View/servicio.jsp");
                return;
                
                // CANCELAR ==============================================================================
            } else if (action.equals("cancelar")) {
                listaDetalle.clear();
                total = 0.0;

                session.removeAttribute("numSerie");
                session.removeAttribute("idCliente");
                session.removeAttribute("dniCliente");
                session.removeAttribute("nombresCliente");
                session.removeAttribute("idProducto");
                session.removeAttribute("nombreProducto");
                session.removeAttribute("precioProducto");
                session.removeAttribute("stockProducto");
                session.removeAttribute("listaDetalle");
                session.removeAttribute("total");

                response.sendRedirect(request.getContextPath() + "/View/servicio.jsp");
                return;
            }
            session.setAttribute("total", total);
            //request.getRequestDispatcher("View/nuevoServicio.jsp").forward(request, response);
            response.sendRedirect(request.getContextPath() + "/View/nuevoServicio.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    private double calcularTotal(List<DetalleServicio> listaDetalle) {
        double total = 0.0;
        for (DetalleServicio detalle : listaDetalle) {
            total += detalle.getSubtotal();
        }
        return Double.parseDouble(String.format("%.2f", total));
    }

}
