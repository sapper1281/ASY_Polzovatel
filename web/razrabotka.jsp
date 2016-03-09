<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>
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
<%@page import= " javax.sql.DataSource"%>
<%@page import= " org.apache.poi.hssf.util.*"%>
<%@page import= " org.apache.poi.hssf.usermodel.*"%>
<%@page import= " java.text.SimpleDateFormat"%>
<%@page import= " org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import= " org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import= " org.apache.commons.fileupload.*"%>
<%@page import= " javax.servlet.ServletException"%>
<%@page import= " java.text.SimpleDateFormat"%>






<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){%>
 <%Object lock = new Object(); 
synchronized(lock)
       {%>
<HR>


<tr><td><H3>Разрабатывается</H3></td></tr>


<HR>
<%}%> 
<%}%> 
