<%-- 
    Document   : FoodHome
    Created on : 18 Mar, 2020, 5:49:11 PM
    Author     : HP
--%>

<%@page import="myfoodpackage.Messages"%>
<%@page import="myfoodpackage.Customers"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myfoodpackage.Foods"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%ArrayList<Foods> fd=(ArrayList<Foods>)request.getAttribute("foodList");%>
<%ArrayList<Customers> customer=(ArrayList<Customers>)request.getAttribute("customerlist");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FoodHome</title>
        <link href="myCSS/FoodStyles.css" rel="stylesheet" type="text/css"/>
        
         <script type="text/javascript">
             function addtoCart(){
                 var parent=document.getElementsByClassName("foodClass")[0];
                 var table=document.getElementById("foodChart");
                 var rowCount=table.rows.length;
                 var sum=0;
                 var i;
                 var j;
                 for(i=0,j=1;i<rowCount*3-2 && j<rowCount*3-2;i=i+3,j=j+3){
                     var quantity=table.getElementsByClassName("child")[i].options[table.getElementsByClassName("child")[i].selectedIndex].value;
                     var getPrice=parent.getElementsByClassName("child")[j].value;
                     sum=sum+(quantity*parseFloat(getPrice));
                 }
                 var total=document.getElementById("tb_price");
                 total.value=sum;
             }
             function sendFoodItems(){
                 var ItemList=[];
                 var parent=document.getElementsByClassName("foodClass")[0];
                 var table=document.getElementById("foodChart");
                 var rowCount=table.rows.length;
                 var i;
                 var j;
                 for(i=0,j=2;i<rowCount*3-2 && j<rowCount*3-2;i=i+3,j=j+3){
                     var quantity=table.getElementsByClassName("child")[i].options[table.getElementsByClassName("child")[i].selectedIndex].value;
                     var foodItem=parent.getElementsByClassName("child")[j].value;
                     if(quantity>0){
                         ItemList.push(foodItem);
                         ItemList.push(" No:");
                         ItemList.push(quantity);
                         ItemList.push(" ");
                     }
                 }
                var item=document.getElementById("foodItemList");
                item.value=ItemList.join(",");
             }
            
         </script>
    </head>
    <body>
<!------------------------------Header Portion------------------------------------------------>
<form action="foodOrder" method="post" id="foodPlaceForm">
     <div class="header text-table">
                <table width="800" align="center">
                    <tr>
                        <th align="center">Name</th>
                        <th align="center">Email</th>
                        <th align="center">Contact</th>
                    </tr>
                            <%for(Customers c:customer){
                                %>
                                <tr>
                                    <td><%=c.getFname()%></td>
                                    <td><%=c.getEmail()%></td>
                                    <td><%=c.getContact()%></td>
                                    <input type="hidden" name="cID" value="<%=c.getEmail()%>"/>
                                </tr>        
                    <%
                            }%>
                            <tr>
                                <td style=" font-size: 28px">
                                    <b>Total Price:</b>
                                </td>
                                <td>
                                    <input type="text" id="tb_price" name="tb_price" readonly="true"/>
                                </td>
                            </tr>
            </table>
                            
        </div>

<!-----------------------------Container Portion------------------------------------------------>
        <div class="body">
            <div class="foodClass">
                <table width="800" align="center" style="opacity: 50%" id="foodChart">
                    <%for(Foods obj:fd){ %>
                    <tr bgcolor="#DAF7A6">
                        <td height="50"><%=obj.getItem_no()%></td>
                        <td height="50"><%=obj.getItem_name()%></td>
                        <td height="50"><%=obj.getItem_description()%></td>
                        <td height="50"><%=obj.getItem_price()%></td>
                        <td height="50">
                            <select class="child">
                                <option value="">Select Quantity</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                            </select>
                            <input type="hidden" class="child" value="<%=obj.getItem_price()%>">
                            <input type="hidden" class="child" value="<%=obj.getItem_name()%>">
                            <input type="hidden" id="foodItemList" name="foodItemList">
                        </td>
                    </tr> 
                    <%}%>
                    <tr bgcolor="#DAF7A6">
                        <td height="70" colspan="6" align="right">
                            <button type="button" id="btnAddtoCart" onclick="addtoCart()">Add to Cart</button>
                        </td>
                    </tr>
                </table>
                    
                        <table>
                            <tr>
                                <td>
                                    <button type="submit" id="btnOrderFood" class="button_blue" onclick="sendFoodItems()">Order Now</button>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%
                                        if(request.getAttribute("")!=null){
                                            Messages msg=(Messages)request.getAttribute("");
                                        %>
                                       <label style="color: red">"Hello"<%%></label>
                                        <%
                                        }
                                        %>
                                </td>
                            </tr>
                        </table>
                    
            </div>                     
        </div>
</form>                               
<!----------------------------Footer Portion-------------------------------------------------->
        <div class="fixed-footer">
            <div class="container">Copyright &copy; Institute of Technical & Education Research, MCA group</div>
        </div>
    </body>
</html>