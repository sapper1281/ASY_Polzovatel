
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

<%--системы возврат пользователей--%>

<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>

<%if(session.getValue("id_role").equals("2")||session.getValue("id_role").equals("3")||session.getValue("id_role").equals("4")){
response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");%>
 <%Object lock = new Object(); 
synchronized(lock)
       {   
%>

<jsp:useBean id="conn" class="com.Connection_ASU_POL" scope="request"/>
<%try {

   // try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
   //       }catch(Throwable theException) {theException.printStackTrace();} 
    //   Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "11111111");  
 Connection myconnection1=conn.getConnection();

%> 
<table border='4'>
<tr>
<td>
<div style="OVERFLOW: auto; WIDTH: 1300px; HEIGHT: 600px"> 
<% 
 String par=request.getParameter("par");
  int tt=1;
 String rol_us="";
    if(session.getValue("id_role").equals("2")){         
      rol_us= " ";
      }else{
      
  rol_us= " and a1.ID_ROLE<>2 ";}
 
 String q="   (a1.ID_SYSTEM=-2 ";
int k1=-1;
 for (int j_1 = 0; j_1 < par.length(); j_1++){
        if (String.valueOf(par.charAt(j_1)).equals("|")){
        if(k1!=-1){
String k2=par.substring(k1+1,j_1);
q=q+" or a1.ID_SYSTEM="+k2;
}
            k1=j_1;
        }}	
	             
q=q+ " ) ";	            
	             
 String pol=" select  a1.ID, a1.ID_USER,a1.DT_BIG_Z, a1.DT_END_Z,  "+
"   a2.ID_ROAD_ASU_TR,a2.TAB_NUM,a2.BLOCK_USER,a2.LAST_NAME,a2.FIRST_NAME,a2.MIDDLE_NAME,a2.TEL,a2.IP,a2.E_MAIL,a2.DT_BIG,a2.DT_END, "+ 
"   a3.CODE_SYSTEM,a3.SN_SYSTEM,  "+
"   a5.CODE_USL,a5.FN_USL,  "+
"   a6.FN_ROLE,  "+
"  a8.FN_STAN,   "+
"   a2.ROAD,  "+

"   a2.SN_JOB  "+
//"   from   "+
//"   (select  a2.ID, a2.ID_ROAD_ASU_TR,a2.TAB_NUM,a2.BLOCK_USER,a2.LAST_NAME,a2.FIRST_NAME,a2.MIDDLE_NAME,a2.TEL,a2.IP,a2.E_MAIL,a2.DT_BIG,a2.DT_END, "+  
//"    'ff' as SN_JOB   "+
//"    a10.SN_JOB   "+
"   from ASU_POL.MAIN_USER_ALL as a2  "+
//"   left join ASU_POL.SOOTV_JOB_ASUTR as a9 on a2.ID_JOB=a9.ID_JOB_ASU_TR   "+
//"  left join ASU_POL.POLYGON_JOB as a10 on a9.ID_JOB=a10.ID " +
//" ) as a2  "+
"  inner join ASU_POL.SOOTV_USER_SYS as a1  on a1.ID_USER=a2.ID and a1.DT_END is  null and "+q+" "+rol_us+" "+
"   left join ASU_POL.POLYGON_SYSTEM as a3 on a1.ID_SYSTEM=a3.ID_system   "+
"   left join ASU_POL.SOOTV_SYS_USL as a4 on a1.ID_SYSTEM=a4.ID_system  "+ 
"   left join ASU_POL.POLYGON_USL as a5 on a1.ID_USL=a5.ID_USL   "+
"   left join ASU_POL.POLYGON_ROLE as a6 on a1.ID_ROLE=a6.ID_ROLE  "+
//"   left join ASU_POL.SOOTV_ROAD_STAN as a7 on a2.ID_ROAD_ASU_TR=a7.ID_ROAD  "+ 
//"   left join ASU_POL.POLYGON_STAN as a8 on a7.ID_STAN=a8.ID_STAN   "+
" left join ASU_POL.POLYGON_STAN as a8 on a1.ID_STAN=a8.ID_STAN "+
"    order by a3.FN_SYSTEM,a2.LAST_NAME,a2.FIRST_NAME,a2.MIDDLE_NAME ";
 

Statement stmt_pol = myconnection1.createStatement(); 
     ResultSet rs_pol = stmt_pol.executeQuery(pol);%>
     
<table >     
 
   
 <% String sys_pol="";
  int kol_1=2;
while (rs_pol.next()){  
String sys_pol_1=rs_pol.getString("SN_SYSTEM");
 if(!sys_pol_1.equals(sys_pol)){
     sys_pol=sys_pol_1;kol_1=2;
%>
<tr >
<td colspan='19'>
<HR>
</td>
</tr> 
<tr bgcolor='#B2B2B2'>
<td colspan='19'> <h3><%=sys_pol%></h3></td>
</tr> 
<tr bgcolor='#B2B2B2'>
<td  NOWRAP> № </td>
<td  NOWRAP> ФИО </td>
<td  NOWRAP> Станция </td>
<td  NOWRAP> Телефон </td>
<td  NOWRAP> Должность </td>
<td  NOWRAP> Место работы </td>
<td  NOWRAP> IP </td>
<td  NOWRAP> e-mail </td>
<td  NOWRAP> Роль </td>
<td  NOWRAP> Дт. начала </td>
<td  NOWRAP> Дт. окончания </td>
<td  NOWRAP> id </td>


</tr> 


<%}
 String Road_user = "";
if(rs_pol.getString("FIRST_NAME")!=null){ 
    
    //String Road_user="";

if((Road_user=rs_pol.getString("ROAD"))==null){

Road_user="";
}
 //String Road_user = "";


boolean t_dor=true;
   int Id_str=rs_pol.getInt("ID_ROAD_ASU_TR");     
          
    
    
    
    
 /*   boolean t_dor=true;
   int Id_str=rs_pol.getInt("ID_ROAD_ASU_TR");
  
    
   while(t_dor){
  
   Statement stmt_2_0 = myconnection1.createStatement(); 
ResultSet rs_2_0 = stmt_2_0.executeQuery(" select ID, CODE_ROAD_ASU_TR, ID_ROAD_ASU_TR, SN_ROAD, FN_ROAD, "+
    " MY_ID_ROAD_ASU_TR, MY_ID_ROAD, DT_BIG, DT_END, STATUS, TYPE "+
    " from ASU_POL.POLYGON_ROAD  "+
    " where ID_ROAD_ASU_TR="+Id_str+" "+
     "and " +
   " DT_VVOD=(select DT_VVOD1 from(select max(DT_VVOD) as DT_VVOD1  from ASU_POL.POLYGON_ROAD ) as sa )  "
 
   ); 
if(rs_2_0.next()){
if(rs_2_0.getFetchSize()!=0){
Road_user=rs_2_0.getString("FN_ROAD").trim()+", "+Road_user;
Id_str=rs_2_0.getInt("MY_ID_ROAD_ASU_TR");
}
}
  else{
Road_user="Не определено"+Road_user;
t_dor=false;
}
if(t_dor){t_dor=Id_str!=0;}
//t_dor=false;
stmt_2_0.close();
rs_2_0.close();
   }  */


}  
 





%>   



<tr
<%if(tt==1){%>bgcolor='#E4E2E0'<% tt=0;}else {%>  bgcolor='#F0F0F0'<%tt=1;}%>


>
<td><%=kol_1-1%>.</td>

<td NOWRAP><%=rs_pol.getString("LAST_NAME")%>  <%=rs_pol.getString("FIRST_NAME")%> <%=rs_pol.getString("MIDDLE_NAME")%>
</td>
<td NOWRAP > <%=rs_pol.getString("FN_STAN")%></td>
<td NOWRAP> <%=rs_pol.getString("TEL")%></td>
<td NOWRAP > <%=rs_pol.getString("SN_JOB")%></td>
<td NOWRAP> <%=Road_user%></td>
<td NOWRAP> <%=rs_pol.getString("IP")%></td>
<td NOWRAP> <%=rs_pol.getString("E_MAIL")%></td>
<td NOWRAP > <%=rs_pol.getString("FN_ROLE")%></td>
<td NOWRAP> <%=rs_pol.getString("DT_BIG_Z")%></td>
<td NOWRAP> <%=rs_pol.getString("DT_END_Z")%></td>
<td  NOWRAP  > <%=rs_pol.getInt("id")%> </td>


</tr>









<%kol_1++;
  } 
rs_pol.close();
stmt_pol.close();
%>    
</table>  
   


</DIV>
</td>
</tr>


</TABLE>

<%  conn.closeConnection(myconnection1);} catch (SQLException e) {%> <tr>Ошибка <%=e%></tr> <%}%>
<%}%> 
<%}%>