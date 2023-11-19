<%-- 
    Document   : customerRegistration
    Created on : 10 Apr, 2020, 3:09:54 PM
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
        <script type="text/javascript">
            function validatePass(){
                var pass=document.getElementById("tbPass").value;
                var confirmPass=document.getElementById("tbConfirmPass").value;
                if(pass!==confirmPass){
                    alert("Password and Confirm Password did not match");
                    var cp=document.getElementById("tbConfirmPass");
                    cp.value="";
                    cp.focus();
                    return false;
                }
                return true;
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
            <center>
                <div class="box">
                    <form action="CustomerRegistration" method="post">
                    <span class="text-center"><b>Create a new account</b></span>
                    <table>
                        <tr>
                            <td>
                                <div class="input-container">
                                    <input type="text" name="tb_name" required=""/>
                                <label>Full Name</label>		
                                </div> 
                            </td>
                        </tr>
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
                                <input type="password" name="tb_password" required="" id="tbPass"/>
                                <label>Password</label>		
                                </div> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-container">
                                    <input type="password" name="tb_confirmPassword" required="" id="tbConfirmPass" />
                                <label>Confirm Password</label>		
                                </div> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-container">
                                <input type="text" name="tb_contact" required=""/>
                                <label>Contact</label>		
                                </div> 
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <button type="submit" name="btn_submit" class="btn" onclick="return validatePass()">Sign Up</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%
                                    if(request.getAttribute("insertResult")!=null){
                                        Messages msg=(Messages)request.getAttribute("insertResult");
                                        %>
                                        <label style="color: red"><%=msg.getInsertResult()%></label>
                                <%
                                    }
                                    if(request.getAttribute("newEmailStatus")!=null){
                                        Messages msg=(Messages)request.getAttribute("newEmailStatus");
                                        %>
                                        <label style="color: red"><%=msg.getIsNewEmailStatus()%></label>
                                <%
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
