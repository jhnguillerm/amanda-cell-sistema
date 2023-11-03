
package Model;

public class Empleado {
    
    private int idEmpleado;
    private String nombres;
    private String dni;
    private String correo;
    private String telefono;
    private String username;
    private String pass;

    public Empleado() {
    }

    public Empleado(int idEmpleado, String nombres, String dni, String correo, String telefono, String username, String pass) {
        this.idEmpleado = idEmpleado;
        this.nombres = nombres;
        this.dni = dni;
        this.correo = correo;
        this.telefono = telefono;
        this.username = username;
        this.pass = pass;
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
    
}
