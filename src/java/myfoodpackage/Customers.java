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
public class Customers {
    private int cid;
    private String fname;
    private String email;
    private String password;
    private String contact;
    
    //Setter method to assign value
    public void setID(int id){this.cid=id;}
    public void setFname(String name){this.fname=name;}
    public void setEmail(String email){this.email=email;}
    public void setPassword(String password){this.password=password;}
    public void setContact(String contact){this.contact=contact;}
    
    //getter methid to fetch data to display
    public int getID(){return cid;}
    public String getFname(){return fname;}
    public String getEmail(){return email;}
    public String getPassword(){return password;}
    public String getContact(){return contact;}
}
