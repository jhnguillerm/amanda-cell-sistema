
package Model;

public class Venta {
    
    private int idVenta;
    private String numSerie;
    private String fechaVenta;
    private double monto;
    private int idCliente;
    private int idEmpleado;

    public Venta() {
    }

    public Venta(int idVenta, String numSerie, String fechaVenta, double monto, int idCliente, int idEmpleado) {
        this.idVenta = idVenta;
        this.numSerie = numSerie;
        this.fechaVenta = fechaVenta;
        this.monto = monto;
        this.idCliente = idCliente;
        this.idEmpleado = idEmpleado;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public String getNumSerie() {
        return numSerie;
    }

    public void setNumSerie(String numSerie) {
        this.numSerie = numSerie;
    }

    public String getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(String fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }
    
}