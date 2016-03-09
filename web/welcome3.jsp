<%--@page import= "com.NewServlet9"%>
<%@page import= "com.SessionPeek"%> 
<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>

<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){%>
<HR>
<table width="100%" border="1" >
<tr width="100%" >
<td >
<H2>Редактирование введенных пользователей</H2>
</td>
</tr>

<tr width="100%" >
<td >
<%if(session.getValue("id_role").equals("2")||session.getValue("id_role").equals("3")){%> 
<jsp:useBean id="Bean3" class="com.NewServlet9" scope="request"/>
<jsp:setProperty name="Bean3" property="*"/> 
<%Bean3.doPost(request,response);%> 
<table>





<tr>
<td>
<%=Bean3.getOUT()%>
</td>
</tr>
</table>
<%}%>
</td>
</tr>



</table>


<%}%> 
<HR>
--%>



















<%--редактирование введенных пользователей--%>

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
<H2>Редактирование введенных пользователей</H2>
</td>
</tr>

<tr width="100%" >
<td >
<%if(session.getValue("id_role").equals("2")||session.getValue("id_role").equals("3")){%> 

<table>





<tr>
<td>

<script type="text/javascript">
  function CHEKSYS1(oForm, cbName, nn) 
         { 
          if(document.getElementById(nn).value=='Показать'){ 
          document.getElementById(nn).value='Скрыть';
        } 
          else{
        document.getElementById(nn).value='Показать';
        } 
          for (var i=0; i < document.getElementsByName(cbName).length; i++){ 
 if(document.getElementsByName(cbName)(i).style.display=='none')  
 { document.getElementsByName(cbName)(i).style.display='block'; 
 }  
 else 
 { document.getElementsByName(cbName)(i).style.display='none';
 }  
 }  
    }  
   
  function checkAll(oForm, cbName, checked) 
 { 
 }   
     </script>
<%try {  %>
<form  id="senddata"  name="senddata" method="post"> 
<table border=1>
<tr>
  <td  NOWRAP colspan='4' >Инф. системы</td>             
    </tr>  



       
      <% 
String UserID = "db2admin";
       String Password = "11111111";

try {
         Class.forName("COM.ibm.db2.jdbc.app.DB2Driver"); 
          }catch(Throwable theException) {theException.printStackTrace();} 
       Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , UserID, Password);  
      
      
       
     SimpleDateFormat dateFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
     SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd.MM.yyyy");
     SimpleDateFormat dateFormatter2_1 = new SimpleDateFormat("dd-MM-yyyy");
     SimpleDateFormat dateFormatter3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       
       
       
       String sys="";
      
      
      if(session.getValue("id_role").equals("2")){         
      sys=" select a1.id, a1.id_system,a1.sn_system "+
      " from ASU_POL.POLYGON_system a1  order by a1.sn_system";
      }else{
             
       sys="  select  "+
	   " a5.id, a5.id_system,a5.sn_system  "+
	   " from ASU_POL.MAIN_USER_ALL a1   "+
           " left join ASU_POL.SOOTV_USER_SYS a3 on a1.ID=a3.ID_USER    "+
           " left join ASU_POL.POLYGON_ROLE a4 on a4.id_role=a3.id_role  "+
	   " left join ASU_POL.POLYGON_SYSTEM a5 on a5.ID_SYSTEM=a3.ID_SYSTEM  "+
	   " where a3.id_system<>1 and a1.id="+session.getValue("id_us")+" and a3.id_role=2 and a3.del=0   ";
          
      } 
   
      
      
      Statement stmt0 = myconnection1.createStatement(); 
ResultSet rs0 = stmt0.executeQuery(sys
  );
while (rs0.next()){%>
    
  <tr  >
  <td  NOWRAP colspan='4' ><input id="in1_<%=rs0.getInt("id_system")%>" type="button" value='Показать'
   onClick="CHEKSYS1(this.form,'id1_<%=rs0.getInt("id_system")%>','in1_<%=rs0.getInt("id_system")%>')" 
   >  
   <%=rs0.getString("sn_system").trim()%></td></tr> 
    
   <tr>
   <td>
   <div id="id1_<%=rs0.getInt("id_system")%>"  name="id1_<%=rs0.getInt("id_system")%>" style="display:none" >
   <table>
   <tr  bgcolor='#EEEEEE' 
   >
     <td NOWRAP bgcolor='#EEEEEE' > &nbsp </td>  
     <td NOWRAP >№</td>
     <td NOWRAP >id записи</td>
     <td NOWRAP >инф. система</td>
     <td NOWRAP >код</td>
     <td NOWRAP >id пол.</td>
     <td NOWRAP >Ф.И.О.</td>
     <td NOWRAP >Телефон</td>
     <td NOWRAP >E-MAIL</td>
     <td NOWRAP >IP</td>
     <td NOWRAP >Дт. начала действия заявки</td>
     <td NOWRAP >Дт. окончания действия заявки</td>
     <td NOWRAP >Роль в инф. системе</td>
     <td NOWRAP >Станция</td>
     <td NOWRAP >id СП</td>
     <td NOWRAP >Структурное подразделение</td>
     <td NOWRAP >Должность</td>
     <td NOWRAP >Блокировка</td>
     <td NOWRAP >Дата начала актуальности</td>
     <td NOWRAP >Дата окончания актуальности</td>
     <td NOWRAP >Код услуги</td>
     <td NOWRAP >Наименование услуги</td>
     </tr>
    
    
    <% String rol_us="";
    if(session.getValue("id_role").equals("2")){         
      rol_us= " ";
      }else{
      
  rol_us= " and a1.ID_ROLE<>2 ";}
    
    Statement stmt1 = myconnection1.createStatement(); 
ResultSet rs1 = stmt1.executeQuery(

" select  a1.ID, a1.ID_USER,a1.DT_BIG_Z, a1.DT_END_Z,  "+
"   a2.ID_ROAD_ASU_TR,a2.TAB_NUM,a2.BLOCK_USER,a2.LAST_NAME,a2.FIRST_NAME,a2.MIDDLE_NAME,a2.TEL,a2.IP,a2.E_MAIL,a2.DT_BIG,a2.DT_END, "+ 
"   a3.CODE_SYSTEM,a3.SN_SYSTEM,  "+
"   a5.CODE_USL,a5.FN_USL,  "+
"   a6.FN_ROLE,  "+
"  a8.FN_STAN,   "+
"   a2.ROAD,  "+
"   a2.SN_JOB  "+
"   from ASU_POL.MAIN_USER_ALL as a2  "+
"  inner join ASU_POL.SOOTV_USER_SYS as a1  on a1.ID_USER=a2.ID and a1.DT_END is  null and a1.ID_system  ="+rs0.getInt("id_system")+" "+rol_us+" "+
"   left join ASU_POL.POLYGON_SYSTEM as a3 on a1.ID_SYSTEM=a3.ID_system   "+
"   left join ASU_POL.SOOTV_SYS_USL as a4 on a1.ID_SYSTEM=a4.ID_system  "+ 
"   left join ASU_POL.POLYGON_USL as a5 on a1.ID_USL=a5.ID_USL   "+
"   left join ASU_POL.POLYGON_ROLE as a6 on a1.ID_ROLE=a6.ID_ROLE  "+
" left join ASU_POL.POLYGON_STAN as a8 on a1.ID_STAN=a8.ID_STAN "+
"    order by a3.FN_SYSTEM,a2.LAST_NAME,a2.FIRST_NAME,a2.MIDDLE_NAME "

);
     int k=1;
     while (rs1.next()){
    
  
         
    String Road_user="";

if((Road_user=rs1.getString("ROAD"))==null){

Road_user="";
}
boolean t_dor=true;
   int Id_str=rs1.getInt("ID_ROAD_ASU_TR");     
  %>    
    
    
    


      
  
    
    
 <tr>
   <td NOWRAP  bgcolor='#EEEEEE' >
  <table><tr><td>
  <input type="checkbox" name="<%=k%>_<%=rs1.getString("CODE_SYSTEM").trim()%>" 
   id="<%=k%>_<%=rs1.getString("CODE_SYSTEM").trim()%>" value="checkbox"
   onClick="getCustomerInfo_new_1(this.form,
  '<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_tel',
  '<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_E_MAIL',
  '<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_IP',
  'd_<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_DT_BIG_Z',
  'd_<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_DT_END_Z',
  '<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_FN_ROLE',
  '<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_FN_STAN',
  '<%=k%>_button_save<%=rs1.getString("CODE_SYSTEM").trim()%>', 
  '<%=k%>_button_del<%=rs1.getString("CODE_SYSTEM").trim()%>', 
  '<%=k%>_<%=rs1.getString("CODE_SYSTEM").trim()%>' 
  );"
  
  > </td><td>
 </td><td
 >
  <input  type="button" name="<%=k%>_button_save<%=rs1.getString("CODE_SYSTEM").trim()%>" id="<%=k%>_button_save<%=rs1.getString("CODE_SYSTEM").trim()%>" style="display:none" 
   onClick="getSave(this.form,
   '<%=k%>_button_save<%=rs1.getString("CODE_SYSTEM").trim()%>', 
   '<%=k%>_button_del<%=rs1.getString("CODE_SYSTEM").trim()%>',
   '<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_ID', 
   '<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_user', 
  '<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_tel',
  '<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_E_MAIL',
  '<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_IP',
  'd_<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_DT_BIG_Z',
  'd_<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_DT_END_Z',
  '<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_FN_ROLE',
  '<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_FN_STAN',
   '<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_ID_ROAD_ASU_TR', 
   'in<%=rs1.getInt("ID_USER")%>_tel',
   'in<%=rs1.getInt("ID_USER")%>_E_MAIL',
   'in<%=rs1.getInt("ID_USER")%>_IP',
   'in<%=rs1.getInt("ID_USER")%>_FN_STAN',
  
  '<%=k%>_<%=rs1.getString("CODE_SYSTEM").trim()%>' 
  
   );" value='Сохранить' >
  </td><td><input  type="button" name="<%=k%>_button_del<%=rs1.getString("CODE_SYSTEM").trim()%>" id="<%=k%>_button_del<%=rs1.getString("CODE_SYSTEM").trim()%>" style="display:none" 
   onClick="getDelet(this.form,
   '<%=k%>_button_save<%=rs1.getString("CODE_SYSTEM").trim()%>', 
   '<%=k%>_button_del<%=rs1.getString("CODE_SYSTEM").trim()%>',
   '<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_ID', 
  
   '<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_user', 
  '<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_tel',
  '<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_E_MAIL',
  '<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_IP',
  'd_<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_DT_BIG_Z',
  'd_<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_DT_END_Z',
  '<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_FN_ROLE',
  '<%=+rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_FN_STAN',
  '<%=k%>_<%=rs1.getString("CODE_SYSTEM").trim()%>' 
   );"  value='Удалить' >
  </td></tr></table>
  </td>
   <td NOWRAP ><%=k%></td>
   <td NOWRAP 
  
   id="<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_ID"
   name="<%=rs1.getInt("ID_USER")%>_ID"
  
   ><%=rs1.getString("ID").trim()%></td>
  
  
   <td NOWRAP ><%=rs1.getString("SN_SYSTEM").trim()%></td>
   <td NOWRAP   ><%=rs1.getString("CODE_SYSTEM").trim()%></td>
   <td NOWRAP
  
   id="<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_user"
   name="<%=rs1.getInt("ID_USER")%>_user"
  
   ><%=rs1.getInt("ID_USER")%></td>
   <td NOWRAP ><%=rs1.getString("LAST_NAME").trim()%>  <%=rs1.getString("FIRST_NAME").trim()%>  <%=rs1.getString("MIDDLE_NAME").trim()%></td>
  <td NOWRAP
  >              
  <div  
   id="<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_tel"
   name="in<%=rs1.getInt("ID_USER")%>_tel"
   ><%=rs1.getString("TEL").trim()%>
  </div>
  </td>
  <td NOWRAP
  >               
  <div 
   id="<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_E_MAIL"
   name="in<%=rs1.getInt("ID_USER")%>_E_MAIL"
   ><%=rs1.getString("E_MAIL").trim()%>
  </div>
  </td>
  <td NOWRAP
  >                
  <div  
   id="<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_IP"
   name="in<%=rs1.getInt("ID_USER")%>_IP"
   ><%=rs1.getString("IP").trim()%>
  </div>
  </td>
  <td NOWRAP
   id="d_<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_DT_BIG_Z"
   name="d_<%=rs1.getInt("ID_USER")%>_DT_BIG_Z"
   ><%=(dateFormatter2.format(rs1.getDate("DT_BIG_Z")).toString())%>
  </td>
  <td NOWRAP
   id="d_<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_DT_END_Z"
   name="d_<%=rs1.getInt("ID_USER")%>_DT_END_Z"
   ><%=(dateFormatter2.format(rs1.getDate("DT_END_Z")).toString())%>
  </td>
  <td NOWRAP
   id="<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_FN_ROLE"
   name="<%=rs1.getInt("ID_USER")%>_FN_ROLE"
   >
  <%=rs1.getString("FN_ROLE").trim()%>
 </td>
  <td NOWRAP
  >               
  <div  
   id="<%=rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_FN_STAN" 
   name="in<%=rs1.getInt("ID_USER")%>_FN_STAN" 
   ><%=rs1.getString("FN_STAN").trim()%>
  </div>
  </td>
  
  <td NOWRAP
   id="<%=+rs1.getInt("ID_USER")%>_<%=rs1.getString("CODE_SYSTEM").trim()%>_ID_ROAD_ASU_TR"
   name="<%=+rs1.getInt("ID_USER")%>_ID_ROAD_ASU_TR" 
   ><%=rs1.getString("ID_ROAD_ASU_TR").trim()%> 
 </td>
  
  
  
  
  
  <td NOWRAP  ><%=Road_user.trim()%></td>
  <td NOWRAP ><%=rs1.getString("SN_JOB")%></td>
  <td NOWRAP ><%=rs1.getInt("BLOCK_USER")%></td>
  
  <td NOWRAP ><%=rs1.getDate("DT_BIG")%></td>
  <td NOWRAP ><%=rs1.getDate("DT_END")%></td>
  <td NOWRAP ><%=rs1.getString("CODE_USL").trim()%></td>
  <td NOWRAP ><%=rs1.getString("FN_USL").trim()%></td>
  </tr>
  
  
  

   
   
   <%k=k+1;   
   }
    
