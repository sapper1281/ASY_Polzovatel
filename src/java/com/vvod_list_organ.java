/*
 * vvod_list_organ.java
 *
 */

package com;



     
    import org.apache.commons.fileupload.*; 
    import org.apache.commons.fileupload.servlet.ServletFileUpload; 
   import org.apache.commons.fileupload.disk.DiskFileItemFactory; 
   
import org.apache.poi.hssf.usermodel.*; 

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import java.text.SimpleDateFormat;
   /** 
    * сервлет обработки загрузки файла на сервер
    */ 
   public class vvod_list_organ extends HttpServlet { 
       
     
       
      // if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){
Object lock = new Object(); 
 private String out1;
    public void setOUT(String out1){
    this.out1=out1;
}
 public String getOUT(){
 return out1;
 }      
       protected void doPost(HttpServletRequest request, HttpServletResponse response) 
               throws ServletException, IOException { 
                   
        synchronized(lock)
       {          
               
           try {   
               
              
               
               SimpleDateFormat dateFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
               SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd-MM-yyyy");
               SimpleDateFormat dateFormatter3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
               Calendar DT_NOW=Calendar.getInstance(); 
               Calendar DT_NOW_1=Calendar.getInstance(); 
               String date=dateFormatter1.format(DT_NOW_1.getTime()).toString();
               String date_1=dateFormatter3.format(DT_NOW_1.getTime()).toString();
               
               Calendar DT_NOW_2=Calendar.getInstance(); 
              DT_NOW_2.set(Calendar.DAY_OF_MONTH,1);
        
              String date_2=dateFormatter1.format(DT_NOW_2.getTime()).toString();
                
               
               List files = new ArrayList(); 
               Map params = new HashMap(); 
              // init(request, params, files); 
                DiskFileItemFactory factory = new DiskFileItemFactory(); 
          
           factory.setRepository(new File("C:/Temp")); 
           ServletFileUpload upload = new ServletFileUpload(factory); 
        //   upload.setSizeMax(102400); 
           List items = upload.parseRequest(request); 
          for (Iterator i = items.iterator(); i.hasNext();) { 
               FileItem item = (FileItem) i.next(); 
                if (item.isFormField()) { 
                   params.put(item.getFieldName(), item.getString()); 
               } 
               else { 
                  if (item.getSize() <= 0) continue; 
                  files.add(item); 
               } 
          } 
               
               
                response.setContentType("text/html; charset=windows-1251"); 
               final PrintWriter writer = response.getWriter(); 
               //---------------
               HttpSession session = request.getSession();
   if(!session.isNew()&&(session.getAttribute("id_role").equals("2")||session.getAttribute("id_role").equals("3"))){
                   
                try { 
               for (Iterator i = files.iterator(); i.hasNext();) { 
                   FileItem item = (FileItem) i.next(); 
                //   final File file = new File(params.get("where") + File.separator + item.getName()); 
                  // HttpSession session = request.getSession();
                 // String name_ses=session.getId();
                   
                     
                   String name_ses=session.getId();
                   
                   final File file = new File("D:\\SPfile"+name_ses+".xls"); 
                  FileOutputStream fos = new FileOutputStream(file); 
                  fos.write(item.get()); 
                   fos.close(); 
                   
                   
                   File FL=new File("D:\\SPfile"+name_ses+".xls");
    InputStream inputStream = new FileInputStream(FL); 
     HSSFWorkbook wb = new HSSFWorkbook(inputStream);
       
       HSSFSheet sheet = wb.getSheetAt(0);



   /*    Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
        try {     
     
         String UserID = "db2admin";
      String Password = "11111111";
     //String Password = "D2_12345678";
      
      Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , UserID, Password); 
      */

       Connection myconnection1=null;
 try {
        myconnection1 = new Connection_ASU_POL().getConnection();


     Statement stmt_0 = myconnection1.createStatement(); 
ResultSet rs_0 = stmt_0.executeQuery(
" select min(ID_ROAD_ASU_TR) as min_ID_ROAD_ASU_TR from ASU_POL.POLYGON_ROAD where R3='not' order by 1"
 );  
int min_ID_ROAD_ASU_TR=-1;
 while(rs_0.next()){   
    if(Integer.parseInt(rs_0.getString("min_ID_ROAD_ASU_TR"))<0){
      min_ID_ROAD_ASU_TR=Integer.parseInt(rs_0.getString("min_ID_ROAD_ASU_TR"))-1;}
 }
             for (Iterator i1 = sheet.rowIterator(); i1.hasNext();) { 
      
      HSSFRow rowN2 = (HSSFRow) i1.next(); 
      
     
      
       HSSFCell cellN0 = rowN2.getCell((short)0);
       HSSFCell cellN1 = rowN2.getCell((short)1);
 String t0=" ";  
String t1=" ";   

if((cellN0!=null) && (cellN0.getCellType()==1)){
    t0=cellN0.getStringCellValue();}
      
       if((cellN1!=null) && (cellN1.getCellType()==1)){
            t1=cellN1.getStringCellValue();}
        


         
     t0=  t0.replace('\'', ' '); 
     t1=  t1.replace('\'', ' '); 
    
     t0=  t0.replace('"', ' '); 
     t1=  t1.replace('"', ' '); 
    

    // writer.println(stt[0]);
    // for (int g=1;g<stt.length; g++){
    // writer.println(stt[g]);}
    // writer.println(stt[1]);
    // writer.println(stt[2]);
    
   // writer.println(t0+"    "+t1);
    
    
      PreparedStatement stmt_in_1 = myconnection1.prepareStatement(
 " insert into ASU_POL.POLYGON_ROAD (  CODE_ROAD_ASU_TR,ID_ROAD_ASU_TR,SN_ROAD,FN_ROAD, " +
 " MY_ID_ROAD_ASU_TR, MY_ID_ROAD, DT_BIG, DT_END, STATUS, TYPE,DT_VVOD,R3) " +
      " values ('"+min_ID_ROAD_ASU_TR+"',"+min_ID_ROAD_ASU_TR+",'"+t0+"','"+t1+"', 0,0,'"+date_2+"','9999-12-31','-1','-1','"+date+"','not')"
);
  stmt_in_1.executeUpdate();
  stmt_in_1.close();  
min_ID_ROAD_ASU_TR=min_ID_ROAD_ASU_TR-1;
       
      }    
            
            
    
    Statement stmt = myconnection1.createStatement(); 
ResultSet rs = stmt.executeQuery(
" select * from ASU_POL.POLYGON_ROAD where R3='not' order by 1"
 );
   
writer.println("<table border=1><tr><td ><div style=\"OVERFLOW: auto; WIDTH: 850px; HEIGHT: 300px\"> <table> " +
" <tr style='position: relative; " +
" top: expression(this.parentElement.parentElement.parentElement.scrollTop)' bgcolor='#B2B2B2'> " +
" <td NOWRAP>id записи </td>  "+
" <td NOWRAP>код объекта </td>  "+
" <td NOWRAP>id объекта </td>  "+
" <td NOWRAP>кр. наз. об.</td>  "+
" <td NOWRAP>пол. наз. об. </td>  "+
" <td NOWRAP>пр. свой об. асу тр </td>  "+
" <td NOWRAP>пр. свой об. </td>  "+
" <td NOWRAP>дт. нач. акт. </td>  "+
" <td NOWRAP>дт. ок. акт. </td>  "+
" <td NOWRAP>статус об. </td>  "+
" <td NOWRAP>тип об. </td>  "+
" <td NOWRAP>дт. ввода </td>  "+
" <td NOWRAP>признак R3</td> <tr> ");
boolean t=false;

while(rs.next()){    
   
    writer.println(" <tr bgcolor= "); 
    if(t){ writer.println(" '#E4E2E0' ");
     t=!t;}else{writer.println(" '#F0F0F0' "); 
     t=!t;}writer.println(" border=1>");
    
    
    writer.println(
    " <td NOWRAP>"+rs.getString("ID").trim()+" </td>  "+
    " <td NOWRAP>"+rs.getString("CODE_ROAD_ASU_TR").trim()+" </td>  "+ 
" <td NOWRAP>"+rs.getString("ID_ROAD_ASU_TR").trim()+" </td>  "+   
" <td NOWRAP>"+rs.getString("SN_ROAD").trim()+" </td>  "+ 
" <td NOWRAP>"+rs.getString("FN_ROAD").trim()+"</td>  "+ 
" <td NOWRAP>"+rs.getString("MY_ID_ROAD_ASU_TR").trim()+" </td>  "+ 
" <td NOWRAP>"+rs.getString("MY_ID_ROAD").trim()+" </td>  "+ 
" <td NOWRAP>"+rs.getString("DT_BIG").trim()+" </td>  "+ 
" <td NOWRAP>"+rs.getString("DT_END").trim()+" </td>  "+ 
" <td NOWRAP>"+rs.getString("STATUS").trim()+" </td>  "+ 
" <td NOWRAP>"+rs.getString("TYPE").trim()+" </td>  "+ 
" <td NOWRAP>"+rs.getString("DT_VVOD").trim()+" </td>  "+ 
 
" <td NOWRAP >"+rs.getString("R3").trim()+"</td> <tr> "
    
  )  ;
    
   
  }       
    
rs.close();
stmt.close();            
 writer.println("</table></div></td></tr> " +
 
 
 "<tr>"+
 "<td>"+
"<form name=\"bak\" method=post   action=\""+request.getContextPath()+"\">"+
"<table width=100%  >"+
     "<tr><td NOWRAP colspan=2 align=center><input type=submit value=\"Продолжить\"  ></td></tr>"+
"</table>"+
"</form>"+
"</td>"+
"</tr>"+
 
 "</table>");           
            
          myconnection1.commit();
            } catch (Exception e) {
            e.printStackTrace();
            } finally {
            // Обязательно закрываем соединение с БД!
            new Connection_ASU_POL().closeConnection(myconnection1);
            }
            
            
            
            
            
               FL.delete();
               FL.deleteOnExit();
              
               
               } 
           } 
           catch (IOException e) {
                e.printStackTrace(); 
                 writer.println("файл "+e+"<br>");
              
               throw e; 
          }
   }      
           
               
               
    
               
               
               
               writer.close(); 
               
           } 
           catch (FileUploadException fue) { 
               fue.printStackTrace(); 
               throw new ServletException(fue); 
           } 
           catch (Exception e) { 
               e.printStackTrace(); 
               throw new ServletException(e); 
           } 
       } }
    
    
  }
 
