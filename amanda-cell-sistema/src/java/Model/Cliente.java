
package Model;

import java.time.LocalDate;

public class Cliente {
    
    private int idCliente;
    private String nombres;
    private String dni;
    private String correo;
    private String telefono;
    private LocalDate fecha;

    public Cliente() {
    }

    public Cliente(int idCliente, String nombres, String dni, String correo, String telefono, LocalDate fecha) {
        this.idCliente = idCliente;
        this.nombres = nombres;
        this.dni = dni;
        this.correo = correo;
        this.telefono = telefono;
        this.fecha = fecha;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }
    
}
