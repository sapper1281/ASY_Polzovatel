<%@page import= "com.NewServlet7"%>
<%@page import= "com.SessionPeek"%> 
<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>

<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){%>
<%--if ("1".equals(request.getParameter("tper"))){--%>
<%--Bean1.doPost(request,response);--%>
<HR>
<table width="100%" border="1" >
<tr width="100%" >
<td >
<H2>Введенные пользователи</H2>
</td>
</tr>

<tr width="100%" >
<td >

<jsp:useBean id="Bean2" class="com.NewServlet7" scope="request"/>
<jsp:setProperty name="Bean2" property="*"/> 
<%--NewServlet7_.doPost(request,response);--%>
<%Bean2.doPost(request,response);%> 
<table>





<tr>
<td>
<%=Bean2.getOUT()%>
<%-- if (Bean2.getOUT()==null){%>Загрузка...<% }else
{ Bean2.getOUT(); }--%>

<%--=NewServlet7_.getOUT()--%>
</td>
</tr>
</table>
</td>
</tr>



</table>

<%--}--%>
<%}%> 
<HR>