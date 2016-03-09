/*
 * vvod_list_write.java
 *
 */

package com;


import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class vvod_list_write extends HttpServlet {
    
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
        String out="";

       String par = req.getParameter("par1");
       
       String road = "";
      String stan = "";
      String usl = ""; 
      String system="";
      String role = "";
    //  String job = "";
      String id_user = "";
      
      String dt_big_z = "";
      String dt_end_z = "";
      //String ID_ZAYAV = "";
      //String ID_REG = "";
      String tel = "";
      String ip = "";
      String mail = "";
      
       out="<table border='1'>"+
       "<tr width=\"100%\"><td colspan='9'> Данные записанные в бд </td></tr>"
       ;
       
  if(!session.isNew()&&(session.getAttribute("id_role").equals("2")||session.getAttribute("id_role").equals("3"))){
      
   String[] stt=par.split("||");  
   out=out+"<table><tr>";
   for  (int g=0;g<stt.length; g++){
    String[] stt_1=stt[g].split("|");  
       for  (int g1=0;g1<stt_1.length; g1++){
     if(g==0){id_user=stt_1[0];}
    if(g==1){road=stt_1[1];}
    if(g==2){system=stt_1[2];}
    if(g==3){usl=stt_1[3];}
    if(g==4){role=stt_1[4];}
    if(g==5){tel=stt_1[5];}
    if(g==6){ip=stt_1[6];}
    if(g==7){mail=stt_1[7];}
    if(g==8){stan=stt_1[8];}
    if(g==9){system=stt_1[9];}
    out=out+"<td>--- "+stt_1[g]+"---</td>";   
       }
     out=out+"</tr></table>";
   }
         
       
  // ||32006330|12|22|23|143466|5-08-72|10.58.146.31|STishanskiy@serw.rzd|2010-03-30|2012-03-30|10603||     

 

  }          
      out=out+"</table>";
      out11.println(out); 
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