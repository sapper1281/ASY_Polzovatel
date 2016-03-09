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
<%@page import= " java.text.*"%>



<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>

<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)&&
((session.getValue("id_us").equals("35341"))||(session.getValue("id_us").equals("25846"))
||(session.getValue("id_us").equals("23417")))

){
response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");%>
 <%Object lock = new Object(); 
synchronized(lock)
       {%>
<HR>
<table border=1>
<tr width="50%" >
<td >
<H2>Ввод пользователей для отключения ИР</H2>
</td>
</tr>


 <tr>
 <td>
<form name="sendfile" method=post  enctype="multipart/form-data" action="<%=request.getContextPath()%>/UploadJsp.jsp">
<table width=100%  >
        <tr><td NOWRAP colspan=2>Выберите файл:  <input type="file" style="width:70%" name="uploadedFile" ></td></tr>
	<tr><td NOWRAP colspan=2 align=center><input type=submit value="Отправить"  > <input type=reset></td></tr>
</table>
</form>
</td>
</tr>



<tr width="100%" >

<td colspan=2>
<b>Формат xls <a href="<%=request.getContextPath()%>/doc/UploadJsp_Form.xls"  target=_blank>Пример</b>
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