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
public class Foods {
    private int item_no;
    private float item_price;
    private String item_name;
    private String item_description;
    
    //setter method

    public void setItem_no(int item_no) {
        this.item_no = item_no;
    }

    public void setItem_price(float item_price) {
        this.item_price = item_price;
    }

    public void setItem_name(String item_name) {
        this.item_name = item_name;
    }

    public void setItem_description(String item_description) {
        this.item_description = item_description;
    }
    
    
    //getter method
    public int getItem_no() {
        return item_no;
    }

    public float getItem_price() {
        return item_price;
    }

    public String getItem_name() {
        return item_name;
    }

    public String getItem_description() {
        return item_description;
    }
    
}
