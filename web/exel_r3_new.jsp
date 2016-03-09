<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>








<%@page import= "java.io.*"%>
<%@page import= "java.net.*"%>
<%@page import= "javax.servlet.*"%>
<%@page import= "javax.servlet.http.*"%>
<%@page import= "javax.servlet.http.*"%>
<%@page import= "javax.servlet.ServletException"%> 
<%@page import= "java.io.*"%> 
<%@page import= "java.util.*"%> 
<%@page import= "org.apache.commons.fileupload.*"%>
<%@page import= "org.apache.commons.fileupload.servlet.ServletFileUpload"%> 
<%@page import= "org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import= "org.apache.poi.hssf.util.*"%>
<%@page import= "org.apache.poi.hssf.usermodel.*"%>
<%@page import= "java.io.*"%>

<%@page import= "java.util.*"%>

<%@page import= "javax.servlet.*"%>

<%@page import= "javax.servlet.http.*"%>
<%@page import= "java.sql.*"%>
<%@page import= "java.net.*"%>
<%@page import= "java.lang.*"%>


<%@page import= "java.util.Date"%>
<%@page import= "javax.naming.InitialContext"%>
<%@page import= "javax.sql.DataSource"%>
<%@page import= "java.sql.*"%>
<%@page import= "java.util.*"%>
<%@page import= "javax.naming.*"%>
<%@page import= "java.text.*"%>
<%@page import= "java.lang.*"%>
<%@page import= "javax.swing.*"%>
<%@page import= "java.awt.event.*"%>
<%@page import= "java.applet.*"%>
<%@page import= "java.text.ParseException"%>
<%@page import= "java.text.SimpleDateFormat"%>






<html>
<head><title>JSP Page</title></head>
<body>
<table>
<% 


SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd.MM.yyyy");


    String par="1130_08";
    String sys="P58";
    File FL=new File("D:\\exel\\P58_ALL.XLS");
      InputStream inputStream = new FileInputStream(FL); 
     HSSFWorkbook wb = new HSSFWorkbook(inputStream);
       
       HSSFSheet sheet = wb.getSheetAt(0);
String t0=" ";  
String t1=" ";   


Calendar BW_DT_1=Calendar.getInstance();
         // long vr=lang3.getTime()-BW_DT_1.getTime().getTime();  


 Date t3=BW_DT_1.getTime();



for (Iterator i1 = sheet.rowIterator(); i1.hasNext();) { 
      
      HSSFRow rowN2 = (HSSFRow) i1.next(); 
      
     
      
       HSSFCell cellN0 = rowN2.getCell((short)0);//начиная со столбца (+1=столбц)
       HSSFCell cellN1 = rowN2.getCell((short)1);
        HSSFCell cellN2 = rowN2.getCell((short)2);
         HSSFCell cellN3 = rowN2.getCell((short)3);
          HSSFCell cellN4 = rowN2.getCell((short)4);
           HSSFCell cellN5 = rowN2.getCell((short)5);
            HSSFCell cellN6 = rowN2.getCell((short)6);

if((cellN0!=null) && (cellN0.getCellType()==1)){
    t0=cellN0.getStringCellValue();}
      
       if((cellN1!=null) && (cellN1.getCellType()==1)){
            t1=cellN1.getStringCellValue();}
            
            
     if((cellN6!=null) && (cellN6.getCellType()==0)){
            t3=cellN6.getDateCellValue();}
     
%>
<tr><td><%=t0%></td><td>    <%=t1%></td><td>    <%=dateFormatter2.format(t3)%></td></tr>
<%


}
 
%></table>
</body>
</html>
