<%-- 
    Document   : index
    Created on : 2 Mar, 2020, 1:32:48 PM
    Author     : HP
--%>

<%@page import="myfoodpackage.Messages"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Master</title>
        <link href="myCSS/myStyle.css" rel="stylesheet" type="text/css"/>
        
      
    </head>
    <body>
        <div class="fixed-header">
        <div class="container">
            <nav>
                <a href="index.jsp">Home</a>
                <a href="customerRegistration.jsp">Sign Up</a>
            </nav>
        </div>
    </div>        
        <div class="container">
            <center>
                <div class="box">
                    <form action="Authorization" method="post">
                    <span class="text-center">login</span>
                    <table>
                        <tr>
                            <td>
                                <div class="input-container">
                                <input type="text" name="tb_email" required=""/>
                                <label>Email</label>		
                                </div> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-container">
                                <input type="password" name="tb_password" required=""/>
                                <label>Password</label>		
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-container">
                                    <select name="category" required="">
                                        <option value="">---Select Category---</option>
                                        <option value="admin">Admin</option>
                                        <option value="customer">Customer</option>
                                    </select>	
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <input type="submit" name="btn_submit" value="Log in" class="btn"/>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">                                
                              <%
                                  if(request.getAttribute("loginstatus")!=null){
                                      Messages status=(Messages)request.getAttribute("loginstatus");
                                      if(status.getLoginstatus()==false){
                                          %>
                                          <label style=" color:  red"><b>Invalid ID or Password</b></label>
                                <%
                                      }
                                  }
                              %>
                            </td>
                        </tr>
                    </table>
                </form>
                </div>
            </center>
        </div>
       
    <div class="fixed-footer">
        <div class="container">Copyright &copy; Institute of Technical & Education Research, MCA group</div>        
    </div>
    </body>
</html>
