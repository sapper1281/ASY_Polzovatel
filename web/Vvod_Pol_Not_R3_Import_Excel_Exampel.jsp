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

<%@page import= " org.apache.poi.hssf.util.*"%>
<%@page import= " org.apache.poi.hssf.usermodel.*"%>

<%@page import= " org.apache.commons.fileupload.*"%>
<%@page import= " org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import= " org.apache.commons.fileupload.disk.DiskFileItemFactory"%>


<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%Object lock = new Object(); 
synchronized(lock)
       {%>

<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)&&((session.getValue("id_role").equals("2"))||(session.getValue("id_role").equals("3")))){
response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");%>
<html>
<head><title>JSP Page</title></head>
<body>

<% 
HSSFWorkbook wb = new HSSFWorkbook();
     FileInputStream fileInput = null;
    
 fileInput = new FileInputStream("C:/Program Files/Apache Software Foundation/Tomcat 5.5/webapps/ASY_Polzovatel/doc/Vvod_Pol_Not_R3_Import_Excel.xls");
 wb = new HSSFWorkbook(fileInput);
 
 response.setContentType("application/download");
 response.setHeader("Content-Disposition", "inline; filename=\"Vvod_Pol_Not_R3_Import_Excel.xls\"");
 OutputStream out_out  = response.getOutputStream();
 wb.write(out_out) ;
 out_out.close();

%>
</body>
</html>
<%}%> 
<%}%>