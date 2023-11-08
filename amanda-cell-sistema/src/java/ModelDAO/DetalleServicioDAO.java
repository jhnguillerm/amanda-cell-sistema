package ModelDAO;

import Config.ConexionDB;
import Interface.CRUD;
import Model.DetalleServicio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DetalleServicioDAO extends ConexionDB implements CRUD<DetalleServicio> {

    ConexionDB conexionDB = new ConexionDB();
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    @Override
    public List toList() {
        ArrayList<DetalleServicio> list = new ArrayList<>();
        String sql = "SELECT * FROM detalle_servicio";
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetalleServicio detalleServicio = new DetalleServicio();
                detalleServicio.setIdDetalleServicio(rs.getInt("id_detalle_servicio"));
                detalleServicio.setCantidad(rs.getInt("cantidad"));
                detalleServicio.setPrecioVenta(rs.getDouble("precio_venta"));
                detalleServicio.setSubtotal(rs.getDouble("subtotal"));
                detalleServicio.setIdProducto(rs.getInt("id_producto"));
                detalleServicio.setIdServicio(rs.getInt("id_servicio"));
                list.add(detalleServicio);
            }
        } catch (Exception e) {
            System.out.println("DetalleServicio - tolist: " + e);
        }
        return list;
    }

    @Override
    public boolean create(DetalleServicio entidad) {
        String sql = "INSERT INTO detalle_servicio (cantidad, precio_venta, subtotal, id_producto, id_servicio) VALUES (?, ?, ?, ?, ?)";
        try {
            connection = conexionDB.getConnection();
            DetalleServicio detalleServicio = (DetalleServicio) entidad;
            ps = connection.prepareStatement(sql);

            ps.setInt(1, detalleServicio.getCantidad());
            ps.setDouble(2, detalleServicio.getPrecioVenta());
            ps.setDouble(3, detalleServicio.getSubtotal());
            ps.setInt(4, detalleServicio.getIdProducto());
            ps.setInt(5, detalleServicio.getIdServicio());

            ps.execute();

            return true;
        } catch (Exception e) {
            System.out.println("DetalleServicio - create: " + e);
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
    public boolean update(DetalleServicio entidad) {
        String sql = "UPDATE detalle_servicio SET cantidad = ?, precio_venta = ?, subtotal = ?, id_producto = ?, id_servicio = ? WHERE id_detalle_servicio = ?";
        try {
            connection = conexionDB.getConnection();
            DetalleServicio detalleServicio = (DetalleServicio) entidad;
            ps = connection.prepareStatement(sql);

            ps.setInt(1, detalleServicio.getCantidad());
            ps.setDouble(2, detalleServicio.getPrecioVenta());
            ps.setDouble(3, detalleServicio.getSubtotal());
            ps.setInt(4, detalleServicio.getIdProducto());
            ps.setInt(5, detalleServicio.getIdServicio());
            ps.setInt(6, detalleServicio.getIdDetalleServicio());

            ps.execute();

            return true;
        } catch (Exception e) {
            System.out.println("DetalleServicio - update: " + e);
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
    public boolean delete(DetalleServicio entidad) {
        String sql = "DELETE FROM detalle_servicio WHERE id_detalle_servicio = ?";
        try {
            connection = conexionDB.getConnection();
            DetalleServicio detalleServicio = (DetalleServicio) entidad;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, detalleServicio.getIdDetalleServicio());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println("DetalleServicio - delete: " + e);
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
    public boolean search(DetalleServicio entidad) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public List<DetalleServicio> obtenerDetallesServicioPorServicio(int idServicio) {
        ArrayList<DetalleServicio> list = new ArrayList<>();
        String sql = "SELECT * FROM detalle_servicio WHERE id_servicio = ?";
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, idServicio);
            rs = ps.executeQuery();

            while (rs.next()) {
                DetalleServicio detalleServicio = new DetalleServicio();
                detalleServicio.setIdDetalleServicio(rs.getInt("id_detalle_servicio"));
                detalleServicio.setCantidad(rs.getInt("cantidad"));
                detalleServicio.setPrecioVenta(rs.getDouble("precio_venta"));
                detalleServicio.setSubtotal(rs.getDouble("subtotal"));
                detalleServicio.setIdProducto(rs.getInt("id_producto"));
                detalleServicio.setIdServicio(rs.getInt("id_servicio"));
                list.add(detalleServicio);
            }
        } catch (Exception e) {
            System.out.println("DetalleServicio - obtenerDetallesServicioPorServicio: " + e);
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
