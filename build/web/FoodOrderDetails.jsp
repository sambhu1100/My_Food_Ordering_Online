<%-- 
    Document   : Welcome_Admin
    Created on : 14 Mar, 2020, 11:54:08 PM
    Author     : HP
--%>

<%@page import="myfoodpackage.ConnectDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food Order Details</title>
        <link href="myCSS/myStyle.css" rel="stylesheet" type="text/css"/>
        <link href="myCSS/FoodStyles.css" rel="stylesheet" type="text/css"/>
        
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
        <form>
            <table width="800" align="center">
            <tr bgcolor="#DAF7A6">
                <td>
                    Sl No
                </td>
                <td>
                    Ordered On
                </td>
                <td>
                    Ordered By
                </td>
                <td>
                    Items and Quantity
                </td>
                <td>
                    Paid Price
                </td>
            </tr>
            <%
                Connection con;
                Statement stmt;
                ResultSet rs;
                int count=0;
                try{
                    ConnectDB db=new ConnectDB();
                    con=db.getCon();
                    if(con!=null){
                        String query="select * from food_order_history order by order_on desc";
                        stmt=con.createStatement();
                        rs=stmt.executeQuery(query);
                        while(rs.next()){
                            count++;
                            %>
                            <tr bgcolor="#DAF7A6">
                                <td>
                                    <%=count%>
                                </td>
                                <td>
                                    <%=rs.getString("order_on")%>
                                </td>
                                <td>
                                    <%=rs.getString("order_by")%>
                                </td>
                                <td>
                                    <%=rs.getString("order_items")%>
                                </td>
                                <td>
                                    <%=rs.getString("price")%>
                                </td>
                                
                            </tr>
                            <%
                        }
                        }
                    }catch(Exception ex){
                        ex.printStackTrace();
                    }
            %>
            
        </table>
        </form>
    </div>    
    <div class="fixed-footer">
        <div class="container">Copyright &copy; Institute of Technical & Education Research, MCA group</div>       
    </div>
    </body>
</html>
