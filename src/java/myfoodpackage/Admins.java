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
public class Admins {
    private int admin_id;
    private String password;
 
    //setter method
    public void setAdminID(int id){this.admin_id=id;}
    public void setPassword(String password){this.password=password;}
    
    //getter method
    public int setAdminID(){return admin_id;}
    public String setPassword(){return password;}
}
