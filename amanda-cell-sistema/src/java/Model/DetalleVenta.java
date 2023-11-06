
package Model;

public class DetalleVenta {
    
    private int idDetalleVenta;
    private int cantidad;
    private double precioVenta;
    private double subtotal;
    private int idProducto;
    private int idVenta;
    
    private String nombreProducto;

    public DetalleVenta() {
    }

    public DetalleVenta(int idDetalleVenta, int cantidad, double precioVenta, double subtotal, int idProducto, int idVenta) {
        this.idDetalleVenta = idDetalleVenta;
        this.cantidad = cantidad;
        this.precioVenta = precioVenta;
        this.subtotal = subtotal;
        this.idProducto = idProducto;
        this.idVenta = idVenta;
    }

    public int getIdDetalleVenta() {
        return idDetalleVenta;
    }

    public void setIdDetalleVenta(int idDetalleVenta) {
        this.idDetalleVenta = idDetalleVenta;
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

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }
    
}
