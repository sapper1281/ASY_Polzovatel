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
 

<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="UTF-8" %>

<%@page import= "com.Logout"%>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/maskedinput.js"></script>

<script > 
 

function Click_Save_Not_R3(s,sheet_rol_count_call){
var i=0;
var td_A=true; 
while((i < s)&&(td_A)){ 
  if( document.getElementById('td_A'+i).value==""){td_A=false;}  
  i++;
} 

i=0;
var td_D=true;    
while((i < s)&&(td_D)){ 
  if( document.getElementById('td_D'+i).title=="Выберите"){td_D=false;}  
  i++;
} 

i=0;
var td_I=true;    
while((i < s)&&(td_I)){ 
  if( document.getElementById('td_I'+i).value==""){td_I=false;}  
  i++;
} 


i=0;
var td_F=true;    
while((i < s)&&(td_F)){ 
  if( document.getElementById('td_F'+i).value==""){td_F=false;}  
  i++;
}

i=0;
var td_dt_big=true;    
while((i < s)&&(td_dt_big)){ 
  if( document.getElementById('td_dt_big'+i).value==""){td_dt_big=false;} 
  i++;
}


i=0;
var td_G=true;    
while((i < s)&&(td_G)){ 
  if( document.getElementById('td_G'+i).value==""){td_G=false;}  
  i++;
}


i=0;
var td_J=true;    
while((i < s)&&(td_J)){ 
  if( document.getElementById('td_J'+i).value==""){td_J=false;}  
  i++;
}

i=0;
var td_K=true;    
while((i < s)&&(td_K)){ 
  if( document.getElementById('td_K'+i).value==""){td_K=false;}  
  i++;
}




if(td_A && td_D && td_I && td_F && td_dt_big && td_G && td_J && td_K){
$("#img_load").show(); 
$("#img_load_new_tab").show(); 
var st=" /";
for(i=0;i < s; i++){

//alert(document.getElementById('td_D'+i).title);


      st=st+document.getElementById('td_A'+i).value.replace('/', ' ').replace('!', ' ')+" /"+
      document.getElementById('td_B'+i).value+" /"+
      document.getElementById('td_C'+i).value+" /"+
      document.getElementById('td_D'+i).title+" /"+
      document.getElementById('td_I'+i).value.replace('/', ' ').replace('!', ' ')+" /"+document.getElementById('td_F'+i).value.replace('/', ' ').replace('!', ' ')+" /"+
      document.getElementById('td_dt_big'+i).value.replace('/', ' ').replace('!', ' ')+" /"+document.getElementById('td_G'+i).value.replace('/', ' ').replace('!', ' ')+" /"+
      document.getElementById('td_J'+i).value.replace('/', ' ').replace('!', ' ')+" /"+document.getElementById('td_K'+i).value.replace('/', ' ').replace('!', ' ')+" /";}
      //alert(st);
     
     
       $("#div_img").load("Vvod_Pol_Not_R3_Import_Excel_Vibor_Save.jsp", {ss: st}, function(){$("#img_load").hide();});  
      
       $("#new_tab").load("Vvod_Pol_Not_R3_Import_Excel_Vibor.jsp", {call: sheet_rol_count_call}, function(){$("#img_load_new_tab").hide();});        
     
       
       
     
  
}
else {
if(!td_A){alert("Ф.И.О.");}
if(!td_D){alert("Выбирите системы");}
if(!td_I){alert("Выбирите № заявки");}
if(!td_F){alert("Выбирите Должность");}
if(!td_dt_big){alert("Выбирите Дат. начала действия заявки");}
if(!td_G){alert("Выбирите Телефон");}
if(!td_J){alert("Выбирите Ip адрес");}
if(!td_K){alert("Выбирите E-mail");}
}
}      
       
 //if(request.getParameter("ss")!=null)
            
</script> 




<%--@include file = "common/header.jsp"--%>                 



<%@include file = "common/header.jsp"%>








<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){%>
<%if("1".equals(request.getParameter("logout"))){%>
<jsp:useBean id="Logoutit" class="com.Logout" scope="request"/>
<jsp:setProperty name="Logoutit" property="*"/>

<%Logoutit.doPost(request,response);%>




<%}else{%>


<tr><%@include file = "common/menu.jsp"%></tr>


<%}}%>












