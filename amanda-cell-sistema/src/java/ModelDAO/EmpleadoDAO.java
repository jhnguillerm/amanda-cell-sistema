package ModelDAO;

import Config.ConexionDB;
import Interface.CRUD;
import Model.Empleado;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO extends ConexionDB implements CRUD<Empleado> {

    ConexionDB conexionDB = new ConexionDB();
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    @Override
    public List toList() {
        ArrayList<Empleado> list = new ArrayList<>();
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
                empleado.setUsername(rs.getString("username"));
                empleado.setPass(rs.getString("pass"));

                list.add(empleado);
            }
        } catch (Exception e) {
            System.out.println("Empleado - tolist: " + e);
        }
        return list;
    }

    @Override
    public boolean create(Empleado entidad) {
        String sql = "INSERT INTO empleado (nombres, dni, correo, telefono, username, pass) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            connection = conexionDB.getConnection();
            Empleado empleado = (Empleado) entidad;
            ps = connection.prepareStatement(sql);

            ps.setString(1, empleado.getNombres());
            ps.setString(2, empleado.getDni());
            ps.setString(3, empleado.getCorreo());
            ps.setString(4, empleado.getTelefono());
            ps.setString(5, empleado.getUsername());
            String encryptedPassword = getMD5(empleado.getPass());
            ps.setString(6, encryptedPassword);

            ps.execute();

            return true;
        } catch (Exception e) {
            System.out.println("Empleado - create: " + e);
            return false;
        } finally {
            try {
                connection.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }

    @Override
    public boolean update(Empleado entidad) {
        String sql = "  UPDATE empleado SET nombres = ?, dni = ?, correo = ?, telefono = ?, username = ?, pass = ? WHERE id_empleado = ?";
        try {
            connection = conexionDB.getConnection();
            Empleado empleado = (Empleado) entidad;
            ps = connection.prepareStatement(sql);

            ps.setString(1, empleado.getNombres());
            ps.setString(2, empleado.getDni());
            ps.setString(3, empleado.getCorreo());
            ps.setString(4, empleado.getTelefono());
            ps.setString(5, empleado.getUsername());
            String encryptedPassword = getMD5(empleado.getPass());
            ps.setString(6, encryptedPassword);
            ps.setInt(7, empleado.getIdEmpleado());

            ps.execute();

            return true;
        } catch (Exception e) {
            System.out.println("Empleado - update: " + e);
            return false;
        } finally {
            try {
                connection.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }

    @Override
    public boolean delete(Empleado entidad) {
        String sql = "DELETE FROM empleado WHERE id_empleado = ?";
        try {
            connection = conexionDB.getConnection();
            Empleado empleado = (Empleado) entidad;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, empleado.getIdEmpleado());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println("Empleado - delete: " + e);
            return false;
        } finally {
            try {
                connection.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }

    @Override
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
                empleado.setUsername(rs.getString("username"));
                empleado.setCorreo(rs.getString("pass"));
                empleado.setNombres(rs.getString("nombres"));
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

}
