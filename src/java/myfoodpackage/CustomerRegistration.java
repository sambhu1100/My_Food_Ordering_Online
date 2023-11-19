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
@WebServlet(name = "CustomerRegistration", urlPatterns = {"/CustomerRegistration"})
public class CustomerRegistration extends HttpServlet {

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
            out.println("<title>Servlet CustomerRegistration</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerRegistration at " + request.getContextPath() + "</h1>");
            /*--------------------------------------------------------------------------------------*/
            String fname=request.getParameter("tb_name").toString();
            String email= request.getParameter("tb_email").toString();
            String password=request.getParameter("tb_password").toString();
            String contact=request.getParameter("tb_contact").toString();
            
            Connection con;
            ResultSet rs;
            Statement stmt;
            String query;
            boolean isNewEmail;
            ConnectDB db=new ConnectDB();
            try{
                con=db.getCon();
                if(con!=null){
                    out.print("Database Connected");
                    stmt=con.createStatement();
                    query="insert into customer_master(fname,email,password,contact) values('"+fname+"','"+email+"','"+password+"','"+contact+"');";
                    ValidateEmail check=new ValidateEmail();
                    isNewEmail=check.isValidEmail(email);
                    if(!isNewEmail){
                        //out.print("email has been taken already");
                        Messages newEmail=new Messages();
                        newEmail.setIsNewEmailStatus("That Email is taken try another!");
                        request.setAttribute("newEmailStatus", newEmail);
                        request.getRequestDispatcher("customerRegistration.jsp").forward(request, response);
                    }
                    else{
                        int result=stmt.executeUpdate(query);
                        if(result>=1){
                            out.print("Account created successfully.");
                            Messages insertResult=new Messages();
                            insertResult.setInsertResult("Account created successfully");
                            request.setAttribute("insertResult", insertResult);
                            request.getRequestDispatcher("customerRegistration.jsp").forward(request, response);
                        }
                        else{
                            Messages insertResult=new Messages();
                            insertResult.setInsertResult("Error!!!");
                            request.setAttribute("insertResult", insertResult);
                            request.getRequestDispatcher("customerRegistration.jsp").forward(request, response);
                        }
                    }
                    
                }
            }
            catch(ClassNotFoundException | SQLException ex){
                ex.printStackTrace();
            }
            
            
            /*--------------------------------------------------------------------------------------*/
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
