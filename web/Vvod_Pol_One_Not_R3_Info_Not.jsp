<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text.*" %>


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
String LAST_NAME="-";
        String FIRST_NAME="-";
        String MIDDLE_NAME="-";
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
        if(LAST_NAME.equals("-")){
           LAST_NAME=fio.substring(i_nas,i_end);
        }
        else{
        if(FIRST_NAME.equals("-")){
            FIRST_NAME=fio.substring(i_nas,i_end);
        }else{
        if(MIDDLE_NAME.equals("-")){
            MIDDLE_NAME=fio.substring(i_nas,i_end);
        end=false;
        }}}}
        t_nas=true;
        t_end=true;
        }
       
        
        
        out1=out1+" <form    name=\"senddata\""+/* action=\"/ASY_Polzovatel/welcome3\" */"method=\"post\"> "+
       
      "<table >" +
      "<tr><td colspan='2'><HR></td></tr>"+    
      "<tr><td ><H4>Введите данные</H4></td></tr>";  
       
     Statement stmt_road = myconnection1.createStatement(); 
     ResultSet rs_road = stmt_road.executeQuery(
     " select ID, CODE_ROAD_ASU_TR, ID_ROAD_ASU_TR, SN_ROAD, FN_ROAD, "+ 
     " MY_ID_ROAD_ASU_TR, MY_ID_ROAD, DT_BIG, DT_END, STATUS, TYPE,  "+ 
     " PR_SERV, DT_VVOD, R3 "+ 
     " from ASU_POL.POLYGON_ROAD where R3='not' "+ 
     " order by SN_ROAD "
     ); 
        
     out1=out1+  "<tr>"+
      "<td width=\"30%\">Структурное подразделение:</td>"+
      "<td  width=\"50%\">"+
      "<select  name=\"road\" id=\"road\" style=\"width: 100%;\">"; 
    
   while (rs_road.next()){
    out1=out1+"<option value=\""+rs_road.getInt("ID_ROAD_ASU_TR")+"\">"+rs_road.getString("SN_ROAD")+" </option>";}   
   rs_road.close();
   stmt_road.close();  

      out1=out1+"</select>"+
      "</td>"+
      "</tr>";  
    
 

      
      
    Statement stmt_stan = myconnection1.createStatement(); 
     ResultSet rs_stan = stmt_stan.executeQuery(
     " select a1.id, a1.id_stan,a1.sn_stan "+
     " from ASU_POL.POLYGON_STAN a1 order by a1.sn_stan "
     ); 
        
     out1=out1+  "<tr>"+
      "<td width=\"30%\">Станция:</td>"+
      "<td  width=\"50%\">"+
      "<select  name=\"stan\" id=\"stan\" style=\"width: 100%;\">"; 
    
   while (rs_stan.next()){
    out1=out1+"<option value=\""+rs_stan.getInt("id_stan")+"\">"+rs_stan.getString("sn_stan")+" </option>";}   
   rs_stan.close();
   stmt_stan.close();  

      out1=out1+"</select>"+
      "</td>"+
      "</tr>";  





 out1=out1+"<tr>"+
      "<td width=\"30%\">Информационный ресурс:</td>"+
      "<td  width=\"50%\">";
      out1=out1+"<select name=\"system\" id=\"system\"  style=\"width: 100%;\">";
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
	   " where a3.id_system<>1 and a1.id="+session.getValue("id_us")+" and a3.id_role=2 and  a3.del=0 ";
        }
      Statement stmt7 = myconnection1.createStatement(); 
ResultSet rs7 = stmt7.executeQuery(sys);
int id_system_1=-1;
 while (rs7.next()){
      if(id_system_1==-1){
    id_system_1=rs7.getInt("id_system");}
    out1=out1+"<option value=\""+rs7.getInt("id_system")+"\">"+rs7.getString("sn_system")+" </option>";
  }
      out1=out1+"</select>"+
      "</td>"+
      "</tr>";   
      
      rs7.close();
      stmt7.close(); 
      


out1=out1+  "<tr>"+
      "<td width=\"30%\">Роль:</td>"+
      "<td  width=\"50%\">"+
      "<select  name=\"role\" id=\"role\" style=\"width: 100%;\">";
      String rol="";
      if(session.getValue("id_role").equals("2")){         
      rol= " select a1.id, a1.id_role,a1.fn_role "+
      " from ASU_POL.POLYGON_ROLE a1 where a1.my_role=0 ";
      }else{
      rol= " select a1.id, a1.id_role,a1.fn_role "+
      " from ASU_POL.POLYGON_ROLE a1 where a1.my_role=0 and a1.id_role<>2 ";}
      Statement stmt9 = myconnection1.createStatement(); 
      ResultSet rs9 = stmt9.executeQuery(rol);
  while (rs9.next()){
    out1=out1+"<option value=\""+rs9.getInt("id_role")+"\">"+rs9.getString("fn_role")+" </option>";
  }
      out1=out1+"</select>"+
      "</td>"+
      "</tr>"; 
 rs9.close();
      stmt9.close(); 
 
     
      
