

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
<script src="jquery-1.4.2.js"></script>
<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){
response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");%>

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
  function CHEKSYS1(oForm, cbName, nn,sys,k1,k2) 
         { 
         $("#"+cbName+" ").hide();
         $("#img"+sys+"").show();  
         if(document.getElementById(nn).value=='Показать'){ 
         document.getElementById(nn).value='Скрыть';
         $("#"+cbName+" ").load("Redak_Pol_Info.jsp", {ss: sys,ss1: k1,ss2: k2}, function(){$("#img"+sys+" ").hide();});    
         $("#"+cbName+" ").show();
         } 
          else
         {document.getElementById(nn).value='Показать';
         $("#"+cbName+" ").hide();
         $("#img"+sys+" ").hide();} 
         }  
   
         
         
     function CHEKSYS2(oForm, cbName, nn,sys,k1,k2) 
         { 
        // alert(k1+" "+k2);
         //$("#"+cbName+" ").hide();
         $("#img"+sys+"").show();  
         //if(document.getElementById(nn).value=='Показать'){ 
         //document.getElementById(nn).value='Скрыть';
         $("#"+cbName+" ").load("Redak_Pol_Info.jsp", {ss: sys,ss1: k1,ss2: k2}, function(){$("#img"+sys+" ").hide();});    
         $("#"+cbName+" ").show();
         /*} 
          else
         {document.getElementById(nn).value='Показать';
         $("#"+cbName+" ").hide();
         $("#img"+sys+" ").hide();} */
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
ResultSet rs0 = stmt0.executeQuery(sys);
while (rs0.next()){%>
    
  <tr  >
  <td  NOWRAP colspan='4' ><input id="in1_<%=rs0.getInt("id_system")%>" type="button" value='Показать'
   onClick="CHEKSYS1(this.form,'id1_<%=rs0.getInt("id_system")%>','in1_<%=rs0.getInt("id_system")%>','<%=rs0.getInt("id_system")%>','1','30')" 
   >  
   <%=rs0.getString("sn_system").trim()%></td></tr> 
    
   <tr>
   <td>
   <img src="images/status_anim.gif" style="display:none" id='img<%=rs0.getInt("id_system")%>'>
   
   <div id="id1_<%=rs0.getInt("id_system")%>"  name="id1_<%=rs0.getInt("id_system")%>" style="display:none"  >
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
       
     
 
  function getCustomerInfo_new_1(Name,Oper_Tel,Oper_E_MAIL,Oper_IP,Oper_DT_BIG_Z,Oper_FN_ROLE,Oper_FN_STAN, butt_save,butt_del,chek) {
 
 if (document.getElementById(chek).checked){
 document.getElementById(butt_del).style.display='block';
 if(document.getElementById(butt_del).value=='Удалить'){  
 document.getElementById(chek).value=document.getElementById(Oper_Tel).innerHTML+'|'+
  document.getElementById(Oper_E_MAIL).innerHTML+'|'+
  document.getElementById(Oper_IP).innerHTML+'|'+
  
  document.getElementById(Oper_DT_BIG_Z).innerHTML+'|'+
  document.getElementById(Oper_FN_ROLE).innerHTML+'|'+
  document.getElementById(Oper_FN_STAN).innerHTML+'|';
  
  
  document.getElementById(butt_save).style.display='block';
   

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
 
  
  +"&"+"Oper_FN_ROLE=" + encodeURIComponent(document.getElementById(Oper_FN_ROLE).innerHTML)
  +"&"+"id_FN_ROLE=" + encodeURIComponent(Oper_FN_ROLE+'_FN_ROLE')
  +"&"+"Oper_FN_STAN=" + encodeURIComponent(document.getElementById(Oper_FN_STAN).innerHTML)
  +"&"+"id_FN_STAN=" + encodeURIComponent(Oper_FN_STAN+'_FN_STAN');
  
  //alert(params);

  var url = "<%=request.getContextPath()%>/NewServlet11";
  request.open("POST", url, true);
  request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  request.onreadystatechange =function(){ updatePage_new_1(Oper_Tel,Oper_E_MAIL,Oper_IP,Oper_DT_BIG_Z,Oper_FN_ROLE,Oper_FN_STAN);};
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
         if(p==4){document.getElementById(Oper_FN_ROLE).innerHTML=document.getElementById(chek).value.substring(k,i);}
         if(p==5){document.getElementById(Oper_FN_STAN).innerHTML=document.getElementById(chek).value.substring(k,i);}
         p=p+1;
         k=i+1;}
        }



}
   } 
      
      function updatePage_new_1(Oper_Tel_1,Oper_E_MAIL_1,Oper_IP_1,Oper_DT_BIG_Z_1,Oper_FN_ROLE_1,Oper_FN_STAN_1) {
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
        // alert(document.getElementById(Oper_DT_BIG_Z_1).innerHTML);
         if(p==1){document.getElementById(Oper_E_MAIL_1).innerHTML=response.substring(k,i);}
         if(p==2){document.getElementById(Oper_IP_1).innerHTML=response.substring(k,i);}
         if(p==3){document.getElementById(Oper_DT_BIG_Z_1).innerHTML=response.substring(k,i);}
         if(p==4){document.getElementById(Oper_FN_ROLE_1).innerHTML=response.substring(k,i);}
         if(p==5){document.getElementById(Oper_FN_STAN_1).innerHTML=response.substring(k,i);}
         p=p+1;
         k=i+1;}
        }
        
       
       } else
         alert("status is " + request.status);
     }
   }
   
   
     function  getDelet(Name,butt_save,butt_del,id_z_1,user_1,Oper_Tel,Oper_E_MAIL,Oper_IP,Oper_DT_BIG_Z,Oper_FN_ROLE,Oper_FN_STAN,chek) 
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
          if(p==4){document.getElementById(Oper_FN_ROLE).innerHTML=document.getElementById(chek).value.substring(k,i);}
         if(p==5){document.getElementById(Oper_FN_STAN).innerHTML=document.getElementById(chek).value.substring(k,i);}
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
   getCustomerInfo_new_1(Name,Oper_Tel,Oper_E_MAIL,Oper_IP,Oper_DT_BIG_Z,Oper_FN_ROLE,Oper_FN_STAN, butt_save,butt_del,chek);
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
  




   
   
   
   
   
   
   
   
    function  getSave(Name,butt_save,butt_del,id_z_1,user_1,Oper_Tel,Oper_E_MAIL,Oper_IP,Oper_DT_BIG_Z,Oper_FN_ROLE,Oper_FN_STAN,Oper_ID_ROAD_ASU_TR,Oper_Tel_mas,Oper_E_MAIL_mas,Oper_IP_mas,Oper_FN_STAN_mas,chek) 
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
      