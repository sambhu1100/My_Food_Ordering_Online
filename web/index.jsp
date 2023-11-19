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
        <title>The Second Wife Kitchen</title>
        <link href="myCSS/FoodStyles.css" rel="stylesheet" type="text/css"/>
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
                <a href="AboutUs.jsp">About us</a>       
            </nav>
        </div>
        </div>  
    
        <div class="container">
        <center>
        <table width="1000" height="100">
            <tr>
                <td colspan="2">
                    <div class="divNew,pNew,h1New" style=" background-color: #FFA07A">
                    <h1 style="color: #800000; font-size: 80px">The Second Wife Kitchen</h1>
                    <h3 style="color: brown; font-size: 30px"><b>Nayapalli, Bhubaneswar</b></h3>
                    <center style="color: navy"><b>North Indian, South Indian, Chinese, Biryani</b></center>
                    </div>
                    
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="divNew,pNew,h1New" style=" background-color: #FFA07A">
                        <div class="container">
                        <nav>
                            <a href="login.jsp">
                                <button type="button" class="btn">Go</button>
                            </a>       
                        </nav>
                        </div>
                    <center style="color: black"><b><b>(We only serve with in the 5 km radius)</b></b></center>
                    </div>
                </td>
            </tr>
        </table>
        </center>
    </div>
    <center style="color: white"><b></b></center>
    <div class="fixed-footer">
        <div class="container">Copyright &copy; Institute of Technical & Education Research, MCA group group</div>        
    </div>
    </body>
</html>
