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
<%@page import= "com.Connection_ASU_POL"%>


<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>

<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){%>
 <%Object lock = new Object(); 
synchronized(lock)
       {%>

<jsp:useBean id="conn" class="com.Connection_ASU_POL" scope="request"/>
<table border="1">
<tr>



<td>    
      
  
 <%try {  
    
   int kol_vse=0;%>
   
  
       
         <tr bgcolor='#EEEEEE'>
         <td NOWRAP >инф. ресурс</td>
     <td NOWRAP >Ф.И.О.</td>
     <td NOWRAP >Телефон</td>
     <td NOWRAP >E-MAIL</td>
     <td NOWRAP >СП</td>
         </tr>         
 
 
 
  
       <% //try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
          //}catch(Throwable theException) {theException.printStackTrace();} 
      // Connection myconnection1_2 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "11111111");  
   Connection myconnection=conn.getConnection();

       
       String vvod  =
 
 " select   "+
	   "  a5.id, a5.id_system,a5.sn_system,a1.LAST_NAME,a1.FIRST_NAME,a1.MIDDLE_NAME,a1.TEL,a1.E_MAIL,a1.ROAD   "+
	   "  from ASU_POL.SOOTV_USER_SYS a3   "+
           "  left join ASU_POL.MAIN_USER_ALL a1 on a1.ID=a3.ID_USER    "+
           "  left join ASU_POL.POLYGON_ROLE a4 on a4.id_role=a3.id_role  "+
	   "  left join ASU_POL.POLYGON_SYSTEM a5 on a5.ID_SYSTEM=a3.ID_SYSTEM   "+
	   "  where a3.id_role=2 and a3.dt_end is null and a3.del=0 and a5.id_parrent<>0 and a5.id_system="+request.getParameter("sys")+" "+ 
	   "  order by 1 ";
      
Statement stmt0 = myconnection1_2.createStatement(); 
ResultSet rs0 = stmt0.executeQuery(vvod);
int sys_b=0;
int k=0;%>

  <%

while (rs0.next()){
    
  %>
   
     
  <tr border=1>
  <td NOWRAP ><%=rs0.getString("SN_SYSTEM").trim()%></td>
   <td NOWRAP ><%=rs0.getString("LAST_NAME").trim()%> <%=rs0.getString("FIRST_NAME").trim()%> <%=rs0.getString("MIDDLE_NAME").trim()%></td>
  <td NOWRAP><%=rs0.getString("TEL").trim()%></td>
  <td NOWRAP><%=rs0.getString("E_MAIL").trim()%></td>
  <td NOWRAP><%=rs0.getString("ROAD").trim()%></td>
 
  </tr>
  <% 
    
    
 
    
    
    
  }
rs0.close();
stmt0.close();    
    
%>
  



  </table> 
    
     
      
    <% conn.closeConnection(myconnection);} catch (SQLException e) {%> <tr>Ошибка <%=e%></tr> <%}%>
 
<%}%> 
<%}%>