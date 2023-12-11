package ModelDAO;

import Config.ConexionDB;
import Interface.CRUD;
import Model.Venta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class VentaDAO extends ConexionDB implements CRUD<Venta> {

    ConexionDB conexionDB = new ConexionDB();
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    @Override
    public List toList() {
        ArrayList<Venta> list = new ArrayList<>();
        String sql = "SELECT * FROM venta";
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Venta venta = new Venta();
                venta.setIdVenta(rs.getInt("id_venta"));
                venta.setNumSerie(rs.getString("num_serie"));
                venta.setFechaVenta(rs.getString("fecha_venta"));
                venta.setMonto(rs.getDouble("monto"));
                venta.setIdCliente(rs.getInt("id_cliente"));
                venta.setIdEmpleado(rs.getInt("id_empleado"));
                list.add(venta);
            }
        } catch (Exception e) {
            System.out.println("Venta - tolist: " + e);
        }
        return list;
    }

    @Override
    public boolean create(Venta entidad) {
        String sql = "INSERT INTO venta (num_serie, fecha_venta, monto, id_cliente, id_empleado) VALUES (?, ?, ?, ?, ?)";
        try {
            connection = conexionDB.getConnection();
            Venta venta = (Venta) entidad;
            ps = connection.prepareStatement(sql);

            ps.setString(1, venta.getNumSerie());
            ps.setString(2, venta.getFechaVenta());
            ps.setDouble(3, venta.getMonto());
            ps.setInt(4, venta.getIdCliente());
            ps.setInt(5, venta.getIdEmpleado());

            ps.execute();

            return true;
        } catch (Exception e) {
            System.out.println("Venta - create: " + e);
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
    public boolean update(Venta entidad) {
        String sql = "UPDATE venta SET num_serie = ?, fecha_venta = ?, monto  = ?, id_cliente = ? , id_empleado = ? WHERE id_venta = ?";
        try {
            connection = conexionDB.getConnection();
            Venta venta = (Venta) entidad;
            ps = connection.prepareStatement(sql);

            ps.setString(1, venta.getNumSerie());
            ps.setString(2, venta.getFechaVenta());
            ps.setDouble(3, venta.getMonto());
            ps.setInt(4, venta.getIdCliente());
            ps.setInt(5, venta.getIdEmpleado());
            ps.setInt(6, venta.getIdVenta());

            ps.execute();

            return true;
        } catch (Exception e) {
            System.out.println("Venta - update: " + e);
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
    public boolean delete(Venta entidad) {
        String sql = "DELETE FROM venta WHERE id_venta = ?";
        try {
            connection = conexionDB.getConnection();
            Venta venta = (Venta) entidad;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, venta.getIdVenta());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println("Venta - delete: " + e);
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
    public boolean search(Venta entidad) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public int cantidadVentas() {
        int cantidad = 0;
        String sql = "SELECT COUNT(*) AS cantidad_ventas FROM venta";
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                cantidad = rs.getInt("cantidad_ventas");
            }
        } catch (Exception e) {
            System.out.println("Venta - cantidadVentas: " + e);
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
        String sql = "SELECT MAX(CAST(SUBSTRING(num_serie, 2) AS UNSIGNED)) AS max_num_serie FROM venta";
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                siguienteId = rs.getInt("max_num_serie") + 1;
            }
        } catch (Exception e) {
            System.out.println("Venta - generarSiguienteId: " + e);
        } finally {
            closeResources();
        }
        return siguienteId;
    }

    public String generarNumSerie() {
        String numSerie = null;
        int siguienteId = generarSiguienteId();
        if (siguienteId > 0) {
            numSerie = String.format("V%04d", siguienteId);
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
