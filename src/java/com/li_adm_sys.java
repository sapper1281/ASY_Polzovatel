/*
 * li_adm_sys.java
 * Вывод админ систем
 * 
 */


package com;


import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;

import java.text.SimpleDateFormat;


public class li_adm_sys extends HttpServlet {
    
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
        "<td  NOWRAP colspan='4' >Инф. ресурс</td>"+
        "</tr>";              
                   

          
  
       
      Connection myconnection1=null;
 try {
        myconnection1 = new Connection_ASU_POL().getConnection();


      
       
     SimpleDateFormat dateFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
     SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd.MM.yyyy");
     SimpleDateFormat dateFormatter2_1 = new SimpleDateFormat("dd-MM-yyyy");
     SimpleDateFormat dateFormatter3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       
       
       
       String sys="";
      
      //поиск систем доступных админ
      
       sys=" select   " +
	   " a5.id, a5.id_system,a5.sn_system,a1.LAST_NAME,a1.FIRST_NAME,a1.MIDDLE_NAME,a1.TEL,a1.E_MAIL,a1.ROAD " +
	   " from ASU_POL.MAIN_USER_ALL a1 " +
           " left join ASU_POL.SOOTV_USER_SYS a3 on a1.ID=a3.ID_USER " +  
           " left join ASU_POL.POLYGON_ROLE a4 on a4.id_role=a3.id_role " +
	   " left join ASU_POL.POLYGON_SYSTEM a5 on a5.ID_SYSTEM=a3.ID_SYSTEM " +
	   " where a3.id_role=2 and a3.dt_end is null and a3.del=0 and a5.id_parrent<>0" +
	   " order by 1 ";
     
      
      
Statement stmt0 = myconnection1.createStatement(); 
ResultSet rs0 = stmt0.executeQuery(sys);
int sys_b=0;
int k=0;
while (rs0.next()){
    
    
    if(sys_b!=0&&rs0.getInt("id_system")!=sys_b){   out=out+"</table>"+
   "</div>   "+
   "</td>"+
   "</tr>";
  }
    
    if(rs0.getInt("id_system")!=sys_b){
    out=out+"<tr>"+
  " <td  NOWRAP colspan='4' ><input id=\"in1_"+rs0.getInt("id_system")+"\" type=\"button\" value='��������'" +
  " onClick=\"CHEKSYS1(this.form,'id1_"+rs0.getInt("id_system")+"','in1_"+rs0.getInt("id_system")+"')\" " +
  " >"+rs0.getString("sn_system").trim()+"</td></tr>";
    
    
    
   out=out+ 
   "<tr>"+
   "<td>"+
   "<div id=\"id1_"+rs0.getInt("id_system")+"\"  name=\"id1_"+rs0.getInt("id_system")+"\" style=\"display:none\" >"+
   "<table border=1>"+
   "<tr  bgcolor='#EEEEEE' >"+
     "<td NOWRAP >№</td>"+
     "<td NOWRAP >инф. система</td>"+
     "<td NOWRAP >ф.и.о.</td>"+
     "<td NOWRAP >Телефон</td>"+
     "<td NOWRAP >E-MAIL</td>"+
     "<td NOWRAP >СП</td>"+
    "</tr>";
   
    k=1;sys_b=rs0.getInt("id_system");
   }
   
       out=out+
  "<tr border=1>"+
  " <td NOWRAP>"+k+"</td>"+
  " <td NOWRAP >"+rs0.getString("SN_SYSTEM").trim()+"</td>"+
  " <td NOWRAP >"+rs0.getString("LAST_NAME").trim()+" "+
                  rs0.getString("FIRST_NAME").trim()+" "+
                  rs0.getString("MIDDLE_NAME").trim()+"</td>"+
  "<td NOWRAP>"+rs0.getString("TEL").trim()+"</td>"+
  "<td NOWRAP>"+rs0.getString("E_MAIL").trim()+"</td>"+
  "<td NOWRAP>"+rs0.getString("ROAD").trim()+"</td>"+
  "</tr>";
  k++;
    
    
    
 
    
    
    
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