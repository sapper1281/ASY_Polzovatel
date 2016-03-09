
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

<%--вывод параметров для асу зир--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%if(session.getValue("id_role").equals("2")||session.getValue("id_role").equals("3")){%>
 <%Object lock = new Object(); 
synchronized(lock)
       {%>
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
  



function check_import_asu_zir_param( cbName, sd, cbName1,cbName2) 
         { 
         
         document.getElementById(cbName).value=sd;
         for (var i=0; i < document.getElementsByName(cbName1).length; i++){ 
         if(document.getElementsByName(cbName1)(i).checked==true){
          document.getElementById(cbName2).value= document.getElementById(cbName2).value+'|'+document.getElementsByName(cbName1)(i).value;
          
}}
document.getElementById(cbName2).value=document.getElementById(cbName2).value+'|';}

</script>     
       
       
       
       
       
       
       
       
<HR>
<%try { %> 
<%--action="/ASY_Polzovatel/import_asu_zir_vved.jsp"--%>
<form    name="senddata" <%--action="/ASY_Polzovatel/import_asu_zir_vved.jsp"--%> method="post">
<input type=hidden id="tper1" name="tper1" value="0"/ > 
<input type=hidden id="par" name="par" value=""/ > 
<table width="100%" border="1" >
<tr><td><H3>Выберите вид отчета</H3></td></tr>
<tr><td>

<select  name="vid" id="vid" style="width: 100%;">
<option value='1'>Заявки выгруженные из АСУ ЗИР </option>
<option value='2'>Заявки введенные в АСУ "Пользователь" и сущ. в АСУ ЗИР </option>
<option value='3'>Заявки не переданные из АСУ ЗИР</option>
</select>
<td></tr>




<tr><td><H3>Выберите системы</H3></td></tr>
   <% String sys="";
      if(session.getValue("id_role").equals("2")){         
      sys=" select a1.id, a1.id_system,a1.sn_system "+
      " from ASU_POL.POLYGON_system a1  order by a1.sn_system";
      }else{
      sys="  select  "+
	   " a5.id, a5.id_system,a5.sn_system  "+
	   " from ASU_POL.MAIN_USER_ALL a1   "+
           " left join ASU_POL.SOOTV_USER_SYS a3 on a1.ID=a3.ID_USER   "+
           " left join ASU_POL.POLYGON_ROLE a4 on a4.id_role=a3.id_role  "+
	   " left join ASU_POL.POLYGON_SYSTEM a5 on a5.ID_SYSTEM=a3.ID_SYSTEM  "+
	   " where a3.id_system<>1 and a1.id="+session.getValue("id_us")+" and a3.id_role=2 and  a3.del=0 "+
           " order by a5.sn_system";
     }
    
    try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
          }catch(Throwable theException) {theException.printStackTrace();} 
       Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "11111111");  
 
     Statement stmt_sys = myconnection1.createStatement(); 
     ResultSet rs_sys = stmt_sys.executeQuery(sys); %>


<tr><td> 
 

<div style="OVERFLOW: auto; WIDTH: 500px; HEIGHT: 200px"> 
<table> 

<tr>
<td  NOWRAP colspan='2' ><input id='IDSYS' name='IDSYS' type='checkbox' value='-1'
   onClick="CHEKSYSALL(this.form,'IDSYS','IDSYS')"
   > Все системы</td></tr>
 <% int k=2;
while (rs_sys.next()){  %>
<tr><td  NOWRAP  ><%=k-1%>. <input id='IDSYS' name='IDSYS' type='checkbox' value='<%=rs_sys.getInt("id_system")%>'
  <%--onClick="CHEKSYSALLV(this.form,'IDSYS','IDSYS')"--%>
   ><%=rs_sys.getString("sn_system").trim()%></td></tr>
 <%k++;
  } 
rs_sys.close();
stmt_sys.close();
%>

</table>
</div> 
<%--if("vvod_4_import_asu_zir_vved".equals(request.getParameter("tper1"))){%>


<table border='4'>
<tr>
<td>
<DIV style="BORDER-BOTTOM: 2px ridge; BORDER-LEFT: 2px ridge; BORDER-RIGHT: 2px ridge; BORDER-TOP: 2px ridge;  WIDTH: 10px">
	

         <IFRAME
		         frameBorder=0 height=600  scrolling=no style='z-index:1000;'
		         src="/ASY_Polzovatel/import_asu_zir_vved.jsp"
		         width=1000
	             </IFRAME>
	             


</DIV>
</td>
</tr>
</TABLE>



<%}--%>

   
   </td></tr>
<tr><td  ><input type = "submit" value="Вывести отчет" <%----%>onClick="check_import_asu_zir_param('tper1','vvod_4_import_asu_zir_vved','IDSYS','par')"<%----%>> </td></tr>
<tr><td>
   
   
 <%if("vvod_4_import_asu_zir_vved".equals(request.getParameter("tper1"))){%>


<table border='4'>
<tr>
<td>
<DIV style="BORDER-BOTTOM: 2px ridge; BORDER-LEFT: 2px ridge; BORDER-RIGHT: 2px ridge; BORDER-TOP: 2px ridge;  WIDTH: 10px">
<%--=request.getParameter("par")--%>	

         <IFRAME
		         frameBorder=0 height=600  scrolling=no style='z-index:1000;'
		         src="/ASY_Polzovatel/import_asu_zir_vved.jsp?par=<%=request.getParameter("par")%>&vid=<%=request.getParameter("vid")%>"
		         width=1050
	             </IFRAME>
	             


</DIV>
</td>
</tr>
</TABLE>



<%}%>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   </td></tr>  
</table>
</form>
<% myconnection1.close();} catch (SQLException e) {%> <tr>Ошибка <%=e%></tr> <%}%>
<HR>
<%}%> 
<%}%>