package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by Steve on 02-Sep-16.
 */
public class DBUtil {

    private static Connection con;

    public static Connection getConnection() {

        // check if connection has already been initialized
        if (con != null)
            return con;

        else
            try {
                String driver = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://localhost:3306/PROJECT1";
                String user = "root";
                String password = "nightfall";
                Class.forName(driver);
                con = DriverManager.getConnection(url, user, password);
            } catch (ClassNotFoundException cnfe) {
                System.out.println(cnfe);
            } catch (SQLException sqe) {
                System.out.println(sqe);
            }

        return con;
    }

}
