<%@page import= "com.Autorization"%>
<%@page import= "com.SessionTracking"%>


<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>

<jsp:useBean id="Bean" class="com.Autorization" scope="request"/>
<jsp:setProperty name="Bean" property="*"/>
<html>

<head>
        <title>��� "������������"</title>
</head>
<body>
<center><H3>��� "������������"</H3></center>

<%--center style="color: RED"><H3>������� 01.02.2011 ��� ������������ �������� ��� ���������</H3></center--%>
<center style="color: RED"><H3>� ����� � ����������� ������ � �� ��� ������������, ����� �������� ������ �� ������������� �������������.</H3></center>
<%--center style="color: RED"><H3>����������� �������� �� ��� ���</H3></center--%>
<center style="color: RED"><H3>� ������ ������������� ������ ����� �������� �� e-mail: apopovkin@serw.rzd</H3></center>
<%--center style="color: RED"><H3> 15.02.2011 �. c 14-00 ������� ����� ��������� ��� ���������� ���������������� �����</H3></center--%>



<%--center style="color: RED"><H3> 15.12.2010 �. ������� ����� ��������� ��� ���������� ���������������� �����</H3></center--%>
<%--center style="color: RED"><H3>�������� ����� ������(������� ��� � ������� �����, �� ������ �������� ������),� ������ ������������� ������ ����� �������� �� �������� ����� apopovkin@serw.rzd </H3></center--%>

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
    <td align="left"><h4>������ ����:&nbsp; <%=session.getValue("LAST_NAME")%>&nbsp; <%=session.getValue("FIRST_NAME")%> &nbsp;<%=session.getValue("MIDDLE_NAME")%>&nbsp;&nbsp;&nbsp;������:&nbsp; <%=session.getValue("fn_role")%></h4></td>
   <%-- <td align="right"><h4>�� �����:&nbsp; <%=session.%></h4></td>--%>
   
   
   <td align="right"><h4>  �� �����: <%= session.getAttribute("SessionsCount")%> </h4></td>
      
   <jsp:useBean id="Monitor" class="com.SessionTracking"/>
  <% Monitor.SessionCount(request);%>
  <%if(session.getValue("id_us").equals("35341")){%>
    <td align="right"><h4>  �� �����: <%= session.getAttribute("SessionsName")%> </h4></td> 
     <%}%>
    
   
   
    <td align="right"><h4>IP:&nbsp; <%=request.getRemoteAddr()%></h4></td>
    <td>
    

    
    
    
    
    <form    name="autorization" method="post"> 
    <input type=hidden name="logout" value="1">
     <input type = "submit" value="�����"/> 
    </form> 
    </td>
</tr>
<tr><td><a href="<%=request.getContextPath()%>/doc/asy_pol.doc"  target=_blank>����������</a></td></tr>
</table>
</td>
</tr>

</table>
<HR>
<%}%>









