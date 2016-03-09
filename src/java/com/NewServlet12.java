/*
 * NewServlet12.java
 * удаление
 * 
 */

package com;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import java.text.*;
 
public class NewServlet12 extends HttpServlet {
    
   public void init(ServletConfig config) throws ServletException {
        super.init(config);
       
        
    }  
    
     private String out1;
    public void setOUT(String out1){
    this.out1=out1;
}
 public String getOUT(){
 return out1;
 }
   public void processRequest(HttpServletRequest req, HttpServletResponse res)
         throws ServletException, IOException {
     
        req.setCharacterEncoding("UTF-8");
        String charset = "windows-1251";
        res.setContentType("text/html; charset=" + charset);  
        HttpSession session = req.getSession();
        PrintWriter out11 = res.getWriter();
         String id_z_1 = req.getParameter("id_z_1");
        // String Oper_Type = req.getParameter("Oper_Type");
         String user_1 = req.getParameter("user_1");
         String pref = req.getParameter("pref");
         
          // Oper_tel
        String out="";
        String UserID = "db2admin";
       String Password = "11111111";
       if(!session.isNew()){    
     SimpleDateFormat dateFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
     SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd-MM-yyyy");
     SimpleDateFormat dateFormatter3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
     
       
        Calendar DT_NOW=Calendar.getInstance(); 
        String date=dateFormatter1.format(DT_NOW.getTime()).toString();
        
     
     
   

    String sql=""; 
     
     //   String id_system_1 = req.getParameter("system_sel_0");
   if(pref.equals("del")){
     sql=  " UPDATE ASU_POL.SOOTV_USER_SYS SET del=1, DT_END = '"+date+"' where id="+id_z_1+" ";
        
      
       out=out+"запись "+id_z_1+" заблокирована";}
   if(pref.equals("out_del")){
     sql=  " UPDATE ASU_POL.SOOTV_USER_SYS SET del= 0, DT_END = null where id="+id_z_1+" ";
        
      
       
       out=out+"запись "+id_z_1+" востановлена";}
           
      Connection myconnection1=null;
      try {
        myconnection1 = new Connection_ASU_POL().getConnection();
    PreparedStatement stmt_up = myconnection1.prepareStatement(
  sql);
  stmt_up.executeUpdate();
  stmt_up.close(); 
    
    
    myconnection1.commit();
            } catch (Exception e) {
            e.printStackTrace();
            } finally {
            // Обязательно закрываем соединение с БД!
            new Connection_ASU_POL().closeConnection(myconnection1);
            }
    out11.println(out); 
   }}
    
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