/*
 * NewServlet11.java
 * появление редактируемых полей
 * 
 */

package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
 
public class NewServlet11 extends HttpServlet {
    
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
         String id_system_1 = req.getParameter("system_sel_0");
        // String Oper_Type = req.getParameter("Oper_Type");
         String Oper_Tel = req.getParameter("Oper_Tel");
         String id_Tel = req.getParameter("id_Tel");
         String Oper_E_MAIL = req.getParameter("Oper_E_MAIL");
         String id_E_MAIL = req.getParameter("id_E_MAIL");
         String Oper_IP = req.getParameter("Oper_IP");
         String id_IP = req.getParameter("id_IP");
         String Oper_DT_BIG_Z = req.getParameter("Oper_DT_BIG_Z");
         String id_DT_BIG_Z = req.getParameter("id_DT_BIG_Z");
        // String Oper_DT_END_Z = req.getParameter("Oper_DT_END_Z");
         String id_DT_END_Z = req.getParameter("id_DT_END_Z");
         String Oper_FN_ROLE = req.getParameter("Oper_FN_ROLE");
         String id_FN_ROLE = req.getParameter("id_FN_ROLE");
         String Oper_FN_STAN = req.getParameter("Oper_FN_STAN");
         String id_FN_STAN = req.getParameter("id_FN_STAN");
         
