
package ModelDAO;

import Config.ConexionDB;
import Interface.CRUD;
import Model.Proveedor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProveedorDAO extends ConexionDB implements CRUD<Proveedor>{
    
    ConexionDB conexionDB = new ConexionDB();
    Connection connection;
    PreparedStatement ps;
    ResultSet rs;
    Proveedor proveedor = new Proveedor();

    @Override
    public List toList() {
        ArrayList<Proveedor> list = new ArrayList<>();
        String sql = "SELECT * FROM proveedor";
        
        try {
            connection = conexionDB.getConnection();
            
            ps = connection.prepareStatement(sql);
            
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Proveedor proveedor = new Proveedor();
                
                proveedor.setIdProveedor(rs.getInt("id_proveedor"));
                proveedor.setNombre(rs.getString("nombre"));
                proveedor.setDireccion(rs.getString("direccion"));
                proveedor.setNumero(rs.getString("numero"));
                proveedor.setCorreo(rs.getString("correo"));
                
                list.add(proveedor);
            }
        } catch (Exception e) {
            System.out.println("Proveedor - toList: " + e);
        }
        
        return list;
    }

    @Override
    public boolean create(Proveedor entidad) {
        String sql = "INSERT INTO proveedor (nombre, direccion, numero, correo)";
        
        try {
            Connection connection = getConnection();
            
            ps = connection.prepareStatement(sql);
            
            ps.setString(1, proveedor.getNombre());
            ps.setString(2, proveedor.getDireccion());
            ps.setString(3, proveedor.getNumero());
            ps.setString(4, proveedor.getCorreo());
            
            ps.execute();
            
            return true;
        } catch (Exception e) {
            System.out.println("Proveedor - create: " + e);
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
    public boolean update(Proveedor entidad) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(Proveedor entidad) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean search(Proveedor entidad) {
        String sql = "SELECT * FROM proveedor WHERE id_proveedor = ?";
        
        try {
            connection = conexionDB.getConnection();
            
            Proveedor proveedor = (Proveedor) entidad;
            
            ps = connection.prepareStatement(sql);
            
            ps.setInt(1, proveedor.getIdProveedor());
            
            rs = ps.executeQuery();
            
            if (rs.next()) {
                proveedor.setIdProveedor(Integer.parseInt(rs.getString("id_proveedor")));
                proveedor.setNombre(rs.getString("nombre"));
                proveedor.setDireccion(rs.getString("direccion"));
                proveedor.setNumero(rs.getString("numero"));
                proveedor.setCorreo(rs.getString("correo"));
                
                return true;
            }
            return false;
        } catch (Exception e) {
            System.out.println("Proveedor - search: " + e);
            return false;
        } finally {
            try {
                connection.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }
    
}