<%

Object lock = new Object(); 
synchronized(lock)
     {
 
   if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)&&((session.getValue("id_role").equals("2"))||(session.getValue("id_role").equals("3")))){
response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");
//if(!session.isNew()&&(session.getValue("id_role").equals("2")||session.getValue("id_role").equals("3"))){         
//response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");


 


        
              
               response.setContentType("text/html; charset=UTF-8"); 
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
               String name_ses="";
               File FL=new File("C:/Tomcat 5.5/webapps/ASY_Polzovatel/doc/Vvod_Pol_Not_R3_Import_Excel.xls");
               
               
    if(request.getParameter("call")==null){
           
               //Список загружаемых файлов 
               List files = new ArrayList(); 
               //Список обычных параметров из HTML-формы 
               Map params = new HashMap(); 
               //Инициализируем структуры files и params 
              // init(request, params, files); 
                DiskFileItemFactory factory = new DiskFileItemFactory(); 
           //Устанавливаем каталог для временных файлов 
          
           factory.setRepository(new File("C:/Temp")); 
           ServletFileUpload upload = new ServletFileUpload(factory); 
           //Установим ограничение на размер загружаемого файла в битах 
        //   upload.setSizeMax(102400); 
           List items = upload.parseRequest(request); 
          for (Iterator i = items.iterator(); i.hasNext();) { 
               FileItem item = (FileItem) i.next(); 
              //Проверяем, является ли параметр обычным полем из HTML-формы, 
              //если да, то помещаем в Map пару name=value... 
               if (item.isFormField()) { 
                   params.put(item.getFieldName(), item.getString()); 
               } 
              //... если нет, то конструируем объект AttachmentDataSource и 
               //помещаем его в список прикрепленных файлов 
               else { 
                  if (item.getSize() <= 0) continue; 
                  files.add(item); 
               } 
          } 
               
               
               //Сохраняем файл на сервере 
               
               final PrintWriter writer = response.getWriter(); 
               //---------------
              // HttpSession session = request.getSession();
  // if(!session.isNew()&&(session.getValue("id_role").equals("2")||session.getValue("id_role").equals("3")))       
                   
              
               for (Iterator i = files.iterator(); i.hasNext();) { 
                   FileItem item = (FileItem) i.next(); 
                   // Файл, в который нужно произвести запись 
                   // final File file = new File(params.get("where") + File.separator + item.getName()); 
                   // HttpSession session = request.getSession();
                   // String name_ses=session.getId();
                   
                   name_ses=session.getId();
                   final File file = new File("D:\\SPfile"+name_ses+".xls"); 
                   FileOutputStream fos = new FileOutputStream(file); 
                   fos.write(item.get()); 
                   fos.close(); 
                   FL=new File("D:\\SPfile"+name_ses+".xls");
                   } 
 }else{
name_ses=session.getId();
FL=new File("D:\\SPfile"+name_ses+".xls");

}
                   
                   
                   
                   
                   
                   
                   
                   
    InputStream inputStream = new FileInputStream(FL); 
     HSSFWorkbook wb = new HSSFWorkbook(inputStream);
       
       HSSFSheet sheet = wb.getSheetAt(0);
       
       
     
       
         String UserID = "db2admin";
    
      String st0="";  
      String st1=""; 
      String st2=""; 
      String st3=""; 
      String st4=""; 
      String st5=""; 
      String st6=""; 
      String st7=""; 
      int sheet_rol_count_call=0;
      
      
      
      if(request.getParameter("call")==null){
      sheet_rol_count_call=1;}
      else{
      sheet_rol_count_call=Integer.parseInt(request.getParameter("call"))+1;}
      
      
      
      
      int sheet_rol_count=0;
if(request.getParameter("call")==null){
%>
 
<%--form name="sen" method=post   action="<%=request.getContextPath()%>"--%>

<table width=100% border='1' >
<tr><td>
<h1>Введите недостающие данные</h1>
</td></tr>

<%}%>



<tr>
<td>
<div id='new_tab'>
<img src="images/status_anim.gif" style="display:none" id='img_load_new_tab'/>
<table >

<tr><td>

<div style="OVERFLOW: auto; WIDTH: 1000px; HEIGHT: 500px"> 
<table    style="overflow: auto; position: relative;"  >

<tr style='position: relative;top: expression(this.parentElement.parentElement.parentElement.scrollTop);z-index: 1000;' bgcolor='#B2B2B2' >
<td  NOWRAP style='left: expression(parentNode.parentNode.parentNode.parentNode.scrollLeft);position: relative;z-index: 100;'>№</td>
<td  NOWRAP style='left: expression(parentNode.parentNode.parentNode.parentNode.scrollLeft);position: relative;z-index: 100;'   >ФИО</td>
<td  NOWRAP>СП</td>
<td  NOWRAP>Станция</td>
<td  NOWRAP>Система</td>
<td  NOWRAP>№ заявки</td>
<td  NOWRAP>Должность</td>
<td  NOWRAP>Дт. нач.</td>
<td  NOWRAP>тел.</td>
<td  NOWRAP>ip адрес</td>
<td  NOWRAP>e-mail</td>
</tr>
<%  
//String st123="!"; 

int g=0;
try{
    
    try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
         }catch(Throwable theException) {theException.printStackTrace();} 
    Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "11111111");  
 

