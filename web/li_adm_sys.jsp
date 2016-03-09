<%@page import= "com.li_adm_sys"%>
<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>

<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){%>
<HR>
<table width="100%" border="1" >
<tr width="100%" >
<td >
<H2>Сотрудники вводящие информацию в АСУ Пользователь по инф. ресурсам</H2>
</td>
</tr>

<tr width="100%" >
<td >
<jsp:useBean id="Bean_li_adm_sys" class="com.li_adm_sys" scope="request"/>
<jsp:setProperty name="Bean_li_adm_sys" property="*"/> 

<%Bean_li_adm_sys.doPost(request,response);%> 
<table>
<tr>
<td>
<%=Bean_li_adm_sys.getOUT()%>
</td>
</tr>
</table>
</td>
</tr>
</table>
<%}%> 
<HR>

