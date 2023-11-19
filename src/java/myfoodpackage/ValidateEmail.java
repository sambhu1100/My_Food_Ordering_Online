/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myfoodpackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author HP
 */
public class ValidateEmail {
    Connection con=null;
    Statement stmt=null;
    ResultSet rs=null;
    String query=null;
    public boolean isValidEmail(String email) throws SQLException{
        ConnectDB db=new ConnectDB();
        try{
            con=db.getCon();
            if(con!=null){
                query="select * from customer_master where binary email='"+email+"' limit 1";
                stmt=con.createStatement();
                rs=stmt.executeQuery(query);
                if(rs.next()){
                    return false;
                }else{
                    return true;
                }
            }
        }catch(ClassNotFoundException ex){
        }
        return false;
    }
    
}
