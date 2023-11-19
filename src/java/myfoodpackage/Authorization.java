/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myfoodpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
@WebServlet(name = "Authorization", urlPatterns = {"/Authorization"})
public class Authorization extends HttpServlet {

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
            out.println("<title>Authorization</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Authorization at " + request.getContextPath() + "</h1>");
            //------------------------Operation------------------------------
            String email=request.getParameter("tb_email");
            String password=request.getParameter("tb_password");
            String category=request.getParameter("category");
            
            Connection con=null;
            ResultSet rs=null;
            Statement stmt=null;
            String query = null;
            ArrayList<Admins> admindata=new ArrayList<Admins>();
            ArrayList<Customers> customerdata=new ArrayList<Customers>();
            
            ConnectDB db=new ConnectDB();
            try{
                con=db.getCon();
                if(con!=null){
                    out.print("Connected Successfully");
                    stmt=con.createStatement();
                    if(category.equalsIgnoreCase("admin")){
                        query="select * from admin where admin_id='"+email+"' and binary password='"+password+"' limit 1";
                        rs=stmt.executeQuery(query);
                        if(rs.next()==false){
                            Messages status=new Messages();
                            status.setLoginstatus(false);
                            request.setAttribute("loginstatus", status);
                            request.getRequestDispatcher("index.jsp").forward(request, response);
                        }
                        else{
                            do{
                                Admins admin=new Admins();
                                admin.setAdminID(rs.getInt("admin_id"));
                                admin.setPassword(rs.getString("password"));
                                admindata.add(admin);
                            }while(rs.next());
                                request.setAttribute("adminList", admindata);
                                request.getRequestDispatcher("Welcome_Admin.jsp").forward(request, response);
                        }
                    }
                    else if(category.equalsIgnoreCase("customer")){
                        query=" select * from customer_master where binary email='"+email+"' and binary password='"+password+"' limit 1";
                        rs=stmt.executeQuery(query);
                        if(rs.next()==false){
                            Messages status=new Messages();
                            status.setLoginstatus(false);
                            request.setAttribute("loginstatus", status);
                            request.getRequestDispatcher("login.jsp").forward(request, response);
                        }
                        else{
                            do{
                                Customers customer=new Customers();
                                customer.setID(rs.getInt("cid"));
                                customer.setFname(rs.getString("fname"));
                                customer.setEmail(rs.getString("email"));
                                customer.setPassword(rs.getString("password"));
                                customer.setContact(rs.getString("contact"));
                                customerdata.add(customer);
                            }while(rs.next());
                            request.setAttribute("customerlist", customerdata);
                            request.getRequestDispatcher("Welcome_Customer.jsp").forward(request, response);
                        }
                    }
                    else{
                        Messages status=new Messages();
                        status.setLoginstatus(false);
                        request.setAttribute("loginstatus", status);
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }                    
                }
                else
                {
                    out.print("Error in connection");
                }
            }catch(IOException | ClassNotFoundException | SQLException | ServletException ex){
                
            }
            //------------------------END------------------------------------
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
