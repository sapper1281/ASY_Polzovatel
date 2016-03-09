<%@page import= "com.block_user"%>
<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>

<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){%>
<HR>
<table width="100%" border="1" >
<tr width="100%" >
<td >
<H2>Подтверждение блокировки</H2>
</td>
</tr>

<tr width="100%" >
<td >
<%if(session.getValue("id_role").equals("2")||session.getValue("id_role").equals("3")){%> 
<jsp:useBean id="Bean_block_user" class="com.block_user" scope="request"/>
<jsp:setProperty name="Bean_block_user" property="*"/> 

<%Bean_block_user.doPost(request,response);%> 
<table>
<tr>
<td>
<%=Bean_block_user.getOUT()%>
</td>
</tr>
</table>
<%}%>
</td>
</tr>
</table>
<%}%> 
<HR>

<script type="text/javascript">



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
       
     
 
  function getButton_blok(Name, butt_block,chek) {
  if (document.getElementById(chek).checked){
  document.getElementById(butt_block).style.display='block';
  }else{
  document.getElementById(butt_block).style.display='none';
  }}
  
  function getBlock(Name,butt_block, trcol,idus,chek) {
  var params = "idus=" + encodeURIComponent(document.getElementById(idus).innerHTML);
  var url = "<%=request.getContextPath()%>/block";
  request.open("POST", url, true);
  request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  request.onreadystatechange =function(){ updateBlock(butt_block, trcol,idus,chek);};
  request.send(params);
  }
  
  
  function updateBlock(butt_block,trcol,idus,chek) {
     if (request.readyState == 4) {
       if (request.status == 200) {
        var response = request.responseText;
       document.getElementById(idus).innerHTML=response;
        document.getElementById(trcol).style.color='BLACK';
        document.getElementById(butt_block).style.display='none';
        document.getElementById(chek).style.display='none';
        } else
         alert("status is " + request.status);
     }
   }
  
  
      
   </script >