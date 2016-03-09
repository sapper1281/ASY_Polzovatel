/*
 * Autorization.java
 * Праверка пароля и логина
 * Created on 26 янваль 2010 г., 13:58
 */

package com;



import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;
import java.util.*;
import java.text.SimpleDateFormat;
/**
 *
 * @author  apopovkin
 * @version
 */
public class Autorization extends HttpServlet {
    
    /** Initializes the servlet.
     */
     public void init(ServletConfig config) throws ServletException {
        super.init(config);
       
    } 
    
    /** Destroys the servlet.
     */
    public void destroy() {
        
    }
    
    
    
    
  private String out1;
    public void setL_NAME(String out1){
    this.out1=out1;
}
 public String getL_NAME(){
 return out1;
 }
    
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    public void processRequest(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {
       req.setCharacterEncoding("Cp1251");
       String charset = "windows-1251";
       res.setContentType("text/html; charset=" + charset);
       String j_username = req.getParameter("j_username");
       String j_password = req.getParameter("j_password");
       HttpSession session = req.getSession();
       
       
       
       
      
      //session.setAttribute("d", SessionsCount+" "+now+" "+id); 
       
       
       
     
       
      // String UserID = "db2admin";
     //  String Password = "D2_12345678";
     //  String Password = "11111111";

     /*    try {
         Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
       }catch(Throwable theException) {theException.printStackTrace();}

       try {

     j_username=  j_username.replace('\'', ' ');
     j_username=  j_username.replace('"', ' ');
     j_password=  j_password.replace('\'', ' ');
     j_password=  j_password.replace('"', ' ');
        Connection myconnection = DriverManager.getConnection("jdbc:db2:ASU_POL4" , UserID, Password);
       
       */

       String out="";
       
        SimpleDateFormat dateFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat dateFormatter3 = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        
        Calendar time1=Calendar.getInstance(); 
        //out.print("Begin: "+dateFormatter3.format(time1.getTime()).toString()+"\n");
       String time=dateFormatter1.format(time1.getTime()).toString();
       
       
      


       
     j_username=  j_username.replace('\'', ' '); 
     j_username=  j_username.replace('"', ' '); 
     j_password=  j_password.replace('\'', ' '); 
     j_password=  j_password.replace('"', ' ');
     Connection myconnection=null;
      try {
        myconnection = new Connection_ASU_POL().getConnection();
        Statement stmt = myconnection.createStatement(); 
        ResultSet rs = stmt.executeQuery(
       
       
      " select a1.id, a1.FIRST_NAME, a1.LAST_NAME,a1.MIDDLE_NAME, a2.login, a3.id_role, a4.fn_role "+
      " from ASU_POL.MAIN_USER_ALL a1  "+
      " left join ASU_POL.ADMIN_PAS a2 on a1.ID=a2.ID_USER  "+
      " left join ASU_POL.SOOTV_USER_SYS a3 on a1.ID=a3.ID_USER and a2.ID_SOOTV_USER_SYS=a3.id  "+
      " left join ASU_POL.POLYGON_ROLE a4 on a4.id_role=a3.id_role "+
      " where a2.login='"+j_username+"' and a2.password='"+j_password+"' and a3.id_system=1 and a1.BLOCK_USER<>1 and "+
      " ((a3.DT_BIG<='"+time+"' and a3.DT_END>='"+time+"') or (a3.DT_BIG<='"+time+"' and a3.DT_END is null)) and  "+
      " ((a3.DT_BIG_Z<='"+time+"' and a3.DT_END_Z>='"+time+"') or (a3.DT_BIG_Z<='"+time+"' and a3.DT_END_Z is null))  and  "+
      " ((a2.DT_BIG<='"+time+"' and a2.DT_END>='"+time+"') or (a2.DT_BIG<='"+time+"' and a2.DT_END is null))  "
  

        
       // " select a1.FIRST_NAME, a1.LAST_NAME,a1.MIDDLE_NAME, a2.login "+
       // " from ASU_POL.MAIN_USER a1 "+
       // " left join ASU_POL.ADMIN_PAS a2 on a1.ID=a2.ID_USER "+
       // " where login='"+j_username+"' and password='"+j_password+"'"
        );

String ses1=null;
String ses2=null;
String ses3=null;
String ses4=null;
if (rs.next()){
    
    
    ServletContext servletContext = session.getServletContext();
    
 //  out=out+"<h4>"+session.getAttribute("SessionsTime")+" </h4>";
   // out=out+"<h4>"+session.getAttribute("attrName")+" </h4>"; 
   
    
     
    
    
    SessionTracking_class sessionTop= new SessionTracking_class();
             
             sessionTop.setses_Name(rs.getString("LAST_NAME")+" "+rs.getString("FIRST_NAME")+" "+rs.getString("MIDDLE_NAME"));
             sessionTop.setses_Time(Long.parseLong(session.getAttribute("SessionsTime").toString()));
    
             
             
             
             
          servletContext.setAttribute(session.getAttribute("attrName").toString(), sessionTop);
            
    
    
     
     
    
    out="<h4> Добрый день! </h4>"+
    "<h3> "+rs.getString("LAST_NAME")+" "+rs.getString("FIRST_NAME")+" "+rs.getString("MIDDLE_NAME")+" </h3>"+
    "<h1>"+rs.getString("login")+"</h1>"+
    "<h1>"+rs.getString("id_role")+"</h1>"+
    "<h1>"+rs.getString("fn_role")+"</h1>";
    
    
    

 
 session.setAttribute("LAST_NAME",rs.getString("LAST_NAME"));
 session.setAttribute("FIRST_NAME",rs.getString("FIRST_NAME"));
 session.setAttribute("MIDDLE_NAME",rs.getString("MIDDLE_NAME"));
 session.setAttribute("login",rs.getString("login"));
 session.setAttribute("id_role",rs.getString("id_role"));
 session.setAttribute("fn_role",rs.getString("fn_role"));
 session.setAttribute("id_us",rs.getString("id"));
  











String sys="";
 
  if(!session.getAttribute("id_role").equals("2")){
      //sys=" select a1.id, a1.id_system,a1.sn_system "+
      //" from ASU_POL.POLYGON_system a1  order by a1.sn_system";
     // }else{
      sys="  select  "+
	   " a5.id, a5.id_system,a5.sn_system  "+
	   " from ASU_POL.MAIN_USER_ALL a1   "+
           " left join ASU_POL.SOOTV_USER_SYS a3 on a1.ID=a3.ID_USER   "+
           " left join ASU_POL.POLYGON_ROLE a4 on a4.id_role=a3.id_role  "+
	   " left join ASU_POL.POLYGON_SYSTEM a5 on a5.ID_SYSTEM=a3.ID_SYSTEM  "+
	   " where a3.id_system<>1  "+
" and a1.id="+session.getAttribute("id_us")+
" and a3.id_role=2 and  a3.del=0 "+
           " order by a5.sn_system";
     
     Statement stmt_sys = myconnection.createStatement(); 
     ResultSet rs_sys = stmt_sys.executeQuery(sys); 




  String id_system_vse="";
    while(rs_sys.next()){
       id_system_vse=id_system_vse+" ID_SYSTEM= "+rs_sys.getString("id_system")+" or";
    }
id_system_vse=id_system_vse+" ID_SYSTEM=-999 ";

   session.setAttribute("ses_systems",id_system_vse);

rs_sys.close(); stmt_sys.close();

}
}
rs.close();
stmt.close();
/*myconnection.close();

    } catch (SQLException e) {out="yyyyyy  "+e;}*/

  

  
myconnection.commit();
            } catch (Exception e) {
            e.printStackTrace();
            } finally {
            // Обязательно закрываем соединение с БД!
            new Connection_ASU_POL().closeConnection(myconnection);
            }



     setL_NAME(out);
       
      
    }
    
   
    
    
    
    
   
    Object lock = new Object(); 
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    synchronized(lock)
    {processRequest(request, response);}
    }
    
   
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        synchronized(lock)
        {processRequest(request, response);}
    }
    
    
    
    public String getServletInfo() {
        return "Short description";
    }
    
}





