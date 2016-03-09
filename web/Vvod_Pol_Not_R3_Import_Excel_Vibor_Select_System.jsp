

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

<%

Object lock = new Object(); 
synchronized(lock)
     {
     
   if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)&&((session.getValue("id_role").equals("2"))||(session.getValue("id_role").equals("3")))){
response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");

    %> 

   <script type="text/javascript"> 
  function CHEKSYSALL(oForm, cbName, nn) 
         {
        if(document.getElementsByName(cbName)(0).checked){
        for (var i=0; i < document.getElementsByName(cbName).length; i++){ 
        document.getElementsByName(cbName)(i).checked=true;} }
        else{
for (var i=0; i < document.getElementsByName(cbName).length; i++){ 
        document.getElementsByName(cbName)(i).checked=false;} }
}      
  



function Click(cbName1,as,cbName2) 
         { 
          var sys="";           
     
         
         for (var i=0; i < document.getElementsByName(cbName1).length; i++){ 
         if(document.getElementsByName(cbName1)(i).checked==true){
         if(i==0){
         sys= sys+'!_'+document.getElementsByName(cbName1)(i).value+'_';}
         else{
         sys= sys+'!_'+document.getElementsByName(cbName1)(i).value+'_'+document.getElementsByName(cbName2)(i-1).value+'_';}
         }}
         
         //alert(sys);
         sys=sys+'!';
         if(sys=='!'){alert('Выбирите систему');



}
         else{
        
if(window.opener) {
         window.opener.document.getElementById(as).value="Выбрано";
         window.opener.document.getElementById(as).style.background="#00FF00";
         window.opener.document.getElementById(as).title=sys;
         window.close(); }}
         
         
   
         

}
</script>     
       
       
       






















       
       
       
  <html>
<head><title>JSP Page</title></head>     
       
<HR>
<%try {%> 
<%--action="/ASY_Polzovatel/import_asu_zir_vved.jsp"--%>
<form    name="senddata" <%--action="/ASY_Polzovatel/import_asu_zir_vved.jsp"--%> method="post">
<div id='sys'>
<table width="100%" border="1" >

<tr><td><H3>Выберите системы</H3></td></tr>
   <% String sys=""; String role="";  int tt=1;
     
 




if(session.getValue("id_role").equals("2")){         
      sys=" select a1.id, a1.id_system,a1.sn_system "+
      " from ASU_POL.POLYGON_system a1  order by a1.sn_system";
      role=" select ID, ID_ROLE, FN_ROLE, MY_ROLE, DT_BIG, DT_END "+
  " from ASU_POL.POLYGON_ROLE "+
  " order by FN_ROLE ";
      }else{
          
          
      sys="  select a1.id, a1.id_system,a1.sn_system "+
      " from ASU_POL.POLYGON_system a1 where "+session.getValue("ses_systems")+ " order by a1.sn_system";  
        
      role=" select ID, ID_ROLE, FN_ROLE, MY_ROLE, DT_BIG, DT_END "+
  " from ASU_POL.POLYGON_ROLE where id<>2 "+
  " order by FN_ROLE ";
    
     }
    
    try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
          }catch(Throwable theException) {theException.printStackTrace();} 
       Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "11111111");  

     Statement stmt_sys = myconnection1.createStatement(); 
     ResultSet rs_sys = stmt_sys.executeQuery(sys); 


%>


<tr><td> 
 

<div style="OVERFLOW: auto; WIDTH: 500px; HEIGHT: 200px"> 
<table> 

<tr>

<td  NOWRAP colspan='2' ><input id='IDSYS' name='IDSYS' type='checkbox' value='-1_0'
   onClick="CHEKSYSALL(this.form,'IDSYS','IDSYS')"
   > Все системы</td></tr>
 <% int k=2;
while (rs_sys.next()){  %>
<tr><td  NOWRAP  ><%=k-1%>. <input id='IDSYS' name='IDSYS' type='checkbox' value='<%=rs_sys.getInt("id_system")%>'
  <%--onClick="CHEKSYSALLV(this.form,'IDSYS','IDSYS')"--%>
   ><%=rs_sys.getString("sn_system").trim()%></td>

<td><select  id='IDROL' name='IDROL' >

 <%    Statement stmt_role = myconnection1.createStatement(); 
     ResultSet rs_role = stmt_role.executeQuery(role); 
 while (rs_role.next()){  %>
<option value="<%=rs_role.getInt("ID_ROLE")%>"><%=rs_role.getString("FN_ROLE")%></option>
<% }  

rs_role.close();
stmt_role.close();%>
</select></td></tr>
 <%k++;
  } 
rs_sys.close();
stmt_sys.close();

myconnection1.close();} catch (SQLException e) {e.printStackTrace();}
%>

</table>
</div> 


   
   </td></tr>
<tr><td  ><input type = "submit" value="OK" <%----%>onClick="Click('IDSYS','<%=request.getParameter("ss")%>','IDROL')"<%----%>> </td></tr>
   
</html>
<%}}%>