/*
 * import_asuzir.java
 * заявки из асу зир
 * 
 */

package com;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.SimpleDateFormat;


public class import_asuzir extends HttpServlet {
    
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
       // PrintWriter out_wr = res.getWriter();
        String charset = "windows-1251";
        res.setContentType("text/html; charset=" + charset);  
        HttpSession session = req.getSession();
        String UserID = "db2admin";
        String Password = "D2_12345678";
        int kol_vse=0;
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
           

       
        out=out+"<form  id=\"senddata\"  name=\"senddata\""+"method=\"post\"> "+
        "<table border=1>" ; 
        out=out+   "<tr bgcolor='#EEEEEE'>"+
         "<td NOWRAP >инф. система</td>"+
         "<td NOWRAP >№ заявки АСУ ЗИР</td>"+
         "<td NOWRAP >ф.и.о.</td>"+
         "<td NOWRAP >Дт. начала действия заявки</td>"+
         "<td NOWRAP >Дт. окончания действия заявки</td>"+
                 
         "</tr>";              
       
      Connection myconnection1=null;
 try {
        myconnection1 = new Connection_ASU_POL().getConnection();
 
       
     SimpleDateFormat dateFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
     SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd.MM.yyyy");
     SimpleDateFormat dateFormatter2_1 = new SimpleDateFormat("dd-MM-yyyy");
     SimpleDateFormat dateFormatter3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       
       
       
       String vvod  =
  /*" select a1.ID_ZAYAV, a1.ID_REG, a1.ID_USER, a1.START_DATE, a1.END_DATE, a1.OP_STATION, a1.LN_USER, "+
  " a1.FN_USER, a1.SN_USER, a1.TEL_USER, a1.MAIL_USER, a1.T_NO, a1.ORGTX, a1.ID_RES "+
  " from ASU_POL.ASU_ZIR_DOB a1 "+
  " order by ID_USER,ID_REG,LN_USER,FN_USER,SN_USER,ID_ZAYAV, "+
  " ID_RES; ";*/
     
     
  " select a1.ID_ZAYAV, a1.ID_REG, a1.ID_USER, a1.START_DATE, a1.END_DATE, a1.OP_STATION, a1.LN_USER, "+
  " a1.FN_USER, a1.SN_USER, a1.TEL_USER, a1.MAIL_USER, a1.T_NO, a1.ORGTX, a1.ID_RES,  "+
  " a3_1.SN_SYSTEM "+
  
  " from ASU_POL.ASU_ZIR_DOB a1 "+
  " left join ASU_POL.POLYGON_SYSTEM as a3_1 on a3_1.ID_SYSTEM=a1.ID_RES " +
  " order by a3_1.SN_SYSTEM, a1.LN_USER,a1.FN_USER,a1.SN_USER ";
     
     
       
      
Statement stmt0 = myconnection1.createStatement(); 
ResultSet rs0 = stmt0.executeQuery(vvod);
int sys_b=0;
int k=0;

 

while (rs0.next()){
    
  
   
       out=out+
  "<tr border=1>"+
  " <td NOWRAP >"+rs0.getString("SN_SYSTEM").trim()+"</td>"+
  "<td NOWRAP>"+rs0.getString("ID_REG").trim()+"</td>"+
  "<td NOWRAP>"+rs0.getString("LN_USER").trim()+" "+rs0.getString("FN_USER").trim()+" "+rs0.getString("SN_USER").trim()+"</td>"+
  "<td NOWRAP>"+rs0.getString("START_DATE").trim()+"</td>"+
  "<td NOWRAP>"+rs0.getString("END_DATE").trim()+"</td>"+
  
  "</tr>";
  kol_vse++;
    
    
    
 
    
    
    
  }
rs0.close();
stmt0.close();    
    

   

out=out+
 "<tr border=1>"+
  " <td NOWRAP >Итог</td>"+
  "<td NOWRAP>"+kol_vse+"</td>"+
  
  "</tr>";

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
       
      //out_wr.println(out);
      
      
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