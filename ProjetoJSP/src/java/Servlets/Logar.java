/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

/**
 *
 * @author Renato
 */
public class Logar extends HttpServlet {

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
        
        try (PrintWriter out = response.getWriter()) {
            String login = request.getParameter("user");
            String senha = request.getParameter("senha");
            HttpSession session = request.getSession();
            try                 
            {
              if(login != null) 
              {
                Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/cruddb","root","");
                String sql = "SELECT * FROM usuarios WHERE usuario=? and senha=?";   
                PreparedStatement psm = conn.prepareStatement(sql);
                psm.setString(1, login);
                psm.setString(2, senha);
                ResultSet rs=psm.executeQuery();
                if(rs.next())
                {
                  response.sendRedirect("index.jsp");
                  session.setAttribute("usuario", login);
                  session.setMaxInactiveInterval(60 * 24);
                } 
                else 
                {
                  response.sendRedirect("login.jsp");
                  //out.println("Falha ao logar! Tente novamente");
                  session.setAttribute("usuario", "");
                }
              }
            } 
            catch (Exception ex) 
            {
              out.println("Exception :" + ex.getMessage());
            }
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