          // Oper_tel
        String out="";
        String UserID = "db2admin";
       String Password = "11111111";
       if(!session.isNew()){    
     //   String id_system_1 = req.getParameter("system_sel_0");
   out=out+//"<table><tr>" +
  // "<td>" +
   "<input type=\"text\" id=\""+id_Tel+"\" name=\""+id_Tel+"\" value=\""+Oper_Tel+"\"  >" +
  // "</td>" +
   "|"+
   //"<td>" +
   "<input type=\"text\" id=\""+id_E_MAIL+"\" name=\""+id_E_MAIL+"\" value=\""+Oper_E_MAIL+"\"  >" +
   //"</td>" +
   "|"+
   "<input type=\"text\" id==\""+id_IP+"\" name=\""+id_IP+"\" value=\""+Oper_IP+"\"  >" +
   //"</td>" +
   "|"+
   "<tr><DIV id=popCal"+id_DT_BIG_Z+" style=\"BORDER-BOTTOM: 2px ridge; BORDER-LEFT: 2px ridge;" +
                    " BORDER-RIGHT: 2px ridge; BORDER-TOP: 2px ridge; POSITION: absolute; " +
                    "VISIBILITY: hidden; WIDTH: 10px\">"+
	            " <IFRAME"+
		        " frameBorder=0 height=240 name=popFrame"+id_DT_BIG_Z+" scrolling=no"+
		        " src=\"common/calendar.htm\""+
		        " width=188>"+
	            " </IFRAME>"+
               "</DIV>"+
              // "<td width=\"30%\">���� ������ �������� ������</td>" +
               "<td width=\"30%\">" +
               "<INPUT TYPE=\"TEXT\"  ID=\""+id_DT_BIG_Z+"\" NAME=\""+id_DT_BIG_Z+"\" readonly=true maxlength=\"10\"  " +
                       "size=\"30\" value=\""+Oper_DT_BIG_Z+"\" title=\"������� ����\">"+
               "<INPUT  onclick=\"popFrame"+id_DT_BIG_Z+".fPopCalendar(document.forms['senddata'].elements['"+id_DT_BIG_Z+"']," +
               "document.forms['senddata'].elements['"+id_DT_BIG_Z+"'],popCal"+id_DT_BIG_Z+",'"+id_DT_BIG_Z+"');" +
               "return false\" type=button  id=button1 name=button1  value=V title=\"����� ���� � ������������ ���������\" style=\"cursor:hand;\">"+ 
               "</td></tr>"+
               
    "|"/*+
   
   
 
   
   "<tr><DIV id=popCal1"+id_DT_END_Z+" style=\"BORDER-BOTTOM: 2px ridge; BORDER-LEFT: 2px ridge;" +
                    " BORDER-RIGHT: 2px ridge; BORDER-TOP: 2px ridge; POSITION: absolute; " +
                    "VISIBILITY: hidden; WIDTH: 10px\">"+
	            " <IFRAME"+
		        " frameBorder=0 height=188 name=popFrame1"+id_DT_END_Z+" scrolling=no"+
		        " src=\"common/calendar.htm\""+
		        " width=183>"+
	            " </IFRAME>"+
               "</DIV>"+
             //  "<td width=\"30%\">���� ��������� �������� ������</td>" +
               "<td width=\"30%\">" +
               "<INPUT TYPE=\"TEXT\"  ID=\""+id_DT_END_Z+"\" NAME=\""+id_DT_END_Z+"\" readonly=true maxlength=\"10\"  " +
                       "size=\"30\" value=\""+Oper_DT_END_Z+"\" title=\"������� ����\">"+
               "<INPUT  onclick=\"popFrame1"+id_DT_END_Z+".fPopCalendar(document.forms['senddata'].elements['"+id_DT_END_Z+"']," +
               "document.forms['senddata'].elements['"+id_DT_END_Z+"'],popCal1"+id_DT_END_Z+",'"+id_DT_END_Z+"');" +
               "return false\" type=button  id=button1 name=button1  value=V title=\"����� ���� � ������������ ���������\" style=\"cursor:hand;\">"+ 
               "</td></tr>"+
       "|" */;       
               
         
    Connection myconnection1=null;
      try {
        myconnection1 = new Connection_ASU_POL().getConnection();
    // out=out+" <script type=\"text/javascript\">"+
    //     " getd(role_1) "+
    //      " {alert(document.getElementById(role_1).value);}"+
    //      " </script>";
         
      out=out+  
      "<select  id=\""+id_FN_ROLE+"\" name=\""+id_FN_ROLE+"\"  " +
      //"onChange=\"getd('role');\" " +
      " style=\"width: 100%;\">";
       
      
      String rol="";
      
      if(session.getValue("id_role").equals("2")){         
      rol= " select a1.id, a1.id_role,a1.fn_role "+
  " from ASU_POL.POLYGON_ROLE a1 where a1.my_role=0 ";
      }else{
      
  rol= " select a1.id, a1.id_role,a1.fn_role "+
  " from ASU_POL.POLYGON_ROLE a1 where a1.my_role=0 and a1.id_role<>2 ";}
      
   
      Statement stmt9 = myconnection1.createStatement(); 
ResultSet rs9 = stmt9.executeQuery(rol
  );
  while (rs9.next()){
       if(!Oper_FN_ROLE.trim().equals(rs9.getString("fn_role").trim())){
          
    out=out+"<option value=\""+rs9.getInt("id_role")+"\">"+rs9.getString("fn_role")+" </option>";}
       else{
    out=out+"<option value=\""+rs9.getInt("id_role")+"\" selected>"+rs9.getString("fn_role")+" </option>";}
  }
   rs9.close();
stmt9.close(); 
      out=out+"</select>"+
      "|" ;  
      
       
       
       
       
       
       
       
       
       
       
       
       
       
       out=out+"<select  id=\""+id_FN_STAN+"\" name=\""+id_FN_STAN+"\" width=183>"; 
  
       
      Statement stmt4 = myconnection1.createStatement(); 
ResultSet rs4 = stmt4.executeQuery(" select a1.id, a1.id_stan,a1.sn_stan "+
  " from ASU_POL.POLYGON_STAN a1 order by a1.sn_stan"
  );

  while (rs4.next()){
    
    //out=out+"<option value=\""+rs4.getInt("id_stan")+"\">"+rs4.getString("sn_stan")+" </option>";
    
    if(!Oper_FN_STAN.trim().equals(rs4.getString("sn_stan").trim())){
    out=out+"<option value=\""+rs4.getInt("id_stan")+"\">"+rs4.getString("sn_stan")+" </option>";
    }
       else{
   out=out+"<option value=\""+rs4.getInt("id_stan")+"\" selected>"+rs4.getString("sn_stan")+" </option>";
    }
    
    
  }
     rs4.close();
stmt4.close(); 
     
     
     
         out=out+"</select>"+
         "|" ; 
   
  myconnection1.commit();


            } catch (Exception e) {
            e.printStackTrace();
            } finally {
            // Обязательно закрываем соединение с БД!
            new Connection_ASU_POL().closeConnection(myconnection1);
            }
   
   
   //"</tr></table>"
   ; 
   
   
   
   
  // "<div id=\""+Oper_Type+"\">" +
  
   
 //  "<td >"+Oper_Type+"  "+Oper_Type+"</td><td >"+UserID+"  "+id_system_1+"</td><td >"+UserID+"  "+id_system_1+"</td>" +
 //  "<td >"+UserID+"  "+id_system_1+"</td><td >"+UserID+"  "+id_system_1+"</td><td >"+UserID+"  "+id_system_1+"</td>"+
 // "</div>";
     out11.println(out);
      
   }}
    
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