<%@page import= "com.Autorization"%>
<%@page import= "com.SessionTracking"%>


<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>

<jsp:useBean id="Bean" class="com.Autorization" scope="request"/>
<jsp:setProperty name="Bean" property="*"/>
<html>

<head>
        <title>АСУ "Пользователь"</title>
</head>
<body>
<center><H3>АСУ "Пользователь"</H3></center>

<%--center style="color: RED"><H3>Сегодня 01.02.2011 АСУ Пользователь доступен для просмотра</H3></center--%>
<center style="color: RED"><H3>В связи с обновлением данных в БД АСУ Пользователь, прошу провести работы по разблокировке пользователей.</H3></center>
<%--center style="color: RED"><H3>Произведена выгрузка из АСУ ЗИР</H3></center--%>
<center style="color: RED"><H3>В случае возникновения ошибок прошу сообщить на e-mail: apopovkin@serw.rzd</H3></center>
<%--center style="color: RED"><H3> 15.02.2011 г. c 14-00 система будет отключена для проведения профилактических работ</H3></center--%>



<%--center style="color: RED"><H3> 15.12.2010 г. система будет отключена для проведения профилактических работ</H3></center--%>
<%--center style="color: RED"><H3>Обновлен режим поиска(введите ФИО и нажмите найти, из списка выберите нужную),в случае возникновения ошибок прошу сообщить на почтовый адрес apopovkin@serw.rzd </H3></center--%>

<HR>
<%if (request.getParameter("j_username")!=null){
Bean.doPost(request,response);%>

<%}%> 
<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){%>
<table width="100%">
<tr>
<td>
<table width="100%" align="left">
<tr width="100%" >
    <td align="left"><h4>Добрый день:&nbsp; <%=session.getValue("LAST_NAME")%>&nbsp; <%=session.getValue("FIRST_NAME")%> &nbsp;<%=session.getValue("MIDDLE_NAME")%>&nbsp;&nbsp;&nbsp;Доступ:&nbsp; <%=session.getValue("fn_role")%></h4></td>
   <%-- <td align="right"><h4>На сайте:&nbsp; <%=session.%></h4></td>--%>
   
   
   <td align="right"><h4>  На сайте: <%= session.getAttribute("SessionsCount")%> </h4></td>
      
   <jsp:useBean id="Monitor" class="com.SessionTracking"/>
  <% Monitor.SessionCount(request);%>
  <%if(session.getValue("id_us").equals("35341")){%>
    <td align="right"><h4>  На сайте: <%= session.getAttribute("SessionsName")%> </h4></td> 
     <%}%>
    
   
   
    <td align="right"><h4>IP:&nbsp; <%=request.getRemoteAddr()%></h4></td>
    <td>
    

    
    
    
    
    <form    name="autorization" method="post"> 
    <input type=hidden name="logout" value="1">
     <input type = "submit" value="Выход"/> 
    </form> 
    </td>
</tr>
<tr><td><a href="<%=request.getContextPath()%>/doc/asy_pol.doc"  target=_blank>Инструкция</a></td></tr>
</table>
</td>
</tr>

</table>
<HR>
<%}%>









