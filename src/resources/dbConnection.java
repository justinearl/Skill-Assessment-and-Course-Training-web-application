package resources;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbConnection {
	  	private static String url = "jdbc:mysql://localhost:3306/sactapp";    
	    private static String driverName = "com.mysql.jdbc.Driver";   
	    private static String username = "root";   
	    private static String password = "1234";
	    private static Connection con;
	   // private static String urlstring;

	    public static Connection getConnection() {
	        try {
	            Class.forName(driverName);
	            try {
	                con = DriverManager.getConnection(url, username, password);
	            } catch (SQLException ex) {
	                
	                System.out.println("Failed to create the database connection."); 
	            }
	        } catch (ClassNotFoundException ex) {
	            // log an exception. for example:
	            System.out.println("Driver not found."); 
	        }
	        return con;
	    }
}
