package Controller;

import Config.GenerarNumSerie;
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
    int numSerie;
    String nuevoNumSerie;
    String problema;
    String descripcion;
    double costo;
    double total;
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

            numSerie = servicioDAO.generarNumSerie();
            GenerarNumSerie generarNumSerie = new GenerarNumSerie();
            nuevoNumSerie = generarNumSerie.generarNumeroSerieServicio(numSerie);
            
            request.setAttribute("numSerieServicio", nuevoNumSerie);
            request.setAttribute("numSerie", numSerie);

            //Buscar cliente
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

                //Buscar Producto
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
                idServicio = numSerie;

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

                // Recalcular el total
                for (int i = 0; i < listaDetalle.size(); i++) {
                    total += listaDetalle.get(i).getSubtotal();
                }

                request.setAttribute("total", total);
                request.setAttribute("listaDetalle", listaDetalle);
            } else if (action.equals("eliminarDetalle")) {
                
                //Crear Servicio y DetalleServicio
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
                numSerie = Integer.parseInt(request.getParameter("txtNumSerie"));
                problema = request.getParameter("txtProblema");
                descripcion = request.getParameter("areaDescripcion");
                costo = Double.parseDouble(request.getParameter("txtCosto"));
                total = Double.parseDouble(request.getParameter("txtTotal"));
                fechaRecepcion = request.getParameter("txtFechaRecepcion");
                fechaEntrega = request.getParameter("txtFechaEntrega");
                estado = request.getParameter("cbEstado");
                idCliente = Integer.parseInt(request.getParameter("txtIdCliente"));
                idEmpleado = (int) session.getAttribute("idEmpleado");

                servicio = new Servicio();

                servicio.setNumSerie(nuevoNumSerie);
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
                response.sendRedirect(request.getContextPath() + "/View/servicio.jsp");
                total = 0.0;
                return;
            } else if (action.equals("cancelar")) {
                listaDetalle.clear();
                response.sendRedirect(request.getContextPath() + "/View/servicio.jsp");
                total = 0.0;
                return;
            }
            request.getRequestDispatcher("View/nuevoServicio.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
