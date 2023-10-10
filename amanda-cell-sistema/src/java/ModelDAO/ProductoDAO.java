
package ModelDAO;

import Config.ConexionDB;
import Interface.CRUD;
import Model.Producto;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductoDAO extends ConexionDB implements CRUD{
    
    ConexionDB conexionDB = new ConexionDB();
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs;
    Producto producto = new Producto();

    @Override
    public List toList() {
        ArrayList<Producto> list = new ArrayList<>();
        String sql = "SELECT * FROM Producto";
        
        try {
            connection = conexionDB.getConnection();
            
            ps = connection.prepareStatement(sql);
            
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Producto producto = new Producto();
                
                producto.setIdProducto(rs.getInt("id_producto"));
                producto.setNombre(rs.getString("nombre"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setPrecioCompra(rs.getDouble("precio_compra"));
                producto.setPrecioVenta(rs.getDouble("precio_venta"));
                producto.setStock(rs.getInt("stock"));
                producto.setTipo(rs.getString("tipo"));
                producto.setIdProveedor(rs.getInt("id_proveedor"));
                
                list.add(producto);
            }
        } catch (Exception e) {
            System.out.println("Producto - toList: " + e);
        }
        
        return list;
    }

    @Override
    public Object list(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean create(Object entidad) {
        String sql = "INSERT INTO Producto (nombre, descripcion, precio_compra, precio_venta, stock, tipo, id_proveedor) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        try {
            Connection connection = conexionDB.getConnection();
            
            Producto producto = (Producto) entidad;
            
            ps = connection.prepareStatement(sql);
            
            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDescripcion());
            ps.setDouble(3, producto.getPrecioCompra());
            ps.setDouble(4, producto.getPrecioVenta());
            ps.setInt(5, producto.getStock());
            ps.setString(6, producto.getTipo());
            ps.setInt(7, producto.getIdProveedor());
            
            ps.execute();
            
            System.out.println("Ser agregó con exito.");
            return true;
        } catch (Exception e) {
            System.out.println("Producto - create: " + e);
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
    public boolean update(Object entidad) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(Object entidad) {
        String sql = "DELETE FROM Producto WHERE id_producto = ?";
        
        try {
            connection = getConnection();
            
            Producto producto = (Producto) entidad;
            
            ps = connection.prepareStatement(sql);
            
            ps.setInt(1, producto.getIdProducto());
            
            ps.execute();
            
            return true;
        } catch (Exception e) {
            System.out.println("Producto - delete: " + e);
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
    public boolean search(Object entidad) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
