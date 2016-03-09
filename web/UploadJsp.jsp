
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>






<%@page import= " java.sql.*"%>
<%@page import= " org.apache.commons.fileupload.*"%>
<%@page import= " org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import= " org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import= " org.apache.poi.hssf.util.*"%>
<%@page import= " org.apache.poi.hssf.usermodel.*"%>
<%@page import= " java.io.*"%>
<%@page import= " java.util.*"%>
<%@page import= " javax.mail.internet.*"%>
<%@page import= " javax.mail.*"%>
<%@page import= " java.text.SimpleDateFormat"%>

<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)&&
((session.getValue("id_us").equals("35341"))||(session.getValue("id_us").equals("25846"))
||(session.getValue("id_us").equals("23417")))
){
response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");%>
 <%Object lock = new Object(); 
synchronized(lock)
       {%>

<%

 PrintWriter pw = response.getWriter();
        pw.println("<HTML><BODY>");

        try
        {
            
SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd-MM-yyyy");            
            
            
           // int maxFileSize = 1000; // Максимальный размер файла, который можно закачивать на сервер. В КилоБайтах.
           // File tempDir = new File("."); // Временная директория на сервере в которую будет закачиваться файл.

            // Настраиваем библиотеку закачки файлов
            DiskFileItemFactory factory = new DiskFileItemFactory( );
            factory.setRepository(new File(".")); 
            ServletFileUpload upload = new ServletFileUpload(factory);

            // Получаем список параметров, пришедших с формы
            List items = upload.parseRequest(request);

            // Обрабатываем каждый параметр
            Iterator iter = items.iterator();
            while( iter.hasNext() )
            {
                FileItem item = (FileItem) iter.next();

                if (item.isFormField())
                {
                    // Если очередное поле является полем с текстовыми данными
                    String name = item.getFieldName();
                    String value = item.getString();

                    pw.println("PARAMETER NAME = " + name + " VALUE = " + value + "<BR>");
                }
                else
                {
                    // Если очередное поле является файлом
                    String fileName = item.getName();
                    long sizeInBytes = item.getSize();

                    // Получаем содержимое файла в виде масисва байт
                  //  byte[] data = item.get();
                    // или в виде входящего потока
                     InputStream uploadedFileStream = item.getInputStream();
                     InputStream uploadedFileStream1 = item.getInputStream();
                     HSSFWorkbook workbook = new HSSFWorkbook(uploadedFileStream);
                     
                     // Получаем количество таблиц
            int numberOfSheets = workbook.getNumberOfSheets();
            for( int sheetNumber = 0; sheetNumber < numberOfSheets; sheetNumber++ )
            {
                // Получаем очередную таблицу по порядковому номеру
                HSSFSheet sheet = workbook.getSheetAt(sheetNumber);

                pw.println("<TABLE BORDER=1>");
                // pw.println("tab"+sheetNumber);

                // Читаем очередную таблицу построчно
                for( int rowNumber = sheet.getFirstRowNum(); rowNumber < sheet.getPhysicalNumberOfRows(); rowNumber++ )
                {
                    // Получаем очередную строку таблицы
                    HSSFRow row = sheet.getRow( rowNumber );
String stringValue="";

String stringValue1="";
String stringValue2="";
String stringValue3="";
String stringValue4="";
//double numericValue=0;                    
                    
if(row!=null){
                    pw.println("<TR>");
                   // pw.println("tr"+rowNumber);

                    // Последовательно обрабатываем каждую ячейку строки
                    for( short cellNumber = row.getFirstCellNum(); cellNumber <  row.getLastCellNum(); cellNumber++ )
                    {
                        // Получаем очередную ячейку строки
                        HSSFCell cell = row.getCell( cellNumber );

                        pw.println("<TD>");
     //   pw.println("td"+rowNumber);
        
        if(cell!=null){
                // Узнаем тип ячейки
                        int cellType = cell.getCellType();
      
                        // Если тип ячейки - текстовая
                        if( HSSFCell.CELL_TYPE_STRING == cellType )
                        {
                            // Получаем текстовое значение в ячейке
                            stringValue = cell.getStringCellValue();
                            pw.println( stringValue );
                        }

                        // Если тип ячейки - число
                        if( HSSFCell.CELL_TYPE_NUMERIC == cellType )
                        {
                            // Получаем числовое значение в ячейке
                            java.util.Date  numericValue = cell.getDateCellValue();
                            stringValue=dateFormatter2.format(numericValue).toString();
                            pw.println( stringValue );
                        }
                        
                       

               if(cellNumber==0) {stringValue1=stringValue;}       
               if(cellNumber==1) {stringValue2=stringValue;}           
               if(cellNumber==2) {stringValue3=stringValue;}           
               if(cellNumber==3) {stringValue4=stringValue;}           
                        // Обработка данных других типов ячеек...
}
                        pw.println("</TD>");
                    }


StringTokenizer fio=new StringTokenizer(stringValue1," ");

String newstringValue1="";
//pw.println("Размер массива"+fio.countTokens());
String[] fioPOL=new String[fio.countTokens()];

int kPOL=0;
while(fio.hasMoreTokens()){
   fioPOL[kPOL]=fio.nextToken();
 //  pw.println("ФИО "+kPOL+":  "+fioPOL[kPOL]);
   newstringValue1=newstringValue1+fioPOL[kPOL];
   kPOL++;
}

//pw.println("newstringValue1 "+newstringValue1);

 try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver"); 
      
          }catch(Throwable theException) {theException.printStackTrace();} 
        
       
        try {     
      String UserID = "db2admin";
      String Password = "11111111";
     //String Password = "D2_12345678";
      
      Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , UserID, Password);  


Statement stmt = myconnection1.createStatement(); 
ResultSet rs = stmt.executeQuery(



 " select a1.ID, a1.ID_ROAD_ASU_TR, a1.TAB_NUM, a1.ID_JOB, a1.BLOCK_USER, a1.PFR,   " +
   "  a1.LAST_NAME, a1.FIRST_NAME, a1.MIDDLE_NAME, a1.TEL, a1.IP, a1.E_MAIL, a1.DT_BIG, a1.DT_END,   " +
  "  	a1.ROAD  ,  " +
"  	a4.id as id_adm, a4.LAST_NAME as LAST_NAME_adm,a4.FIRST_NAME as FIRST_NAME_adm, a4.MIDDLE_NAME as MIDDLE_NAME_adm,a4.e_mail as e_mail_adm " +
  "     from ASU_POL.MAIN_USER_ALL_BLOCK as a1   " +
"  	 left join ASU_POL.SOOTV_USER_SYS_BLOCK as a2 on a1.ID=a2.ID_USER " +
"  	 inner join ASU_POL.SOOTV_USER_SYS as a3 on a3.id_system=a2.id_system and a3.id_role=2 and a3.del=0  " +
"  	 left join ASU_POL.MAIN_USER_ALL as a4 on a4.id=a3.id_user and a4.block_user<>1  " +
"  	 where a1.BLOCK_USER=1  " +
 "    and  " +
 "    LCASE(rtrim(a1.LAST_NAME)||rtrim(a1.FIRST_NAME)||rtrim(a1.MIDDLE_NAME)) like LCASE(rtrim('"+newstringValue1+"%'))  " +
 //" and LCASE(rtrim(a1.sn_job)) like LCASE(rtrim('"+stringValue3+"%')) "+
 
"   group by a1.ID, a1.ID_ROAD_ASU_TR, a1.TAB_NUM, a1.ID_JOB, a1.BLOCK_USER, a1.PFR,   " +
  "     a1.LAST_NAME, a1.FIRST_NAME, a1.MIDDLE_NAME, a1.TEL, a1.IP, a1.E_MAIL, a1.DT_BIG, a1.DT_END,   " +
 "   	a1.ROAD  ,a4.id, a4.LAST_NAME,a4.FIRST_NAME, a4.MIDDLE_NAME,a4.e_mail  " +
   
 "     union all " +
"  select a1.ID, a1.ID_ROAD_ASU_TR, a1.TAB_NUM, a1.ID_JOB, a1.BLOCK_USER, a1.PFR,   " +
 "      a1.LAST_NAME, a1.FIRST_NAME, a1.MIDDLE_NAME, a1.TEL, a1.IP, a1.E_MAIL, a1.DT_BIG, a1.DT_END,   " +
 "   	a1.ROAD  , " +
"  	a4.id as id_adm,a4.LAST_NAME as LAST_NAME_adm,a4.FIRST_NAME as FIRST_NAME_adm, a4.MIDDLE_NAME as MIDDLE_NAME_adm,a4.e_mail as e_mail_adm " +
 "      from ASU_POL.MAIN_USER_ALL as a1   " +
"  	 left join ASU_POL.SOOTV_USER_SYS as a2 on a1.ID=a2.ID_USER " +
"  	 inner join ASU_POL.SOOTV_USER_SYS as a3 on a3.id_system=a2.id_system and a3.id_role=2 and a3.del=0  " +
"  	 left join ASU_POL.MAIN_USER_ALL as a4 on a4.id=a3.id_user and a4.block_user<>1  " +
"  	 where  a1.BLOCK_USER<>1  and (a1.R3_YES_OR_NIOT='yes' or a1.R3_YES_OR_NIOT is null) " +
 "    and  " +
 "    LCASE(rtrim(a1.LAST_NAME)||rtrim(a1.FIRST_NAME)||rtrim(a1.MIDDLE_NAME)) like LCASE(rtrim('"+newstringValue1+"%'))  " +
  //" and LCASE(rtrim(a1.sn_job)) like LCASE(rtrim('"+stringValue3+"%')) "+
"   group by a1.ID, a1.ID_ROAD_ASU_TR, a1.TAB_NUM, a1.ID_JOB, a1.BLOCK_USER, a1.PFR,   " +
  "     a1.LAST_NAME, a1.FIRST_NAME, a1.MIDDLE_NAME, a1.TEL, a1.IP, a1.E_MAIL, a1.DT_BIG, a1.DT_END,   " +
 "   	a1.ROAD  , a4.id,  a4.LAST_NAME,a4.FIRST_NAME, a4.MIDDLE_NAME,a4.e_mail  " 
    
); 


 pw.println("<td><table><tr><td>Сообщения отправлены:</td></tr>");


while(rs.next()){
    
   
    
String SN_SYSTEM="";
 Statement stmt1 = myconnection1.createStatement(); 
ResultSet rs1 = stmt1.executeQuery(

 " select a5.SN_SYSTEM " +
  "     from ASU_POL.MAIN_USER_ALL_BLOCK as a1   " +
"  	 left join ASU_POL.SOOTV_USER_SYS_BLOCK as a2 on a1.ID=a2.ID_USER " +
"  	 inner join ASU_POL.SOOTV_USER_SYS as a3 on a3.id_system=a2.id_system and a3.id_role=2 and a3.del=0  " +
"  	 left join ASU_POL.MAIN_USER_ALL as a4 on a4.id=a3.id_user and a4.block_user<>1  " +
" left join ASU_POL.POLYGON_SYSTEM as a5 on a3.ID_SYSTEM=a5.ID_SYSTEM " +
"  	 where a1.BLOCK_USER=1  " +
 "    and  " +
 "    a1.ID="+rs.getString("id")+" and a4.ID="+rs.getString("id_adm")+" " +
   "   group by a5.SN_SYSTEM  " +
   
 "     union all " +
"  select a5.SN_SYSTEM " +
 "      from ASU_POL.MAIN_USER_ALL as a1   " +
"  	 left join ASU_POL.SOOTV_USER_SYS as a2 on a1.ID=a2.ID_USER " +
"  	 inner join ASU_POL.SOOTV_USER_SYS as a3 on a3.id_system=a2.id_system and a3.id_role=2 and a3.del=0  " +
"  	 left join ASU_POL.MAIN_USER_ALL as a4 on a4.id=a3.id_user and a4.block_user<>1  " +
" left join ASU_POL.POLYGON_SYSTEM as a5 on a3.ID_SYSTEM=a5.ID_SYSTEM " +
"  	 where  a1.BLOCK_USER<>1  and (a1.R3_YES_OR_NIOT='yes' or a1.R3_YES_OR_NIOT is null) " +
 "    and  " +
 "    a1.ID="+rs.getString("id")+" and a4.ID="+rs.getString("id_adm")+" " +
 "   group by a5.SN_SYSTEM  " 
    
);

while(rs1.next()){
SN_SYSTEM=SN_SYSTEM+", "+rs1.getString("SN_SYSTEM");
}

rs1.close();
stmt1.close();






    
    
   String sn=rs.getString("LAST_NAME_adm")+" "+rs.getString("FIRST_NAME_adm")+" "+rs.getString("MIDDLE_NAME_adm");

 String e_mail_adm=rs.getString("e_mail_adm").trim();
 pw.println("<tr><td>"+sn+" "+e_mail_adm+"</td></tr>");                    
                          
     String us="<h3>АСУ \"Пользователь\" </h3>"+
         "<h3>Добрый день "+sn+";</h3>"+
         "<h3>В связи с увольнением закройте доступ следующим пользователям в сопровождаемые вами системы:  </h3>"+
         "<h3>Обращайте внимание на место работы, возможно совпадение Ф.И.О.</h3>"+
        // "<h3>Необходимо переоформить заявку:  </h3>"+
         "<table border='1'>"+
         "<tr><td>ФИО</td><td>Отдел</td><td>Должность</td><td>Дата увольнения</td><td>Инф. ресурс</td></tr>";
        us=us+ "<tr><td>"+stringValue1+"</td><td>"+stringValue2+"</td><td>"+stringValue3+"</td><td>"+stringValue4+"</td><td>"+SN_SYSTEM+"</td></tr>";
        us=us+"</table>";                  
                        
                        
                        
       String to=e_mail_adm;                 
                        
                        
                        
                        
        String from = "ASU_POL@serw.rzd";
      String host = "10.58.0.47";
Properties properties = System.getProperties();
properties.setProperty("mail.smtp.host", host);
Session session1 = Session.getDefaultInstance(properties);
                 
                        
                        
                        
            try{
         MimeMessage message = new MimeMessage(session1);
         message.setFrom(new InternetAddress(from));
         message.addRecipient(Message.RecipientType.TO,
                                  new InternetAddress(to));
         message.setSubject("Пользователь блокирован");
         message.setContent(us,"text/html; charset=UTF-8" );
       

         
         
  //       message.setText("данные отправлены");

         // Send message
         Transport.send(message);
         System.out.println("Sent message successfully....");
      }catch (MessagingException mex) {
         mex.printStackTrace();
      }               
                        
 

}
rs.close();
stmt.close();
pw.println("</table></td>");


        
        
        
 myconnection1.close();
  
} catch (SQLException e) {pw.println(e);}         
        
        
        



}

                    pw.println("</TR>");
                }
          
                
                
                
                pw.println("</TABLE>");
                pw.println("<HR>");
            }
                     
                     
                     
                     
                     
                   // pw.println("FILE NAME = " + fileName + " SIZE = " + sizeInBytes + " DATA_LENGTH = " + data.length + "<BR>");//
                }
            }
        }
        catch (FileUploadException e)
        {
            pw.println( e.getMessage() );
        }
        
        pw.println("<TABLE>");
      pw.println(" <tr>");
  pw.println("<td>");
 pw.println("<form name=\"bak\" method=post   action=\""+request.getContextPath()+"\">");
 pw.println("<table width=100%  >");
 pw.println("     <tr><td NOWRAP colspan=2 align=center><input type=submit value=\"Продолжить\"  ></td></tr>");
 pw.println("</table>");
 pw.println("</form>");
 pw.println("</td>");
 pw.println("</tr>  ");        
  pw.println("</TABLE>");      
        
        

        pw.println("</HTML></BODY>");
}}%>