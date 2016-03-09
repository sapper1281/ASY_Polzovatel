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
<td colspan='23'>
<H2>Отчет о кол-ве введенных пользователей по СП</H2>
</td>
</tr>

<% try {  
  
   try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
          }catch(Throwable theException) {theException.printStackTrace();} 
       Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "11111111");  

String sql_0  =   " select ID,  ID_ROAD_ASU_TR, SN_ROAD, MY_ID_ROAD_ASU_TR "+
  " from ASU_POL.POLYGON_ROAD where ID_ROAD_ASU_TR in (123611,8,32005801,32008260,3706,75665,118960,122072,122734,113425) "+
  " order by SN_ROAD "; 
       
Statement stmt_0 = myconnection1.createStatement(); 
ResultSet rs_0 = stmt_0.executeQuery(sql_0); 

String sql_1_1=" select a0_0.SN_SYSTEM,a0_0.ID_SYSTEM,a0_0.CODE_USL,a0_0.SN_USL ";
String sql_1_2=" from (select a1.SN_SYSTEM,a1.ID_SYSTEM,a3.CODE_USL,a3.SN_USL from ASU_POL.POLYGON_SYSTEM as a1 "+
  " left join ASU_POL.SOOTV_SYS_USL as a2 on a1.ID_SYSTEM=a2.ID_SYSTEM "+
  " left join ASU_POL.POLYGON_USL as a3 on a3.ID_USL=a2.ID_USL  "+
  " where ID_PARRENT<>0 )as a0_0  ";
String sql_1_3=" ";
String sql_1_4=" ";
int k=1;  %>

<tr width="100%" >
<td  NOWRAP>Системы</td>
<td  NOWRAP>Код усл.</td>
<td  NOWRAP>Наименование усл.</td>
<%
while (rs_0.next()){
  
  boolean t=true;  
  String ROAD=", %";   
   int ID_ROAD_ASU_TR=rs_0.getInt("ID_ROAD_ASU_TR");
   String SN_ROAD=rs_0.getString("SN_ROAD").trim();


if(SN_ROAD.equals("ДУД")){%>
<td  NOWRAP>ЦД(ДУД)</td> 
<%}
   
if(SN_ROAD.equals("ДТ")){%>
<td  NOWRAP>ЦТ(ДТ)</td> 
<%}
if(!SN_ROAD.equals("ДТ")&&!SN_ROAD.equals("ДУД"))
{%>
   
  <td  NOWRAP><%=SN_ROAD%></td> 
  
   
   
  <%} SN_ROAD=  SN_ROAD.replace('"', '\"'); 
   int MY_ID_ROAD_ASU_TR=rs_0.getInt("MY_ID_ROAD_ASU_TR");
  
   while(t){
   if(MY_ID_ROAD_ASU_TR==0){t=!t; ROAD=SN_ROAD+ROAD;}
   else{

String sql_2  =   " select ID,  ID_ROAD_ASU_TR, SN_ROAD, MY_ID_ROAD_ASU_TR "+
  " from ASU_POL.POLYGON_ROAD where ID_ROAD_ASU_TR="+MY_ID_ROAD_ASU_TR+" "+
  " order by ID,ID_ROAD_ASU_TR; "; 
Statement stmt_2 = myconnection1.createStatement(); 
ResultSet rs_2 = stmt_2.executeQuery(sql_2); 

while (rs_2.next()){
  ROAD=", "+SN_ROAD+ROAD;
  ID_ROAD_ASU_TR=rs_2.getInt("ID_ROAD_ASU_TR");
  SN_ROAD=rs_2.getString("SN_ROAD").trim();
  SN_ROAD=  SN_ROAD.replace('"', '\"'); 
  MY_ID_ROAD_ASU_TR=rs_2.getInt("MY_ID_ROAD_ASU_TR");
}
rs_2.close();
stmt_2.close();
}
 }
  
   sql_1_1=sql_1_1+ ",a0_"+k+".w1 as w"+k+",a0_"+k+".f1 as f"+k+" ";
   sql_1_2=sql_1_2+
  " left join(  "+
  " select a0.w1,a0.SN_SYSTEM,a0.ID_SYSTEM,a0.f1 from "+
  " (select a2_0.w1,a1.SN_SYSTEM,a1.ID_SYSTEM_1 as ID_SYSTEM,  count(a1.SN_SYSTEM) as f1  "+
  " from ( "+
  " select a2.SN_SYSTEM,a2.ID_SYSTEM as ID_SYSTEM_1 ,a1.*   "+
  " from ASU_POL.SOOTV_USER_SYS as a1  "+
  " left join ASU_POL.POLYGON_SYSTEM as a2 on a1.id_system=a2.id_system  "+
  " where ID_PARRENT<>0 and del=0  "+
  " )as a1    "+
  " inner join (select '"+ROAD+"'as w1, ASU_POL.MAIN_USER_ALL.* from ASU_POL.MAIN_USER_ALL where ROAD like  '"+ROAD+"')  as a2_0   on a2_0.ID=a1.ID_USER  "+ 
  " group by a2_0.w1,a1.SN_SYSTEM ,a1.ID_SYSTEM_1 "+
  " order by a1.SN_SYSTEM ) as a0 )as a0_"+k+" on a0_0.ID_SYSTEM=a0_"+k+".ID_SYSTEM ";
  sql_1_3=sql_1_3 +" a0_"+k+".f1 is not null or"; 
  sql_1_4= " a0_"+k+".f1 is not null ";
   
   
k++;

}


%>
</tr>
<%
rs_0.close();
stmt_0.close();



 if(!sql_1_3.equals(" ")){
sql_1_3="where "+ sql_1_3+sql_1_4;
}
String sql_1=sql_1_1+sql_1_2+sql_1_3+" order by a0_0.SN_SYSTEM ";

Statement stmt_3 = myconnection1.createStatement(); 
ResultSet rs_3 = stmt_3.executeQuery(sql_1); 

while (rs_3.next()){
%>

<tr width="100%" >
<td  NOWRAP>
<%=rs_3.getString("SN_SYSTEM")%>
</td>

<td  NOWRAP>
<%=rs_3.getString("CODE_USL")%>
</td>

<td  NOWRAP>
<%=rs_3.getString("SN_USL")%>
</td>

<%

int dyd=0;
int dt=0;
for (int i=1;i<k;i++){
String f="f"+i;
if(i==2){dt=rs_3.getInt("f"+i);}
if(i==3){dyd=rs_3.getInt("f"+i);}

%>

<td  NOWRAP>
<%if(i==k-1){
int yu=rs_3.getInt("f"+i)-dyd-dt;
%><%=yu%><%
}else{%>
<%=rs_3.getInt("f"+i)%>
<%}%>
</td>
<%}%>
</tr>  
    
    
<%    }

rs_3.close();
stmt_3.close();
 myconnection1.close();} catch (SQLException e) {   %> <tr>Ошибка <%=e%></tr> <%}%>

</table>
<HR>
<%}%> 
<%}%>
