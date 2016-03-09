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



<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>

<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)&&(session.getValue("id_us").equals("35341"))){%>
 <%Object lock = new Object(); 
synchronized(lock)
       {%>

<HR>
<table width="100%" border="1" >
<tr width="100%" >
<td >
<H2>Пользователи АСУ Пользователь</H2>
</td>
</tr>

<tr width="100%" >
<td >
<div style="OVERFLOW: auto; WIDTH: 800px; HEIGHT: 300px"> 
<table   >
    
      
  
 <%try {  
   int kol_vse=0;%>
   
<tr style='position: relative;
        top: expression(this.parentElement.parentElement.parentElement.scrollTop)' bgcolor='#B2B2B2' border=1>
<td NOWRAP >ФИО</td>
<td NOWRAP >Логин</td>
<td NOWRAP >Пароль</td>
<td NOWRAP >Тел.</td>
<td NOWRAP >Mail</td>
</tr>         
 
 
 
  
       <% try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
          }catch(Throwable theException) {theException.printStackTrace();} 
       Connection myconnection1_2 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "11111111");  

 //Connection myconnection1_2 = DriverManager.getConnection("java:comp/env/jdbc/asu_pol" , "db2admin", "11111111");  

String vvod  =
" select  a1.LOGIN, a1.PASSWORD,a2.LAST_NAME, a2.FIRST_NAME, a2.MIDDLE_NAME, a2.TEL, a2.IP, a2.E_MAIL "+
" from ASU_POL.ADMIN_PAS as a1  "+
" left join ASU_POL.MAIN_USER_ALL as a2 on a1.ID_USER=a2.ID "+
" where a1.dt_end is null order by a2.LAST_NAME,a2.FIRST_NAME, a2.MIDDLE_NAME ";
      
Statement stmt0 = myconnection1_2.createStatement(); 
ResultSet rs0 = stmt0.executeQuery(vvod);
int sys_b=0;
int k=0;%>

  <%
boolean t=false;
while (rs0.next()){ %>
<tr bgcolor= <% if(t){ %>'#E4E2E0'<% t=!t;}else{%>'#F0F0F0'<%t=!t;}%> border=1>
<td NOWRAP><%=rs0.getString("LAST_NAME").trim()%>  <%=rs0.getString("FIRST_NAME").trim()%>  <%=rs0.getString("MIDDLE_NAME").trim()%></td>
<td NOWRAP><%=rs0.getString("LOGIN").trim()%></td>
<td NOWRAP><%=rs0.getString("PASSWORD").trim()%></td>  
<td NOWRAP><%=rs0.getString("TEL").trim()%></td>
<td NOWRAP><%=rs0.getString("E_MAIL").trim()%></td>
</tr>
<% kol_vse++;}
rs0.close();
stmt0.close();    
%>
  
<tr border=1>
<td NOWRAP >Итог</td>
<td NOWRAP><%=kol_vse%></td>
</tr>

<% myconnection1_2.close();} catch (SQLException e) {%> <tr><td>Ошибка <%=e%></td></tr> <%}%>
  
</table> 
</div>
</td>
</tr>
</table>

 
<HR>
<%}%> 
<%}%>