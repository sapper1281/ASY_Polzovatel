<%@page import= "com.li_user_sys"%>
<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>

<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){%>
<HR>
<table width="100%" border="1" >
<tr width="100%" >
<td >
<H2>Количество введенных пользователей</H2>
</td>
</tr>

<tr width="100%" >
<td >
<jsp:useBean id="Bean_li_user_sys" class="com.li_user_sys" scope="request"/>
<jsp:setProperty name="Bean_li_user_sys" property="*"/> 

<%Bean_li_user_sys.doPost(request,response);%> 
<table>
<tr>
<td>
<%=Bean_li_user_sys.getOUT()%>
</td>
</tr>
</table>
</td>
</tr>
</table>
<%}%> 
<HR>
