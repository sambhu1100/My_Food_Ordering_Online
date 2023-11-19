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
        <title>Food Order Placed</title>
        <link href="myCSS/myStyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="fixed-header">
        <div class="container">
            <nav>
                <a href="index.jsp">Home</a>
                <a href="customerRegistration.jsp">Sign Up</a>
                <a href="AboutUs.jsp">About us</a>
                <a href="index.jsp">Logout</a>
            </nav>
        </div>
    </div>        
       <div class="container">
            <center>
                <div class="box">
                    <form action="index.jsp">
                    <span class="text-center">Order Placed!</span>
                    <table>      
                        <tr>
                            <td align="center">                                
                              <%
                                  if(request.getAttribute("Message")!=null){
                                      Messages status=(Messages)request.getAttribute("Message");
                                          %>
                                          <label style=" color:  red"><b><%=status.getShowMessages()%></b></label>
                                <%     
                                  }
                              %>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <input type="submit" name="btn_submit" value="Close" class="btn"/>
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
