package ModelDAO;

import Config.ConexionDB;
import Interface.CRUD;
import Model.Producto;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductoDAO extends ConexionDB implements CRUD<Producto> {

    ConexionDB conexionDB = new ConexionDB();
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    Producto producto = new Producto();

    public ProductoDAO() {
    }

    @Override
    public List toList() {
        ArrayList<Producto> list = new ArrayList<>();
        String sql = "SELECT * FROM producto";

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
    public boolean create(Producto entidad) {
        String sql = "INSERT INTO producto (nombre, descripcion, precio_compra, precio_venta, stock, tipo, id_proveedor) VALUES (?, ?, ?, ?, ?, ?, ?)";

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
    public boolean update(Producto entidad) {
        String sql = "UPDATE producto SET nombre = ?, descripcion = ?, precio_compra = ?, precio_venta = ?, stock = ?, tipo = ?, id_proveedor = ? WHERE id_producto = ?";

        try {
            connection = conexionDB.getConnection();

            Producto producto = (Producto) entidad;

            ps = connection.prepareStatement(sql);

            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDescripcion());
            ps.setDouble(3, producto.getPrecioCompra());
            ps.setDouble(4, producto.getPrecioVenta());
            ps.setInt(5, producto.getStock());
            ps.setString(6, producto.getTipo());
            ps.setInt(7, producto.getIdProveedor());
            ps.setInt(8, producto.getIdProducto());

            ps.execute();

            return true;
        } catch (Exception e) {
            System.out.println("Producto - update: " + e);
            return false;
        } finally {
            try {
                connection.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }

    public boolean updateStock(int idProducto, int stock) {
        String sql = "UPDATE producto SET stock = ? WHERE id_producto = ?";

        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);

            ps.setInt(1, stock);
            ps.setInt(2, idProducto);

            ps.executeUpdate();

            return true;
        } catch (Exception e) {
            System.out.println("Producto - updateStock: " + e);
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
    public boolean delete(Producto entidad) {
        String sql = "DELETE FROM producto WHERE id_producto = ?";

        try {
            connection = conexionDB.getConnection();

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
    public boolean search(Producto entidad) {
        String sql = "SELECT * FROM producto WHERE id_producto = ?";
        try {
            connection = conexionDB.getConnection();
            Producto producto = (Producto) entidad;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, producto.getIdProducto());
            rs = ps.executeQuery();

            if (rs.next()) {
                producto.setIdProducto(Integer.parseInt(rs.getString("id_producto")));
                producto.setNombre(rs.getString("nombre"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setPrecioCompra(Double.parseDouble(rs.getString("precio_compra")));
                producto.setPrecioVenta(Double.parseDouble(rs.getString("precio_venta")));
                producto.setStock(Integer.parseInt(rs.getString("stock")));
                producto.setTipo(rs.getString("tipo"));
                producto.setIdProveedor(Integer.parseInt(rs.getString("id_proveedor")));

                return true;
            }
            return false;
        } catch (Exception e) {
            System.out.println("Producto - search: " + e);
            return false;
        } finally {
            try {
                connection.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }

    public int cantidadProductos() {
        int cantidad = 0;
        String sql = "SELECT COUNT(*) AS cantidad_productos FROM producto";
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                cantidad = rs.getInt("cantidad_productos");
            }
        } catch (Exception e) {
            System.out.println("Producto - cantidadProductos: " + e);
        } finally {
            try {
                connection.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return cantidad;
    }

    public int totalStock() {
        int totalStock = 0;
        String sql = "SELECT SUM(stock) AS total_stock FROM producto";
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                totalStock = rs.getInt("total_stock");
            }
        } catch (Exception e) {
            System.out.println("Producto - totalStock: " + e);
        } finally {
            try {
                connection.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return totalStock;
    }
    
    public double totalPrecioCompra() {
        double total = 0.0;
        String sql = "SELECT SUM(precio_compra) AS total_compra FROM producto";
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total_compra");
            }
        } catch (Exception e) {
            System.out.println("Producto - totalPrecioCompra: " + e);
        } finally {
            try {
                connection.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return total;
    }


}
