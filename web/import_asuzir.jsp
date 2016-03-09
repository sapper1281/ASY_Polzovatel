<%--@page import= "com.import_asuzir"%>
<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>

<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){%>
<HR>
<table width="100%" border="1" >
<tr width="100%" >
<td >
<H2>Заявки переданные из АСУ ЗИР</H2>
</td>
</tr>

<tr width="100%" >
<td >
<jsp:useBean id="Bean_import_asuzir" class="com.import_asuzir" scope="request"/>
<jsp:setProperty name="Bean_import_asuzir" property="*"/> 

<%Bean_import_asuzir.doPost(request,response);%> 
<table>
<tr>
<td>
<%=Bean_import_asuzir.getOUT()%>
</td>
</tr>
</table>
</td>
</tr>
</table>
<%}%> 
<HR>
<%--Bean_import_asuzir.doPost(request,response);--%>
<%--@page import= "com.import_asuzir"--%>
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
 <%Object lock = new Object(); 
synchronized(lock)
       {%>

<HR>
<table width="100%" border="1" >
<tr width="100%" >
<td >
<H2>Заявки переданные из АСУ ЗИР</H2>
</td>
</tr>
<tr width="100%" >
<td >
<table>
<tr>



<td>    
      
  
 <%try {  
   int kol_vse=0;%>
   
   
       
         <tr bgcolor='#EEEEEE'>
         <td NOWRAP >инф. система</td>
         <td NOWRAP >№ заявки АСУ ЗИР</td>
         <td NOWRAP >ФИО</td>
         <td NOWRAP >Дт. нач. действия заявки</td>
         <td NOWRAP >Дт. окончания действия заявки</td>
         </tr>         
 
 
 
  
       <% try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
          }catch(Throwable theException) {theException.printStackTrace();} 
       Connection myconnection1_2 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "11111111");  


       
       String vvod  =
 
  " select a1.ID_ZAYAV, a1.ID_REG, a1.ID_USER, a1.START_DATE, a1.END_DATE, a1.OP_STATION, a1.LN_USER, "+
  " a1.FN_USER, a1.SN_USER, a1.TEL_USER, a1.MAIL_USER, a1.T_NO, a1.ORGTX, a1.ID_RES,  "+
  " a3_1.SN_SYSTEM "+
  
  " from ASU_POL.ASU_ZIR_DOB a1 "+
  " left join ASU_POL.POLYGON_SYSTEM as a3_1 on a3_1.ID_SYSTEM=a1.ID_RES " +
  " union all"+
  " select a1.ID_ZAYAV, a1.ID_REG, a1.ID_USER, a1.START_DATE, a1.END_DATE, a1.OP_STATION, a1.LN_USER, "+
  " a1.FN_USER, a1.SN_USER, a1.TEL_USER, a1.MAIL_USER, a1.T_NO, a1.ORGTX, a1.ID_RES,  "+
  " a3_1.SN_SYSTEM "+
  
  " from ASU_POL.ASU_ZIR_DOB_1 a1 "+
  " left join ASU_POL.POLYGON_SYSTEM as a3_1 on a3_1.ID_SYSTEM=a1.ID_RES " +
  " order by SN_SYSTEM, LN_USER, FN_USER,SN_USER ";
      
Statement stmt0 = myconnection1_2.createStatement(); 
ResultSet rs0 = stmt0.executeQuery(vvod);
int sys_b=0;
int k=0;%>

  <%

while (rs0.next()){
    
  %>
   
     
  <tr border=1>
   <td NOWRAP ><%=rs0.getString("SN_SYSTEM").trim()%></td>
  <td NOWRAP><%=rs0.getString("ID_REG").trim()%></td>
  <td NOWRAP><%=rs0.getString("LN_USER").trim()%>  <%=rs0.getString("FN_USER").trim()%>  <%=rs0.getString("SN_USER").trim()%></td>
  <td NOWRAP><%=rs0.getString("START_DATE").trim()%></td>
  <td NOWRAP><%=rs0.getString("END_DATE").trim()%></td>
  
  </tr>
  <% kol_vse++;
    
    
    
 
    
    
    
  }
rs0.close();
stmt0.close();    
    
%>
  

<tr border=1>
   <td NOWRAP >Итог</td>
  <td NOWRAP><%=kol_vse%></td>
  
  </tr>

  </table> 
    
     
      
    <% myconnection1_2.close();} catch (SQLException e) {%> <tr>Ошибка <%=e%></tr> <%}%>
  </td>   


</tr>
</table>
</td>
</tr>
</table>

 
<HR>
<%}%> 
<%}%>