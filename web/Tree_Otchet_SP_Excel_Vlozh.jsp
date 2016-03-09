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


<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){
response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");

Object lock = new Object(); 
synchronized(lock)
{
    
    
    
    
    
try {  
 HSSFWorkbook wb = new HSSFWorkbook();
 HSSFSheet sheet = wb.createSheet("new sheet");
 
 
  String sys= request.getParameter("sys");
  String road= request.getParameter("road");
    
  
    
     
sheet.setColumnWidth((short)0,(short)3000);
sheet.setColumnWidth((short)1,(short)10000);
sheet.setColumnWidth((short)2,(short)4000);
sheet.setColumnWidth((short)3,(short)7000);
sheet.setColumnWidth((short)4,(short)10000);


    
 try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
          }catch(Throwable theException) {theException.printStackTrace();} 
       Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "11111111");    

String sqlM_0  =   " select SN_SYSTEM from ASU_POL.POLYGON_SYSTEM where ID_SYSTEM="+sys+" ";
Statement stmtM_0 = myconnection1.createStatement(); 
ResultSet rsM_0 = stmtM_0.executeQuery(sqlM_0);
 String SheetName="";
while(rsM_0.next()){
  SheetName=rsM_0.getString("SN_SYSTEM").trim();
    wb.setSheetName( 0, "SheetName", HSSFWorkbook.ENCODING_UTF_16 );}

rsM_0.close();
stmtM_0.close();


//---------?????? ????????? ????????----------------------     
     HSSFPrintSetup print = sheet.getPrintSetup();
     print.setScale((short)83);
     print.setPaperSize((short) print.A4_PAPERSIZE);
   
     
    HSSFFont font = wb.createFont();
    font.setFontHeightInPoints((short)9);//шрифт
    font.setFontName("Arial");
    font.setBoldweight( HSSFFont.BOLDWEIGHT_BOLD);
     
    HSSFFont font1 = wb.createFont();
    font1.setFontHeightInPoints((short)13);//?????
    font1.setFontName("Arial");
    font1.setBoldweight( HSSFFont.BOLDWEIGHT_BOLD);
     
    HSSFCellStyle styleN1 = wb.createCellStyle();
    styleN1.setFillBackgroundColor((short)12);
    styleN1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    styleN1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
    styleN1.setFillBackgroundColor((short)155);
    styleN1.setWrapText(true);
    styleN1.setFont(font1); 
     
    
    
    
    HSSFCellStyle style0_1 = wb.createCellStyle();
    style0_1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    style0_1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    style0_1.setBorderRight(HSSFCellStyle.BORDER_THIN);
    style0_1.setBorderTop(HSSFCellStyle.BORDER_THIN);
    style0_1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
    style0_1.setFont(font);
    style0_1.setWrapText(true);
    
    HSSFRow rowN0 = sheet.createRow(0);
    rowN0.setHeight((short)500);
    HSSFCell cellN0 = rowN0.createCell((short)0);
    cellN0.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN0.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN0.setCellValue("Система: "+SheetName);
    cellN0.setCellStyle(styleN1);
    sheet.addMergedRegion(new Region(0,(short)0,0,(short)(1)));
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    
    HSSFRow rowN1 = sheet.createRow(1);
    rowN1.setHeight((short)500);
    HSSFCell cellN1 = rowN1.createCell((short)0);
    cellN1.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN1.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN1.setCellValue("СП "+SheetName);
    cellN1.setCellStyle(styleN1);
    sheet.addMergedRegion(new Region(1,(short)0,1,(short)(1)));
    */
  
    
    
  

String sql_0  =   " select ID,  ID_ROAD_ASU_TR, SN_ROAD, MY_ID_ROAD_ASU_TR "+
  " from ASU_POL.POLYGON_ROAD where (ID_ROAD_ASU_TR="+road+
  " )and "+
    " ((DT_VVOD=(select max(DT_VVOD) from ASU_POL.POLYGON_ROAD) and r3='yes') or (r3='not'))"+
  
  " order by SN_ROAD "; 
       
Statement stmt_0 = myconnection1.createStatement(); 
ResultSet rs_0 = stmt_0.executeQuery(sql_0); 













/*String sql_1_1=" select a0_0.SN_SYSTEM,a0_0.ID_SYSTEM,a0_0.CODE_USL,a0_0.SN_USL ";
String sql_1_2=" from (select a1.SN_SYSTEM,a1.ID_SYSTEM,a3.CODE_USL,a3.SN_USL from ASU_POL.POLYGON_SYSTEM as a1 "+
  " left join ASU_POL.SOOTV_SYS_USL as a2 on a1.ID_SYSTEM=a2.ID_SYSTEM "+
  " left join ASU_POL.POLYGON_USL as a3 on a3.ID_USL=a2.ID_USL  "+
  " where ID_PARRENT<>0 )as a0_0  ";
String sql_1_3=" ";
String sql_1_4=" ";
int k=1; 



   HSSFRow  rowN1 = sheet.createRow(1);
    rowN1.setHeight((short)500);
    HSSFCell cellN1 = rowN1.createCell((short)0);
    cellN1.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN1.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN1.setCellValue("№");
    cellN1.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(1,(short)0,1,(short)0));
    
    cellN1 = rowN1.createCell((short)1);
    cellN1.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN1.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN1.setCellValue("Ф.И.О.");
    cellN1.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(1,(short)1,1,(short)1));

    



int k_road=3;*/
String ROAD="";
String ROAD_1="";
while (rs_0.next()){
  
  boolean t=true;  
 // ROAD=", %";   
   int ID_ROAD_ASU_TR=rs_0.getInt("ID_ROAD_ASU_TR");
   String SN_ROAD=rs_0.getString("SN_ROAD").trim();
ROAD_1=SN_ROAD;
   
   
  /*  cellN1 = rowN1.createCell((short)k_road);
    cellN1.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN1.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN1.setCellValue(SN_ROAD);
    cellN1.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(1,(short)k_road,1,(short)k_road));
k_road++;*/

 SN_ROAD=  SN_ROAD.replace('"', '\"'); 
   int MY_ID_ROAD_ASU_TR=rs_0.getInt("MY_ID_ROAD_ASU_TR");
  
   while(t){
   if(MY_ID_ROAD_ASU_TR==0){t=!t; ROAD=SN_ROAD+ROAD;}
   else{

String sql_2  =   " select ID,  ID_ROAD_ASU_TR, SN_ROAD, MY_ID_ROAD_ASU_TR "+
  " from ASU_POL.POLYGON_ROAD where ( ID_ROAD_ASU_TR="+MY_ID_ROAD_ASU_TR+" "+
   " )and "+
    " ((DT_VVOD=(select max(DT_VVOD) from ASU_POL.POLYGON_ROAD) and r3='yes') or (r3='not'))"+
 
  " order by ID,ID_ROAD_ASU_TR; "; 
Statement stmt_2 = myconnection1.createStatement(); 
ResultSet rs_2 = stmt_2.executeQuery(sql_2); 

while (rs_2.next()){
  ROAD=", "+SN_ROAD+ROAD;
  ID_ROAD_ASU_TR=rs_2.getInt("ID_ROAD_ASU_TR");
  SN_ROAD=rs_2.getString("SN_ROAD").trim();
  SN_ROAD=  SN_ROAD.replace('"', '\"'); 
  MY_ID_ROAD_ASU_TR=rs_2.getInt("MY_ID_ROAD_ASU_TR");
}
rs_2.close();
stmt_2.close();
}
 }
  
   
  /*  HSSFRow rowN0 = sheet.createRow(0);
    rowN0.setHeight((short)500);
    HSSFCell cellN0 = rowN0.createCell((short)0);
    cellN0.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN0.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN0.setCellValue(ROAD);
    cellN0.setCellStyle(styleN1);
    sheet.addMergedRegion(new Region(0,(short)0,0,(short)(stt.length+1)));
   
   
   
   sql_1_1=sql_1_1+ ",a0_"+k+".w1 as w"+k+",a0_"+k+".f1 as f"+k+" ";
   sql_1_2=sql_1_2+
  " left join(  "+
  " select a0.w1,a0.SN_SYSTEM,a0.ID_SYSTEM,a0.f1 from "+
  " (select a2_0.w1,a1.SN_SYSTEM,a1.ID_SYSTEM_1 as ID_SYSTEM,  count(a1.SN_SYSTEM) as f1  "+
  " from ( "+
  
  " select distinct a2.SN_SYSTEM,a2.ID_SYSTEM as ID_SYSTEM_1 ,a1.id_user,a1.ID_SYSTEM "+
  
  
 // " select a2.SN_SYSTEM,a2.ID_SYSTEM as ID_SYSTEM_1 ,a1.*   "+
  " from ASU_POL.SOOTV_USER_SYS as a1  "+
  " left join ASU_POL.POLYGON_SYSTEM as a2 on a1.id_system=a2.id_system  "+
  " where ID_PARRENT<>0 and del=0  "+
  " )as a1    "+
  " inner join (select '"+ROAD+"'as w1, ASU_POL.MAIN_USER_ALL.* from ASU_POL.MAIN_USER_ALL where ROAD like  '"+ROAD+"')  as a2_0   on a2_0.ID=a1.ID_USER  "+ 
  " group by a2_0.w1,a1.SN_SYSTEM ,a1.ID_SYSTEM_1 "+
  " order by a1.SN_SYSTEM ) as a0 )as a0_"+k+" on a0_0.ID_SYSTEM=a0_"+k+".ID_SYSTEM ";
  sql_1_3=sql_1_3 +" a0_"+k+".f1 is not null or"; 
  sql_1_4= " a0_"+k+".f1 is not null ";
   
   
k++;*/

}
    HSSFRow rowN1 = sheet.createRow(0);
    rowN1.setHeight((short)500);
    HSSFCell cellN1 = rowN1.createCell((short)3);
    cellN1.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN1.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN1.setCellValue("СП: "+ROAD_1);
    cellN1.setCellStyle(styleN1);
    sheet.addMergedRegion(new Region(0,(short)3,0,(short)4));

    
    
    HSSFRow rowN1_1 = sheet.createRow(1);
    rowN1_1.setHeight((short)500);
    HSSFCell cellN1_1 = rowN1_1.createCell((short)0);
    cellN1_1.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN1_1.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN1_1.setCellValue("Введенные пользователи");
    cellN1_1.setCellStyle(styleN1);
    sheet.addMergedRegion(new Region(1,(short)0,1,(short)4));

ROAD=ROAD+", %";

rs_0.close();
stmt_0.close();




String sql_1  =   " select a2_0.w1,a1.SN_SYSTEM,a1.ID_SYSTEM_1 as ID_SYSTEM, count(a1.SN_SYSTEM) as f1, a1.id_user, a2_0.LAST_NAME,a2_0.FIRST_NAME,a2_0.MIDDLE_NAME,a2_0.TEL,a2_0.E_MAIL,a2_0.ROAD "+
     " from ( select distinct a2.SN_SYSTEM,a2.ID_SYSTEM as ID_SYSTEM_1 ,a1.id_user,a1.ID_SYSTEM "+
            " from ASU_POL.SOOTV_USER_SYS as a1  "+
	        " left join ASU_POL.POLYGON_SYSTEM as a2 on a1.id_system=a2.id_system  "+
		" 	where ID_PARRENT<>0 and del=0 and a2.ID_SYSTEM="+sys+")as a1  "+
	        " inner join (select '"+ROAD+"' as w1, ASU_POL.MAIN_USER_ALL.*  "+
	        " from ASU_POL.MAIN_USER_ALL where ROAD like '"+ROAD+"') as a2_0 on a2_0.ID=a1.ID_USER  "+
	       "  group by a2_0.w1,a1.SN_SYSTEM ,a1.ID_SYSTEM_1, a1.id_user, a2_0.LAST_NAME,a2_0.FIRST_NAME,a2_0.MIDDLE_NAME,a2_0.TEL,a2_0.E_MAIL,a2_0.ROAD order by a2_0.LAST_NAME,a2_0.FIRST_NAME,a2_0.MIDDLE_NAME ";



Statement stmt_3 = myconnection1.createStatement(); 
ResultSet rs_3 = stmt_3.executeQuery(sql_1); 






HSSFRow rowN2 = sheet.createRow(2);
    rowN2.setHeight((short)500);
    HSSFCell cellN2 = rowN2.createCell((short)0);
    cellN2.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN2.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN2.setCellValue("№");
    cellN2.setCellStyle(styleN1);
    sheet.addMergedRegion(new Region(2,(short)0,2,(short)(0)));
    
    cellN2 = rowN2.createCell((short)1);
    cellN2.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN2.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN2.setCellValue("Ф.И.О.");
    cellN2.setCellStyle(styleN1);
    sheet.addMergedRegion(new Region(2,(short)1,2,(short)(1)));   

    
    cellN2 = rowN2.createCell((short)2);
    cellN2.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN2.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN2.setCellValue("тел.");
    cellN2.setCellStyle(styleN1);
    sheet.addMergedRegion(new Region(2,(short)2,2,(short)(2)));   



cellN2 = rowN2.createCell((short)3);
    cellN2.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN2.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN2.setCellValue("e-mail");
    cellN2.setCellStyle(styleN1);
    sheet.addMergedRegion(new Region(2,(short)3,2,(short)(3)));   



cellN2 = rowN2.createCell((short)4);
    cellN2.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN2.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN2.setCellValue("Структурное подразделение");
    cellN2.setCellStyle(styleN1);
    sheet.addMergedRegion(new Region(2,(short)4,2,(short)(4)));   

    
    
int k_rot=3;   
while (rs_3.next()){
    
    rowN2 = sheet.createRow(k_rot);
    rowN2.setHeight((short)500);
    cellN2 = rowN2.createCell((short)0);
    cellN2.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN2.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN2.setCellValue(k_rot-2);
    cellN2.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(k_rot,(short)0,k_rot,(short)(0)));   
    
    
    
    cellN2 = rowN2.createCell((short)1);
    cellN2.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN2.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN2.setCellValue(  rs_3.getString("LAST_NAME").trim()+" "+rs_3.getString("FIRST_NAME").trim()+" "+rs_3.getString("MIDDLE_NAME").trim() );
    cellN2.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(k_rot,(short)1,k_rot,(short)(1)));   
    



