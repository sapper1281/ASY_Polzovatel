
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
<%@page import= " org.apache.*"%>


<%--вывод введенных в асу пол из асу зир--%>

<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251"%>
<%--@page contentType="application/download1" --%>
<div>
<%=request.getParameter("par")%>
<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){%>
 <%Object lock = new Object(); 
synchronized(lock)
       {%>


<%--=session.getValue("id_us")--%>



 <% try {  

     SimpleDateFormat dateFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat dateFormatter3 = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        Calendar DT_NOW_1=Calendar.getInstance(); 
        String date=dateFormatter1.format(DT_NOW_1.getTime()).toString();
     
     
String par=request.getParameter("par");
String vid=request.getParameter("vid");
String q=" where a1.ID_RES=-2 ";
if(vid.equals("3")) {
q=" and (a1.ID_RES=-2 ";

}
int k1=-1;
 for (int j_1 = 0; j_1 < par.length(); j_1++){
        if (String.valueOf(par.charAt(j_1)).equals("|")){
        if(k1!=-1){
String k2=par.substring(k1+1,j_1);
q=q+" or a1.ID_RES="+k2;
}
            k1=j_1;
        }}
if(vid.equals("3")) {
q=q+" ) ";

}

HSSFWorkbook wb = new HSSFWorkbook();
     HSSFSheet sheet = wb.createSheet("new sheet");
     sheet.setColumnWidth((short)0,(short)4000);
     sheet.setColumnWidth((short)1,(short)4000);
     sheet.setColumnWidth((short)2,(short)8000);
     sheet.setColumnWidth((short)3,(short)4000);
     sheet.setColumnWidth((short)4,(short)4000);
     sheet.setColumnWidth((short)5,(short)4000);
     sheet.setColumnWidth((short)6,(short)4000);
     sheet.setColumnWidth((short)7,(short)4000);
     if(vid.equals("3")) {   
     sheet.setColumnWidth((short)8,(short)8000);    
         }
     wb.setSheetName( 0, "SomeUnicodeName", HSSFWorkbook.ENCODING_UTF_16 );
//---------делаем альбомную страницу----------------------     
     HSSFPrintSetup print = sheet.getPrintSetup();
    print.setScale((short)83);
    print.setPaperSize((short) print.A4_PAPERSIZE);
 //-------------рисуем заголовок----------------------------------------------
String f1="";    
if(vid.equals("1")) {   
    f1="Заявки выгруженные из АСУ ЗИР";  }
  if(vid.equals("2")) {
    f1="Заявки введенные в АСУ \"Пользователь\" и сущ. в АСУ ЗИР"; 
      }
if(vid.equals("3")) {
    f1="Заявки не переданные из АСУ ЗИР"; 
      }
    
    HSSFFont font = wb.createFont();
    font.setFontHeightInPoints((short)9);//шрифт
    font.setFontName("Arial");
    font.setBoldweight( HSSFFont.BOLDWEIGHT_BOLD);
    
    HSSFFont font1 = wb.createFont();
    font1.setFontHeightInPoints((short)13);//шрифт
    font1.setFontName("Arial");
    font1.setBoldweight( HSSFFont.BOLDWEIGHT_BOLD);
   
    HSSFCellStyle styleN1 = wb.createCellStyle();
    styleN1.setFillBackgroundColor((short)12);
    styleN1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    styleN1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
    styleN1.setFillBackgroundColor((short)155);
    styleN1.setWrapText(true);
    styleN1.setFont(font1);
    
    
      HSSFCellStyle style0 = wb.createCellStyle();
      style0.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
      style0.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
      style0.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    style0.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    style0.setBorderRight(HSSFCellStyle.BORDER_THIN);
    style0.setBorderTop(HSSFCellStyle.BORDER_THIN);
    style0.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    style0.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
    style0.setFont(font);
   style0.setWrapText(true);
    
   HSSFCellStyle style0_1 = wb.createCellStyle();
      style0_1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    style0_1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    style0_1.setBorderRight(HSSFCellStyle.BORDER_THIN);
    style0_1.setBorderTop(HSSFCellStyle.BORDER_THIN);
    style0_1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    //style0_1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
    
    style0_1.setFont(font);
    style0_1.setWrapText(true);
    
   
    
    
    HSSFRow rowN1 = sheet.createRow(0);
    HSSFCell cellN1 = rowN1.createCell((short)0);
    cellN1.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN1.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN1.setCellValue(f1);
    cellN1.setCellStyle(styleN1);
    sheet.addMergedRegion(new Region(0,(short)0,0,(short)7));
    
 
    HSSFRow  rowN3 = sheet.createRow(1);//начиная с какой строчки (+1=строка)
    HSSFCell  cellN3 = rowN3.createCell((short)0);//начиная со столбца (+1=столбц)
    cellN3.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue("Система");
    cellN3.setCellStyle(style0);
    sheet.addMergedRegion(new Region(1,(short)0,1,(short)0));
  
   
    rowN3 = sheet.createRow(1);//начиная с какой строчки (+1=строка)
    cellN3 = rowN3.createCell((short)1);//начиная со столбца (+1=столбц)
    cellN3.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue("Номер заявки");
    cellN3.setCellStyle(style0);
    sheet.addMergedRegion(new Region(1,(short)1,1,(short)1));
  
   
    rowN3 = sheet.createRow(1);//начиная с какой строчки (+1=строка)
    cellN3 = rowN3.createCell((short)2);//начиная со столбца (+1=столбц)
    cellN3.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue("Ф.И.О.");
    cellN3.setCellStyle(style0);
    sheet.addMergedRegion(new Region(1,(short)2,1,(short)2));
  
   
    rowN3 = sheet.createRow(1);//начиная с какой строчки (+1=строка)
    cellN3 = rowN3.createCell((short)3);//начиная со столбца (+1=столбц)
    cellN3.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue("Тел.");
    cellN3.setCellStyle(style0);
    sheet.addMergedRegion(new Region(1,(short)3,1,(short)3));
  
    
    rowN3 = sheet.createRow(1);//начиная с какой строчки (+1=строка)
    cellN3 = rowN3.createCell((short)4);//начиная со столбца (+1=столбц)
    cellN3.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue("E-Mail");
    cellN3.setCellStyle(style0);
    sheet.addMergedRegion(new Region(1,(short)4,1,(short)4));
 
    rowN3 = sheet.createRow(1);//начиная с какой строчки (+1=строка)
    cellN3 = rowN3.createCell((short)5);//начиная со столбца (+1=столбц)
    cellN3.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue("Дата нач.");
    cellN3.setCellStyle(style0);
    sheet.addMergedRegion(new Region(1,(short)5,1,(short)5));
    
    rowN3 = sheet.createRow(1);//начиная с какой строчки (+1=строка)
    cellN3 = rowN3.createCell((short)6);//начиная со столбца (+1=столбц)
    cellN3.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue("Дата окончания");
    cellN3.setCellStyle(style0);
    sheet.addMergedRegion(new Region(1,(short)6,1,(short)6));
    
    rowN3 = sheet.createRow(1);//начиная с какой строчки (+1=строка)
    cellN3 = rowN3.createCell((short)7);//начиная со столбца (+1=столбц)
    cellN3.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue("Дата выгрузки");
    cellN3.setCellStyle(style0);
    sheet.addMergedRegion(new Region(1,(short)7,1,(short)7));
    if(vid.equals("3")) {  

rowN3 = sheet.createRow(1);//начиная с какой строчки (+1=строка)
    cellN3 = rowN3.createCell((short)8);//начиная со столбца (+1=столбц)
    cellN3.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue("Причина");
    cellN3.setCellStyle(style0);
    sheet.addMergedRegion(new Region(1,(short)8,1,(short)8));
}
 
    
  //---формирование отчета
    int strok=2;
     
   int kol_vse=0;
   try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
          }catch(Throwable theException) {theException.printStackTrace();} 
       Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "11111111");  

String vvod  ="";
    if(vid.equals("1")) {   
       vvod  =
  " select  a3_1.SN_SYSTEM, a1.ID_REG,a1.LN_USER, a1.FN_USER, a1.SN_USER, a1.TEL_USER, "+
  " a1.MAIL_USER, a1.START_DATE, a1.END_DATE,   "+
  " a1.DT_IMPORT "+
  " from ASU_POL.ASU_ZIR_DOB_1 a1 "+
  " left join ASU_POL.POLYGON_SYSTEM as a3_1 on a3_1.ID_SYSTEM=a1.ID_RES " +
  q+
  " union all "+
  " select  a3_1.SN_SYSTEM, a1.ID_REG,a1.LN_USER, a1.FN_USER, a1.SN_USER, a1.TEL_USER, "+
  " a1.MAIL_USER, a1.START_DATE, a1.END_DATE,   "+
  " a1.DT_IMPORT "+
  " from ASU_POL.ASU_ZIR_DOB a1 "+
  " left join ASU_POL.POLYGON_SYSTEM as a3_1 on a3_1.ID_SYSTEM=a1.ID_RES " +
  q+
  " order by SN_SYSTEM, LN_USER,FN_USER,SN_USER ";}
     if(vid.equals("2")) {   
       vvod  =
  " select  a3_1.SN_SYSTEM, a1.ID_REG,a1.LN_USER, a1.FN_USER, a1.SN_USER, a1.TEL_USER, "+
  " a1.MAIL_USER, a1.START_DATE, a1.END_DATE,   "+
  " a1.DT_IMPORT "+
  " from ASU_POL.ASU_ZIR_VSE_VVED a1 "+
  " left join ASU_POL.POLYGON_SYSTEM as a3_1 on a3_1.ID_SYSTEM=a1.ID_RES " +
  q+
  " order by SN_SYSTEM, LN_USER,FN_USER,SN_USER ";}   
       
 if(vid.equals("3")) {   
       vvod  =
  " select  a3_1.SN_SYSTEM, a1.ID_REG,a1.LN_USER, a1.FN_USER, a1.SN_USER, a1.TEL_USER, " + 
   " a1.MAIL_USER, a1.START_DATE, a1.END_DATE, " +
   " a1.DT_IMPORT, " +
   " case  " +
   " when a1.massn=-1 then 'Не найдено совпадений'  " +
   " when a1.massn=9 then 'Не найдено совпадений' "+
//" a2.NAME_MASSN " +
   " when a1.massn=2 then 'Не найдено совпадений'  " +
   " when a1.massn=1 then 'Не найдено совпадений'  " +
   " when a1.END_DATE<'"+date+"' then 'Срок действия заявки окончен' " +
   
   " when a1.START_DATE<'"+date+"' and  a1.END_DATE>'"+date+"' and (a1.massn<>-1 or a1.massn<>9 or a1.massn<>2 or a1.massn<>1) " +
   " and a3.BEGDA>(select max(dt_big) from ASU_POL.MAIN_USER_ALL) " +
   " then 'Возможен после выгрузки асу тр' " +
   " else 'Не найдено совпадений' " +
   " end as s " +
   " from ASU_POL.ASU_ZIR_NEP a1 " + 
   " left join ASU_POL.POLYGON_SYSTEM as a3_1 on a3_1.ID_SYSTEM=a1.ID_RES  " +
   " left join ASU_ZIR.MASSN as a2 on a2.id_massn=a1.massn  " +
   " left join ASU_POL.ASU_ZIR_DOB_1 as a3 on  " +
    " a3.ID_ZAYAV=a1.ID_ZAYAV and  a3.ID_REG=a1.ID_REG  and  a3.ID_USER=a1.ID_USER and   " +
            " a3.START_DATE=a1.START_DATE and  a3.END_DATE=a1.END_DATE and a3.OP_STATION=a1.OP_STATION and  " + 
            " a3.LN_USER=a1.LN_USER and  a3.FN_USER=a1.FN_USER and  a3.SN_USER=a1.SN_USER and   " +
           // " a3.TEL_USER=a1.TEL_USER and  a3.MAIL_USER=a1.MAIL_USER and  "+
 "  a3.T_NO=a1.T_NO and   " +
            //" a3.ORGTX=a1.ORGTX and 
 " a3.ID_RES=a1.ID_RES and   " +
            " a3.pernr=a1.pernr and "+
 //a3.nachn=a1.nachn and  a3.vorna=a1.vorna and   " +
           // " a3.midnm=a1.midnm and  "+
//a3.massn=a1.massn and  a3.begda=a1.begda and   " +
            " a3.orgtx_1=a1.orgtx_1 " +
//"and  a3.podr= a1.podr  " +
   " left join ASU_POL.ASU_ZIR_VSE_VVED as a4 on  " +
   " a4.ID_ZAYAV=a1.ID_ZAYAV and  a4.ID_REG=a1.ID_REG  and  a4.ID_USER=a1.ID_USER and  " + 
            " a4.START_DATE=a1.START_DATE and  a4.END_DATE=a1.END_DATE and a4.OP_STATION=a1.OP_STATION and  " + 
            " a4.LN_USER=a1.LN_USER and  a4.FN_USER=a1.FN_USER and  a4.SN_USER=a1.SN_USER and   " +
      //      " a4.TEL_USER=a1.TEL_USER and  a4.MAIL_USER=a1.MAIL_USER and  "+
 "  a4.T_NO=a1.T_NO and   " +
            //" a4.ORGTX=a1.ORGTX and 
 " a4.ID_RES=a1.ID_RES and   " +
            " a4.pernr=a1.pernr and "+
 //a4.nachn=a1.nachn and  a4.vorna=a1.vorna and   " +
      //      " a4.midnm=a1.midnm and  "+
//a4.massn=a1.massn and  a4.begda=a1.begda and   " +
            " a4.orgtx_1=a1.orgtx_1 " +
//"and  a4.podr= a1.podr  " +
   " where a4.ID_ZAYAV is null and a3.ID_ZAYAV is null " +
   q+
   " order by SN_SYSTEM, LN_USER,FN_USER,SN_USER  " ;
}

       
      
Statement stmt0 = myconnection1.createStatement(); 
ResultSet rs0 = stmt0.executeQuery(vvod);

while (rs0.next()){
 
     
    rowN3 = sheet.createRow(strok);
    cellN3 = rowN3.createCell((short)0);//начиная со столбца (+1=столбц)
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue(rs0.getString("SN_SYSTEM").trim());
    cellN3.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(strok,(short)0,strok,(short)0));
    rowN3 = sheet.createRow(strok);
    cellN3 = rowN3.createCell((short)1);//начиная со столбца (+1=столбц)
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue(rs0.getString("ID_REG").trim());
    cellN3.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(strok,(short)1,strok,(short)1));
    rowN3 = sheet.createRow(strok);
    cellN3 = rowN3.createCell((short)2);//начиная со столбца (+1=столбц)
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue( rs0.getString("LN_USER").trim()+" "+rs0.getString("FN_USER").trim()+" "+rs0.getString("SN_USER").trim());
    cellN3.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(strok,(short)2,strok,(short)2));
    rowN3 = sheet.createRow(strok);
    cellN3 = rowN3.createCell((short)3);//начиная со столбца (+1=столбц)
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue(rs0.getString("TEL_USER").trim());
    cellN3.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(strok,(short)3,strok,(short)3));
    rowN3 = sheet.createRow(strok);
    cellN3 = rowN3.createCell((short)4);//начиная со столбца (+1=столбц)
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue(rs0.getString("MAIL_USER").trim());
    cellN3.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(strok,(short)4,strok,(short)4));
    rowN3 = sheet.createRow(strok);
    cellN3 = rowN3.createCell((short)5);//начиная со столбца (+1=столбц)
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue(rs0.getString("START_DATE"));
    cellN3.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(strok,(short)5,strok,(short)5));
    rowN3 = sheet.createRow(strok);
    cellN3 = rowN3.createCell((short)6);//начиная со столбца (+1=столбц)
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue(rs0.getString("END_DATE"));
    cellN3.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(strok,(short)6,strok,(short)6));
    rowN3 = sheet.createRow(strok);
    cellN3 = rowN3.createCell((short)7);//начиная со столбца (+1=столбц)
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue(rs0.getString("DT_IMPORT"));
    cellN3.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(strok,(short)7,strok,(short)7));
    
     if(vid.equals("3")) {  
    rowN3 = sheet.createRow(strok);
    cellN3 = rowN3.createCell((short)8);//начиная со столбца (+1=столбц)
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue(rs0.getString("s"));
    cellN3.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(strok,(short)8,strok,(short)8));
    }
    strok++;
    
    
   kol_vse++;
  }