String sp=" select ID, CODE_ROAD_ASU_TR, ID_ROAD_ASU_TR, SN_ROAD, FN_ROAD, "+ 
    " MY_ID_ROAD_ASU_TR, MY_ID_ROAD, DT_BIG, DT_END, STATUS, TYPE,  "+ 
    " PR_SERV, DT_VVOD, R3 "+ 
    " from ASU_POL.POLYGON_ROAD where R3='not' "+ 
    " order by SN_ROAD ";  
      
     Statement stmt_sp = myconnection1.createStatement(); 
     ResultSet rs_sp = stmt_sp.executeQuery(sp); 
  
  ResultSetMetaData metadata_sp= rs_sp.getMetaData();  
  Vector rows_sp=new Vector();
   while(rs_sp.next()){ 
       Vector newRow_sp=new Vector();  
       Object obj;
   for(int i_sp=1;i_sp<=metadata_sp.getColumnCount();i_sp++){
   newRow_sp.addElement(rs_sp.getObject(i_sp));
   }
   rows_sp.addElement(newRow_sp);} 
     
rs_sp.close(); stmt_sp.close();
  
  
  
  


  String stan="select a1.id, a1.id_stan,a1.sn_stan "+
  " from ASU_POL.POLYGON_STAN a1 " +
  " order by a1.sn_stan";  
      
     Statement stmt_stan = myconnection1.createStatement(); 
     ResultSet rs_stan = stmt_stan.executeQuery(stan); 
  
  ResultSetMetaData metadata_stan= rs_stan.getMetaData();  
  Vector rows_stan=new Vector();
   while(rs_stan.next()){ 
       Vector newRow_stan=new Vector();  
       Object obj;
   for(int i_stan=1;i_stan<=metadata_stan.getColumnCount();i_stan++){
   newRow_stan.addElement(rs_stan.getObject(i_stan));
   }
   rows_stan.addElement(newRow_stan);} 
     
 rs_stan.close(); stmt_stan.close();
 
  
 
 
 String sys="";
 
  if(session.getValue("id_role").equals("2")){         
      sys=" select a1.id, a1.id_system,a1.sn_system "+
      " from ASU_POL.POLYGON_system a1  order by a1.sn_system";
      }else{
      sys="  select  "+
	   " a5.id, a5.id_system,a5.sn_system  "+
	   " from ASU_POL.MAIN_USER_ALL a1   "+
           " left join ASU_POL.SOOTV_USER_SYS a3 on a1.ID=a3.ID_USER   "+
           " left join ASU_POL.POLYGON_ROLE a4 on a4.id_role=a3.id_role  "+
	   " left join ASU_POL.POLYGON_SYSTEM a5 on a5.ID_SYSTEM=a3.ID_SYSTEM  "+
	   " where a3.id_system<>1  "+
" and a1.id="+session.getValue("id_us")+
" and a3.id_role=2 and  a3.del=0 "+
           " order by a5.sn_system";
     }
     Statement stmt_sys = myconnection1.createStatement(); 
     ResultSet rs_sys = stmt_sys.executeQuery(sys); 
 
    ResultSetMetaData metadata_sys= rs_sys.getMetaData(); 
   
    boolean fakt_sys=false;
    String id_system="";
    String sn_system="";
    String id_system_vse="!";
    
    int pr_sys=0;
     while(rs_sys.next()){
       pr_sys++;  
       id_system_vse=id_system_vse+rs_sys.getString("id_system")+"!";
       
       id_system=  "!"+rs_sys.getString("id_system")+"!";
       sn_system=  rs_sys.getString("sn_system");
    }
    if(pr_sys==1){fakt_sys=!fakt_sys;}
    
 
 
 
  rs_sys.close(); stmt_sys.close();
 
 
 
  
  if(sheet.getPhysicalNumberOfRows()%10==0){
  sheet_rol_count=sheet.getPhysicalNumberOfRows()/10;}
  else{sheet_rol_count=(sheet.getPhysicalNumberOfRows()-sheet.getPhysicalNumberOfRows()%10)/10+1;}
  
  

