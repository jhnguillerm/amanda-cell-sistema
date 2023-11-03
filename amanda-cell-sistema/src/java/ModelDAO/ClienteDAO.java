package ModelDAO;

import Config.ConexionDB;
import Interface.CRUD;
import Model.Cliente;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ClienteDAO extends ConexionDB implements  CRUD<Cliente> {
    
    ConexionDB conexionDB = new ConexionDB();
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    @Override
    public List toList() {
        ArrayList<Cliente> list = new ArrayList<>();
        String sql = "SELECT * FROM cliente";
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                
                cliente.setIdCliente(rs.getInt("id_cliente"));
                cliente.setNombres(rs.getString("nombres"));
                cliente.setDni(rs.getString("dni"));
                cliente.setCorreo(rs.getString("correo"));
                cliente.setTelefono(rs.getString("telefono"));
                
                list.add(cliente);
            }
        } catch (Exception e) {
            System.out.println("Cliente - tolist: " + e);
        }
        return list;
    }

    @Override
    public boolean create(Cliente entidad) {
        String sql = "INSERT INTO cliente (nombres, dni, correo, telefono) VALUES (?, ?, ?, ?)";
        try {
            connection = conexionDB.getConnection();
            Cliente cliente = (Cliente) entidad;
            ps = connection.prepareStatement(sql);
            
            ps.setString(1, cliente.getNombres());
            ps.setString(2, cliente.getDni());
            ps.setString(3, cliente.getCorreo());
            ps.setString(4, cliente.getTelefono());
            
            ps.execute();
            
            return true;
        } catch (Exception e) {
            System.out.println("Cliente - create: " + e);
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
    public boolean update(Cliente entidad) {
        String sql = "  UPDATE cliente SET nombres = ?, dni = ?, correo = ?, telefono = ? WHERE id_cliente = ?";
        try {
            connection = conexionDB.getConnection();
            Cliente cliente = (Cliente) entidad;
            ps = connection.prepareStatement(sql);
            
            ps.setString(1, cliente.getNombres());
            ps.setString(2, cliente.getDni());
            ps.setString(3, cliente.getCorreo());
            ps.setString(4, cliente.getTelefono());
            ps.setInt(5, cliente.getIdCliente());
            
            ps.execute();
            
            return true;
        } catch (Exception e) {
            System.out.println("Cliente - update: " + e);
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
    public boolean delete(Cliente entidad) {
        String sql = "DELETE FROM cliente WHERE id_cliente = ?";
        try {
            connection = conexionDB.getConnection();
            Cliente cliente = (Cliente) entidad;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, cliente.getIdCliente());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println("Cliente - delete: " + e);
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
    public boolean search(Cliente entidad) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
