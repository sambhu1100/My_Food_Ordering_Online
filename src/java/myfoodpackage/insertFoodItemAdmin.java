/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myfoodpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "insertFoodItemAdmin", urlPatterns = {"/insertFoodItemAdmin"})
public class insertFoodItemAdmin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet insertFoodItemAdmin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet insertFoodItemAdmin at " + request.getContextPath() + "</h1>");
            String itemName=request.getParameter("tb_itemName");
            String description=request.getParameter("tb_Description");
            double price=Double.parseDouble(request.getParameter("tb_price"));
            //out.println(itemName+""+description+""+price);
            Connection con;
            Statement stmt;
            String query="insert into food_item(item_name,item_description,item_price) values('"+itemName+"','"+description+"','"+price+"')";
            try{
                ConnectDB db=new ConnectDB();
                con=db.getCon();             
                stmt=con.createStatement();
                ValidateFoodItem item=new ValidateFoodItem();
                boolean newItem=item.isValidItem(itemName);
                if(!newItem){
                    Messages ms=new Messages();
                    ms.setShowMessages("Item already exists");
                    request.setAttribute("Message", ms);
                    request.getRequestDispatcher("FoodInsertAdmin.jsp").forward(request, response);
                }else{
                    int i=stmt.executeUpdate(query);
                    if(i>0){
                        Messages ms=new Messages();
                        ms.setShowMessages("Item added successfully");
                        request.setAttribute("Message", ms);
                        request.getRequestDispatcher("FoodInsertAdmin.jsp").forward(request, response);
                    }else{
                        out.println("Error");
                    }
                }
            }catch(ClassNotFoundException ex){
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(insertFoodItemAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(insertFoodItemAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
