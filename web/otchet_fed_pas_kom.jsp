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
<H2>Отчет о кол-ве введенных пользователей ФПК</H2>
</td>
</tr>
<tr width="100%" >
<td >
<table border="1">

<%
SimpleDateFormat dateFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat dateFormatter3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS");
        Calendar DT_NOW_10=Calendar.getInstance(); 
        String DT_NOW_2 = dateFormatter3.format(DT_NOW_10.getTime()).toString();
%>
  
   <%--tr><%=DT_NOW_2%> </tr--%>   


<tr>



<td>    
      
  
 <%try {  
   int kol_vse=0;%>
   
   
       
         <tr bgcolor='#EEEEEE'>
             
 
 
 
  
       <% try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
          }catch(Throwable theException) {theException.printStackTrace();} 
       Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "11111111");  


       
       
String vvod0  =   " select count(a1.id_system)+1 as q "+
" from "+
" (select distinct id_system "+
  " from ASU_POL.SOOTV_USER_SYS as a1  "+
  " inner join ASU_POL.MAIN_USER_ALL as a3 on  a1.id_user=a3.id where ROAD like  'ОАО \"Федеральная пассажирская компания\"%'"+
   
  " and del=0) as a1 "+
  " left join ASU_POL.POLYGON_SYSTEM as a2 "+
  " on a1.id_system=a2.id_system "+
  " where ID_PARRENT<>0 "+
  " order by 1   "; 
       
 Statement stmt0_1 = myconnection1.createStatement(); 
ResultSet rs0_1 = stmt0_1.executeQuery(vvod0); 
int kol_sys=0;

while (rs0_1.next()){
 kol_sys=   rs0_1.getInt("q");} 
   

String[][] mas= new String[kol_sys][1000];      
   
  rs0_1.close();
stmt0_1.close();    


String vvod1  =   " select a2.SN_SYSTEM as q "+
" from "+
" (select distinct id_system "+
  " from ASU_POL.SOOTV_USER_SYS as a1  "+
  " inner join ASU_POL.MAIN_USER_ALL as a3 on  a1.id_user=a3.id where ROAD like  'ОАО \"Федеральная пассажирская компания\"%'"+
   
  " and del=0) as a1 "+
  " left join ASU_POL.POLYGON_SYSTEM as a2 "+
  " on a1.id_system=a2.id_system "+
  " where ID_PARRENT<>0 "+
  " order by 1   "; 
   
 Statement stmt0_2 = myconnection1.createStatement(); 
ResultSet rs0_2 = stmt0_2.executeQuery(vvod1);  
int is=1;
mas[0][0]="Структурное подразделение";
while (rs0_2.next()){
 mas[is][0]=rs0_2.getString("q");is++;}  
 rs0_2.close();
stmt0_2.close();    

    

String sql0=" select a0.Road,a0.ID_ROAD_ASU_TR ";

String sql=
" from( "+

" select a2.Road,a2.ID_ROAD_ASU_TR, count(a1.SN_SYSTEM) as f0 "+
 "  from (select a2.SN_SYSTEM,a1.*  "+
 "  from ASU_POL.SOOTV_USER_SYS as a1 "+
 "  left join ASU_POL.POLYGON_SYSTEM as a2 on a1.id_system=a2.id_system "+
 "  where ID_PARRENT<>0 and del=0 ) as a1   "+
 "   inner join (select * from ASU_POL.MAIN_USER_ALL where ROAD like  'ОАО \"Федеральная пассажирская компания\"%')  as a2   on a2.ID=a1.ID_USER "+  
 "   group by ROAD,ID_ROAD_ASU_TR "+
 "   order by ROAD ) as a0 ";





