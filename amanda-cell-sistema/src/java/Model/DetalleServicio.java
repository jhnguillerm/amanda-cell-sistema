package Model;

public class DetalleServicio {
    
    private int idDetalleServicio;
    private int cantidad;
    private double precioVenta;
    private double subtotal;
    private int idProducto;
    private int idServicio;
    
    private String nombreProducto;

    public DetalleServicio() {
    }

    public DetalleServicio(int idDetalleServicio, int cantidad, double precioVenta, double subtotal, int idProducto, int idServicio, String nombreProducto) {
        this.idDetalleServicio = idDetalleServicio;
        this.cantidad = cantidad;
        this.precioVenta = precioVenta;
        this.subtotal = subtotal;
        this.idProducto = idProducto;
        this.idServicio = idServicio;
        this.nombreProducto = nombreProducto;
    }

    public int getIdDetalleServicio() {
        return idDetalleServicio;
    }

    public void setIdDetalleServicio(int idDetalleServicio) {
        this.idDetalleServicio = idDetalleServicio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(double precioVenta) {
        this.precioVenta = precioVenta;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }
    
}
