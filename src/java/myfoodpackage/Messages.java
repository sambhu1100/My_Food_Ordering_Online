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
public class Messages {
    private boolean loginstatus=true;
    public void setLoginstatus(boolean loginstatus){this.loginstatus=loginstatus;}
    public boolean getLoginstatus(){return this.loginstatus;}
    
    private String insertResult=null;
    public void setInsertResult(String insertResult){this.insertResult=insertResult;}
    public String getInsertResult(){return this.insertResult;}
    
    private String isNewEmailStatus=null;
    public void setIsNewEmailStatus(String emailStatus){this.isNewEmailStatus=emailStatus;}
    public String getIsNewEmailStatus(){return this.isNewEmailStatus;}
    
    private String showMessages=null;
    public void setShowMessages(String showMessages) {this.showMessages = showMessages;}
    public String getShowMessages() {return showMessages;}
    
}
