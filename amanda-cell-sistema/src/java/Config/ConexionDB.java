
package Config;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionDB {
    
    private static final String url = "jdbc:mysql://localhost:3306/amanda_cell";
    private static final String user = "root";
    private static final String password = "";
    
    public static Connection getConnection() {
        Connection connection = null;
        try {
            if (connection == null || connection.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(url, user, password);
                System.out.println("Se conectó a la base de datos.");
            }
        } catch (Exception ex) {
            System.out.println("Error Config/ConexionDB: " + ex);
        }
        return connection;
    }
    
}
