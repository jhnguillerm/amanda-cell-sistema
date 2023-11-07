package ModelDAO;

import Config.ConexionDB;
import Interface.CRUD;
import Model.DetalleVenta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DetalleVentaDAO extends ConexionDB implements CRUD<DetalleVenta> {

    ConexionDB conexionDB = new ConexionDB();
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    @Override
    public List toList() {
        ArrayList<DetalleVenta> list = new ArrayList<>();
        String sql = "SELECT * FROM detalle_venta";
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetalleVenta detalleVenta = new DetalleVenta();
                detalleVenta.setIdDetalleVenta(rs.getInt("id_detalle_venta"));
                detalleVenta.setCantidad(rs.getInt("cantidad"));
                detalleVenta.setPrecioVenta(rs.getDouble("precio_venta"));
                detalleVenta.setSubtotal(rs.getDouble("subtotal"));
                detalleVenta.setIdProducto(rs.getInt("id_producto"));
                detalleVenta.setIdVenta(rs.getInt("id_venta"));
                list.add(detalleVenta);
            }
        } catch (Exception e) {
            System.out.println("DetalleVenta - tolist: " + e);
        }
        return list;
    }

    @Override
    public boolean create(DetalleVenta entidad) {
        String sql = "INSERT INTO detalle_venta (cantidad, precio_venta, subtotal, id_producto, id_venta) VALUES (?, ?, ?, ?, ?)";
        try {
            connection = conexionDB.getConnection();
            DetalleVenta detalleVenta = (DetalleVenta) entidad;
            ps = connection.prepareStatement(sql);

            ps.setInt(1, detalleVenta.getCantidad());
            ps.setDouble(2, detalleVenta.getPrecioVenta());
            ps.setDouble(3, detalleVenta.getSubtotal());
            ps.setInt(4, detalleVenta.getIdProducto());
            ps.setInt(5, detalleVenta.getIdVenta());

            ps.execute();

            return true;
        } catch (Exception e) {
            System.out.println("DetalleVenta - create: " + e);
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
    public boolean update(DetalleVenta entidad) {
        String sql = "UPDATE detalle_venta SET cantidad = ?, precio_venta = ?, subtotal = ?, id_producto = ?, id_venta = ? WHERE id_detalle_venta = ?";
        try {
            connection = conexionDB.getConnection();
            DetalleVenta detalleVenta = (DetalleVenta) entidad;
            ps = connection.prepareStatement(sql);

            ps.setInt(1, detalleVenta.getCantidad());
            ps.setDouble(2, detalleVenta.getPrecioVenta());
            ps.setDouble(3, detalleVenta.getSubtotal());
            ps.setInt(4, detalleVenta.getIdProducto());
            ps.setInt(5, detalleVenta.getIdVenta());
            ps.setInt(6, detalleVenta.getIdDetalleVenta());

            ps.execute();

            return true;
        } catch (Exception e) {
            System.out.println("DetalleVenta - update: " + e);
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
    public boolean delete(DetalleVenta entidad) {
        String sql = "DELETE FROM detalle_venta WHERE id_detalle_venta = ?";
        try {
            connection = conexionDB.getConnection();
            DetalleVenta detalleVenta = (DetalleVenta) entidad;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, detalleVenta.getIdDetalleVenta());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println("DetalleVenta - delete: " + e);
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
    public boolean search(DetalleVenta entidad) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public List<DetalleVenta> obtenerDetallesVentaPorVenta(int idVenta) {
        ArrayList<DetalleVenta> list = new ArrayList<>();
        String sql = "SELECT * FROM detalle_venta WHERE id_venta = ?";

        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, idVenta);
            rs = ps.executeQuery();

            while (rs.next()) {
                DetalleVenta detalleVenta = new DetalleVenta();
                detalleVenta.setIdDetalleVenta(rs.getInt("id_detalle_venta"));
                detalleVenta.setCantidad(rs.getInt("cantidad"));
                detalleVenta.setPrecioVenta(rs.getDouble("precio_venta"));
                detalleVenta.setSubtotal(rs.getDouble("subtotal"));
                detalleVenta.setIdProducto(rs.getInt("id_producto"));
                detalleVenta.setIdVenta(rs.getInt("id_venta"));
                list.add(detalleVenta);
            }
        } catch (Exception e) {
            System.out.println("DetalleVenta - obtenerDetallesVentaPorVenta: " + e);
        } finally {
            try {
                connection.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }

        return list;
    }

}