//" select distinct a2.Road,a2.ID_ROAD_ASU_TR "+
//" from  ASU_POL.MAIN_USER_ALL as a2  "+
//" where ROAD like  'ОАО \"Федеральная пассажирская компания\"%' "+
//" order by ROAD ) as a0 ";
for( int i=1;i<kol_sys;i++){
 mas[i][0]=  mas[i][0].replace('\'', ' '); 
      mas[i][0]=   mas[i][0].replace('"', ' '); 
     
     
     
     
sql0=sql0+" , a"+i+".f"+i+" ";
sql= sql+   
" left join  "+
"  ( "+
"   select a2.Road,a2.ID_ROAD_ASU_TR, count(a1.SN_SYSTEM) as f"+i+" "+
"   from (select a2.SN_SYSTEM,a1.*  "+
"   from ASU_POL.SOOTV_USER_SYS as a1 "+
"   left join ASU_POL.POLYGON_SYSTEM as a2 on a1.id_system=a2.id_system "+
"   where ID_PARRENT<>0 and del=0 and a2.SN_SYSTEM='"+mas[i][0]+"' ) as a1   "+
"    left join ASU_POL.MAIN_USER_ALL as a2   on a2.ID=a1.ID_USER   "+
"    group by ROAD,ID_ROAD_ASU_TR "+
"    order by ROAD) as a"+i+" on a0.ID_ROAD_ASU_TR=a"+i+".ID_ROAD_ASU_TR  ";    
    
    
}

//, a1.f1,
 
  /*left join 
 (
  select a2.Road,a2.ID_ROAD_ASU_TR, count(a1.SN_SYSTEM) as f1
  from (select a2.SN_SYSTEM,a1.* 
  from ASU_POL.SOOTV_USER_SYS as a1
  left join ASU_POL.POLYGON_SYSTEM as a2 on a1.id_system=a2.id_system
  where ID_PARRENT<>0 and del=0 and a2.SN_SYSTEM='NetOp Guest' ) as a1  
   left join ASU_POL.MAIN_USER_ALL as a2   on a2.ID=a1.ID_USER  
   group by ROAD,ID_ROAD_ASU_TR
   order by ROAD) as a1 on a0.ID_ROAD_ASU_TR=a1.ID_ROAD_ASU_TR 
*/


















for( int i=0;i<kol_sys;i++){
%>

<td><%=mas[i][0]%></td>


<%

}


%>





<%--

       
       String vvod  =
 
  " select a1.*,a2.* "+
  " from ASU_POL.SOOTV_USER_SYS as a1  "+
  " inner join ASU_POL.MAIN_USER_ALL as a2   on a2.ID=a1.ID_USER  "+
  " where del=0 "+
  " order by ROAD ";
      
Statement stmt0 = myconnection1.createStatement(); 
ResultSet rs0 = stmt0.executeQuery(vvod);
int sys_b=0;
int k=0;%>

  <%
String st="";
while (rs0.next()){
    String[] stt=rs0.getString("ROAD").split(",");   
if(!st.equals(stt[0])){

%>

<tr><td><%=stt[0]%></td></tr>

<%


st=stt[0];
}
    
    
    
  }
rs0.close();
stmt0.close();    
    
--%>
  

</tr>
<%

Statement stmt0_3 = myconnection1.createStatement(); 
ResultSet rs0_3 = stmt0_3.executeQuery(sql0+sql); 
//int kol_sys=0;
%>
<tr>

<%
while (rs0_3.next()){
    
 %> <td NOWRAP><%=rs0_3.getString("Road")%></td>  <%
for ( int i=1; i<kol_sys; i++){

if  (rs0_3.getString("f"+i+"")==null){

%>
<td>&nbsp</td>
<%
}else
    
 {

%>

<td><%=rs0_3.getString("f"+i+"")%></td>

<%
}   
    
    
}
%> </tr>  <%
} 
rs0_3.close();
stmt0_3.close();  
%>


<%








%>
<%--tr><%=sql0%> <%=sql%></tr--%>
<%
        
        Calendar DT_NOW=Calendar.getInstance(); 
        
        String DT_NOW_1 = dateFormatter3.format(DT_NOW.getTime()).toString();

%>
   
   <%--tr><%=sql0+sql%> </tr--%>  
   
   
   
   <%--tr><%=DT_NOW_1%> </tr--%>    
    <% myconnection1.close();} catch (SQLException e) {%> <tr>Ошибка <%=e%></tr> <%}%>
  </td>   


</tr>
</table>
</td>
</tr>
</table>

 
<HR>
<%}%> 
<%}%>