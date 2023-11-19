<%-- 
    Document   : Welcome_Customer
    Created on : 2 Mar, 2020, 1:51:20 PM
    Author     : HP
--%>

<%@page import="myfoodpackage.Customers"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%ArrayList<Customers> customer=(ArrayList<Customers>)request.getAttribute("customerlist");%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Customer</title>
        <link href="myCSS/myStyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="fixed-header">
        <div class="container">
            <nav>
                <a href="index.jsp">Home</a>
                <a href="AboutUs.jsp">About us</a>
                <a href="index.jsp">Logout</a>
            </nav>
        </div>
    </div>
        
        <div class="container">
            <center>
                <div class="box">
                    <form action="FoodMaster" method="post">                   
                    <table width="500">
                        <%
                        for(Customers c:customer){
                        %>
                        
                        <tr>
                            <td>
                                <div class="text-table"> 
                                    <script type="text/javascript">
                                        function checkPassword(){
                                           var conf=window.confirm("Are you sure you want to delete your account permanently?");
                                           if(conf)
                                               return true;
                                           return false;
                                        }
                                    </script>
                                    <a href="Customer_Operations?id=<%=c.getEmail()%>&pass=<%=c.getPassword()%>" onclick="return checkPassword();">Delete Account</a>                                  
                                </div>
                            </td>
                            <td>
                                <div class="text-table">
                                    <a href="customerUpdation.jsp?id=<%=c.getEmail()%>&pass=<%=c.getPassword()%>">Update Account</a>
                                </div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td align="left">
                                <div class="text-table">Customer ID:</div></td>
                            <td align="left">
                                <div class="text-table"><%=c.getID()%></div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <div class="text-table">Name:</div></td><td align="left">
                                <div class="text-table"><%=c.getFname()%></div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <div class="text-table">Email:</div></td><td align="left">
                                <div class="text-table"><%=c.getEmail()%></div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <div class="text-table">Contact:</div></td><td align="left">
                                <div class="text-table"><%=c.getContact()%></div>
                            </td>
                        </tr>
                        <input type="hidden" name="cID" value="<%=c.getID()%>"/>
                        <input type="hidden" name="cName" value="<%=c.getFname()%>"/>
                        <input type="hidden" name="cEmail" value="<%=c.getEmail()%>"/>
                        <input type="hidden" name="cContact" value="<%=c.getContact()%>"/>
                        <%
                        }
                        %>
                        <tr>
                            <td colspan="2">
                                <input type="submit" name="btn_submit" value="Order Food now" class="btn"/>
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
