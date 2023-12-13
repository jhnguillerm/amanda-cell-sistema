
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
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    @Override
    public List toList() {
        List<Proveedor> list = new ArrayList<>();
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
                proveedor.setRuc(rs.getString("ruc"));
                
                list.add(proveedor);
            }
        } catch (Exception e) {
            System.out.println("Proveedor - toList: " + e);
        }
        
        return list;
    }

    @Override
    public boolean create(Proveedor entidad) {
        String sql = "INSERT INTO proveedor (nombre, direccion, numero, correo, ruc) VALUES (?, ?, ?, ?, ?)";
        
        try {
            connection = conexionDB.getConnection();
            
            Proveedor proveedor = (Proveedor) entidad;
            
            ps = connection.prepareStatement(sql);
            
            ps.setString(1, proveedor.getNombre());
            ps.setString(2, proveedor.getDireccion());
            ps.setString(3, proveedor.getNumero());
            ps.setString(4, proveedor.getCorreo());
            ps.setString(5, proveedor.getRuc());
            
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
        String sql = "UPDATE proveedor SET nombre = ?, direccion = ?, numero = ?, correo = ?, ruc = ? WHERE id_proveedor = ?";
        
        try {
            connection = conexionDB.getConnection();
            
            Proveedor proveedor = (Proveedor) entidad;
            
            ps = connection.prepareStatement(sql);
            
            ps.setString(1, proveedor.getNombre());
            ps.setString(2, proveedor.getDireccion());
            ps.setString(3, proveedor.getNumero());
            ps.setString(4, proveedor.getCorreo());
            ps.setString(5, proveedor.getRuc());
            ps.setInt(6, proveedor.getIdProveedor());
            
            ps.execute();
            
            return true;
        } catch (Exception e) {
            System.out.println("Proveedor - update: " + e);
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
    public boolean delete(Proveedor entidad) {
        String sql = "DELETE FROM proveedor WHERE id_proveedor = ?";
        
        try {
            connection = conexionDB.getConnection();
            
            Proveedor proveedor = (Proveedor) entidad;
            
            ps = connection.prepareStatement(sql);
            
            ps.setInt(1, proveedor.getIdProveedor());
            
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
                proveedor.setRuc(rs.getString("ruc"));
                
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
