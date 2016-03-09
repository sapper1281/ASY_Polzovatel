<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>


 <% 
 
 
Object lock = new Object(); 
synchronized(lock)
     {
 
   if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)&&((session.getValue("id_role").equals("2"))||(session.getValue("id_role").equals("3")))){
response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");

      
       
request.setCharacterEncoding("UTF-8");
        String charset = "windows-1251";
        response.setContentType("text/html; charset=" + charset);  
String fio=request.getParameter("fio")+" ";
String out1="";
String LAST_NAME="";
        String FIRST_NAME="";
        String MIDDLE_NAME="";
  try {     
      String UserID = "db2admin";
      String Password = "11111111";
      Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , UserID, Password);          
    
        
        
        int i=0;
        boolean t_nas=true;
        boolean t_end=true;
        boolean end=true;
        int i_nas=0;
        int i_end=fio.length()-1;
        while( (i<fio.length())&&(t_nas||t_end)&&end){
         i_nas=0;
         i_end=fio.length()-1;    
        while(t_nas && (i<fio.length()) && (String.valueOf(fio.charAt(i)).equals(" "))  ){i++;}
        if(t_nas && (i<fio.length()) && (!(String.valueOf(fio.charAt(i)).equals(" ")))  )
        {t_nas=false;i_nas=i;i++;}
        while(t_end && (i<fio.length()) && (!(String.valueOf(fio.charAt(i)).equals(" ")))  ) {i++;}
        if(t_end && (i<fio.length()) && (String.valueOf(fio.charAt(i)).equals(" "))  )
        {t_end=false;i_end=i;i++;}
        if((i_nas!=i_end)&&(i_end!=0)&&!t_nas&&!t_end){
        if(LAST_NAME.equals("")){
           LAST_NAME=fio.substring(i_nas,i_end);
        }
        else{
        if(FIRST_NAME.equals("")){
            FIRST_NAME=fio.substring(i_nas,i_end);
        }else{
        if(MIDDLE_NAME.equals("")){
            MIDDLE_NAME=fio.substring(i_nas,i_end);
        end=false;
        }}}}
        t_nas=true;
        t_end=true;
        }
       
      
 // поиск фамилии  
  Statement stmt5_fio = myconnection1.createStatement(); 
     ResultSet rs5_fio = stmt5_fio.executeQuery(
     " select ID, ID_ROAD_ASU_TR, TAB_NUM, ID_JOB, BLOCK_USER, PFR, "+ 
     " LAST_NAME, FIRST_NAME, MIDDLE_NAME, TEL, IP, E_MAIL, DT_BIG, "+
     " DT_END, PRIZ, ROAD, SN_JOB, R3_YES_OR_NIOT "+
     " from ASU_POL.MAIN_USER_ALL where "+
     "   LCASE(rtrim(LAST_NAME)||rtrim(FIRST_NAME)||rtrim(MIDDLE_NAME))  like LCASE(rtrim('"+LAST_NAME+FIRST_NAME+MIDDLE_NAME+"%')) " +
     "  and BLOCK_USER=0 and R3_YES_OR_NIOT='not'");
 
 
out1="<div  width=\"100%\" align=\"top\" name=\"td11_11\" id=\"td11_11\"  >"+
"<table><tr><td><div style=\"OVERFLOW: auto; WIDTH: 1000px; HEIGHT: 500px\"   ><table>";
 
 

    
     boolean r=true; 
boolean r1=true;
while(rs5_fio.next()){
    //String ROAD="fff";
   int ID_JOB=rs5_fio.getInt("ID_JOB");
    int ID=rs5_fio.getInt("ID");
    int ID_ROAD_ASU_TR=rs5_fio.getInt("ID_ROAD_ASU_TR");
    LAST_NAME=rs5_fio.getString("LAST_NAME").trim();
    FIRST_NAME=rs5_fio.getString("FIRST_NAME").trim();
    MIDDLE_NAME=rs5_fio.getString("MIDDLE_NAME").trim();
    String ROAD=rs5_fio.getString("ROAD").trim();
    if (r1){
  out1=out1+"<tr  bgcolor='#E4E2E0' >";r1=false;}
    else{out1=out1+"<tr  bgcolor='#F0F0F0' >"; r1=true;}
  
  if(!ROAD.equals("Не определено")) { 
  if(r){
  out1=out1+ 
  "<td><input id='Poi_1' name='Poi_1' type='radio' checked value='"+ID_JOB+"|"+ID+"|"+ID_ROAD_ASU_TR+"|"+
  LAST_NAME+"|"+FIRST_NAME+"|"+MIDDLE_NAME+"'></td>";
  r=false;
  }
  else{
   out1=out1+ "<td><input id='Poi_1' name='Poi_1' type='radio'  value='"+ID_JOB+"|"+ID+"|"+ID_ROAD_ASU_TR+"|"+
   LAST_NAME+"|"+FIRST_NAME+"|"+MIDDLE_NAME+"'></td>";
  } }else{out1=out1+"<td>&nbsp;</td>";}
   
  
   
   out1=out1+"<td>"+   LAST_NAME+" "+FIRST_NAME+" "+MIDDLE_NAME+" ["+ROAD+"]"+" </td>";
   
  out1= out1+"</tr>";
   
   // i++;
 }


rs5_fio.close();
stmt5_fio.close();
     
 out1= out1+
"</table></div></td></tr><tr>"+
"<td align=center>"+
"<input type='button' value='Вывести' onClick=\"getCustomerInfoPoisk_1('Poi_1','not');\" >"+

"<input type='button' value='Новый' onClick=\"getCustomerInfoPoisk_3();\" >"+

"</td>"+

"</tr>"+
"</table>"+
"</div>";   
 
myconnection1.close();
    }catch (SQLException e) {}  
out.println( out1);
  }} %>