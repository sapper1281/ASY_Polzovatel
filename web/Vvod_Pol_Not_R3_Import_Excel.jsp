<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>
<%--ввод пользователей не входящих в R3--%>

<%Object lock = new Object(); 
synchronized(lock)
       {%>
<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)&&((session.getValue("id_role").equals("2"))||(session.getValue("id_role").equals("3")))){
response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");%>
<script > 
    function Click_Exampel() 
    { 
 obj = document.getElementById('Exampel');  
 obj.setAttribute("action","<%=request.getContextPath()%>/Vvod_Pol_Not_R3_Import_Excel_Exampel.jsp");  
 obj.setAttribute("target","hiddenframe");  
 obj.setAttribute("method","post");  
 obj.setAttribute("enctype","multipart/form-data");  
 obj.submit(); }


</script>






<HR>
<table border=1 width=100% >
<tr>
<td>
<H2>Выберите импортируемый файл Excel</H2>
</td>
</tr>



<tr>
<td>
<form name="sendfile" method=post  enctype="multipart/form-data" action="<%=request.getContextPath()%>/Vvod_Pol_Not_R3_Import_Excel_Vibor.jsp">
<table width=100%  >
       <tr><td NOWRAP colspan=2>Выберите файл:  <input type="file" style="width:70%" name="sendfile" ></td></tr>
       <tr><td NOWRAP colspan=2 align=center><input type=submit value="Отправить" > <input type=reset></td></tr>
</table>
</form>
</td>
</tr>
<tr>
<td colspan=2>

<form name="Exampel">

<tr  style="color: Blue; "    onclick='Click_Exampel()' ><td height='50' style='cursor:pointer' ><i><u><b>Пример:  Формат xls </b></u></i></td></tr>
<%--tr><td NOWRAP colspan=2 align=center><input type=submit value="Пример" > </td></tr--%>


</form>
</td>
</tr>

</table>

<HR>
<%}%> 
<%}%>