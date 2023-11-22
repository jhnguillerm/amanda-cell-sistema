
package Config;

public class GenerarNumSerie {

    public String generarNumeroSerieVenta(int idVenta) {
        String formatoNumeroVenta = String.format("V%04d", idVenta);
        return formatoNumeroVenta;
    }

    public String generarNumeroSerieServicio(int idServicio) {
        String formatoNumeroServicio = String.format("S%04d", idServicio);
        return formatoNumeroServicio;
    }
}