rs1.close();
stmt1.close();%>    
   
   
   
    </table>
   </div>   
   </td>
   </tr>
   
     
 <% }
rs0.close();
stmt0.close();  %> 
   
   </table>
  </form>  
      
   <% myconnection1.close();

      } catch (SQLException e) {%> <tr>Ошибка <%=e%></tr> <%} %>





</td>
</tr>
</table>
<%}%>
</td>
</tr>
</table>

<HR>

 <%}%>  

<%}%> 







<script type="text/javascript">

var request = false;
var request1 = false;
var request2 = false;

   try {
     request = new XMLHttpRequest();
     request1 = new XMLHttpRequest();
     request2 = new XMLHttpRequest();
   } catch (trymicrosoft) {
     try {
       request = new ActiveXObject("Msxml2.XMLHTTP");
       request1 = new ActiveXObject("Msxml2.XMLHTTP");
       request2 = new ActiveXObject("Msxml2.XMLHTTP");
     } catch (othermicrosoft) {
       try {
         request = new ActiveXObject("Microsoft.XMLHTTP");
         request1 = new ActiveXObject("Microsoft.XMLHTTP");
         request2 = new ActiveXObject("Microsoft.XMLHTTP");
       } catch (failed) {
         request = false;
         request1 = false;
         request2 = false;
       }  
     }
   }

   if (!request)
     alert("Error initializing XMLHttpRequest!");
   if (!request1)
     alert("Error initializing XMLHttpRequest!");
   if (!request2)
     alert("Error initializing XMLHttpRequest!");
       
     
 
  function getCustomerInfo_new_1(Name,Oper_Tel,Oper_E_MAIL,Oper_IP,Oper_DT_BIG_Z,Oper_DT_END_Z,Oper_FN_ROLE,Oper_FN_STAN, butt_save,butt_del,chek) {
 ///alert('33333');
  if (document.getElementById(chek).checked){
 // alert(Oper_Tel+'_tel');//id tel
 document.getElementById(butt_del).style.display='block';
if(document.getElementById(butt_del).value=='Удалить'){  
document.getElementById(chek).value=document.getElementById(Oper_Tel).innerHTML+'|'+
  document.getElementById(Oper_E_MAIL).innerHTML+'|'+
  document.getElementById(Oper_IP).innerHTML+'|'+
  
  document.getElementById(Oper_DT_BIG_Z).innerHTML+'|'+
  document.getElementById(Oper_DT_END_Z).innerHTML+'|'+
  document.getElementById(Oper_FN_ROLE).innerHTML+'|'+
  document.getElementById(Oper_FN_STAN).innerHTML+'|';
  
 // alert(document.getElementById(Oper_FN_STAN).innerHTML);
  
  // alert(document.getElementById(butt_del).value);  
  
 // alert(document.getElementById(butt_del).value=='Удалить');
  document.getElementById(butt_save).style.display='block';
  //else {document.getElementById(butt_save).style.display='none';}
  

  
  //alert(Oper_FN_STAN+'_FN_STAN');
  var system_sel_0 = '11111';
  var params = "system_sel_0=" + encodeURIComponent(system_sel_0)
  +"&"+"Oper_Tel=" + encodeURIComponent(document.getElementById(Oper_Tel).innerHTML)
  +"&"+"id_Tel=" + encodeURIComponent(Oper_Tel+'_tel')
  
  +"&"+"Oper_E_MAIL=" + encodeURIComponent(document.getElementById(Oper_E_MAIL).innerHTML)
  +"&"+"id_E_MAIL=" + encodeURIComponent(Oper_E_MAIL+'_E_MAIL')
  +"&"+"Oper_IP=" + encodeURIComponent(document.getElementById(Oper_IP).innerHTML)
  +"&"+"id_IP=" + encodeURIComponent(Oper_IP+'_IP')
  
  +"&"+"Oper_DT_BIG_Z=" + encodeURIComponent(document.getElementById(Oper_DT_BIG_Z).innerHTML)
  +"&"+"id_DT_BIG_Z=" + encodeURIComponent(Oper_DT_BIG_Z+'_DT_BIG_Z')
  +"&"+"Oper_DT_END_Z=" + encodeURIComponent(document.getElementById(Oper_DT_END_Z).innerHTML)
  +"&"+"id_DT_END_Z=" + encodeURIComponent(Oper_DT_END_Z+'_DT_END_Z')
  +"&"+"Oper_FN_ROLE=" + encodeURIComponent(document.getElementById(Oper_FN_ROLE).innerHTML)
  +"&"+"id_FN_ROLE=" + encodeURIComponent(Oper_FN_ROLE+'_FN_ROLE')
  +"&"+"Oper_FN_STAN=" + encodeURIComponent(document.getElementById(Oper_FN_STAN).innerHTML)
  +"&"+"id_FN_STAN=" + encodeURIComponent(Oper_FN_STAN+'_FN_STAN')
;

  var url = "<%=request.getContextPath()%>/NewServlet11";
  request.open("POST", url, true);
  request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  request.onreadystatechange =function(){ updatePage_new_1(Oper_Tel,Oper_E_MAIL,Oper_IP,Oper_DT_BIG_Z,Oper_DT_END_Z,Oper_FN_ROLE,Oper_FN_STAN);};
  request.send(params);
 }
  //alert(document.getElementById(Oper_FN_STAN).innerHTML);
}else{
//alert('ПНХ!!!');
document.getElementById(butt_save).style.display='none';
document.getElementById(butt_del).style.display='none';

        var k=0;
        var p=0;
        var p1=0
        for (var i=0; i < document.getElementById(chek).value.length; i++) {
        if(document.getElementById(chek).value.substring(i,i+1)=='|'){
         if(p==0){document.getElementById(Oper_Tel).innerHTML=document.getElementById(chek).value.substring(k,i);}
         if(p==1){document.getElementById(Oper_E_MAIL).innerHTML=document.getElementById(chek).value.substring(k,i);}
         if(p==2){document.getElementById(Oper_IP).innerHTML=document.getElementById(chek).value.substring(k,i);}
         
         if(p==3){document.getElementById(Oper_DT_BIG_Z).innerHTML=document.getElementById(chek).value.substring(k,i);}
         if(p==4){document.getElementById(Oper_DT_END_Z).innerHTML=document.getElementById(chek).value.substring(k,i);}
         if(p==5){document.getElementById(Oper_FN_ROLE).innerHTML=document.getElementById(chek).value.substring(k,i);}
         if(p==6){document.getElementById(Oper_FN_STAN).innerHTML=document.getElementById(chek).value.substring(k,i);}
         p=p+1;
         k=i+1;}
        }



}
   } 
      
      function updatePage_new_1(Oper_Tel_1,Oper_E_MAIL_1,Oper_IP_1,Oper_DT_BIG_Z_1,Oper_DT_END_Z_1,Oper_FN_ROLE_1,Oper_FN_STAN_1) {
      //alert(Oper_Tel1);
      //alert('4444');
     if (request.readyState == 4) {
       if (request.status == 200) {
        var response = request.responseText;
        
        var k=0;
        var p=0;
        var p1=0
        for (var i=0; i < response.length; i++) {
        if(response.substring(i,i+1)=='|'){
         if(p==0){document.getElementById(Oper_Tel_1).innerHTML=response.substring(k,i);}
         if(p==1){document.getElementById(Oper_E_MAIL_1).innerHTML=response.substring(k,i);}
         if(p==2){document.getElementById(Oper_IP_1).innerHTML=response.substring(k,i);}
         
         if(p==3){document.getElementById(Oper_DT_BIG_Z_1).innerHTML=response.substring(k,i);}
         if(p==4){document.getElementById(Oper_DT_END_Z_1).innerHTML=response.substring(k,i);}
         if(p==5){document.getElementById(Oper_FN_ROLE_1).innerHTML=response.substring(k,i);}
         if(p==6){document.getElementById(Oper_FN_STAN_1).innerHTML=response.substring(k,i);}
         p=p+1;
         k=i+1;}
        }
        
       
       } else
         alert("status is " + request.status);
     }
   }
   
   
     function  getDelet(Name,butt_save,butt_del,id_z_1,user_1,Oper_Tel,Oper_E_MAIL,Oper_IP,Oper_DT_BIG_Z,Oper_DT_END_Z,Oper_FN_ROLE,Oper_FN_STAN,chek) 
   {
//alert(document.getElementById(id_z_1).innerHTML);   
//alert(document.getElementById(user_1).innerHTML); 
  
  if(document.getElementById(butt_del).value=='Удалить'){
    document.getElementById(butt_del).value='Восстановить';
    document.getElementById(butt_save).style.display='none';
    
    
    var params = "id_z_1=" + encodeURIComponent(document.getElementById(id_z_1).innerHTML)
  +"&"+"user_1=" + encodeURIComponent(document.getElementById(user_1).innerHTML)
  +"&"+"pref=" + encodeURIComponent('del');
  
  var url = "<%=request.getContextPath()%>/NewServlet12";
  request1.open("POST", url, true);
  request1.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  request1.onreadystatechange =function(){ updatePage_delete(document.getElementById(id_z_1).innerHTML);};
  request1.send(params); 
    
   var k=0;
        var p=0;
        var p1=0
        for (var i=0; i < document.getElementById(chek).value.length; i++) {
        if(document.getElementById(chek).value.substring(i,i+1)=='|'){
         if(p==0){document.getElementById(Oper_Tel).innerHTML=document.getElementById(chek).value.substring(k,i);}
         if(p==1){document.getElementById(Oper_E_MAIL).innerHTML=document.getElementById(chek).value.substring(k,i);}
         if(p==2){document.getElementById(Oper_IP).innerHTML=document.getElementById(chek).value.substring(k,i);}
         
         if(p==3){document.getElementById(Oper_DT_BIG_Z).innerHTML=document.getElementById(chek).value.substring(k,i);}
         if(p==4){document.getElementById(Oper_DT_END_Z).innerHTML=document.getElementById(chek).value.substring(k,i);}
         if(p==5){document.getElementById(Oper_FN_ROLE).innerHTML=document.getElementById(chek).value.substring(k,i);}
         if(p==6){document.getElementById(Oper_FN_STAN).innerHTML=document.getElementById(chek).value.substring(k,i);}
         p=p+1;
         k=i+1;}
        }
    
    
    

     }
     else{
     
    document.getElementById(butt_del).value='Удалить';
    document.getElementById(butt_save).style.display='block';
   // alert('запись '+document.getElementById(id_z_1).innerHTML+' восстановлена' );
  
  
   
   
   var params = "id_z_1=" + encodeURIComponent(document.getElementById(id_z_1).innerHTML)
  +"&"+"user_1=" + encodeURIComponent(document.getElementById(user_1).innerHTML)
  +"&"+"pref=" + encodeURIComponent('out_del');
 // alert(params);
  var url = "<%=request.getContextPath()%>/NewServlet12";
  request1.open("POST", url, true);
  request1.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  request1.onreadystatechange =function(){ updatePage_delete(document.getElementById(id_z_1).innerHTML);};
 // alert(document.getElementById(id_z_1).innerHTML);
  request1.send(params);
// return();
  // alert('1111');
   getCustomerInfo_new_1(Name,Oper_Tel,Oper_E_MAIL,Oper_IP,Oper_DT_BIG_Z,Oper_DT_END_Z,Oper_FN_ROLE,Oper_FN_STAN, butt_save,butt_del,chek);
   //return();
//alert('2222222');
  
    
    
    
    
    
    
    
    } 

//alert(document.getElementById(tel_1).value);
//alert(document.getElementById(MAIL_1).value);
//alert(document.getElementById(IP_1).value);
//alert(document.getElementById('dt_big_z').value);
//alert(document.getElementById('dt_end_z').value);
//alert(document.getElementById('role').value);
//alert(document.getElementById('stan').value);
}
   




