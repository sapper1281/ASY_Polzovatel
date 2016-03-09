
<%@page import= "com.Connection_ASU_POL"%>
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

<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){%>
<HR>
<table width="100%" border="1" >
<tr width="100%" >
<td >
<H2>Количество введенных пользователей</H2>
</td>
</tr>

<tr width="100%" >
<td >
<jsp:useBean id="conn" class="com.Connection_ASU_POL" scope="request"/>

<% Connection myconnection=conn.getConnection();%> 
<table>
<tr>
<td>

<table>

<%request.getParameter("sys")
 
 String vvod=
 
 
 
 
 
 
 
 
Statement stmt0 = myconnection.createStatement(); 
ResultSet rs0 = stmt0.executeQuery(vvod);




while (rs0.next()){
    
  %>
   
     
  <tr border=1>
  
   <td NOWRAP ><%=rs0.getString("LAST_NAME").trim()%> <%=rs0.getString("FIRST_NAME").trim()%> <%=rs0.getString("MIDDLE_NAME").trim()%></td>
 
  </tr>
  <% 
    
    
 
    
    
    
  }
rs0.close();
stmt0.close();    
    
%>



</table>



</td>
</tr>
</table>
<% conn.closeConnection(myconnection);%>

</td>
</tr>
</table>
<%}%> 
<HR>