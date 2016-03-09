/*
 * Vvod_Pol_One_Info.java
 *
 */


package com;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import java.text.SimpleDateFormat;


public class Vvod_Pol_One_Info extends HttpServlet {
    
   public void init(ServletConfig config) throws ServletException {
        super.init(config);
        
    } 
    
   
   private String out1;
    public void setOUT(String out1){
    this.out1=out1;
}
 public String getOUT(){
 return out1;
 }
   
   
   
   
   
    
   public void processRequest(HttpServletRequest req, HttpServletResponse res)
         throws ServletException, IOException {
      
        req.setCharacterEncoding("UTF-8");
        String charset = "windows-1251";
        res.setContentType("text/html; charset=" + charset);  
        HttpSession session = req.getSession();
        PrintWriter out11 = res.getWriter();    
      
      String road = req.getParameter("road");
      String job = req.getParameter("job");
      String id= req.getParameter("id");
      String  pr_r3= req.getParameter("pr_r3");
      
       String UserID = "db2admin";
       String Password = "11111111";
       String out="";
      
      if((!session.isNew())&&(session.getAttribute("FIRST_NAME")!=null)){
              
   Connection myconnection1=null;
      try {
        myconnection1 = new Connection_ASU_POL().getConnection();




       out=out+" <form    name=\"senddata\""+/* action=\"/ASY_Polzovatel/welcome3\" */"method=\"post\"> "+
       
      "<table >" +
      "<tr><td><H4>Подключенные системы</H4></td></tr>"+
      "<tr><td colspan='2'>";
      
     
     Statement stmt_podk = myconnection1.createStatement(); 
     ResultSet rs_podk = stmt_podk.executeQuery( 
      "  select  "+
	   " a3.id_user, a5.id_system,a5.sn_system,a6.FN_ROLE  "+
           " from  ASU_POL.SOOTV_USER_SYS as a3" +
           " left join ASU_POL.POLYGON_SYSTEM a5 on a5.ID_SYSTEM=a3.ID_SYSTEM  "+
           " left join ASU_POL.POLYGON_ROLE a6 on a3.ID_ROLE=a6.ID_ROLE "+
	   " where  a3.id_user="+id+"  and  a3.del=0 order by 3");
      
    out=out+"<div style=\"OVERFLOW: auto; WIDTH: 500px; HEIGHT: 150px\">" +
"<table border=\"1\">";

           out=out+" <tr style='position: relative; " +
" top: expression(this.parentElement.parentElement.parentElement.scrollTop)' bgcolor='#B2B2B2'> " +
           "<td>Id системы</td><td>Система</td><td>Роль</td></tr>";
     
           while(rs_podk.next()){
           out=out+"<tr>" +
           "<td>"+
           rs_podk.getInt("id_system")+"</td><td>"+
           rs_podk.getString("sn_system").trim()+"</td><td>"+
           rs_podk.getString("FN_ROLE").trim()+
           "</td></tr>";
           };
      rs_podk.close();
      stmt_podk.close();
   out=out+   "</table>"+
"</div>"+   
 "</td></tr>"+
 "<tr><td colspan='2'><HR></td></tr>"+    
 "<tr><td ><H4>Введите данные</H4></td></tr>";

   
   
      
 
      
    String Road_user = "";  
    Statement stmt_2_0 = myconnection1.createStatement(); 
    ResultSet rs_2_0 = stmt_2_0.executeQuery(
    " select ROAD "+
    " from ASU_POL.MAIN_USER_ALL where id="+id+" ");
    while(rs_2_0.next()){
    Road_user=rs_2_0.getString("ROAD").trim();}
    out=out+  "<tr>"+
    "<td width=\"30%\">Структурное подразделение:</td>"+
    "<td name=\"road\" id=\"road\" width=\"50%\" value=\""+road+"\">"+Road_user+"</td></tr>";
      
   
       
 
    out=out+  "<tr>"+
      "<td width=\"30%\">Станция:</td>"+
      "<td  width=\"50%\">"+
      "<select  name=\"stan\" id=\"stan\" style=\"width: 100%;\">"; 
    Statement stmt4_1 = myconnection1.createStatement(); 
   ResultSet rs4_1 = stmt4_1.executeQuery(" select ID, ID_USER, ID_STAN, DT_BIG, DT_END "+
  " from ASU_POL.SOOTV_USER_STAN "+
  " where ID_USER="+id+" "+
  " order by ID "
  );
   if (rs4_1.next()){   
   Statement stmt4 = myconnection1.createStatement(); 
ResultSet rs4 = stmt4.executeQuery(" select a1.id, a1.id_stan,a1.sn_stan "+
  " from ASU_POL.POLYGON_STAN a1 " +
  " where a1.id_stan="+rs4_1.getInt("ID_STAN")+" "+
  " order by a1.sn_stan"
  );
   while (rs4.next()){
    out=out+"<option value=\""+rs4.getInt("id_stan")+"\">"+rs4.getString("sn_stan")+" </option>";}   
   rs4.close();
   stmt4.close();  
}
     else{
     
      Statement stmt4 = myconnection1.createStatement(); 
ResultSet rs4 = stmt4.executeQuery(" select a1.id, a1.id_stan,a1.sn_stan "+
  " from ASU_POL.POLYGON_STAN a1 order by a1.sn_stan"
  );
while (rs4.next()){
    out=out+"<option value=\""+rs4.getInt("id_stan")+"\">"+rs4.getString("sn_stan")+" </option>";}
     rs4.close();
stmt4.close(); 
     }
         out=out+"</select>"+
      "</td>"+
      "</tr>";  
      rs4_1.close();
stmt4_1.close(); 
      
      
    





      
      
      
      out=out+"<tr>"+
      "<td width=\"30%\">Информационный ресурс:</td>"+
      "<td  width=\"50%\">";
      out=out+"<select name=\"system\" id=\"system\"  style=\"width: 100%;\">";
      String sys="";
      if(session.getAttribute("id_role").equals("2")){
      sys=" select a1.id, a1.id_system,a1.sn_system "+
      " from ASU_POL.POLYGON_system a1  order by a1.sn_system";
      }else{
      sys="  select  "+
	   " a5.id, a5.id_system,a5.sn_system  "+
	   " from ASU_POL.MAIN_USER_ALL a1   "+
           " left join ASU_POL.SOOTV_USER_SYS a3 on a1.ID=a3.ID_USER   "+
           " left join ASU_POL.POLYGON_ROLE a4 on a4.id_role=a3.id_role  "+
	   " left join ASU_POL.POLYGON_SYSTEM a5 on a5.ID_SYSTEM=a3.ID_SYSTEM  "+
	   " where a3.id_system<>1 and a1.id="+session.getAttribute("id_us")+" and a3.id_role=2 and  a3.del=0 ";
        }
      Statement stmt7 = myconnection1.createStatement(); 
ResultSet rs7 = stmt7.executeQuery(sys);
int id_system_1=-1;
 while (rs7.next()){
      if(id_system_1==-1){
    id_system_1=rs7.getInt("id_system");}
    out=out+"<option value=\""+rs7.getInt("id_system")+"\">"+rs7.getString("sn_system")+" </option>";
  }
      out=out+"</select>"+
      "</td>"+
      "</tr>";   
      
     
     
   
      
      out=out+  "<tr>"+
      "<td width=\"30%\">Роль:</td>"+
      "<td  width=\"50%\">"+
      "<select  name=\"role\" id=\"role\" style=\"width: 100%;\">";
      String rol="";
      if(session.getAttribute("id_role").equals("2")){
      rol= " select a1.id, a1.id_role,a1.fn_role "+
      " from ASU_POL.POLYGON_ROLE a1 where a1.my_role=0 ";
      }else{
      rol= " select a1.id, a1.id_role,a1.fn_role "+
      " from ASU_POL.POLYGON_ROLE a1 where a1.my_role=0 and a1.id_role<>2 ";}
      Statement stmt9 = myconnection1.createStatement(); 
      ResultSet rs9 = stmt9.executeQuery(rol
  );
  while (rs9.next()){
    out=out+"<option value=\""+rs9.getInt("id_role")+"\">"+rs9.getString("fn_role")+" </option>";
  }
      out=out+"</select>"+
      "</td>"+
      "</tr>"+   
      
      
      
      
      
       "<tr>"+
      "<td width=\"30%\">Должность:</td>"+
      "<td name=\"job\" id=\"job\" width=\"50%\" ";
        
      Statement stmt10 = myconnection1.createStatement(); 
ResultSet rs10 = stmt10.executeQuery(
" select SN_JOB "+
  " from ASU_POL.MAIN_USER_ALL where id="+id+" "
);
  while (rs10.next()){
  out=out+" value=\""+job+"\">"+rs10.getString("sn_job")+" ";
  } 
      out=out+
      "</td>"+
      "</tr>";  
      
     
      
      
      
     Statement stmt11 = myconnection1.createStatement(); 
ResultSet rs11 = stmt11.executeQuery(" select ID, ID_ROAD_ASU_TR, TAB_NUM, ID_JOB, BLOCK_USER, PFR, "+ 
    " LAST_NAME, FIRST_NAME, MIDDLE_NAME, TEL, IP, E_MAIL, DT_BIG, DT_END "+ 
  " from ASU_POL.MAIN_USER_ALL where id="+id+" and  BLOCK_USER<>1  "+ 
  " order by ID " ); 

while(rs11.next()){
  out=out+"<tr>"+
     "<input type=hidden name=\"id_user\" value=\""+id+"\">"+

     "<td width=\"30%\">Фамилия:</td>"+
     "<td width=\"50%\" >"+ rs11.getString("LAST_NAME").trim() +"</td>"+
 "</tr> "+
      "<tr>"+
     "<td width=\"30%\">Имя:</td>"+
     "<td width=\"50%\">"+ rs11.getString("FIRST_NAME").trim() +"</td>"+
 "</tr> "+
 "<tr>"+
     "<td width=\"30%\">Отчество:</td>"+
     "<td width=\"50%\">"+ rs11.getString("MIDDLE_NAME").trim() +"</td>"+
 "</tr> ";
     
  
     
     
     
     
     
 out=out+"<tr>"+
     "<td width=\"30%\">Телефон</td>";
 if(rs11.getString("TEL")!=null){
 out=out+
     "<td width=\"50%\"><input type=\"text\"  name= \"tel\" id= \"tel\"  value=\""+ rs11.getString("TEL").trim() +"\" style=\"width: 100%;\"/></td>";
 }else
 {out=out+   "<td width=\"50%\"><input type=\"text\"  name= \"tel\" id= \"tel\"  value=\"-\" style=\"width: 100%;\"/></td>";
 }
 
 out=out+"</tr> "+
 "<tr>"+
     "<td width=\"30%\">ip</td>";
  if(rs11.getString("IP")!=null){
 out=out+   "<td width=\"50%\"><input type=\"text\"  name= \"ip\" id= \"ip\"  value=\""+ rs11.getString("IP").trim() +"\" style=\"width: 100%;\"/></td>";
 }else
 {out=out+   "<td width=\"50%\"><input type=\"text\"  name= \"ip\" id= \"ip\"  value=\"-\" style=\"width: 100%;\"/></td>";
 }

 
 
 out=out+"</tr> "+
 "<tr>"+
     "<td width=\"30%\">e-mail</td>";
 if(rs11.getString("E_MAIL")!=null){
  out=out+   "<td width=\"50%\"><input type=\"text\"  name= \"mail\" id= \"mail\"  value=\""+ rs11.getString("E_MAIL").trim() +"\" style=\"width: 100%;\"/></td>";
 }else
 {out=out+   "<td width=\"50%\"><input type=\"text\"  name= \"mail\" id= \"mail\"  value=\"@serw.rzd\" style=\"width: 100%;\"/></td>";
}
  out=out+"</tr> ";
 
  }
 
out=out+"<tr>"+
     "<td width=\"30%\">№ заявки:</td>"+
     "<td width=\"50%\"><input type=\"text\"  name= \"num_z\" id= \"num_z\"  value=\"-\" style=\"width: 100%;\"/></td>"+
     "</tr> "; 



 if(session.getAttribute("id_role").equals("2")){
 out=out+"<tr> "+
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
     out=out+"<tr><DIV id=popCal style=\"BORDER-BOTTOM: 2px ridge; BORDER-LEFT: 2px ridge;" +
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
               "return false\" type=button  id=button1 name=button1  value=V title=\"Выбор даты с использованием календаря\" style=\"cursor:hand;\">"+
               "</td></tr>";
          
     out=out+" <script> " +
      "     document.senddata.dt_big_z.value=\""+DT+"\"; " +
       "   </script> </table>" ;    
      
      
if(session.getValue("id_role").equals("2")||session.getValue("id_role").equals("3")){                 

out=out+" <p><label>"+

" <input type = \"button\"   value=\"Запись в БД\"   onClick=\"getCustomerInfo('"+pr_r3+"','old');\"/> "+


" </label></p> ";
}
out=out+" </form> ";
      
  

rs7.close();
stmt7.close();  
rs9.close();
stmt9.close();  
rs10.close();
stmt10.close(); 
 rs11.close();
  stmt11.close(); 
   
   
   
   
 myconnection1.commit();
            } catch (Exception e) {
            e.printStackTrace();
            } finally {
            // Обязательно закрываем соединение с БД!
            new Connection_ASU_POL().closeConnection(myconnection1);
            }

      }  
     out11.println(out);     
      
      out11.close();
      
   }
   Object lock = new Object(); 
   
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         synchronized(lock)
       {processRequest(request, response);}
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         synchronized(lock)
       {processRequest(request, response);}
    }
    
   
   public String getServletInfo() {
      return "A session tracking servlet";
   }
} 