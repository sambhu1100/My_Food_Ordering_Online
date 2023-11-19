<%-- 
    Document   : Customer_details
    Created on : 7 Mar, 2020, 7:28:32 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
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
        
        <div class="container">
            <center>
                <div class="box">
                    <form action="Welcome_Customer.jsp" method="post">
                    <span class="text-center">Welcome Customer</span>
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
                                <input type="password" name="tb_assword" required=""/>
                                <label>Password</label>		
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <input type="submit" name="btn_submit" value="Log in" class="btn"/>
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