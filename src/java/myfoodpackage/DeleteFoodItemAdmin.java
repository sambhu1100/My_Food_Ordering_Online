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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "DeleteFoodItemAdmin", urlPatterns = {"/DeleteFoodItemAdmin"})
public class DeleteFoodItemAdmin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteFoodItemAdmin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteFoodItemAdmin at " + request.getContextPath() + "</h1>");
            //out.println("Working");
            String itemNo[]=request.getParameterValues("tb_itemNo");
            String itemName[]=request.getParameterValues("tb_itemName");
            String itemDesc[]=request.getParameterValues("tb_itemDescription");
            String itemPrice[]=request.getParameterValues("tb_itemPrice");
            String all[]=request.getParameterValues("chbx_Delete");
            int len=all.length;
            int count=0;
            Connection con;
            Statement stmt;
            try{
                ConnectDB db=new ConnectDB();
                con=db.getCon();
                stmt=con.createStatement();
                for(int j=0;j<len;j++){
                    String query="delete from food_item where item_name='"+all[j]+"' limit 1";
                    int x=stmt.executeUpdate(query);
                    if(x>0)
                        count++;
                }
                if(count>0){
                    Messages msg=new Messages();
                    msg.setShowMessages("Data has been updated");
                    request.setAttribute("Message", msg);
                    request.getRequestDispatcher("FoodDetailsAdmin.jsp").forward(request, response);
                }               
            }catch(ClassNotFoundException | SQLException ex){
                ex.printStackTrace();
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
        processRequest(request, response);
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
        processRequest(request, response);
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