function updatePage_delete(id_z_1) {
      //alert('111111111111');
     if (request1.readyState == 4) {
       if (request1.status == 200) {
        var response = request1.responseText;
      alert(response );  
     // alert('запись '+id_z_1+' заблокирована' );
       
       } else
         alert("status is " + request1.status);
     }
   } 
  




   
   
   
   
   
   
   
   
    function  getSave(Name,butt_save,butt_del,id_z_1,user_1,Oper_Tel,Oper_E_MAIL,Oper_IP,Oper_DT_BIG_Z,Oper_DT_END_Z,Oper_FN_ROLE,Oper_FN_STAN,Oper_ID_ROAD_ASU_TR,Oper_Tel_mas,Oper_E_MAIL_mas,Oper_IP_mas,Oper_FN_STAN_mas,chek) 
   {
//alert(document.getElementById(id_z_1).innerHTML);   
//alert(document.getElementById(user_1).innerHTML); 
//alert(Oper_Tel+'_tel');
//alert(document.getElementById(Oper_Tel+'_tel').value);
//alert(Oper_E_MAIL+'_E_MAIL');
//alert(document.getElementById(Oper_E_MAIL+'_E_MAIL').value);
//alert(Oper_IP+'_IP');
//alert(document.getElementById(Oper_IP+'_IP').value);
//alert(Oper_DT_BIG_Z+'_DT_BIG_Z');
//alert(document.getElementById(Oper_DT_BIG_Z+'_DT_BIG_Z').value);
//alert(Oper_DT_END_Z+'_DT_END_Z');
//alert(document.getElementById(Oper_DT_END_Z+'_DT_END_Z').value);
//alert(Oper_FN_ROLE+'_FN_ROLE');
//alert(document.getElementById(Oper_FN_ROLE+'_FN_ROLE').innerHTML);
//alert(document.getElementById(Oper_FN_ROLE+'_FN_ROLE').value);
//alert(Oper_FN_STAN+'_FN_STAN');
//alert(document.getElementById(Oper_FN_STAN+'_FN_STAN').innerHTML);
//alert(document.getElementById(Oper_FN_STAN+'_FN_STAN').value);

//alert(document.getElementById(Oper_ID_ROAD_ASU_TR).innerHTML);


var params = "id_z_1=" + encodeURIComponent(document.getElementById(id_z_1).innerHTML)
  +"&"+"user_1=" + encodeURIComponent(document.getElementById(user_1).innerHTML)
  +"&"+"Oper_Tel=" + encodeURIComponent(document.getElementById(Oper_Tel+'_tel').value)
  +"&"+"Oper_E_MAIL=" + encodeURIComponent(document.getElementById(Oper_E_MAIL+'_E_MAIL').value)
  +"&"+"Oper_IP=" + encodeURIComponent(document.getElementById(Oper_IP+'_IP').value)
  +"&"+"Oper_DT_BIG_Z=" + encodeURIComponent(document.getElementById(Oper_DT_BIG_Z+'_DT_BIG_Z').value)
  +"&"+"Oper_DT_END_Z=" + encodeURIComponent(document.getElementById(Oper_DT_END_Z+'_DT_END_Z').value)
  +"&"+"Oper_FN_ROLE=" + encodeURIComponent(document.getElementById(Oper_FN_ROLE+'_FN_ROLE').value)
  +"&"+"Oper_FN_STAN=" + encodeURIComponent(document.getElementById(Oper_FN_STAN+'_FN_STAN').value)
  +"&"+"Oper_ID_ROAD_ASU_TR=" + encodeURIComponent(document.getElementById(Oper_ID_ROAD_ASU_TR).innerHTML)
  
;


var url = "<%=request.getContextPath()%>/NewServlet13";
  request2.open("POST", url, true);
  request2.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  request2.onreadystatechange =function(){ updatePage_save(document.getElementById(id_z_1).innerHTML);};
  request2.send(params); 

document.getElementById(chek).checked=this.checked;
document.getElementById(butt_del).style.display='none';
document.getElementById(butt_save).style.display='none';
document.getElementById(chek).value='checkbox';

document.getElementById(Oper_Tel).innerHTML=document.getElementById(Oper_Tel+'_tel').value;
document.getElementById(Oper_E_MAIL).innerHTML=document.getElementById(Oper_E_MAIL+'_E_MAIL').value;
document.getElementById(Oper_IP).innerHTML=document.getElementById(Oper_IP+'_IP').value;
document.getElementById(Oper_DT_BIG_Z).innerHTML=document.getElementById(Oper_DT_BIG_Z+'_DT_BIG_Z').value;
document.getElementById(Oper_DT_END_Z).innerHTML=document.getElementById(Oper_DT_END_Z+'_DT_END_Z').value;

document.getElementById(Oper_FN_ROLE).innerHTML=document.getElementById(Oper_FN_ROLE+'_FN_ROLE').options[document.getElementById(Oper_FN_ROLE+'_FN_ROLE').selectedIndex].innerText;
document.getElementById(Oper_FN_STAN).innerHTML=document.getElementById(Oper_FN_STAN+'_FN_STAN').options[document.getElementById(Oper_FN_STAN+'_FN_STAN').selectedIndex].innerText;

//alert(Name[Oper_Tel_mas].length);

//alert(Oper_Tel_mas);
//alert(document.getElementsByName(Oper_Tel_mas).length);

//alert(document.getElementById(id_z_1).innerHTML);   
//alert(document.getElementById(user_1).innerHTML); 
//alert(Oper_Tel+'_tel');
//alert(document.getElementById(Oper_Tel+'_tel').value);
//alert(Oper_E_MAIL+'_E_MAIL');
//alert(document.getElementById(Oper_E_MAIL+'_E_MAIL').value);
//alert(Oper_IP+'_IP');
//alert(document.getElementById(Oper_IP+'_IP').value);
//alert(Oper_DT_BIG_Z+'_DT_BIG_Z');
//alert(document.getElementById(Oper_DT_BIG_Z+'_DT_BIG_Z').value);
//alert(Oper_DT_END_Z+'_DT_END_Z');
//alert(document.getElementById(Oper_DT_END_Z+'_DT_END_Z').value);
//alert(Oper_FN_ROLE+'_FN_ROLE');
//alert(document.getElementById(Oper_FN_ROLE+'_FN_ROLE').innerHTML);
//alert(document.getElementById(Oper_FN_ROLE+'_FN_ROLE').value);
//alert(Oper_FN_STAN+'_FN_STAN');
//alert(document.getElementById(Oper_FN_STAN+'_FN_STAN').innerHTML);
//alert(document.getElementById(Oper_FN_STAN+'_FN_STAN').value);

}
   




