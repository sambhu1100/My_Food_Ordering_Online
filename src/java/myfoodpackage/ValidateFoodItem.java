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
public class ValidateFoodItem {
    Connection con;
    Statement stmt;
    ResultSet rs;
    String query;
    public boolean isValidItem(String foodName) throws SQLException{
        ConnectDB db=new ConnectDB();
        try{
            con=db.getCon();
            if(con!=null){
                query="select item_name from food_item where binary item_name='"+foodName+"' limit 1;";
                stmt=con.createStatement();
                rs=stmt.executeQuery(query);
                if(!rs.next()){
                    return true;
                }else{
                    return false;
                }
            }
        }catch(ClassNotFoundException ex){
        }
        return false;
    }
}
