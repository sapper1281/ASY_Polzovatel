/*
 * block.java
 *
 * 
 */

package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;



public class block extends HttpServlet {
    
   public void init(ServletConfig config) throws ServletException {
        super.init(config);
        
    } 
    
   
   private String out1;
    public void setOUT(String out1){
    this.out1=out1;}
   public String getOUT(){
   return out1;}
   
   
   
   
   
    
   public void processRequest(HttpServletRequest req, HttpServletResponse res)
         throws ServletException, IOException {
      
        req.setCharacterEncoding("UTF-8");
        String charset = "windows-1251";
        res.setContentType("text/html; charset=" + charset);  
        HttpSession session = req.getSession();
        String UserID = "db2admin";
        String Password = "11111111";
        PrintWriter out_print= res.getWriter();
        String out="отказ";
        String idus = req.getParameter("idus");
        
        
         if(!session.isNew()){         
           
   Connection myconnection1=null;
 try {
        myconnection1 = new Connection_ASU_POL().getConnection();

      PreparedStatement stmt_up = myconnection1.prepareStatement(
      " UPDATE ASU_POL.SOOTV_USER_SYS_BLOCK SET del=4 where id="+idus+" ");
      stmt_up.executeUpdate();
      stmt_up.close(); 
      
       out="блок.";
      myconnection1.commit();
            } catch (Exception e) {
            e.printStackTrace();
            } finally {
            // Обязательно закрываем соединение с БД!
            new Connection_ASU_POL().closeConnection(myconnection1);
            }
      }
       
      
      out_print.println(out);    
      
      
      
   }
   Object lock = new Object(); 
   
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         synchronized(lock)
       {processRequest(request, response);}
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         synchronized(lock)
       {processRequest(request, response);}
    }
    
   
   public String getServletInfo() {
      return "A session tracking servlet";
   }
} 