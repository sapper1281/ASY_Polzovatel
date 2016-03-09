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

 <%
SimpleDateFormat dateFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat dateFormatter3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS");
        
        Calendar DT_NOW_10=Calendar.getInstance(); 
        
        String DT_NOW_2 = dateFormatter3.format(DT_NOW_10.getTime()).toString();

%>
<%--tr><%=DT_NOW_2%> </tr--%>         
       
<HR>
<table width="100%" border="1" >
<tr width="100%" >
<td >
<H2>Отчет о введенных пользователей ФПК</H2>
</td>
</tr>
<tr width="100%" >
<td >
<table border="1">


    
<%try {  
   int kol_vse=0;%>
<tr bgcolor='#EEEEEE'>
<td>Инф. ресурс</td>
<td>ФИО</td>
<td>Должность</td>
<td>СП</td>
<td>Роль</td>
</tr>
             
 
 
 
  
       <% try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
          }catch(Throwable theException) {theException.printStackTrace();} 
       Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "11111111");  


       
       
String vvod0  =   

" select a1.SN_SYSTEM, a2.last_name,a2.first_name,a2.middle_name,a2.sn_job,a2.ROAD,a1_0.FN_ROLE   "+
 "   from (select a2.SN_SYSTEM,a1.*   "+
 "   from ASU_POL.SOOTV_USER_SYS as a1  "+
 "   left join ASU_POL.POLYGON_SYSTEM as a2 on a1.id_system=a2.id_system  "+
 "   where ID_PARRENT<>0 and del=0 ) as a1    "+
 "    inner join (select * from ASU_POL.MAIN_USER_ALL where ROAD like  'ОАО \"Федеральная пассажирская компания\"%')  as a2   on a2.ID=a1.ID_USER  "+
 " left join ASU_POL.POLYGON_ROLE as a1_0 on a1.ID_ROLE=a1_0.ID_ROLE "+
 "   order by SN_SYSTEM,ROAD,Last_name,first_name,middle_name ";



 
       
 Statement stmt0_1 = myconnection1.createStatement(); 
ResultSet rs0_1 = stmt0_1.executeQuery(vvod0); 
int kol_sys=0;

while (rs0_1.next()){

%>
    
<tr>
<td NOWRAP><%=rs0_1.getString("SN_SYSTEM")%></td> 
<td NOWRAP><%=rs0_1.getString("last_name")%> <%=rs0_1.getString("first_name")%> <%=rs0_1.getString("middle_name")%></td> 
<td NOWRAP><%=rs0_1.getString("sn_job")%></td> 

<td NOWRAP><%=rs0_1.getString("ROAD")%></td> 
<td NOWRAP><%=rs0_1.getString("FN_ROLE")%></td> 

</tr>
 <%  

} 
   
   
rs0_1.close();
stmt0_1.close();    
%>
<% myconnection1.close();} catch (SQLException e) {%> <tr>Ошибка <%=e%></tr> <%}%>

</table>
</td>
</tr>
</table>

 
<HR>
<%
        
        Calendar DT_NOW=Calendar.getInstance(); 
        
        String DT_NOW_1 = dateFormatter3.format(DT_NOW.getTime()).toString();

%>
 <%--tr><%=DT_NOW_1%> </tr--%> 
<%}%> 
<%}%>