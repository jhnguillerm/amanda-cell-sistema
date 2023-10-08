
package ModelDAO;

import Config.ConexionDB;
import Interface.CRUD;
import Model.Producto;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductoDAO implements CRUD{
    
    ConexionDB conexionDB = new ConexionDB();
    Connection connection;
    PreparedStatement ps;
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
                producto.setPrecio(rs.getDouble("precio"));
                producto.setStock(rs.getInt("stock"));
                producto.setTipo(rs.getString("tipo"));
                producto.setIdProveedor(rs.getInt("id_proveedor"));
                
                list.add(producto);
            }
        } catch (Exception e) {
        }
        
        return list;
    }

    @Override
    public Object list(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean add(Object entidad) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean edit(Object entidad) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
