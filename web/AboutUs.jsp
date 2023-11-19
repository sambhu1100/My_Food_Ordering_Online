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
        <title>About US</title>
        <link href="myCSS/myStyle.css" rel="stylesheet" type="text/css"/>
        <style>
.divNew {
  border: 1px solid gray;
  padding: 8px;
}

.h1New {
  text-align: center;
  text-transform: uppercase;
  color: cornsilk;
  animation: cssmarquee 2s linear infinite alternate;
}

.pNew {
  text-indent: 50px;
  text-align: justify;
  letter-spacing: 3px;
}
</style>
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
    <marquee onmousedown="this.stop();" onmouseup="this.start();">
        <table width="1000" height="100">
            <tr>
                <td colspan="2">
                    <div class="divNew,pNew,h1New" style=" background-color: #FFA07A">
                    <h1 style="color: #800000">INSTITUTE OF TECHNICAL EDUCATION AND RESEARCH</h1>
                    </div>
                </td>
            </tr>
            <tr>                
                <td>
                    <div class="divNew,pNew,h1New" style=" background-color: #FFA07A">
                    <h1 style="color: #800000">Rahul Ranjan Behera</h1>
                    <p>Redg No.: 1951020034</p>
                    </div>
                </td>
                <td>
                    <div class="divNew,pNew,h1New" style=" background-color: #FFA07A">
                    <h1 style="color: #800000">Dashrath Tudu</h1>
                    <p>Redg No.:1951020042</p>
                    </div>
                </td>
            </tr>
        </table>
       
        
        
       
        
        </marquee>
    <center style="color: white"><b>(Click and hold the mouse to stop)</b></center>
    <div class="fixed-footer">
        <div class="container">Copyright &copy; Institute of Technical & Education Research, MCA group group</div>        
    </div>
    </body>
</html>
