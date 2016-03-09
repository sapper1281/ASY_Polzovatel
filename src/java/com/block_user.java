/*
 * block_user.java
 * подтверждение блокировки
 * 
 */

package com;



import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;

import java.text.SimpleDateFormat;


public class block_user extends HttpServlet {
    
   public void init(ServletConfig config) throws ServletException {
        super.init(config);
        
    } 
    
   
   private String out1;
    public void setOUT(String out1){
    this.out1=out1;}
   public String getOUT(){
   return out1;}
   
   
   
   
   
    
   public void processRequest(HttpServletRequest req, HttpServletResponse res)
         throws ServletException, IOException {
      
        req.setCharacterEncoding("UTF-8");
        String charset = "windows-1251";
        res.setContentType("text/html; charset=" + charset);  
        HttpSession session = req.getSession();
        String UserID = "db2admin";
        String Password = "11111111";
      //  String Password = "D2_12345678";
        String out="";
        out=out+ " <script type=\"text/javascript\"> "+
        
        " function CHEKSYS1(oForm, cbName, nn) "+
        " { "+
        "  if(document.getElementById(nn).value=='Показать'){ "+
        "  document.getElementById(nn).value='Скрыть';" +
        "} "+
        "  else{" +
        "document.getElementById(nn).value='Показать';" +
        "} "+
        " for (var i=0; i < document.getElementsByName(cbName).length; i++){ "+
        " if(document.getElementsByName(cbName)(i).style.display=='none') "+ 
        " { document.getElementsByName(cbName)(i).style.display='block'; " +
        " }  "+
        " else  "+
        " { document.getElementsByName(cbName)(i).style.display='none';" +
        " }  "+
        " }  "+
        " } "+   
    
        " </script> ";
      
        
         if(!session.isNew()){         
           
  // try {
       
        out=out+"<form  id=\"senddata\"  name=\"senddata\""+"method=\"post\"> "+
        "<table border=1>" ; 
        out=out+   "<tr>"+
        "<td  NOWRAP colspan='4' >Инф. сист.</td>"+
        "</tr>";              
                   

          
  
       
    //   try {
    //     Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
    //      }catch(Throwable theException) {theException.printStackTrace();}
    //   Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , UserID, Password);
      
    Connection myconnection1=null;
 try {
        myconnection1 = new Connection_ASU_POL().getConnection();
   
       
     SimpleDateFormat dateFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
     SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd.MM.yyyy");
     SimpleDateFormat dateFormatter2_1 = new SimpleDateFormat("dd-MM-yyyy");
     SimpleDateFormat dateFormatter3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       
       
       
       String sys="";
      
      //поиск систем доступных администратору
      if(session.getAttribute("id_role").equals("2")){
      sys=" select a1.id, a1.id_system,a1.sn_system "+
      " from ASU_POL.POLYGON_system a1  order by a1.sn_system";
      }else{
       sys=" select  "+
	   " a5.id, a5.id_system,a5.sn_system  "+
	   " from ASU_POL.MAIN_USER_ALL a1   "+
           " left join ASU_POL.SOOTV_USER_SYS a3 on a1.ID=a3.ID_USER   "+
           " left join ASU_POL.POLYGON_ROLE a4 on a4.id_role=a3.id_role  "+
	   " left join ASU_POL.POLYGON_SYSTEM a5 on a5.ID_SYSTEM=a3.ID_SYSTEM  "+
	   " where a3.id_system<>1 and a1.id="+session.getAttribute("id_us")+" and a3.id_role=2 and a3.del=0   ";
      } 
   
      
      
Statement stmt0 = myconnection1.createStatement(); 
ResultSet rs0 = stmt0.executeQuery(sys
  );
while (rs0.next()){
    out=out+"<tr>"+
  " <td  NOWRAP colspan='4' ><input id=\"in1_"+rs0.getInt("id_system")+"\" type=\"button\" value='��������'" +
  " onClick=\"CHEKSYS1(this.form,'id1_"+rs0.getInt("id_system")+"','in1_"+rs0.getInt("id_system")+"')\" " +
  " >"+
  rs0.getString("sn_system").trim()+"</td></tr>";
    
    
    
   out=out+ 
   "<tr>"+
   "<td>"+
   "<div id=\"id1_"+rs0.getInt("id_system")+"\"  name=\"id1_"+rs0.getInt("id_system")+"\" style=\"display:none\" >"+
   "<table>"+
   "<tr  bgcolor='#EEEEEE' >"+
     "<td NOWRAP bgcolor='#EEEEEE' > &nbsp </td>"+  
     "<td NOWRAP >№</td>"+
     "<td NOWRAP >id записи</td>"+
     "<td NOWRAP >инф. система</td>"+
     "<td NOWRAP >код</td>"+
     "<td NOWRAP >id пол.</td>"+
     "<td NOWRAP >ф.и.о.</td>"+
     "<td NOWRAP >Телефон</td>"+
     "<td NOWRAP >E-MAIL</td>"+
     "<td NOWRAP >IP</td>"+
     "<td NOWRAP >Дт. начала действия заявки</td>"+
     "<td NOWRAP >Дт. окончания действия заявки</td>"+
     "<td NOWRAP >Роль в инф. системе</td>"+
     "<td NOWRAP >Станция</td>"+
     "<td NOWRAP >id СП</td>"+
     "<td NOWRAP >Структурное подразделение</td>"+
     "<td NOWRAP >Должность</td>"+
     "<td NOWRAP >Блокировка</td>"+
     "<td NOWRAP >Дт. начала актуальности</td>"+
     "<td NOWRAP >Дт. окончания актуальности</td>"+
     "<td NOWRAP >Код услуги</td>"+
     "<td NOWRAP >Наименование услуги</td>"+
   "</tr>";
   
   
    String rol_us="";
    if(session.getAttribute("id_role").equals("2")){
       rol_us= " ";
    }else{
    rol_us= " and a1.ID_ROLE<>2 ";}
    
Statement stmt1 = myconnection1.createStatement(); 
ResultSet rs1 = stmt1.executeQuery(
"   select  a1.ID, a1.ID_USER,a1.DT_BIG_Z, a1.DT_END_Z,  "+
"   a2.ID_ROAD_ASU_TR,a2.TAB_NUM,a2.BLOCK_USER,a2.LAST_NAME,a2.FIRST_NAME,a2.MIDDLE_NAME,a2.TEL,a2.IP,a2.E_MAIL,a2.DT_BIG,a2.DT_END, "+ 
"   a3.CODE_SYSTEM,a3.SN_SYSTEM,  "+
"   a5.CODE_USL,a5.FN_USL,  "+
"   a6.FN_ROLE,  "+
"   a8.FN_STAN,   "+
"   a2.SN_JOB  "+
"   from   "+
"   (select  a2.ID, a2.ID_ROAD_ASU_TR,a2.TAB_NUM,a2.BLOCK_USER,a2.LAST_NAME,a2.FIRST_NAME,a2.MIDDLE_NAME,a2.TEL,a2.IP,a2.E_MAIL,a2.DT_BIG,a2.DT_END, "+  
"    a10.SN_JOB   "+
"   from ASU_POL.MAIN_USER_ALL_BLOCK as a2  "+
"   left join ASU_POL.SOOTV_JOB_ASUTR as a9 on a2.ID_JOB=a9.ID_JOB_ASU_TR  "+
"   left join ASU_POL.POLYGON_JOB as a10 on a9.ID_JOB=a10.ID ) as a2  "+
"   inner join ASU_POL.SOOTV_USER_SYS_BLOCK as a1  on a1.ID_USER=a2.ID and a1.del=3 " +
"   and a1.ID_system  ="+rs0.getInt("id_system")+" "+rol_us+" "+
"   left join ASU_POL.POLYGON_SYSTEM as a3 on a1.ID_SYSTEM=a3.ID_system   "+
"   left join ASU_POL.SOOTV_SYS_USL as a4 on a1.ID_SYSTEM=a4.ID_system  "+ 
"   left join ASU_POL.POLYGON_USL as a5 on a1.ID_USL=a5.ID_USL   "+
"   left join ASU_POL.POLYGON_ROLE as a6 on a1.ID_ROLE=a6.ID_ROLE  "+
" left join ASU_POL.POLYGON_STAN as a8 on a1.ID_STAN=a8.ID_STAN "+
"    order by a3.FN_SYSTEM,a2.LAST_NAME,a2.FIRST_NAME,a2.MIDDLE_NAME "

);
     int k=1;
     while (rs1.next()){
      
    boolean t_dor=true;
   int Id_str=rs1.getInt("ID_ROAD_ASU_TR");
   String Road_user = "";
   String System_user = "0";
   
    
   while(t_dor){
  
   Statement stmt_2_0 = myconnection1.createStatement(); 
ResultSet rs_2_0 = stmt_2_0.executeQuery(" select ID, CODE_ROAD_ASU_TR, ID_ROAD_ASU_TR, SN_ROAD, FN_ROAD, "+
    " MY_ID_ROAD_ASU_TR, MY_ID_ROAD, DT_BIG, DT_END, STATUS, TYPE "+
    " from ASU_POL.POLYGON_ROAD  "+
    " where ID_ROAD_ASU_TR="+Id_str+" "
   ); 
while(rs_2_0.next()){
if(rs_2_0.getFetchSize()!=0){
Road_user=rs_2_0.getString("FN_ROAD").trim()+", "+Road_user;
Id_str=rs_2_0.getInt("MY_ID_ROAD_ASU_TR");
}
}
t_dor=Id_str!=0;
//t_dor=false;
stmt_2_0.close();
rs_2_0.close();
   }         
      
      
      
    
      
    out=out+
    
  "<tr id=\"tr"+k+"_"+rs1.getString("CODE_SYSTEM").trim()+"\" style=\"color: RED\">"+
  " <td NOWRAP  bgcolor='#EEEEEE' >" +
  "<table><tr ><td>" +
  "<input type=\"checkbox\" name=\""+k+"_"+rs1.getString("CODE_SYSTEM").trim()+"\" id=\""+k+"_"+rs1.getString("CODE_SYSTEM").trim()+"\" value=\"checkbox\" " +
  " onClick=\"getButton_blok(this.form," +
 // "'"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_tel"+"'," +
 // "'"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_E_MAIL"+"'," +
 // "'"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_IP"+"'," +
 // "'d_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_DT_BIG_Z"+"'," +
//  "'d_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_DT_END_Z"+"'," +
//  "'"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_FN_ROLE"+"'," +
//  "'"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_FN_STAN"+"'," +
//  "'"+k+"_button_save"+rs1.getString("CODE_SYSTEM").trim()+"', " +
 // "'chek"+k+"_"+rs1.getString("CODE_SYSTEM").trim()+"', " +
  "'"+k+"_button_blok"+rs1.getString("CODE_SYSTEM").trim()+"', " +
  "'"+k+"_"+rs1.getString("CODE_SYSTEM").trim()+"' " +
  ");\""+
  
  "> </td><td>" +
  "</td><td>" +
  
  "<input  type=\"button\" name=\""+k+"_button_blok"+rs1.getString("CODE_SYSTEM").trim()+"\" id=\""+k+"_button_save"+rs1.getString("CODE_SYSTEM").trim()+"\" style=\"display:none\" " +
  " onClick=\"getBlock(this.form," +
  "'"+k+"_button_blok"+rs1.getString("CODE_SYSTEM").trim()+"', " +
  "'tr"+k+"_"+rs1.getString("CODE_SYSTEM").trim()+"', "+
  "'"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_ID"+"', "+ 
  "'"+k+"_"+rs1.getString("CODE_SYSTEM").trim()+"' " +
  //" '"+k+"_button_save"+rs1.getString("CODE_SYSTEM").trim()+"', "+
 // " '"+k+"_button_del"+rs1.getString("CODE_SYSTEM").trim()+"',"+
 // " '"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_ID"+"', " +
 // " '"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_user"+"', " +
  //"'"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_tel"+"'," +
  //"'"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_E_MAIL"+"'," +
 // "'"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_IP"+"'," +
 // "'d_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_DT_BIG_Z"+"'," +
  //"'d_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_DT_END_Z"+"'," +
  //"'"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_FN_ROLE"+"'," +
 // "'"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_FN_STAN"+"'," +
 // " '"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_ID_ROAD_ASU_TR"+"', "+
 // "'in"+rs1.getInt("ID_USER")+"_tel"+"'," +
 // "'in"+rs1.getInt("ID_USER")+"_E_MAIL"+"'," +
 // "'in"+rs1.getInt("ID_USER")+"_IP"+"'," +
 // "'in"+rs1.getInt("ID_USER")+"_FN_STAN"+"'," +
 // "'"+k+"_"+rs1.getString("CODE_SYSTEM").trim()+"' " +
  " );\""+
  " value='Блокировать' >"+
  /*
  "</td><td><input  type=\"button\" name=\""+k+"_button_del"+rs1.getString("CODE_SYSTEM").trim()+"\" id=\""+k+"_button_del"+rs1.getString("CODE_SYSTEM").trim()+"\" style=\"display:none\" " +
  " onClick=\"getDelet(this.form," +
  " '"+k+"_button_save"+rs1.getString("CODE_SYSTEM").trim()+"', "+
  " '"+k+"_button_del"+rs1.getString("CODE_SYSTEM").trim()+"',"+
  " '"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_ID"+"', " +
  " '"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_user"+"', " +
  "'"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_tel"+"'," +
  "'"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_E_MAIL"+"'," +
  "'"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_IP"+"'," +
  "'d_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_DT_BIG_Z"+"'," +
  "'d_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_DT_END_Z"+"'," +
  "'"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_FN_ROLE"+"'," +
  "'"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_FN_STAN"+"'," +
  "'"+k+"_"+rs1.getString("CODE_SYSTEM").trim()+"' " +
  " );\"\"   value='�������' >"+
  
  */
  "</td></tr></table>" +
  "</td>"+
  " <td NOWRAP " +
 // "id=\"chek"+k+"_"+rs1.getString("CODE_SYSTEM").trim()+"\"
  " >"+k+"</td>"+
  " <td NOWRAP " +
  " id=\""+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_ID"+"\" "+
//  " name=\""+rs1.getInt("ID_USER")+"_ID"+"\" " +
  " >"+rs1.getString("ID").trim()+"</td>"+
  
  
  " <td NOWRAP >"+rs1.getString("SN_SYSTEM").trim()+"</td>"+
  " <td NOWRAP   >"+rs1.getString("CODE_SYSTEM").trim()+"</td>"+
  " <td NOWRAP" +
  
  //" id=\""+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_user"+"\" "+
 // " name=\""+rs1.getInt("ID_USER")+"_user"+"\" " +
  
  " >"+rs1.getInt("ID_USER")+"</td>"+
  " <td NOWRAP >"+rs1.getString("LAST_NAME").trim()+" "+
                  rs1.getString("FIRST_NAME").trim()+" "+
                  rs1.getString("MIDDLE_NAME").trim()+"</td>"+
  "<td NOWRAP" +
  ">"+                
 // "<div  " +
 // " id=\""+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_tel"+"\" "+
 // " name=\"in"+rs1.getInt("ID_USER")+"_tel"+"\" " +
 // " >"+
  rs1.getString("TEL").trim()+" " +
 // "</div>"+
  "</td>"+
  "<td NOWRAP" +
  ">"+                
 // "<div  " +
  //" id=\""+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_E_MAIL"+"\" "+
 // " name=\"in"+rs1.getInt("ID_USER")+"_E_MAIL"+"\" " +
  //" >"+
  rs1.getString("E_MAIL").trim()+" " +
  //"</div>"+
  "</td>"+
  "<td NOWRAP" +
  ">"+                
  //"<div  " +
 // " id=\""+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_IP"+"\" "+
 // " name=\"in"+rs1.getInt("ID_USER")+"_IP"+"\" " +
 // " >"+
  rs1.getString("IP").trim()+" " +
 // "</div>"+
  "</td>"+
  "<td NOWRAP" +
 // " id=\"d_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_DT_BIG_Z"+"\" "+
 // " name=\"d_"+rs1.getInt("ID_USER")+"_DT_BIG_Z"+"\" " +
  " >"+(dateFormatter2.format(rs1.getDate("DT_BIG_Z")).toString())+" " +
  "</td>"+
  "<td NOWRAP" +
 // " id=\"d_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_DT_END_Z"+"\" "+
 // " name=\"d_"+rs1.getInt("ID_USER")+"_DT_END_Z"+"\" " +
  " >"+(dateFormatter2.format(rs1.getDate("DT_END_Z")).toString())+" " +
  "</td>"+
  "<td NOWRAP" +
 // " id=\""+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_FN_ROLE"+"\" "+
 // " name=\""+rs1.getInt("ID_USER")+"_FN_ROLE"+"\" " +
  " >"
 +rs1.getString("FN_ROLE").trim()+" " +
  "</td>"+
  "<td NOWRAP" +
  ">"+                
 // "<div  " +
 // " id=\""+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_FN_STAN"+"\" "+
 // " name=\"in"+rs1.getInt("ID_USER")+"_FN_STAN"+"\" " +
 // " >"+
  rs1.getString("FN_STAN").trim()+" " +
 // "</div>"+
  "</td>"+
  
  "<td NOWRAP" +
 //  " id=\""+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_ID_ROAD_ASU_TR"+"\" "+
 // " name=\""+rs1.getInt("ID_USER")+"_ID_ROAD_ASU_TR"+"\" " +
  " >"+rs1.getString("ID_ROAD_ASU_TR").trim()+" " +
  "</td>"+
  
 
  "<td NOWRAP  >"+Road_user.trim()+"</td>"+
  "<td NOWRAP >"+rs1.getString("SN_JOB")+"</td>"+
  
  "<td NOWRAP >"+rs1.getInt("BLOCK_USER")+"</td>"+
  
  "<td NOWRAP >"+rs1.getDate("DT_BIG")+"</td>"+
  "<td NOWRAP >"+rs1.getDate("DT_END")+"</td>"+
  "<td NOWRAP >"+rs1.getString("CODE_USL").trim()+"</td>"+
  "<td NOWRAP >"+rs1.getString("FN_USL").trim()+"</td>"+
  
  
   "</tr>"
  
  
  
  ;
   k=k+1;   
      
      
      
  }
    
rs1.close();
stmt1.close();    
    
    
    
    
    
    
    out=out+"</table>"+
   "</div>   "+
   "</td>"+
   "</tr>";
    
    
    
  }
rs0.close();
stmt0.close();    
    

   




  out=out+"</table>"+
  "</form>" ;  
      
       
      
     
      
      
      
      myconnection1.commit();
            } catch (Exception e) {
            e.printStackTrace();
            } finally {
            // Обязательно закрываем соединение с БД!
            new Connection_ASU_POL().closeConnection(myconnection1);
            }
      
      }
       
      
      setOUT(out);     
      
      
      
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