out1=out1+"<tr><td width=\"30%\">Должность:</td>";
out1=out1+   "<td width=\"50%\"><input type=\"text\"  name= \"job\" id= \"job\"  value=\"-\" style=\"width: 100%;\"/></td>";
out1=out1+"<tr><td width=\"30%\">Фамилия:</td>";
out1=out1+   "<td width=\"50%\"><input type=\"text\"  name= \"fam\" id= \"fam\"  value=\""+LAST_NAME+"\" style=\"width: 100%;\"/></td>";
out1=out1+"<tr><td width=\"30%\">Имя:</td>";
out1=out1+   "<td width=\"50%\"><input type=\"text\"  name= \"imy\" id= \"imy\"  value=\""+FIRST_NAME+"\" style=\"width: 100%;\"/></td>";
out1=out1+"<tr><td width=\"30%\">Отчество:</td>";
out1=out1+   "<td width=\"50%\"><input type=\"text\"  name= \"otc\" id= \"otc\"  value=\""+MIDDLE_NAME+"\" style=\"width: 100%;\"/></td>";
out1=out1+"<tr><td width=\"30%\">Телефон:</td>";
out1=out1+   "<td width=\"50%\"><input type=\"text\"  name= \"tel\" id= \"tel\"  value=\"-\" style=\"width: 100%;\"/></td>";
out1=out1+"</tr><tr><td width=\"30%\">ip:</td>";
out1=out1+   "<td width=\"50%\"><input type=\"text\"  name= \"ip\" id= \"ip\"  value=\"-\" style=\"width: 100%;\"/></td>";
out1=out1+"</tr><tr><td width=\"30%\">e-mail:</td>";
out1=out1+   "<td width=\"50%\"><input type=\"text\"  name= \"mail\" id= \"mail\"  value=\"@serw.rzd\" style=\"width: 100%;\"/></td>";
out1=out1+"</tr> ";
 
out1=out1+"<tr>"+
     "<td width=\"30%\">№ заявки:</td>"+
     "<td width=\"50%\"><input type=\"text\"  name= \"num_z\" id= \"num_z\"  value=\"-\" style=\"width: 100%;\"/></td>"+
     "</tr> "; 



 if(session.getValue("id_role").equals("2")){
 out1=out1+"<tr> "+
     "<td width=\"30%\" style=\"color: RED\">Логин:</td> "+
     "<td width=\"50%\"><input type=\"text\"  name= \"user_log\" style=\"width: 100%;\"/></td> "+
 "</tr> "+
 "<tr> "+
     "<td width=\"30%\" style=\"color: RED\">Пароль:</td> "+
     "<td width=\"50%\"><input type=\"password\"  name= \"user_pas\" style=\"width: 100%;\"/></td> "+
 "</tr> ";
 }   
     
     
     
    
      
     SimpleDateFormat dateFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
     SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd.MM.yyyy");
     SimpleDateFormat dateFormatter3 = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
     Calendar DT_NOW=Calendar.getInstance(); 
     String DT=dateFormatter2.format(DT_NOW.getTime()).toString();    
     out1=out1+"<tr><DIV id=popCal style=\"BORDER-BOTTOM: 2px ridge; BORDER-LEFT: 2px ridge;" +
                    " BORDER-RIGHT: 2px ridge; BORDER-TOP: 2px ridge; POSITION: absolute; " +
                    "VISIBILITY: hidden; WIDTH: 10px\">"+
	            " <IFRAME"+
		        " frameBorder=0 height=240 name=popFrame scrolling=no"+
		        " src=\"common/calendar.htm\""+
		        " width=188>"+
	            " </IFRAME>"+
               "</DIV>"+
               "<td width=\"30%\">Дата начала действия заявки</td>" +
               "<td width=\"50%\">" +
               "<INPUT TYPE=\"TEXT\"  ID=\"dt_big_z\" NAME=\"dt_big_z\" readonly=true maxlength=\"10\"  " +
                       "size=\"40\" value=\""+DT+"\" title=\"Введите дату\">"+
               "<INPUT  onclick=\"popFrame.fPopCalendar(document.forms['senddata'].elements['dt_big_z']," +
               "document.forms['senddata'].elements['dt_big_z'],popCal,'dt_big_z');" +
               "return false\" type=button  id=button1 name=button1  value=V title=\"Выбор даты с испльзование календаря\" style=\"cursor:hand;\">"+ 
               "</td></tr>";
          
     out1=out1+" <script> " +
      "     document.senddata.dt_big_z.value=\""+DT+"\"; " +
       "   </script> </table>" ;    
      
      
if(session.getValue("id_role").equals("2")||session.getValue("id_role").equals("3")){                 

out1=out1+" <p><label>"+

" <input type = \"button\"   value=\"Запись в БД\"   onClick=\"getCustomerInfo('not','new');\"/> "+


" </label></p> ";
}
out1=out1+" </form> ";   
     
        
        
  /*    
 // поиск фамилии  
  Statement stmt5_fio = myconnection1.createStatement(); 
     ResultSet rs5_fio = stmt5_fio.executeQuery(
     " select ID, ID_ROAD_ASU_TR, TAB_NUM, ID_JOB, BLOCK_USER, PFR, "+ 
     " LAST_NAME, FIRST_NAME, MIDDLE_NAME, TEL, IP, E_MAIL, DT_BIG, "+
     " DT_END, PRIZ, ROAD, SN_JOB, R3_YES_OR_NIOT "+
     " from ASU_POL.MAIN_USER_ALL_1 where "+
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
"<input type='button' value='Вывести' onClick=\"getCustomerInfoPoisk_2('Poi_1');\" >"+

"<input type='button' value='Новый' onClick=\"getCustomerInfoPoisk_3('Poi_1');\" >"+

"</td>"+

"</tr>"+
"</table>"+
"</div>";   
 */
myconnection1.close();
    }catch (SQLException e) {}  
out.println( out1);
  }} %>