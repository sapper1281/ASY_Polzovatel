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
<H2>Отделы вводящие информацию в АСУ Пользователь</H2>
</td>
</tr>
<tr width="100%" >
<td >
<table border="1">
<tr>



<td>    
      
  
 <%try {  
   int kol_vse=0;%>
   
   
       
         <tr bgcolor='#EEEEEE'>
         <td NOWRAP >Отдел</td>
         <td NOWRAP >Код инф. ресурса</td>
         <td NOWRAP >Наименование инф. ресурса</td>
         </tr>         
 
 
 
  
       <% try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
          }catch(Throwable theException) {theException.printStackTrace();} 
       Connection myconnection1_2 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "11111111");  


       
       String vvod  =
 
 " select distinct rtrim(a3.ROAD) as road,a1.ID_SYSTEM,rtrim(a2.SN_SYSTEM) as SN_SYSTEM, a3.ID_ROAD_ASU_TR "+
" from ASU_POL.SOOTV_USER_SYS as a1 "+
  " left join ASU_POL.POLYGON_SYSTEM as a2 on a1.ID_SYSTEM=a2.ID_SYSTEM "+
  " left join ASU_POL.MAIN_USER_ALL as a3 on a3.ID=a1.ID_USER "+
  " where ID_ROLE=2 and del=0 and ID_PARRENT<>0 "+
  " order by 1,3 ";
      
Statement stmt0 = myconnection1_2.createStatement(); 
ResultSet rs0 = stmt0.executeQuery(vvod);
int sys_b=0;
int k=0;%>

  <%

while (rs0.next()){
    
  %>
   
     
  <tr border=1>
   <td NOWRAP ><a href="<%=request.getContextPath()%>/otdel_vvod_adm.jsp?sys=<%=rs0.getInt("ID_SYSTEM")%>&road=<%=rs0.getInt("ID_ROAD_ASU_TR")%>" target=_blank><%=rs0.getString("road").trim()%></td>
  <td NOWRAP><%=rs0.getInt("ID_SYSTEM")%></td>
  <td NOWRAP><%=rs0.getString("SN_SYSTEM").trim()%></td>
  
  </tr>
  <% 
    
    
 
    
    
    
  }
rs0.close();
stmt0.close();    
    
%>
  



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