g=0;
     
int i1 = 0;

if(request.getParameter("call")!=null){
    i1=Integer.parseInt(request.getParameter("call"))*10;}


int i1_10=i1;

if(i1< sheet.getPhysicalNumberOfRows() ) {

while((i1< sheet.getPhysicalNumberOfRows())&&(i1<i1_10+10)){

          
        
          
        
          
          %>
        
       <script type="text/javascript"> 
    jQuery(function($) { 
       $.mask.definitions['~']='[+-]'; 
       $('#td_dt_big<%=g%>').mask('9999-99-99'); 
    });
    </script>
          
     
    <script>
    function Click_System<%=g%>() 
    {
    window.open("/ASY_Polzovatel/Vvod_Pol_Not_R3_Import_Excel_Vibor_Select_System.jsp?ss=td_D<%=g%>&sd=<%=id_system_vse%>","CNN_WindowName","menubar=yes,location=yes,resizable=yes,scrollbars=yes,status=yes");
  }
    </script>   
     
    
          
  <%        
      
      HSSFRow rowN2 =   sheet.getRow(i1);; 
      
     
      
       HSSFCell cellN0 = rowN2.getCell((short)0);//начиная со столбца (+1=столбц)
       HSSFCell cellN1 = rowN2.getCell((short)1);
       HSSFCell cellN2 = rowN2.getCell((short)2);
       HSSFCell cellN3 = rowN2.getCell((short)3);
       HSSFCell cellN4 = rowN2.getCell((short)4);
       HSSFCell cellN5 = rowN2.getCell((short)5);
       HSSFCell cellN6 = rowN2.getCell((short)6);
      
String t0=" ";  
String t1=" "; 
String t2=" ";
String t3=" ";
//String t4=" ";
String t5=" ";
String t6=" ";
String t7=" ";

if((cellN0!=null) && (cellN0.getCellType()==1)){
    t0=cellN0.getStringCellValue();}
else{if(cellN0!=null){t0="нет";}else{t0="нет";};}
if((cellN1!=null) && (cellN1.getCellType()==1)){
    t1=cellN1.getStringCellValue();}
else{if(cellN1!=null){t1="";}else{t1="";};}
if((cellN2!=null) && (cellN2.getCellType()==1)){
    t2=cellN2.getStringCellValue();}
else{if(cellN2!=null){t2="нет";}else{t2="нет";};}


if((cellN3!=null) && (cellN3.getCellType()==1)){
  
Calendar DT_NOW_a=Calendar.getInstance(); 
t3= dateFormatter1.format(DT_NOW_a.getTime()).toString();


}
else{if((cellN3!=null)&& (cellN3.getCellType()!=3))
{t3=dateFormatter1.format(cellN3.getDateCellValue()).toString();
}
else{

Calendar DT_NOW_a=Calendar.getInstance(); 
t3= dateFormatter1.format(DT_NOW_a.getTime()).toString();

}}

/*

if((cellN4!=null) && (cellN4.getCellType()==1)){
 
String dday = t3.substring(8,10); 
        int dday1=Integer.parseInt(dday);
        String mmonth = t3.substring(5,7);
        int mmonth1=Integer.parseInt(mmonth)-1;
        String yyear = t3.substring(0,4);
        int yyear1=Integer.parseInt(yyear);
        int yyear2= yyear1+2;
        
Calendar DT_NOW_a=Calendar.getInstance(); 
DT_NOW_a.set(yyear2,mmonth1,dday1,0,0,0);        
t4= dateFormatter1.format(DT_NOW_a.getTime()).toString();

}
else{if((cellN4!=null)&& (cellN4.getCellType()!=3)){t4=dateFormatter1.format(cellN4.getDateCellValue()).toString();}
else{

String dday = t3.substring(8,10); 
        int dday1=Integer.parseInt(dday);
        String mmonth = t3.substring(5,7);
        int mmonth1=Integer.parseInt(mmonth)-1;
        String yyear = t3.substring(0,4);
        int yyear1=Integer.parseInt(yyear);
        int yyear2= yyear1+2;
        
Calendar DT_NOW_a=Calendar.getInstance(); 
DT_NOW_a.set(yyear2,mmonth1,dday1,0,0,0);        
t4= dateFormatter1.format(DT_NOW_a.getTime()).toString();
}}*/
if((cellN4!=null) && (cellN4.getCellType()==1)){
    t5=cellN4.getStringCellValue();}
else{if(cellN4!=null){t5="нет";}else{t5="нет";};}
if((cellN5!=null) && (cellN5.getCellType()==1)){
    t6=cellN5.getStringCellValue();}
else{if(cellN5!=null){t6="нет";}else{t6="нет";};}
if((cellN6!=null) && (cellN6.getCellType()==1)){
    t7=cellN6.getStringCellValue();}
else{if(cellN6!=null){t7="нет";}else{t7="нет";};}



         
     t0=  t0.replace('\'', ' '); 
     t1=  t1.replace('\'', ' ');
     t2=  t2.replace('\'', ' ');
     t3=  t3.replace('\'', ' ');
    // t4=  t4.replace('\'', ' ');
     t5=  t5.replace('\'', ' ');
     t6=  t6.replace('\'', ' ');
     t7=  t7.replace('\'', ' ');
     
    t0=  t0.replace('"', ' '); 
    t1=  t1.replace('"', ' '); 
    t2=  t2.replace('"', ' '); 
    t3=  t3.replace('"', ' '); 
    //t4=  t4.replace('"', ' '); 
    t5=  t5.replace('"', ' '); 
    t6=  t6.replace('"', ' '); 
    t7=  t7.replace('"', ' '); 
    
    t0=  t0.replace('!', ' '); 
    t1=  t1.replace('!', ' '); 
    t2=  t2.replace('!', ' '); 
    t3=  t3.replace('!', ' '); 
    //t4=  t4.replace('"', ' '); 
    t5=  t5.replace('!', ' '); 
    t6=  t6.replace('!', ' '); 
    t7=  t7.replace('!', ' '); 
    
   
    // st123=st123+"!"+t0+"!"+t1+"!"+t2+"!"+t3+"!"+t4+"!"+t5+"!"+t6+"!"+t7+"!";
     
    //if(!t1.equals("нет")){
%>
   <tr>
   <td  bgcolor='#FFFFFF' style='left: expression(parentNode.parentNode.parentNode.parentNode.scrollLeft);position: relative;z-index: 100;'><%=i1%></td>   

<td  bgcolor='#FFFFFF' NOWRAP style='left: expression(parentNode.parentNode.parentNode.parentNode.scrollLeft);position: relative;z-index: 100;' width="200">
<input style="width: 100%;" type='text' id="td_A<%=g%>" value='<%=t1%>'/></td>
 
<td NOWRAP width="250" style="z-index: 10;">

    <select   id="td_B<%=g%>" style="width: 100%;z-index: 1;"> 
    <% for (int i_sp=0;i_sp<rows_sp.size();i_sp++){ 
     Vector line_sp =(Vector)rows_sp.get(i_sp);%> 
    <option style='z-index: 1;' value="<%=line_sp.get(1)%>"><%=line_sp.get(3)%></option>
    <% } %> 
    </select>

    </td>
    
    
    
    
   
   <td NOWRAP width="150" style="z-index: 10;"><select id="td_C<%=g%>" style="width: 100%; z-index: 1;"> 
    <% for (int i_stan=0;i_stan<rows_stan.size();i_stan++){ 
     Vector line_stan =(Vector)rows_stan.get(i_stan);%> 
    <option style='z-index: 1;'  value="<%=line_stan.get(1)%>"><%=line_stan.get(2)%></option>
    <% } %> 
   </select></td>
   <%--if(fakt_sys){%>
     <td NOWRAP width="200"><input  style="width: 100%;background: #F8F8F8;" TITLE='!<%=id_system%>!'  type='button' id="td_D<%=g%>" value='<%=sn_system%>'></input></td>
    <%}else{---%>
    <td NOWRAP width="200"><input onclick="Click_System<%=g%>()" style="width: 100%;background: #FF0000;" TITLE='Выберите'  type='button' id="td_D<%=g%>" value='Выберите'></input></td>
   <%--}--%>
    
   <td NOWRAP width="200"><input style="width: 100%;" type='text' id="td_I<%=g%>" value='<%=t0%>'/></td>
   <td NOWRAP width="200"><input style="width: 100%;" type='text' id="td_F<%=g%>" value='<%=t2%>'/></td>
   <td NOWRAP width="200"><input style="width: 100%;" type='text' id="td_dt_big<%=g%>" tabindex="1" value='<%=t3%>'/></td>
   
   
   <td NOWRAP width="150"><input style="width: 100%;" type='text' id="td_G<%=g%>" value='<%=t5%>'/></td>
   <td NOWRAP width="150"><input style="width: 100%;" type='text' id="td_J<%=g%>" value='<%=t6%>'/></td>
   <td NOWRAP width="150"><input style="width: 100%;" type='text' id="td_K<%=g%>" value='<%=t7%>'/></td>
   
   </tr>
    <%
      g++;//}else{

//int h=g;
%>  

<%--tr><td style='left: expression(parentNode.parentNode.parentNode.parentNode.scrollLeft);position: relative;z-index: 100;'><%=h%></td>
<td NOWRAP colspan='11' style='left: expression(parentNode.parentNode.parentNode.parentNode.scrollLeft);position: relative;z-index: 100;'>Нет Ф.И.О.</td> </tr>
--%><% //} 
i1++;}

}else{


%>
<tr><td>Введены все записи</td></tr>



<%

}


