rs0.close();
stmt0.close();    
    
rowN3 = sheet.createRow(strok);
    cellN3 = rowN3.createCell((short)0);//начиная со столбца (+1=столбц)
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue("Итог");
    cellN3.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(strok,(short)0,strok,(short)0));   
rowN3 = sheet.createRow(strok);
    cellN3 = rowN3.createCell((short)1);//начиная со столбца (+1=столбц)
    cellN3.setCellValue(kol_vse);
    cellN3.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(strok,(short)1,strok,(short)1));
 strok++;  
 
/*rowN3 = sheet.createRow(strok);
    cellN3 = rowN3.createCell((short)0);//начиная со столбца (+1=столбц)
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue(par);
    cellN3.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(strok,(short)0,strok,(short)0));    
 */
/*rowN3 = sheet.createRow(strok);
    cellN3 = rowN3.createCell((short)1);//начиная со столбца (+1=столбц)
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue(par1);
    cellN3.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(strok,(short)1,strok,(short)1));    */
 /*
  rowN3 = sheet.createRow(strok);
    cellN3 = rowN3.createCell((short)2);//начиная со столбца (+1=столбц)
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue(session.getValue("id_us").toString());
    cellN3.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(strok,(short)2,strok,(short)2));    
    */ 
      
    myconnection1.close();
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    response.setContentType("application/download");
    // response.setContentType("text/html");
     
 response.setHeader("Content-Disposition", "inline; filename=\"VVED_ASUZIR.xls\"");
      
 
 
 

 OutputStream out_out  = response.getOutputStream();
 wb.write(out_out) ;
 out_out.close();
 
 } catch (SQLException e) {%> <tr>Ошибка <%=e%></tr> <%}%>
 

 
 

<%--=wb--%>





<%}%> 
<%}%>


   </div>
    
    
    
<%--<html>
<head><title>JSP Page</title></head>
<body>
<%= request.getParameter("IDSYS")%>


</body>

</html>--%>
