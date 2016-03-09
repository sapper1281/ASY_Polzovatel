
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
    function Click_but_SP(s){
        $("#img"+s+" ").show(); 
        if($("#but"+s+" ").text()=="+")
        {
         $("#but"+s+" ").text("-");
         $("#div"+s+" ").load("Tree_Plus.jsp", {ss: s}, function(){$("#img"+s+" ").hide();});    
        }
        else{$("#but"+s+" ").text("+");
         $("#div"+s+" ").load("Tree_Minus.jsp", {ss: s}, function(){$("#img"+s+" ").hide();});    
        }
       // $("div").load("DateServer.jsp", function(data){$("input").val(data);} );
       
    }      
     
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
    { document.getElementById('sp').value="";
    
    
         
        for (var i=0; i < document.getElementsByName('A_0').length; i++){ 
            if(document.getElementsByName('A_0')(i).checked==true){
                document.getElementById('sp').value= document.getElementById('sp').value+'!'+document.getElementsByName('A_0')(i).value;
          
            }}
        document.getElementById('sp').value=document.getElementById('sp').value+'!';

        
         document.getElementById('sys1').value="";
         for (var i=0; i < document.getElementsByName('IDSYS').length; i++){ 
         if(document.getElementsByName('IDSYS')(i).checked==true){
          document.getElementById('sys1').value= document.getElementById('sys1').value+'!'+document.getElementsByName('IDSYS')(i).value;
          
         }}
         document.getElementById('sys1').value=document.getElementById('sys1').value+'!';
        
        
        //alert(document.getElementById('sp').value);  
       // alert(document.getElementById('sys1').value);  
        
      
       
       if(document.getElementById('Excel').checked==true){ 
      <%-- $("#div_otchet").load("Tree_Otchet_SP_Excel.jsp", {ss: document.getElementById('sp').value}, function(){$("#img_otchet").hide();});
       window.open("/ASY_Polzovatel/Tree_Otchet_SP_Excel.jsp?ss="+document.getElementById('sp').value,"CNN_WindowName","menubar=yes,location=yes,resizable=yes,scrollbars=yes,status=yes"); --%>
  //alert(document.getElementById('sp').value);  
obj = document.getElementById('m');  

 obj.setAttribute("action","/ASY_Polzovatel/Tree_Otchet_SP_Excel.jsp");  

 obj.setAttribute("target","hiddenframe");  

 obj.setAttribute("method","post");  

 obj.setAttribute("enctype","multipart/form-data");  

 obj.submit(); 


       
       
}else{
     $("#img_otchet").show();     
     $("#div_otchet").load("Tree_Otcher_SP.jsp", {ss: document.getElementById('sp').value,ss1: document.getElementById('sys1').value}, function(){$("#img_otchet").hide();}); 
       }
        
    }
    
    
    
    
    
    

              
      
      
      
</script>
<%if ((!session.isNew()) && (session.getValue("FIRST_NAME") != null)) {
response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010"); 
 Object lock = new Object();
            synchronized (lock) {  
    // session.putValue("v", "0") ;  
try{
    
    try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
          }catch(Throwable theException) {theException.printStackTrace();} 
       Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "11111111");  
      //Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "D2_12345678");  

     String sp=" select ID, CODE_ROAD_ASU_TR, ID_ROAD_ASU_TR, SN_ROAD, FN_ROAD, "+ 
    " MY_ID_ROAD_ASU_TR, MY_ID_ROAD, DT_BIG, DT_END, STATUS, TYPE,  "+ 
    " PR_SERV, DT_VVOD, R3 "+ 
    " from ASU_POL.POLYGON_ROAD where ((MY_ID_ROAD_ASU_TR=0 and "+
    " DT_VVOD=(select max(DT_VVOD) from ASU_POL.POLYGON_ROAD)) or (R3='not' and MY_ID_ROAD_ASU_TR=0)) "+ 
    " order by ID,ID_ROAD_ASU_TR ";  
      
     Statement stmt_sp = myconnection1.createStatement(); 
     ResultSet rs_sp = stmt_sp.executeQuery(sp); 






String sys=""; int tt=1;
      if((!session.isNew()) && (session.getValue("FIRST_NAME") != null)){         
      sys=" select a1.id, a1.id_system,a1.sn_system "+
      " from ASU_POL.POLYGON_system a1  order by a1.sn_system";
      }/*else{
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
     }*/
    
     Statement stmt_sys = myconnection1.createStatement(); 
     ResultSet rs_sys = stmt_sys.executeQuery(sys);






%>


      
               

<HR>
<form
name='m'>
<input type=hidden id="sp" name="sp" value=""/ > 
<input type=hidden id="sys1" name="sys1" value=""/ > 
<table width="100%" border="1" >
   <tr width="100%" >
        <td  colspan='2'>
        <H2>Отчет о введенных пользователях </H2>
           
            </td>
            </tr>


    <tr width="100%" >
        <td style="color: RED" colspan='2'>
        <H3>Внимание! Вложенные организации входят в состав основной</H3>
           
            </td>
            </tr>
            <tr>
    <td > <H2>Выберите структурные подразделения</H2>
    </td><td ><H2>Выберите системы</H2>
    </td></tr>
    
    <tr><td>
    <div style="OVERFLOW: auto; WIDTH: 600px; HEIGHT: 300px"> 

    <%//int i=0;
    while(rs_sp.next()){
     
%>
    
        <ol><button onclick="Click_but_SP('<%=rs_sp.getString("ID_ROAD_ASU_TR")%>')" id="but<%=rs_sp.getString("ID_ROAD_ASU_TR")%>" >+</button><input type="checkbox"  id="A_0" name="A_0" value='<%=rs_sp.getString("ID_ROAD_ASU_TR")%>'/>
        <%=rs_sp.getString("SN_ROAD")%><div id='div<%=rs_sp.getString("ID_ROAD_ASU_TR")%>'><img src="images/status_anim.gif" style="display:none" id='img<%=rs_sp.getString("ID_ROAD_ASU_TR")%>'/></div></ol>
          
     <% }   rs_sp.close(); stmt_sp.close(); %>
     </div>
    </td>
    
    
    
    <td>
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
     <tr><td colspan='2'><button onclick="Click_SP()">Показать</button><input type="checkbox"  id="Excel" name="Excel" />Excel</td></tr>
     <tr><td colspan='2'><div  id='div_otchet'><img src="images/status_anim.gif" style="display:none" id='img_otchet'/></div></td></tr>
     <%--tr><td><a id='ahref' href="/ASY_Polzovatel/Tree_Otchet_SP_Excel.jsp?ss=<%=request.getParameter("sp")%>" onclick="Click_SP_Excel()" target=_blank>Excel</a></td></tr>             
     <tr><td><button onclick="Click_SP_Excel()">Показать</button--%>
     
</table>
</form>
<HR>
<% myconnection1.close();} catch (SQLException e) {%> <tr>Ошибка <%=e%></tr> <%}%>
<%}%> 
<%}%>