cellN2 = rowN2.createCell((short)2);
    cellN2.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN2.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN2.setCellValue(  rs_3.getString("TEL").trim() );
    cellN2.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(k_rot,(short)2,k_rot,(short)(2)));   
    
    
    cellN2 = rowN2.createCell((short)3);
    cellN2.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN2.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN2.setCellValue(  rs_3.getString("E_MAIL").trim() );
    cellN2.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(k_rot,(short)3,k_rot,(short)(3)));   
    
    
    cellN2 = rowN2.createCell((short)4);
    cellN2.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN2.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN2.setCellValue(  rs_3.getString("ROAD").trim() );
    cellN2.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(k_rot,(short)4,k_rot,(short)(4)));   


k_rot++;
    
     }

rs_3.close();
stmt_3.close();
    

/*
 if(!sql_1_3.equals(" ")){
sql_1_3="where "+ sql_1_3+sql_1_4;
}
String sql_1=sql_1_1+sql_1_2+sql_1_3+" order by a0_0.SN_SYSTEM ";

Statement stmt_3 = myconnection1.createStatement(); 
ResultSet rs_3 = stmt_3.executeQuery(sql_1); 


int k_rot=2;
while (rs_3.next()){


    HSSFRow  rowN3 = sheet.createRow(k_rot);
    rowN3.setHeight((short)500);
    HSSFCell cellN3 = rowN3.createCell((short)0);
    cellN3.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue(rs_3.getString("SN_SYSTEM"));
    cellN3.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(k_rot,(short)0,k_rot,(short)0));

    cellN3 = rowN3.createCell((short)1);
    cellN3.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue(rs_3.getString("CODE_USL"));
    cellN3.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(k_rot,(short)1,k_rot,(short)1));

    cellN3 = rowN3.createCell((short)2);
    cellN3.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue(rs_3.getString("SN_USL"));
    cellN3.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(k_rot,(short)2,k_rot,(short)2));

k_rot++;



//int dyd=0;
//int dt=0;
for (int i=1;i<k;i++){
String f="f"+i;

cellN3 = rowN3.createCell((short)(i+2));
    cellN3.setCellType( HSSFCell.CELL_TYPE_STRING );
    cellN3.setEncoding( HSSFCell.ENCODING_UTF_16 );
    cellN3.setCellValue(rs_3.getInt("f"+i));
    cellN3.setCellStyle(style0_1);
    sheet.addMergedRegion(new Region(k_rot,(short)(i+2),k_rot,(short)(i+2)));



}   }

rs_3.close();
stmt_3.close();

*/
 myconnection1.close();


response.setContentType("application/download");
 response.setHeader("Content-Disposition", "inline; filename=\"VVED_ASUZIR.xls\"");
 OutputStream out_out  = response.getOutputStream();
 wb.write(out_out) ;
 out_out.close();


}catch (SQLException e){}
 

}}%> 