myconnection1.close();



} catch (SQLException e) {e.printStackTrace();}
%>

</table >
</div >

</td></tr>

<tr ><td>
 <%for( int sheet_rol_count_i=1;sheet_rol_count_i<=sheet_rol_count;sheet_rol_count_i++){
 if(sheet_rol_count_call==sheet_rol_count_i){


%>
&nbsp;<b style="color: RED"><%=sheet_rol_count_i%></b>&nbsp;
 
 <%}else{%>
 &nbsp;<%=sheet_rol_count_i%>&nbsp; 
 
 <%}}%>

 </td></tr>
 
  <%if(sheet_rol_count_call<=sheet_rol_count){%>
 <tr ><td NOWRAP colspan=8>
<table width=100%  >

   <form name="bak" method=post   action="<%=request.getContextPath()%>">
     <tr>
     <td NOWRAP colspan=8 align=center><input type='button' onclick='Click_Save_Not_R3(<%=g%>,<%=sheet_rol_count_call%>)' value="Ввести"  />
     <input type=submit value="Отмена"  ></td>
     </tr>
    </form>
      
</table>
</td></tr>

<%}else{%>

 <tr>
 <td>
<form name="bak" method=post   action="<%=request.getContextPath()%>">
<table width=100%  >
     <tr><td NOWRAP colspan=2 align=center><input type=submit value="Продолжить"  ></td></tr>
</table>
</form>
</td>
</tr>


<%}%>
 </div>
</table>
 </td></tr>
 



<%if(request.getParameter("call")==null){ %>
<tr ><td NOWRAP colspan=8><div id='div_img'><img src="images/status_anim.gif" style="display:none" id='img_load'/></div>

</td></tr>



<%--/form--%>



</table>       
   <%  }   FL.delete();
          FL.deleteOnExit();
             


}  %>
     
     
     
   <%   
     
     
     


}
%>