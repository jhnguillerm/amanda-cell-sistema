package ModelDAO;

import Config.ConexionDB;
import Interface.CRUD;
import Model.Servicio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ServicioDAO extends ConexionDB implements CRUD<Servicio> {

    ConexionDB conexionDB = new ConexionDB();
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    @Override
    public List toList() {
        ArrayList<Servicio> list = new ArrayList<>();
        String sql = "SELECT * FROM servicio";
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Servicio servicio = new Servicio();
                servicio.setIdServicio(rs.getInt("id_servicio"));
                servicio.setNumSerie(rs.getString("num_serie"));
                servicio.setProblema(rs.getString("problema"));
                servicio.setDescripcion(rs.getString("descripcion"));
                servicio.setCosto(rs.getDouble("costo"));
                servicio.setTotal(rs.getDouble("total"));
                servicio.setFechaRecepcion(rs.getString("fecha_recepcion"));
                servicio.setFechaEntrega(rs.getString("fecha_entrega"));
                servicio.setEstado(rs.getString("estado"));
                servicio.setIdCliente(rs.getInt("id_cliente"));
                servicio.setIdEmpleado(rs.getInt("id_empleado"));
                list.add(servicio);
            }
        } catch (Exception e) {
            System.out.println("Servicio - tolist: " + e);
        }
        return list;
    }

    @Override
    public boolean create(Servicio entidad) {
        String sql = "INSERT INTO servicio (num_serie, problema, descripcion, costo, total, fecha_recepcion, fecha_entrega, estado, id_cliente, id_empleado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            connection = conexionDB.getConnection();
            Servicio servicio = (Servicio) entidad;
            ps = connection.prepareStatement(sql);

            ps.setString(1, servicio.getNumSerie());
            ps.setString(2, servicio.getProblema());
            ps.setString(3, servicio.getDescripcion());
            ps.setDouble(4, servicio.getCosto());
            ps.setDouble(5, servicio.getTotal());
            ps.setString(6, servicio.getFechaRecepcion());
            ps.setString(7, servicio.getFechaEntrega());
            ps.setString(8, servicio.getEstado());
            ps.setInt(9, servicio.getIdCliente());
            ps.setInt(10, servicio.getIdEmpleado());

            ps.execute();

            return true;
        } catch (Exception e) {
            System.out.println("Servicio - create: " + e);
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
    public boolean update(Servicio entidad) {
        String sql = "UPDETE servicio SET num_serie = ?, problema = ?, descripcion = ?, costo = ?, total = ?, fecha_recepcion = ?, fecha_entrega = ?, estado = ?, id_cliente = ?, id_empleado = ? WHERE id_servicio = ?";
        try {
            connection = conexionDB.getConnection();
            Servicio servicio = (Servicio) entidad;
            ps = connection.prepareStatement(sql);

            ps.setString(1, servicio.getNumSerie());
            ps.setString(2, servicio.getProblema());
            ps.setString(3, servicio.getDescripcion());
            ps.setDouble(4, servicio.getCosto());
            ps.setDouble(5, servicio.getTotal());
            ps.setString(6, servicio.getFechaRecepcion());
            ps.setString(7, servicio.getFechaEntrega());
            ps.setString(8, servicio.getEstado());
            ps.setInt(9, servicio.getIdCliente());
            ps.setInt(10, servicio.getIdEmpleado());
            ps.setInt(11, servicio.getIdServicio());

            ps.execute();

            return true;
        } catch (Exception e) {
            System.out.println("Servicio - update: " + e);
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
    public boolean delete(Servicio entidad) {
        String sql = "DELETE FROM servicio WHERE id_servicio = ?";
        try {
            connection = conexionDB.getConnection();
            Servicio servicio = (Servicio) entidad;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, servicio.getIdServicio());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println("Servicio - delete: " + e);
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
    public boolean search(Servicio entidad) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int cantidadServicios() {
        int cantidad = 0;
        String sql = "SELECT COUNT(*) AS cantidad_servicios FROM servicio";
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                cantidad = rs.getInt("cantidad_servicios");
            }
        } catch (Exception e) {
            System.out.println("Servicio - cantidadServicios: " + e);
        } finally {
            try {
                connection.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return cantidad;
    }

    public int generarSiguienteId() {
        int siguienteId = 0;
        String sql = "SELECT MAX(CAST(SUBSTRING(num_serie, 2) AS UNSIGNED)) AS max_num_serie FROM servicio";
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                siguienteId = rs.getInt("max_num_serie") + 1;
            }
        } catch (Exception e) {
            System.out.println("ServicioDAO - generarSiguienteId: " + e);
        } finally {
            closeResources();
        }
        return siguienteId;
    }

    public String generarNumSerie() {
        String numSerie = null;
        int siguienteId = generarSiguienteId();
        if (siguienteId > 0) {
            numSerie = String.format("S%04d", siguienteId);
        }
        return numSerie;
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

}
