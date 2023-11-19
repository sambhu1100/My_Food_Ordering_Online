/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myfoodpackage;

/**
 *
 * @author HP
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
    private final String driver="com.mysql.jdbc.Driver";
    private final String url="jdbc:mysql://localhost:3306/food_ordering";
    private final String user="root";
    private final String password="root";
    Connection con=null;
    public Connection getCon() throws ClassNotFoundException{
        try{
            Class.forName(driver);
            con=DriverManager.getConnection(url, user, password);
        }catch(SQLException ex){
        }
        return con;
    }
}
