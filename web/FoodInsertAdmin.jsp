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
        <title>Insert Food Item</title>
        <link href="myCSS/myStyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="fixed-header">
        <div class="container">
            <nav>
                <a href="index.jsp">Home</a>
            </nav>
        </div>
    </div>        
        <div class="container">
            <center>
                <div class="box">
                    <form action="insertFoodItemAdmin" method="post">
                    <span class="text-center">Add New Food Item</span>
                    <table>
                        <tr>
                            <td>
                                <div class="input-container">
                                <input type="text" name="tb_itemName" required=""/>
                                <label>Item name</label>		
                                </div> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-container">
                                <input type="text" name="tb_Description" required=""/>
                                <label>Description</label>		
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-container">
                                <input type="text" name="tb_price" required=""/>
                                <label>Price</label>		
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <input type="submit" name="btn_submit" value="Add" class="btn"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <%
                                if(request.getAttribute("Message")!=null){
                                    Messages msg=(Messages)request.getAttribute("Message");
                            %>
                                        <label style="color: red"><b><%=msg.getShowMessages()%></b></label>
                            <%}%>                                     
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
