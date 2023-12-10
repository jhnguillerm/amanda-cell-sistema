package ModelDAO;

import Config.ConexionDB;
import Model.Producto;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.http.HttpServletResponse;

public class ProductoDAO extends ConexionDB {

    ConexionDB conexionDB = new ConexionDB();
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List toList() {
        List<Producto> list = new ArrayList<>();
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
                producto.setFecha(rs.getObject("fecha", LocalDate.class));
                producto.setImagen(rs.getBinaryStream("imagen"));
                producto.setIdProveedor(rs.getInt("id_proveedor"));

                list.add(producto);
            }
        } catch (Exception e) {
            System.out.println("Producto - toList: " + e);
        }
        return list;
    }

    public void toListImagen(int idProducto, HttpServletResponse response) {
        String sql = "SELECT * FROM producto WHERE id_producto = " + idProducto;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");
        try {
            outputStream = response.getOutputStream();
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                inputStream = rs.getBinaryStream("imagen");
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }
        } catch (Exception e) {
            System.out.println("Producto Imagen - toListImagen: " + e);
        }
    }

    public void create(Producto producto) {
        String sql = "INSERT INTO producto (nombre, descripcion, precio_compra, precio_venta, stock, tipo, fecha, imagen, id_proveedor) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);

            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDescripcion());
            ps.setDouble(3, producto.getPrecioCompra());
            ps.setDouble(4, producto.getPrecioVenta());
            ps.setInt(5, producto.getStock());
            ps.setString(6, producto.getTipo());
            ps.setDate(7, java.sql.Date.valueOf(LocalDate.now()));
            ps.setBlob(8, producto.getImagen());
            ps.setInt(9, producto.getIdProveedor());

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Producto - create: " + e);
        } finally {
            closeResources();
        }
    }

    public void update(Producto producto) {
        String sql = "UPDATE producto SET nombre = ?, descripcion = ?, precio_compra = ?, precio_venta = ?, stock = ?, tipo = ?, imagen = ?, id_proveedor = ? WHERE id_producto = ?";
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);

            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDescripcion());
            ps.setDouble(3, producto.getPrecioCompra());
            ps.setDouble(4, producto.getPrecioVenta());
            ps.setInt(5, producto.getStock());
            ps.setString(6, producto.getTipo());
            ps.setBlob(7, producto.getImagen());
            ps.setInt(8, producto.getIdProveedor());
            ps.setInt(9, producto.getIdProducto());

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Producto - update: " + e);
        } finally {
            closeResources();
        }
    }

    public void delete(Producto producto) {
        String sql = "DELETE FROM producto WHERE id_producto = ?";
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, producto.getIdProducto());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Producto - delete: " + e);
        } finally {
            closeResources();
        }
    }

    public Producto getProductoById(int idProducto) {
        String sql = "SELECT * FROM producto WHERE id_producto = ?";
        Producto producto = null;
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, idProducto);
            rs = ps.executeQuery();

            if (rs.next()) {
                producto = new Producto();
                
                producto.setIdProducto(Integer.parseInt(rs.getString("id_producto")));
                producto.setNombre(rs.getString("nombre"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setPrecioCompra(Double.parseDouble(rs.getString("precio_compra")));
                producto.setPrecioVenta(Double.parseDouble(rs.getString("precio_venta")));
                producto.setStock(Integer.parseInt(rs.getString("stock")));
                producto.setTipo(rs.getString("tipo"));
                producto.setFecha(rs.getObject("fecha", LocalDate.class));
                producto.setImagen(rs.getBinaryStream("imagen"));
                producto.setIdProveedor(Integer.parseInt(rs.getString("id_proveedor")));
            }
        } catch (Exception e) {
            System.out.println("Producto - getProductoById: " + e);
        } finally {
            closeResources();
        }
        return producto;
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

    public int obtenerSiguienteId() {
        String sql = "SELECT MAX(id_producto) AS max_id FROM producto";
        try {
            connection = conexionDB.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int maxId = rs.getInt("max_id");
                return maxId + 1;
            }
        } catch (Exception e) {
            System.out.println("Producto - obtenerSiguienteId: " + e);
        } finally {
            try {
                connection.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return 0;
    }
    
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
