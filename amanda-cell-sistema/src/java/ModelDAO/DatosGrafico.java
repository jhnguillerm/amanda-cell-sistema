
package ModelDAO;

import Config.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DatosGrafico {
    
    ConexionDB conexionDB = new ConexionDB();
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Object> getData() {
        try {
            connection = conexionDB.getConnection();

            String sql = "SELECT tipo, COUNT(*) AS cantidad FROM producto GROUP BY tipo";

            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            List<Object> data = new ArrayList<>();

            while (rs.next()) {
                String tipo = rs.getString("tipo");
                int cantidad = rs.getInt("cantidad");
                data.add(new Object[]{tipo, cantidad});
            }

            return data;
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    
}
