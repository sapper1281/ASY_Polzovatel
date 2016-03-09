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
<%--<script type="text/javascript">
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

     
     
     
     
       function getLoad(ss) {
   


    var sendfile = document.getElementById(ss).value;
      
    var params = "sendfile=" + encodeURIComponent(sendfile);
      
     var url = "<%=request.getContextPath()%>/vvod_list_organ";
    
     request.open("POST", url, true);
    //request.setRequestHeader('Content-Type', 'multipart/form-data')
    request.onreadystatechange = updateLoad;
    request.send(params);
   }



function updateLoad() {
     if (request.readyState == 4) {
       if (request.status == 200) {
         var response = request.responseText;
        document.getElementById("set").innerHTML =response;
       } else
         alert("status is " + request.status);
     }
   }
     
     
</script>--%>
<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)&&(session.getValue("id_us").equals("35341"))){%>
 <%Object lock = new Object(); 
synchronized(lock)
       {%>
<HR>
<table border=1>
<tr width="50%" >
<td >
<H2>Ввод организаций не входящих в R3</H2>
</td>
</tr>


 <tr>
 <td>
<form name="sendfile" method=post  enctype="multipart/form-data" action="<%=request.getContextPath()%>/vvod_list_organ">
<table width=100%  >
       <%--input type=hidden id="tper" name="tper" value="adm_2"/--%>
       <tr><td NOWRAP colspan=2>Выберите файл:  <input type="file" style="width:70%" name="sendfile" ></td></tr>
	<tr><td NOWRAP colspan=2 align=center><input type=submit<%--button--%> value="Отправить" <%--onClick="getLoad('sendfile')"--%> > <input type=reset></td></tr>
</table>
</form>
</td>
</tr>



<tr width="100%" >

<td colspan=2>
<b>Формат xls <a href="<%=request.getContextPath()%>/doc/vvod_list_organ.xls"  target=_blank>Пример</b>
</td>

</tr>  
  
  
  
<%--<tr>
<td>
<div id="set">
</div>
</td>
</tr>--%>
</table>
 
<HR>
<%}%> 
<%}%>