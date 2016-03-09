

<%@ page import="java.util.*" %>
<%@page import= " java.io.*"%>
<%@page import= " java.util.*"%>
<%@page import= " javax.servlet.*"%>
<%@page import= " javax.servlet.http.*"%>
<%@page import= " java.sql.*"%>
<%@page import= " java.net.*"%>
<%@page import= " java.lang.*"%>
<%@page import= " java.io.*"%>
<%@page import= " java.net.*"%>
<%@page import= " javax.servlet.*"%>
<%@page import= " javax.servlet.http.*"%>
<%@page import= " java.util.Date"%>
<%@page import= " javax.naming.InitialContext"%>
<%@page import= " javax.sql.DataSource"%>
<%@page import= " java.sql.*"%>
<%@page import= " java.util.*"%>
<%@page import= " javax.naming.*"%>
<%@page import= " java.text.*"%>
<%@page import= " java.lang.*"%>
<%@page import= " javax.swing.*"%>
<%@page import= " java.awt.event.*"%>
<%@page import= " java.applet.*"%>
<%@page import= " java.text.ParseException"%>
<%@page import= " java.text.SimpleDateFormat"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

 <% if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){
response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");
      
       
     /*  try{
       Thread.sleep(1000);
} catch(Exception ex){ex.printStackTrace();}     
 */

//int v=Integer.parseInt(session.getValue("v").toString())+1;
//String d=""+v;
//session.putValue("v", d) ;

Object lock = new Object();
            synchronized (lock) {  
 int ss= Integer.parseInt(request.getParameter("ss"));
               
 String dt="";               
    // session.putValue("v", "0") ;  
try{
    
    try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
         }catch(Throwable theException) {theException.printStackTrace();} 
    Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "11111111");  

   
    String sp=" select ID, CODE_ROAD_ASU_TR, ID_ROAD_ASU_TR, SN_ROAD, FN_ROAD, "+ 
    " MY_ID_ROAD_ASU_TR, MY_ID_ROAD, DT_BIG, DT_END, STATUS, TYPE,  "+ 
    " PR_SERV, DT_VVOD, R3 "+ 
    " from ASU_POL.POLYGON_ROAD where (MY_ID_ROAD_ASU_TR="+ss+" and R3='yes' and "+
    " DT_VVOD=(select max(DT_VVOD) from ASU_POL.POLYGON_ROAD)) or (MY_ID_ROAD_ASU_TR="+ss+" and R3='not') "+ 
    " order by ID,ID_ROAD_ASU_TR ";  
      
     Statement stmt_sp = myconnection1.createStatement(); 
     ResultSet rs_sp = stmt_sp.executeQuery(sp); 


 while(rs_sp.next()){

 dt=dt+"<ul><ol><button onclick=\"Click_but_SP('"+rs_sp.getString("ID_ROAD_ASU_TR")+"')\" id=\"but"+rs_sp.getString("ID_ROAD_ASU_TR")+"\">+</button><input type=\"checkbox\" id=\"A_0\"   name=\"A_0\"  value='"+rs_sp.getString("ID_ROAD_ASU_TR")+"' />"+
        rs_sp.getString("SN_ROAD")+"<div id=\"div"+rs_sp.getString("ID_ROAD_ASU_TR")+"\"><img src=\"images/status_anim.gif\" style=\"display:none\" id=\"img"+rs_sp.getString("ID_ROAD_ASU_TR")+"\"/></div></ol></ul>";

  }   rs_sp.close(); stmt_sp.close();
 myconnection1.close();} catch (SQLException e) {e.printStackTrace();}
out.println(dt);}
//out.println("dddddd"+request.getParameter("ss"));}
  } %>