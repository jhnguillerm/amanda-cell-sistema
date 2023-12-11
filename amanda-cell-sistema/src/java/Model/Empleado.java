package Model;

import java.io.InputStream;

public class Empleado {
    
    private int idEmpleado;
    private String nombres;
    private String dni;
    private String correo;
    private String telefono;
    private String direccion;
    private String username;
    private String pass;
    private String rol;
    private InputStream foto;

    public Empleado() {
    }

    public Empleado(int idEmpleado, String nombres, String dni, String correo, String telefono, String direccion, String username, String pass, String rol, InputStream foto) {
        this.idEmpleado = idEmpleado;
        this.nombres = nombres;
        this.dni = dni;
        this.correo = correo;
        this.telefono = telefono;
        this.direccion = direccion;
        this.username = username;
        this.pass = pass;
        this.rol = rol;
        this.foto = foto;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
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

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public InputStream getFoto() {
        return foto;
    }

    public void setFoto(InputStream foto) {
        this.foto = foto;
    }
    
}
