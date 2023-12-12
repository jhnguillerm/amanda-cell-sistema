package ModelDAO;

import Config.ConexionDB;
import Model.Empleado;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

public class EmpleadoDAO extends ConexionDB {

    ConexionDB conexionDB = new ConexionDB();
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List toList() {
        List<Empleado> list = new ArrayList<>();
        String sql = "SELECT * FROM empleado";
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Empleado empleado = new Empleado();

                empleado.setIdEmpleado(rs.getInt("id_empleado"));
                empleado.setNombres(rs.getString("nombres"));
                empleado.setDni(rs.getString("dni"));
                empleado.setCorreo(rs.getString("correo"));
                empleado.setTelefono(rs.getString("telefono"));
                empleado.setDireccion(rs.getString("direccion"));
                empleado.setUsername(rs.getString("username"));
                empleado.setPass(rs.getString("pass"));
                empleado.setRol(rs.getString("rol"));
                empleado.setFoto(rs.getBinaryStream("foto"));

                list.add(empleado);
            }
        } catch (Exception e) {
            System.out.println("Empleado - tolist: " + e);
        }
        return list;
    }

    public void toListImagen(int idEmpleado, HttpServletResponse response) {
        String sql = "SELECT * FROM empleado WHERE id_empleado = " + idEmpleado;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");
        try {
            outputStream = response.getOutputStream();
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                inputStream = rs.getBinaryStream("foto");
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }
        } catch (Exception e) {
            System.out.println("Empleado - toListImagen: " + e);
        }
    }

    public void create(Empleado empleado) {
        if (!datosExisten(empleado.getCorreo(), "correo", 0)
                && !datosExisten(empleado.getDni(), "dni", 0)
                && !datosExisten(empleado.getUsername(), "username", 0)
                && !datosExisten(empleado.getTelefono(), "telefono", 0)) {
            String sql = "INSERT INTO empleado (nombres, dni, correo, telefono, direccion, username, pass, rol, foto) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try {
                connection = conexionDB.getConnection();
                ps = connection.prepareStatement(sql);

                ps.setString(1, empleado.getNombres());
                ps.setString(2, empleado.getDni());
                ps.setString(3, empleado.getCorreo());
                ps.setString(4, empleado.getTelefono());
                ps.setString(5, empleado.getDireccion());
                ps.setString(6, empleado.getUsername());
                String encryptedPassword = getMD5(empleado.getPass());
                ps.setString(7, encryptedPassword);
                ps.setString(8, empleado.getRol());
                ps.setBlob(9, empleado.getFoto());

                ps.executeUpdate();
            } catch (Exception e) {
                System.out.println("Empleado - create: " + e);
            } finally {
                closeResources();
            }
        } else {
            System.out.println("La información del empleado ya existe.");
        }
    }

    public void update(Empleado empleado) {
        if (!datosExisten(empleado.getCorreo(), "correo", empleado.getIdEmpleado())
                && !datosExisten(empleado.getDni(), "dni", empleado.getIdEmpleado())
                && !datosExisten(empleado.getUsername(), "username", empleado.getIdEmpleado())
                && !datosExisten(empleado.getTelefono(), "telefono", empleado.getIdEmpleado())) {
            String sql = "UPDATE empleado SET nombres = ?, dni = ?, correo = ?, telefono = ?, direccion = ?, username = ?, pass = ?, rol = ?, foto = ? WHERE id_empleado = ?";
            try {
                connection = conexionDB.getConnection();
                ps = connection.prepareStatement(sql);

                ps.setString(1, empleado.getNombres());
                ps.setString(2, empleado.getDni());
                ps.setString(3, empleado.getCorreo());
                ps.setString(4, empleado.getTelefono());
                ps.setString(5, empleado.getDireccion());
                ps.setString(6, empleado.getUsername());
                String encryptedPassword = getMD5(empleado.getPass());
                ps.setString(7, encryptedPassword);
                ps.setString(8, empleado.getRol());
                ps.setBlob(9, empleado.getFoto());
                ps.setInt(10, empleado.getIdEmpleado());

                ps.executeUpdate();
            } catch (Exception e) {
                System.out.println("Empleado - update: " + e);
            } finally {
                closeResources();
            }
        } else {
            System.out.println("La información del empleado ya existe para otro empleado.");
        }
    }

    public void delete(Empleado empleado) {
        String sql = "DELETE FROM empleado WHERE id_empleado = ?";
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, empleado.getIdEmpleado());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Empleado - delete: " + e);
        } finally {
            closeResources();
        }
    }

    public Empleado getEmpleadoById(int idEmpleado) {
        String sql = "SELECT * FROM empleado WHERE id_empleado = ?";
        Empleado empleado = null;
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, idEmpleado);
            rs = ps.executeQuery();
            if (rs.next()) {
                empleado = new Empleado();

                empleado.setIdEmpleado(Integer.parseInt(rs.getString("id_empleado")));
                empleado.setNombres(rs.getString("nombres"));
                empleado.setDni(rs.getString("dni"));
                empleado.setCorreo(rs.getString("correo"));
                empleado.setTelefono(rs.getString("telefono"));
                empleado.setDireccion(rs.getString("direccion"));
                empleado.setUsername(rs.getString("username"));
                empleado.setRol(rs.getString("rol"));
                empleado.setFoto(rs.getBinaryStream("foto"));
            }
        } catch (Exception e) {
            System.out.println("Empleado - getEmpleadoById: " + e);
        } finally {
            closeResources();
        }
        return empleado;
    }

    public Empleado login(String username, String pass) {
        String sql = "SELECT * FROM empleado WHERE username = ? AND pass = ?";

        Empleado empleado = new Empleado();

        try {
            connection = conexionDB.getConnection();

            ps = connection.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, pass);

            rs = ps.executeQuery();

            while (rs.next()) {
                empleado.setIdEmpleado(rs.getInt("id_empleado"));
                empleado.setUsername(rs.getString("username"));
                empleado.setCorreo(rs.getString("pass"));
                empleado.setNombres(rs.getString("nombres"));
                empleado.setRol(rs.getString("rol"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return empleado;
    }

    public String getMD5(String input) {
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("MD5");
            byte[] bytes = md.digest(input.getBytes());
            BigInteger numero = new BigInteger(1, bytes);
            String string = numero.toString(16);
            while (string.length() < 32) {
                string = "0" + string;
            }
            return string;
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (Exception e) {
            System.out.println("Error al cerrar recursos: " + e);
        }
    }

    public boolean search(Empleado entidad) {
        String sql = "SELECT * FROM empleado WHERE id_empleado = ?";
        try {
            connection = conexionDB.getConnection();
            Empleado empleado = (Empleado) entidad;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, empleado.getIdEmpleado());
            rs = ps.executeQuery();
            if (rs.next()) {
                empleado.setIdEmpleado(rs.getInt("id_empleado"));
                empleado.setNombres(rs.getString("nombres"));
                empleado.setDni(rs.getString("dni"));
                empleado.setCorreo(rs.getString("correo"));
                empleado.setTelefono(rs.getString("telefono"));
                return true;
            }
            return false;
        } catch (Exception e) {
            System.out.println("Empleado - search: " + e);
            return false;
        } finally {
            try {
                connection.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }

    public boolean datosExisten(String value, String columnName, int idEmpleado) {
        String sql = "SELECT COUNT(*) FROM empleado WHERE " + columnName + " = ? AND id_empleado != ?";
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, value);
            ps.setInt(2, idEmpleado);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            System.out.println("Error al verificar la duplicación de información del empleado: " + e);
        } finally {
            closeResources();
        }
        return false;
    }

}
