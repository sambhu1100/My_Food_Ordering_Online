  <%-- 
    Document   : Welcome_Admin
    Created on : 14 Mar, 2020, 11:54:08 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Admin</title>
        <link href="myCSS/myStyle.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
            function logout(){
                window.location="index.jsp";
            }
        </script>
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
        
        <div class="container">
            <center>
                <div class="box">
                <form>
                    <span class="text-center">Welcome Admin</span>
                    <table>
                        <tr>
                            <td>
                                <div class="input-container">
                                    <a href="FoodOrderDetails.jsp" target="_blank">Show Food Order Details</a>		
                                </div> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-container">
                                    <a href="FoodDetailsAdmin.jsp" target="_blank">Edit Food Items</a>
                                </div>
                            </td>
                        </tr>  
                        <tr>
                            <td align="center">
                                <input type="button" name="btn_submit" value="Log out" onclick="logout()" class="btn"/>
                            </td>
                        </tr>
                    </table>
                </form>
                </div>
            </center>
        </div>
    </div>    
    <div class="fixed-footer">
        <div class="container">Copyright &copy; Institute of Technical & Education Research, MCA group</div>       
    </div>
    </body>
</html>
