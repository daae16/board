package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {
   private static final String url = "jdbc:mariadb://localhost:3306/java";
   private static final String user = "test";
   private static final String password = "test";
   private static final String driver_name = "org.mariadb.jdbc.Driver";
   
   private static Connection conn;
   
   private static void init() {
         try {
            Class.forName(driver_name);
         } catch (ClassNotFoundException e) {
            e.printStackTrace();
         }

   }
   public static Connection getConnection() {
      if(conn==null) {
         init(); 
         try {
            conn = DriverManager.getConnection(url, user, password);
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      return conn;
   }
   public static void close() {
      if(conn!=null) {
         try {
            conn.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      conn = null;
   }

}