package helper;

import java.sql.*;

public class MySQlConnection {

    private static Connection myConn;
    
    public static Connection mySQLConnection() throws Exception{
        
        Class.forName("com.mysql.jdbc.Driver");
        String host = "jdbc:mysql://";
        String server = "localhost/";
        String database = "myblog";
                
        String serverURL = host + server + database;
        
        String username = "root";
        String password = "";
        
        myConn = DriverManager.getConnection(serverURL, username, password);
        return myConn;
    }
}
