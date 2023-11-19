<%-- 
    Document   : Welcome_Admin
    Created on : 14 Mar, 2020, 11:54:08 PM
    Author     : HP
--%>

<%@page import="myfoodpackage.Messages"%>
<%@page import="myfoodpackage.ConnectDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food Items Details</title>
        <link href="myCSS/myStyle.css" rel="stylesheet" type="text/css"/>
        <link href="myCSS/FoodStyles.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
            function confirmAction(){
                var a=window.confirm("Are you sure?");
                if(a){
                    return true;
                }
                return false;
            }
            function selectAll(){
                var all=document.getElementsByClassName("chbxDelete");
                var result=document.getElementById("checkAll").checked;
                if(result){
                    for(var i=0;i<all.length;i++){
                        document.forms["FoodDetailsAdmin"].chbx_Delete[i].checked=true;
                    }
                }else{
                    for(var i=0;i<all.length;i++){
                        document.forms["FoodDetailsAdmin"].chbx_Delete[i].checked=false;
                    }
                }
            }
        </script>
    </head>
    <body>
        <div class="fixed-header">
        <div class="container">
            <nav>
                <a href="index.jsp">Home</a>
                <a href="=AboutUs.jsp">About us</a>
            </nav>
        </div>
    </div>
    <div class="container">       
        <form action="updateFoodItemAdmin" method="post" id="FoodDetailsAdmin">
            <table width="800" align="center">
            <tr bgcolor="#DAF7A6">
                <td>
                    Item No
                </td>
                <td>
                    Item Name
                </td>
                <td>
                    Description
                </td>
                <td>
                    Price
                </td>
                <td>
                    Select All<input type="checkbox" id="checkAll" onclick="selectAll()">
                </td>
            </tr>
            <%
                Connection con;
                Statement stmt;
                ResultSet rs;
                try{
                    ConnectDB db=new ConnectDB();
                    con=db.getCon();
                    if(con!=null){
                        String query="select * from food_item";
                        stmt=con.createStatement();
                        rs=stmt.executeQuery(query);
                        while(rs.next()){
                            %>
                            <tr bgcolor="#DAF7A6">
                                <td>
                                    <input type="text" name="tb_itemNo" value="<%=rs.getInt("item_no")%>" readonly="true" required=""/>
                                </td>
                                <td>
                                    <input type="text" name="tb_itemName" value="<%=rs.getString("item_name")%>" required=""/>
                                </td>
                                <td>
                                    <input type="textarea" name="tb_itemDescription" value="<%=rs.getString("item_description")%>" required=""/>
                                </td>
                                <td>
                                    <input type="text" name="tb_itemPrice" value="<%=rs.getString("item_price")%>" required=""/>
                                </td>
                                <td>
                                    <input type="checkbox" class="chbxDelete" name="chbx_Delete" value="<%=rs.getString("item_name")%>">
                                </td>
                            </tr>
                            <%
                        }
                        }
                    }catch(Exception ex){
                        ex.printStackTrace();
                    }
            %>
            <tr>
                <td colspan="2">
                    <button type="submit" class="btn" onclick="return confirmAction()" formaction="FoodInsertAdmin.jsp">Add New</button>
                </td>
                <td>
                    <button type="submit" class="btn" onclick="return confirmAction()">Update</button>
                </td>
                <td colspan="2">
                    <button type="submit" class="btn" onclick="return confirmAction()" formaction="DeleteFoodItemAdmin">Delete</button>
                </td>
            </tr>
            <tr>
                <td colspan="4">
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
    <div class="fixed-footer">
        <div class="container">Copyright &copy; Institute of Technical & Education Research, MCA group</div>        
    </div>
    </body>
</html>
