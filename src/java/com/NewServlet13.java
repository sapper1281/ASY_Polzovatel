/*
 * NewServlet13.java
 * Сохранение данных при редактировании
 * 
 */

package com;


import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import java.text.*;
 
public class NewServlet13 extends HttpServlet {
    
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
        PrintWriter out_print = res.getWriter();
         String id_z_1 = req.getParameter("id_z_1");
         String user_1 = req.getParameter("user_1");
         String Oper_Tel = req.getParameter("Oper_Tel");
         String Oper_E_MAIL = req.getParameter("Oper_E_MAIL");
         String Oper_IP = req.getParameter("Oper_IP");
         String Oper_DT_BIG_Z = req.getParameter("Oper_DT_BIG_Z");
        // String Oper_DT_END_Z = req.getParameter("Oper_DT_END_Z");
         String Oper_FN_ROLE = req.getParameter("Oper_FN_ROLE");
         String Oper_FN_STAN = req.getParameter("Oper_FN_STAN");
         String Oper_ID_ROAD_ASU_TR = req.getParameter("Oper_ID_ROAD_ASU_TR");
         
         
        
          
         
         
         
         
         
         
         
       // Oper_ID_ROAD_ASU_TR
         
         
         
          // Oper_tel
        String out="";
        out=out+" "+ id_z_1;
         out=out+" "+user_1;
          out=out+" "+ Oper_Tel;
          out=out+" "+Oper_E_MAIL;
          out=out+" "+ Oper_IP;
          out=out+" "+ Oper_DT_BIG_Z;
          //out=out+" "+ Oper_DT_END_Z;
          out=out+" "+ Oper_FN_ROLE;
          out=out+" "+ Oper_FN_STAN;
          out=out+" "+ Oper_ID_ROAD_ASU_TR+"/n ";
        String UserID = "db2admin";
       String Password = "11111111";
       if(!session.isNew()){    
     SimpleDateFormat dateFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
     SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd-MM-yyyy");
     SimpleDateFormat dateFormatter3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
     
       
        
        String dday_p = Oper_DT_BIG_Z.substring(0,2); 
        int dday1_p=Integer.parseInt(dday_p);
        String mmonth_p = Oper_DT_BIG_Z.substring(3,5);
        int mmonth1_p=Integer.parseInt(mmonth_p)-1;
        String yyear_p = Oper_DT_BIG_Z.substring(6,10);
        int yyear1_p=Integer.parseInt(yyear_p);   
        Calendar DT_NOW=Calendar.getInstance(); 
        Calendar DT_NOW_1=Calendar.getInstance(); 
        String date=dateFormatter1.format(DT_NOW_1.getTime()).toString();
        String date_1=dateFormatter3.format(DT_NOW_1.getTime()).toString();
        
        DT_NOW.set(yyear1_p,mmonth1_p,dday1_p,0,0,0);
        String dt_big_z=dateFormatter1.format(DT_NOW.getTime()).toString();
      
       
        DT_NOW.set(yyear1_p+1,mmonth1_p,dday1_p,0,0,0);
        String dt_end_z=dateFormatter1.format(DT_NOW.getTime()).toString();                               
         
        
        
      /* dday_p = Oper_DT_END_Z.substring(0,2); 
         dday1_p=Integer.parseInt(dday_p);
         mmonth_p = Oper_DT_END_Z.substring(3,5);
         mmonth1_p=Integer.parseInt(mmonth_p)-1;
         yyear_p = Oper_DT_END_Z.substring(6,10);
         yyear1_p=Integer.parseInt(yyear_p); 
         DT_NOW.set(yyear1_p,mmonth1_p,dday1_p,0,0,0);
         String  dt_end_z=dateFormatter1.format(DT_NOW.getTime()).toString();  */ 
          
     
     
     
     
     
        
 Connection myconnection1=null;
      try {
        myconnection1 = new Connection_ASU_POL().getConnection();
    PreparedStatement stmt_up_MAIN_USER_ALL = myconnection1.prepareStatement(
  " UPDATE ASU_POL.MAIN_USER_ALL SET  " +
  " tel = '"+Oper_Tel+"' "+
  " , " +
  " ip= '"+Oper_IP+"'" +
  " , " +
  " e_mail= '"+Oper_E_MAIL+"'" +
   " where ID="+user_1+" ");
  stmt_up_MAIN_USER_ALL.executeUpdate();
  stmt_up_MAIN_USER_ALL.close();   
          out=out+" Обнавлен: ";
          out=out+" id пол.: "+user_1;
          out=out+" Тел.: "+ Oper_Tel;
          out=out+" mail: "+Oper_E_MAIL;
          out=out+" ip: "+ Oper_IP+"/n";
          
          
          
   
    PreparedStatement stmt_up_SOOTV_USER_SYS = myconnection1.prepareStatement(
  " UPDATE ASU_POL.SOOTV_USER_SYS SET  " +
  " id_role="+Oper_FN_ROLE+", "+
  " dt_big_z = '"+dt_big_z+"', "+
  " dt_end_z = '"+dt_end_z+"', "+
  " ID_STAN = "+Oper_FN_STAN+" "+
  " where ID="+id_z_1+" ");
  stmt_up_SOOTV_USER_SYS.executeUpdate();
  stmt_up_SOOTV_USER_SYS.close();   

     out=out+" Обнавлен: ";
          out=out+" id записи.: "+id_z_1;
          out=out+" id роли: "+ dt_big_z;
          out=out+" Дата начала актуальности: "+ dt_big_z;
          out=out+" Дата окончания актуальности: "+dt_end_z;
          out=out+" id стан.: "+ Oper_FN_STAN+"/n";

 //-------------------------------------------
 
 
 
 PreparedStatement stmt_up_SOOTV_USER_SYS_1 = myconnection1.prepareStatement(
  " UPDATE ASU_POL.SOOTV_USER_SYS SET  " +
  //" id_role="+Oper_FN_ROLE+", "+
  //" dt_big_z = '"+dt_big_z+"', "+
  //" dt_end_z = '"+dt_end_z+"', "+
  " ID_STAN = "+Oper_FN_STAN+" "+
  " where ID_User="+user_1+" ");
  stmt_up_SOOTV_USER_SYS_1.executeUpdate();
  stmt_up_SOOTV_USER_SYS_1.close();  
 
   out=out+" Обнавлен: ";
          out=out+" id пол.: "+user_1;
           out=out+" id стан.: "+ Oper_FN_STAN+"/n";
          
         //-----------стан
   
   
   Statement stmt4_1 = myconnection1.createStatement(); 
ResultSet rs4_1 = stmt4_1.executeQuery(" select ID, ID_USER, ID_STAN, DT_BIG, DT_END "+
  " from ASU_POL.SOOTV_USER_STAN "+
  " where ID_USER="+user_1+//" and  ID_STAN="+Oper_FN_STAN+" "+
  " order by ID "
  );
 

while (rs4_1.next()){
    
  PreparedStatement stmt_up_SOOTV_USER_STAN = myconnection1.prepareStatement(
  " UPDATE ASU_POL.SOOTV_USER_STAN SET  " +
  " ID_STAN = "+Oper_FN_STAN+" "+
  //" dt_end_z = '"+dt_end_z+"' "+
  " where ID="+rs4_1.getInt("ID")+" ");
  stmt_up_SOOTV_USER_STAN.executeUpdate();
  stmt_up_SOOTV_USER_STAN.close();  
  
  
  out=out+" Обнавлен: ";
        out=out+" id записи соотв пол. стан: "+rs4_1.getInt("ID")+" ";
        out=out+" id пол.: "+ user_1;
        out=out+" id стан.: "+ Oper_FN_STAN+"/n";
  
    
 }

rs4_1.close();
stmt4_1.close(); 


           
          
          
          
          
          
                  
          
 //--------сп
int id_sootv_org=0;  
Statement stmt = myconnection1.createStatement(); 
ResultSet rs = stmt.executeQuery(" select a1.ID "+
  " from ASU_POL.SOOTV_ROAD_STAN a1 where a1.ID_ROAD="+Oper_ID_ROAD_ASU_TR+" and   a1.ID_STAN="+Oper_FN_STAN+"  "
  ); 

/*if(!rs.next()){
out=out+" id 11111--: "+Oper_ID_ROAD_ASU_TR+"/n";
out=out+" id 11111--: "+Oper_FN_STAN+"/n";

/*String query = "insert into ASU_POL.SOOTV_ROAD_STAN (  ID_ROAD, ID_STAN,DT_BIG) values ( ?, ?, '"+date+"')";
      PreparedStatement myStmt = myconnection1.prepareStatement(query);
      myStmt.setInt(1,Integer.parseInt(Oper_ID_ROAD_ASU_TR));
      myStmt.setInt(2,Integer.parseInt(Oper_FN_STAN));
      myStmt.executeUpdate();
      myStmt.close();

out=out+" id insert 11111: /n";*/

/*

}else {out=out+" id 22222: "+rs.getInt("ID")+"/n";}*/
if(!rs.next()){

      String query = "insert into ASU_POL.SOOTV_ROAD_STAN (  ID_ROAD, ID_STAN,DT_BIG) values ( "+Oper_ID_ROAD_ASU_TR+", "+Oper_FN_STAN+", '"+date+"')";
      PreparedStatement myStmt = myconnection1.prepareStatement(query);
      //myStmt.setInt(1,Integer.parseInt(Oper_ID_ROAD_ASU_TR));
     // myStmt.setInt(2,Integer.parseInt(Oper_FN_STAN));
      myStmt.executeUpdate();
      myStmt.close();

Statement stmt1 = myconnection1.createStatement(); 
ResultSet rs1 = stmt1.executeQuery(" select a1.ID "+
  " from ASU_POL.SOOTV_ROAD_STAN a1 where a1.ID_ROAD="+Oper_ID_ROAD_ASU_TR+"  and a1.ID_STAN="+Oper_FN_STAN+"  "
  );
  while (rs1.next()){
  id_sootv_org=rs1.getInt("ID");
    out=out+" Обнавлен: ";
    out=out+" id введенной записи соотв. орг. стан.: "+rs1.getInt("ID")+" ";
    out=out+" id сп: "+ Oper_ID_ROAD_ASU_TR;
    out=out+" id стан.: "+ Oper_FN_STAN+"/n";
  }

rs1.close();
stmt1.close();      
}  else{id_sootv_org=rs.getInt("ID"); 
        out=out+" Обнавлен: ";
        out=out+" id существующей записи соотв. орг. стан.: "+rs.getInt("ID")+" ";
        out=out+" id сп: "+ Oper_ID_ROAD_ASU_TR;
        out=out+" id стан.: "+ Oper_FN_STAN+"/n";}
   rs.close();    
   stmt.close();          
          
         
 
   
   
   
   
          
          
          
          
          
          
     myconnection1.commit();
            } catch (Exception e) {
            e.printStackTrace();
            } finally {
            // Обязательно закрываем соединение с БД!
            new Connection_ASU_POL().closeConnection(myconnection1);
            }
    out_print.println(out); 
    
    
    
    
    
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