function updatePage_save(id_z_1) {
      //alert('111111111111');
     if (request2.readyState == 4) {
       if (request2.status == 200) {
        var response = request2.responseText;
      alert(response );  
     // alert('запись '+id_z_1+' заблокирована' );
       
       } else
         alert("status is " + request2.status);
     }
   } 
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

   </script>   
   
 
 


<%--
<script type="text/javascript" language="javascript">


function makeRequest(Xpage) {


      if(Xpage=='news'){
    url='http://10.58.1.96/root/IVC/IE/news.php'; }
      if(Xpage=='ivck'){
    url='http://10.58.1.96/root/IVC/IE/VCstruk/ivck.php'; }
     if(Xpage=='ivcg'){
    url='http://10.58.1.96/root/IVC/IE/VCstruk/ivcg.php'; }
     if(Xpage=='ivcz'){
    url='http://10.58.1.96/root/IVC/IE/VCstruk/ivcz.php'; }
     if(Xpage=='ivcz1'){
    url='http://10.58.1.96/root/IVC/IE/VCstruk/ivcz1.php';}




var http_request = false;

if (window.XMLHttpRequest) { // Mozilla, Safari, ...
http_request = new XMLHttpRequest();
if (http_request.overrideMimeType) {
http_request.overrideMimeType('text/xml');
// Читайте ниже об этой строке
}
} else if (window.ActiveXObject) { // IE
try {
http_request = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
try {
http_request = new ActiveXObject("Microsoft.XMLHTTP");
} catch (e) {}
}
}
if (!http_request) {
alert('Не вышло  Невозможно создать экземпляр класса XMLHTTP ');
return false;
}
http_request.onreadystatechange = function() { alertContents(http_request); };
request.onreadystatechange =function(){ updatePage_new_1(Xpage);};
http_request.open('GET', url, true);
http_request.send(null);
}








function alertContents(http_request) {

    // в нем будем отображать ход выполнения
    var statusElem = document.getElementById('reque') 


if (http_request.readyState == 4) {
if (http_request.status == 200) {
//alert(http_request.responseText);


XXX=http_request.responseText;
 statusElem.innerHTML = XXX;
} else {
alert('С запросом возникла проблема.');
}
}
}
</script>
<div onclick="makeRequest('news')">assdasd</div>
<div onclick="makeRequest('ivck')">assdasd</div>
<div onclick="makeRequest('ivcg')">22222</div>
<div onclick="makeRequest('ivcz')">3333</div>
<div onclick="makeRequest('ivcz1')">444</div>

<?php
echo"<div id='reque'></div>";
?>
      --%>
      