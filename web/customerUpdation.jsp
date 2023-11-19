<%-- 
    Document   : customerRegistration
    Created on : 10 Apr, 2020, 3:09:54 PM
    Author     : HP
--%>

<%@page import="myfoodpackage.Messages"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String cid=request.getParameter("id");
    String cpassword=request.getParameter("pass");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Customer</title>
        <link href="myCSS/myStyle.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
            function validatePass(){
                var pass=document.getElementById("tb_password").value;
                var confirmPass=document.getElementById("tb_cpassword").value;
                if(pass!==confirmPass){
                    alert("Password and Confirm Password did not match");
                    var cp=document.getElementById("tb_cpassword");
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
                    <form action="CustomerUpdation" method="post">
                    <span class="text-center"><b>Update account</b></span>
                    <table>
                        <tr>
                            <td>
                                <div class="input-container">
                                    <input type="text" name="tb_name" required=""/>
                                <label>New Name</label>		
                                </div> 
                            </td>
                        </tr>
                        <tr> 
                            <td>
                                <div class="input-container">
                                <input type="password" name="tb_password" required="" id="tb_password"/>
                                <label>New Password</label>		
                                </div> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-container">
                                <input type="password" name="tb_cpassword" required="" id="tb_cpassword"/>
                                <label>Confirm Password</label>		
                                </div> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-container">
                                <input type="text" name="tb_contact" required=""/>
                                <label>New Contact</label>		
                                </div> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="hidden" name="cID" value="<%=cid%>"/>
                                <input type="hidden" name="cPassword" value="<%=cpassword%>"/>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <button type="submit" name="btn_submit" class="btn" onclick="return validatePass()">Update</button>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div class="input-container">
                                    <a href="index.jsp"><b>Cancel</b></a>	
                                </div> 
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
