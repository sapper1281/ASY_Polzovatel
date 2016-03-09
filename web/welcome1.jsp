
<%@page import= "com.NewServlet5"%>
<%@page import= "com.SessionPeek1"%>
<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.autocomplete.js"></script>
<style type="text/css">


.ac_results {
	padding: 0px;
	border: 1px solid WindowFrame;
	background-color: Window;
	overflow: hidden;
}

.ac_results ul {
	width: 100%;
	list-style-position: outside;
	list-style: none;
	padding: 0;
	margin: 0;
}

.ac_results iframe {
	display:none;/*sorry for IE5*/
	display/**/:block;/*sorry for IE5*/
	position:absolute;
	top:0;
	left:0;
	z-index:-1;
	filter:mask();
	width:3000px;
	height:3000px;
}

.ac_results li {
	position:relative;
    margin: 0px;
	padding: 2px 5px;
	cursor: pointer;
	display: block;
	width: 100%;
	font: menu;
	font-size: 12px;
	overflow: hidden;
}

.ac_loading {
	background : Window url('autocomplete_indicator.gif') right center no-repeat;
}

.ac_over {
	background-color: Highlight;
	color: HighlightText;
}

#searchq {
  width:260px;
border: inset 2px;
}
<%--&&(session.getValue("id_role").equals("2")||session.getValue("id_role").equals("3"))--%>
</style>
<jsp:useBean id="Bean1" class="com.NewServlet5" scope="request"/>
<jsp:setProperty name="Bean1" property="*"/>
<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){%>
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
<form id="searchForm" name="searchForm" method="post" ACTION="/ASY_Polzovatel/NewServlet1">
<table>
<tr><td><font color=4F5E7B size=2 >Поиск по фамилии:</font></td>
<input type=hidden name="road_0" value="not">
<input type=hidden name="job_0" value="not">
<input type=hidden name="id_0" value="not">

<td align=center>
<div class="searchInput">
<input name="searchq" type="text" id="searchq" size="50" maxlength=250 value="" onClick="getCli('searchq');" >
</div></td>
<td align=center>
<input type="button" value="найти" onClick="getCustomerInfo1('searchForm');" style="cursor:pointer;" class=button></td>
</tr>

</table>
</FORM>
</td>




<td rowspan="2">
<div width="100%" align="top" name="td11" id="td11"  />
</div>
</td>



</tr>

<tr width="100%" >



<td>
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
$(document).ready(function(){


function liFormat (row, i, num) {
	var result = row[0];
	return result;
}
function selectItem(li) {
	if( li == null ) var sValue = 'А ничего не выбрано!';
	if( !!li.extra ) var sValue0 = li.extra[0];
	if( !!li.extra ) var sValue1 = li.extra[1];
	if( !!li.extra ) var sValue2 = li.extra[2];
	else var sValue = li.selectValue;
	//alert("Выбрана запись с ID: " + sValue0);
	//alert("Выбрана запись с ID: " + sValue1);
	//alert("Выбрана запись с ID: " + sValue2);
	document.getElementById("road_0").value=sValue2;
	document.getElementById("job_0").value=sValue0;
	document.getElementById("id_0").value=sValue1;
	//alert("Выбрана запись с IDroad_0: " + document.getElementById("road_0").value);
	//alert("Выбрана запись с IDjob_0: " + document.getElementById("job_0").value);
	
     
	
	
	

	
	
	
	
	
	
	
	
	
	//getCustomerInfo('searchForm');
//   alert( document.getElementById("job").value);
}

// --- Автозаполнение2 ---
$("#searchq").autocomplete("/ASY_Polzovatel/NewServlet1", {
	delay:10,
	minChars:10,
	matchSubset:1,
	autoFill:false,
	matchContains:1,
	cacheLength:10,
	selectFirst:true,
	formatItem:liFormat,
	maxItemsToShow:10,
	onItemSelect:selectItem
}); 

});
<%--/script>
<script language="javascript" type="text/javascript"--%>


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

     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
      
      function getCli(ss) {
      
       
      
    document.getElementById(ss).value="";
   // document.getElementById("road_0").value="not";
   // document.getElementById("job_0").value="not";
   // document.getElementById("id_0").value="not";
	
   
   }

     
     
     
     
     
     
     
     
     
     
     
      function getCustomerInfo3(ss,ss1) {
      var road_sel_0 = document.getElementById(ss1).value;
      
       
      
    alert("Выбрана запись с IDroad: " + road_sel_0);
	
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

     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     function getCustomerInfo1(ss) {
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

     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
   function getCustomerInfo(ss) {
     var road = document.getElementById("road").value;
      //alert(road);
     // var nod = document.getElementById("nod").value;
     // alert(nod);
     // var service = document.getElementById("service").value;
      
     // alert(service);
      var stan = document.getElementById("stan").value;
      
     // alert(stan);
    //  var org = document.getElementById("org").value;
     // alert(org);
      var usl = document.getElementById("usl").value;
     // alert(usl);
      var system = document.getElementById("system").value;
     // alert(system);
     // var arm = document.getElementById("arm").value;
     // alert(arm);
      var role = document.getElementById("role").value;
     // alert(role);
      var job = document.getElementById("job").value;
      var id_user = document.getElementById("id_user").value;
     // alert(job);
     // var last = document.getElementById("last").value;
     /// alert(last);
      //var first = document.getElementById("first").value;
      //alert(first);
     // var middle = document.getElementById("middle").value;
      //alert(middle);
      var tel = document.getElementById("tel").value;
     // alert(tel);
      var ip = document.getElementById("ip").value;
     // alert(ip);
      var mail = document.getElementById("mail").value;
     // alert(mail);
      var dt_big_z = document.getElementById("dt_big_z").value;
     // alert(dt_big_z);
      var dt_end_z = document.getElementById("dt_end_z").value;
    //  alert(dt_end_z);
    
    
   
     
      
   var params = "road=" + encodeURIComponent(road)
//+"&"+"nod=" + encodeURIComponent(nod)
//+"&"+"service=" + encodeURIComponent(service)
+"&"+"stan=" + encodeURIComponent(stan)
//+"&"+"org=" + encodeURIComponent(org)
+"&"+"usl=" + encodeURIComponent(usl)
+"&"+"system=" + encodeURIComponent(system)
//+"&"+"arm=" + encodeURIComponent(arm)
+"&"+"role=" + encodeURIComponent(role)
+"&"+"job=" + encodeURIComponent(job)
+"&"+"id_user=" + encodeURIComponent(id_user)
//+"&"+"last=" + encodeURIComponent(last)
//+"&"+"first=" + encodeURIComponent(first)
//+"&"+"middle=" + encodeURIComponent(middle)
+"&"+"tel=" + encodeURIComponent(tel)
+"&"+"ip=" + encodeURIComponent(ip)
+"&"+"mail=" + encodeURIComponent(mail)
+"&"+"dt_big_z=" + encodeURIComponent(dt_big_z)
+"&"+"dt_end_z=" + encodeURIComponent(dt_end_z);



 <%if (session.getValue("id_role").equals("2")){%>
   var user_log = document.getElementById("user_log").value;
     // alert(dt_big_z);
      var user_pas = document.getElementById("user_pas").value;
    //  alert(dt_end_z);
    
    
     params =params
    +"&"+"user_log=" + encodeURIComponent(user_log)
    +"&"+"user_pas=" + encodeURIComponent(user_pas);
    // alert(user_pas);
    
    
    <%}%>
      




      
      
     var url = "<%=request.getContextPath()%>/NewServlet4";
     
     
     
 
//alert(url);
 //document.getElementById("phone").value=url;
     request.open("POST", url, true);
   request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
   

    
    request.onreadystatechange = updatePage;
     request.send(params)
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
   
   
   
 function updatePage() {
     if (request.readyState == 4) {
       if (request.status == 200) {
         var response = request.responseText;
        // alert("ddddddd");
        // alert(response);
         document.getElementById("td11").innerHTML =response;
         
       } else
         alert("status is " + request.status);
     }
   }

function updatePage1() {
     if (request.readyState == 4) {
       if (request.status == 200) {
         var response = request.responseText;
        // alert("ddddddd");
       //  alert(response);
       //  alert(document.getElementById("road_job").value);
         document.getElementById("road_job").innerHTML =response;
         
       } else
         alert("status is " + request.status);
     }
     
     
     document.getElementById("road_0").value="not";
	document.getElementById("job_0").value="not";
	document.getElementById("id_0").value="not";
   //  alert(document.getElementById("road_0").value);
   }
    
    



   
         
      function getCustomerInfo_new(Name,Oper_Type) {
      //alert(Name);
      //alert(Oper_Type);
      if(Oper_Type=='usl_sel_0'){    
     // alert(Name);
      //alert(Oper_Type);
      var system_sel_0 = document.getElementById(Name).value;
      
      var params = "system_sel_0=" + encodeURIComponent(system_sel_0);
      var url = "<%=request.getContextPath()%>/NewServlet8";}
      request.open("POST", url, true);
      request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
      if(Oper_Type=='usl_sel_0'){ request.onreadystatechange = updatePage_new;}
      request.send(params);
   } 
      
      
      
      
      
      function updatePage_new() {
     if (request.readyState == 4) {
       if (request.status == 200) {
         var response = request.responseText;
        
         document.getElementById("usl_div").innerHTML =response;
         
       } else
         alert("status is " + request.status);
     }
   }
      
      
      
      
      
      
      
    
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   


 </script>

