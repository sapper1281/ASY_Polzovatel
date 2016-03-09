
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



<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="UTF-8" %>
<script src="jquery-1.4.2.js"></script>
<script > 
    
function CHEKSYSALL(oForm, cbName, nn) 
         {
        if(document.getElementsByName(cbName)(0).checked){
        for (var i=0; i < document.getElementsByName(cbName).length; i++){ 
        document.getElementsByName(cbName)(i).checked=true;} }
        else{
for (var i=0; i < document.getElementsByName(cbName).length; i++){ 
        document.getElementsByName(cbName)(i).checked=false;} }
}  
  
    function Click_SP() 
    { 
        
         document.getElementById('sys1').value="";
         for (var i=0; i < document.getElementsByName('IDSYS').length; i++){ 
         if(document.getElementsByName('IDSYS')(i).checked==true){
          document.getElementById('sys1').value= document.getElementById('sys1').value+'!'+document.getElementsByName('IDSYS')(i).value;
          
         }}
         document.getElementById('sys1').value=document.getElementById('sys1').value+'!';
        
        
      
      
       
     /*  if(document.getElementById('Excel').checked==true){ 
     
obj = document.getElementById('m');  

 obj.setAttribute("action","/ASY_Polzovatel/Tree_Otchet_SP_Excel.jsp");  

 obj.setAttribute("target","hiddenframe");  

 obj.setAttribute("method","post");  

 obj.setAttribute("enctype","multipart/form-data");  

 obj.submit(); 


       
       
}else{*/
     $("#img_otchet").show();     
     $("#div_otchet").load("Otchet_Sroki_Zayvok.jsp", {ss1: document.getElementById('sys1').value}, function(){$("#img_otchet").hide();}); 
      // }
        
    }
    
    
    
    
    
    

              
      
      
      
</script>
<%if(session.getValue("id_role").equals("2")||session.getValue("id_role").equals("3")){
response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010"); 
 Object lock = new Object();
            synchronized (lock) {  
    // session.putValue("v", "0") ;  
try{
    
    try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
          }catch(Throwable theException) {theException.printStackTrace();} 
       Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "11111111");  
      //Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "D2_12345678");  

 
String sys=""; int tt=1;
      if((!session.isNew()) && (session.getValue("FIRST_NAME") != null)){         
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
	   " where a3.id_system<>1  "+
" and a1.id="+session.getValue("id_us")+
" and a3.id_role=2 and  a3.del=0 "+
           " order by a5.sn_system";
     }




}
    
     Statement stmt_sys = myconnection1.createStatement(); 
     ResultSet rs_sys = stmt_sys.executeQuery(sys);






%>


      
               

<HR>
<form
name='m'>
<input type=hidden id="sys1" name="sys1" value=""/> 
<table width="100%" border="1" >
   <tr width="100%" >
        <td>
        <H2>Заявки с истекшим сроком актуальности</H2>
   </td></tr>
   <%--td style="color: RED" colspan='2'--%>
        
    <tr><td > <H2>Выберите системы</H2></td></tr>
    <tr><td>
    <table>
    <tr><td> 
 

<div style="OVERFLOW: auto; WIDTH: 600px; HEIGHT: 300px"> 
<table> 

<tr>

<td  NOWRAP  ><input id='IDSYS' name='IDSYS' type='checkbox' value='-1'
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


   
   </td></tr>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   </table> 
    
    
    </td>
    
    
    
    </tr>
     <tr><td colspan='2'><button onclick="Click_SP()">Показать</button></td></tr>
     <tr><td colspan='2'><div  id='div_otchet'><img src="images/status_anim.gif" style="display:none" id='img_otchet'/></div></td></tr>
     <%--tr><td><a id='ahref' href="/ASY_Polzovatel/Tree_Otchet_SP_Excel.jsp?ss=<%=request.getParameter("sp")%>" onclick="Click_SP_Excel()" target=_blank>Excel</a></td></tr>             
     <tr><td><button onclick="Click_SP_Excel()">Показать</button--%>
     
</table>
</form>
<HR>
<% myconnection1.close();} catch (SQLException e) {%> <tr>Ошибка <%=e%></tr> <%}%>
<%}%> 
<%}%>

