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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
@WebServlet(name = "FoodMaster", urlPatterns = {"/FoodMaster"})
public class FoodMaster extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FoodMaster</title>");            
            out.println("</head>");
            out.println("<body>");
            /*-----------------------------------------------------------------------------------------------*/
            Connection con=null;
            Statement stmt=null;
            ResultSet rs=null;
            ArrayList<Foods> foodData=new ArrayList<Foods>();
            //Customer
            ArrayList<Customers> customer=new ArrayList<Customers>();
            
            int cID=Integer.parseInt(request.getParameter("cID"));
            String cName=request.getParameter("cName");
            String cEmail=request.getParameter("cEmail");
            String cContact=request.getParameter("cContact");
            
            Customers c=new Customers();
            c.setID(cID);
            c.setFname(cName);
            c.setEmail(cEmail);
            c.setContact(cContact);
            customer.add(c);
            
            
            ConnectDB db=new ConnectDB();
            try {
                con=db.getCon();
                if(con==null){
                    out.print("Could not connect to Food Item DB. Try again!");
                    response.sendRedirect("index.jsp");
                }
                stmt=con.createStatement();
                rs=stmt.executeQuery("select * from food_item");
                while(rs.next()){
                    Foods fd=new Foods();
                    fd.setItem_no(rs.getInt("item_no"));
                    fd.setItem_name(rs.getString("item_name"));
                    fd.setItem_description(rs.getString("item_description"));
                    fd.setItem_price(rs.getFloat("item_price"));
                    foodData.add(fd);
                }
                request.setAttribute("foodList", foodData);
                request.setAttribute("customerlist", customer);
                request.getRequestDispatcher("FoodHome.jsp").forward(request, response);
                
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(FoodMaster.class.getName()).log(Level.SEVERE, null, ex);
            }
            /*-----------------------------------------------------------------------------------------------*/
            out.println("<h1>Servlet FoodMaster at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(FoodMaster.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(FoodMaster.class.getName()).log(Level.SEVERE, null, ex);
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
