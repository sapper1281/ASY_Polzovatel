<%@page import= "com.li_road"%>
<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>

<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){%>
<HR>
<table width="100%" border="1" >
<tr width="100%" >
<td >
<H2>Дерево предприятий</H2>
</td>
</tr>

<tr width="100%" >
<td >
<jsp:useBean id="Bean_li_road" class="com.li_road" scope="request"/>
<jsp:setProperty name="Bean_li_road" property="*"/> 

<%Bean_li_road.doPost(request,response);%> 
<table>
<tr>
<td>
<%=Bean_li_road.getOUT()%>
</td>
</tr>
</table>
</td>
</tr>
</table>
<%}%> 
<HR>
