
<%--@page import= "com.Poisk"--%>
<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>

<script type="text/javascript" src="js/jquery.js"></script>
 
<%--&&(session.getValue("id_role").equals("2")||session.getValue("id_role").equals("3"))--%>
<%--/style--%>



<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){
response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");
%>
<%--if ("1".equals(request.getParameter("tper"))){--%>
<%--Bean1.doPost(request,response);--%>
<HR>
<table width="100%" border="1" >
<tr width="100%" >
<td >
<H2>Ввод данных</H2>
</td>



<td>
<H2>Данные записанные в БД</H2>
</td>

</tr>

<tr width="100%" >



<td>
<form id="searchForm1" name="searchForm1" method="post">
<table>



<tr><td><font color=4F5E7B size=2 >Поиск по фамилии:</font></td>
<input type=hidden name="road_0" value="not">
<input type=hidden name="job_0" value="not">
<input type=hidden name="id_0" value="not">

<td align=center>
<div>
<input name="searchqPoisk" type="text" id="searchqPoisk" size="50" maxlength=250 value="" onClick="getCliPoisk('searchqPoisk');" >
</div></td>


<td align=center>
<input type="button" value="найти" onClick="getCustomerInfoPoisk('searchqPoisk');" ></td></tr>
<tr>
<td align=center colspan='2'>
<input type="checkbox"  name="Pr_not_R3"  id="Pr_not_R3"  value="">Организации нет в системе R3</td>
</tr>

</table>
</FORM>
</td>




<td rowspan="4">
<img src="images/status_anim.gif" style="display:none" id='img_load2'/>
<div width="100%" align="top" name="td11" id="td11"  />
</div>
</td>



</tr>

<tr width="100%" >



<td>
<img src="images/status_anim.gif" style="display:none" id='img_load'/>
<div width="100%" align="top" name="td11_11" id="td11_11" value="rrrrrr" />
</div>



</td>





</tr>





<tr width="100%" >



<td>
<img src="images/status_anim.gif" style="display:none" id='img_load1'/>
<div width="100%" align="top" name="road_job" id="road_job" value="rrrrrr" />
</div>
</td>





</tr>

<%--

<tr width="100%" >
<td >
<tr>
<td >
tttttttttttttttttttttt
</td >
</tr>

<tr>
<td >
yyyyyyyyyyyyyyyyyyyyyyyyyyy
</td >
</tr>
</td>


 


<td >
<tr>
<td >
rrrrrrrrrrrrrrrrrrrrrrrrrrr
</td >
</tr>
</td>



</tr>--%>
</table>

<%}%>
<%--}--%> 
<HR>
<script type="text/javascript">
   var request = false;
   try {
     request = new XMLHttpRequest();
   } catch (trymicrosoft) {
     try {
       request = new ActiveXObject("Msxml2.XMLHTTP");
     } catch (othermicrosoft) {
       try {
         request = new ActiveXObject("Microsoft.XMLHTTP");
       } catch (failed) {
         request = false;
       }  
     }
   }

   if (!request)
     alert("Error initializing XMLHttpRequest!");

     
     
     function getCliPoisk(ss) {
     document.getElementById(ss).value="";}

  /* function getCustomerInfoPoisk(ss) { 
   $("#img_load").show();
   var fio = document.getElementById(ss).value;
   $("#td11_11").load("<%=request.getContextPath()%>/Poisk_1", {fio: encodeURIComponent(fio)}, function(){$("#img_load").hide();});  
   }   
   */
   
   
   //поиск фамилий
      function getCustomerInfoPoisk(ss) {
      document.getElementById("td11_11").innerHTML="";
      document.getElementById("road_job").innerHTML="";
      document.getElementById("td11").innerHTML="";
    
      var fio = document.getElementById(ss).value;
      var params = "fio=" + encodeURIComponent(fio);
      
      if(document.getElementById('Pr_not_R3').checked==true){
      //alert("ret");
      $("#img_load").show();
      $("#td11_11").load("Vvod_Pol_One_Not_R3.jsp", {fio: fio}, function(){$("#img_load").hide();});  
      }
      else {var url = "<%=request.getContextPath()%>/Poisk_1";
      $("#img_load").show(); 
      request.open("POST", url, true);
      request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
      request.onreadystatechange = updatePagePoisk;
      request.send(params);
      }
      }

      function updatePagePoisk() {
      if (request.readyState == 4) {
       if (request.status == 200) {
         $("#img_load").hide();
         var response = request.responseText;
         document.getElementById("td11_11").innerHTML =response;
       } else
         alert("status is " + request.status);}}
     
     
         
         
         
         
         
         
         
         
         
         
         
         
         
       
         
         
   //форма вывод данных R3     
    function getCustomerInfoPoisk_1(ss1,ss) {
    
    
    var pr_r3=ss; 
    var road_123="";
    document.getElementById("road_job").innerHTML="";
    document.getElementById("td11").innerHTML="";
    
    for (var i=0; i < document.getElementsByName(ss1).length; i++){ 
    if( document.getElementsByName(ss1)(i).checked){ 
    road_123= document.getElementsByName(ss1)(i).value+"|";}}
    STR="xxx.ccc.vvv";
    var st =road_123.split("|");
    
    if(st.length>1){
     var   road= st[2];
     var   job= st[0]; 
     var   id= st[1];  
     document.getElementById("road_0").value=road;
     document.getElementById("job_0").value=job;
     document.getElementById("id_0").value=id;  
     var params = "road=" + encodeURIComponent(road)
     +"&"+"job=" + encodeURIComponent(job)
     +"&"+"pr_r3=" + encodeURIComponent(pr_r3)
     +"&"+"id=" + encodeURIComponent(id);
     var url = "<%=request.getContextPath()%>/Vvod_Pol_One_Info";
     $("#img_load1").show(); 
     request.open("POST", url, true);
     request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
     request.onreadystatechange = updatePagePoisk_1;
     request.send(params);}else{alert("Повторите ввод");}} 
   
   
     function updatePagePoisk_1() {
     if (request.readyState == 4) {
       if (request.status == 200) {
         $("#img_load1").hide();
         var response = request.responseText;
         document.getElementById("road_job").innerHTML =response;
       } else
         alert("status is " + request.status);}}
  
   
    
         
     
         
         
         
         
         
     /*    
        //форма вывод данных не R3(есть)     
    function getCustomerInfoPoisk_2(ss1) {
    var road_123="";
    document.getElementById("road_job").innerHTML="";
    document.getElementById("td11").innerHTML="";
    
    for (var i=0; i < document.getElementsByName(ss1).length; i++){ 
    if( document.getElementsByName(ss1)(i).checked){ 
    road_123= document.getElementsByName(ss1)(i).value+"|";}}
    STR="xxx.ccc.vvv";
    var st =road_123.split("|");
     var   road= st[2];
     var   job= st[0]; 
     var   id= st[1];  
     document.getElementById("road_0").value=road;
     document.getElementById("job_0").value=job;
     document.getElementById("id_0").value=id;  
     var params = "road=" + encodeURIComponent(road)
     +"&"+"job=" + encodeURIComponent(job)
     +"&"+"id=" + encodeURIComponent(id);
     var url = "<%=request.getContextPath()%>/Vvod_Pol_One_Info";
     $("#img_load1").show(); 
     request.open("POST", url, true);
     request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
     request.onreadystatechange = updatePagePoisk_1;
     request.send(params);} 
   
   
     function updatePagePoisk_2() {
     if (request.readyState == 4) {
       if (request.status == 200) {
         $("#img_load1").hide();
         var response = request.responseText;
         document.getElementById("road_job").innerHTML =response;
       } else
         alert("status is " + request.status);}}
  
    */
         
         
         
      //форма вывод данных не R3(нет)     
    function getCustomerInfoPoisk_3() {
    //var pr="3";
    document.getElementById("road_job").innerHTML="";
    document.getElementById("td11").innerHTML="";
   // alert("ret3");
    var fio=document.getElementById('searchqPoisk').value;
   // alert(fio);
    $("#img_load1").show();
    $("#road_job").load("Vvod_Pol_One_Not_R3_Info_Not.jsp", {fio: fio}, function(){$("#img_load1").hide();});} 
   
   
  /* function getCustomerInfoPoisk_3_Save() {
    //var pr="3";
    document.getElementById("td11").innerHTML="";
    alert("ret3");
    var fio=document.getElementById('searchqPoisk').value;
    alert(fio);
    $("#img_load2").show();
    $("#td11").load("Vvod_Pol_One_Not_R3_Info_Not.jsp", {fio: fio}, function(){$("#img_load2").hide();});  
}       
         
         
         */
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
      function getCustomerInfo(ss,ss1) {
      document.getElementById("td11").innerHTML="";
    
     var pr_r3=ss; 
     var pr_new=ss1;
     var road = document.getElementById("road").value;
     //alert(road);
     var stan = document.getElementById("stan").value;
    // alert(stan);
//var usl = document.getElementById("usl").value;
     
     var system = document.getElementById("system").value;
    // alert(system);
     var role = document.getElementById("role").value;
    // alert(role);
     var job = document.getElementById("job").value;
    // alert(job);
    var id_user="";
    if(ss1=='new'){
    
    id_user = document.getElementById("fam").value
+" "+document.getElementById("imy").value
+" "+document.getElementById("otc").value;
     
    }else{ id_user = document.getElementById("id_user").value;}
    // alert(id_user);
     var tel = document.getElementById("tel").value;
    // alert(tel);
     var ip = document.getElementById("ip").value;
    // alert(ip);
     var mail = document.getElementById("mail").value;
    // alert(mail);
     var dt_big_z = document.getElementById("dt_big_z").value;
   //  alert(dt_big_z);
     var num_z = document.getElementById("num_z").value;
   //  alert(num_z);
     
     
//var dt_end_z = document.getElementById("dt_end_z").value;
    
  var params = "road=" + encodeURIComponent(road)
  +"&"+"pr_r3=" + encodeURIComponent(pr_r3)
  +"&"+"pr_new=" + encodeURIComponent(pr_new)
+"&"+"stan=" + encodeURIComponent(stan)

//+"&"+"usl=" + encodeURIComponent(usl)

+"&"+"system=" + encodeURIComponent(system)
+"&"+"role=" + encodeURIComponent(role)
+"&"+"job=" + encodeURIComponent(job)
+"&"+"id_user=" + encodeURIComponent(id_user)
+"&"+"tel=" + encodeURIComponent(tel)
+"&"+"ip=" + encodeURIComponent(ip)
+"&"+"mail=" + encodeURIComponent(mail)
+"&"+"dt_big_z=" + encodeURIComponent(dt_big_z)
+"&"+"num_z=" + encodeURIComponent(num_z);
//+"&"+"dt_end_z=" + encodeURIComponent(dt_end_z);



 <%if (session.getValue("id_role").equals("2")){%>
   var user_log = document.getElementById("user_log").value;
   var user_pas = document.getElementById("user_pas").value;
   params =params
   +"&"+"user_log=" + encodeURIComponent(user_log)
   +"&"+"user_pas=" + encodeURIComponent(user_pas);
 <%}%>
   
  var url = "<%=request.getContextPath()%>/Vvod_Pol_One_Save";
  request.open("POST", url, true);
  request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
  request.onreadystatechange = updatePage;
  request.send(params)
   }
     
    function updatePage() {
     if (request.readyState == 4) {
       if (request.status == 200) {
         var response = request.responseText;
         document.getElementById("td11").innerHTML =response;
        } else
         alert("status is " + request.status);}} 
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
         
         
         
         
         
         
      /*    
     function getCustomerInfo_new(Name,Oper_Type) {
      if(Oper_Type=='usl_sel_0'){    
      var system_sel_0 = document.getElementById(Name).value;
      var params = "system_sel_0=" + encodeURIComponent(system_sel_0);
      var url = "<%=request.getContextPath()%>/NewServlet8";}
      request.open("POST", url, true);
      request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
      if(Oper_Type=='usl_sel_0'){ request.onreadystatechange = updatePage_new;}
      request.send(params);} 
      
    function updatePage_new() {
     if (request.readyState == 4) {
       if (request.status == 200) {
         var response = request.responseText;
         document.getElementById("usl_div").innerHTML =response;
         } else
         alert("status is " + request.status);}}     
     */       
         
         
    /*
    function getCustomerInfo3(ss,ss1) {
      var road_sel_0 = document.getElementById(ss1).value;
      
       
      
  //  alert("Выбрана запись с IDroad: " + road_sel_0);
	
   // alert("Выбрана запись с IDjob: " + job);
	
   //   alert("Выбрана запись с IDjob: " + id); 
      
      
   var params = "road_sel_0=" + encodeURIComponent(road_sel_0);
  //   alert("params: " + params); 
      
     var url = "<%=request.getContextPath()%>/NewServlet6";
     
 //  alert("url " + url); 
     request.open("POST", url, true);
   request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
   

    
    request.onreadystatechange = updatePage3;
     request.send(params);
   }
   
   
   
   function updatePage3() {
     if (request.readyState == 4) {
       if (request.status == 200) {
         var response = request.responseText;
        // alert("ddddddd");
        // alert(response);
         document.getElementById("road_sel").innerHTML =response;
         
       } else
         alert("status is " + request.status);
     }
   }
   
   
   
   
   
   
   
 
   
   function getCustomerInfo2(ss) {
     if(document.getElementById("road_0").value!="not"){
     var road = document.getElementById("road_0").value;
      var job =  document.getElementById("job_0").value;
      
      var id =  document.getElementById("id_0").value;
      
       
      
    //alert("Выбрана запись с IDroad: " + road);
	
   // alert("Выбрана запись с IDjob: " + job);
	
   //   alert("Выбрана запись с IDjob: " + id); 
      
      
   var params = "road=" + encodeURIComponent(road)
+"&"+"job=" + encodeURIComponent(job)
+"&"+"id=" + encodeURIComponent(id);
  //   alert("params: " + params); 
      
     var url = "<%=request.getContextPath()%>/NewServlet3";
     
 //  alert("url " + url); 
     request.open("POST", url, true);
   request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
   

    
    request.onreadystatechange = updatePage1;
     request.send(params)}
   }

    
       
    */

  
     
      
    
    
    
    
    
    
    
    
    
    
    


 </script>

