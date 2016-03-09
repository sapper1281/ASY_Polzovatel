/*
 * li_user_sys.java
 * кол-во введенных пользователей
 */


package com;



import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.SimpleDateFormat;


public class li_user_sys extends HttpServlet {
    
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
       // String UserID = "db2admin";
       // String Password = "11111111";
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
         "<td NOWRAP >№</td>"+
          "<td NOWRAP >инф. система</td>"+
         "<td NOWRAP >кол-во</td>"+
         "<td NOWRAP >Сопровождающий отдел</td>"+
         "<td NOWRAP >Сотрудники вводящие инф.</td>"+
         "</tr>";              
       
     /*  try {
         Class.forName("COM.ibm.db2.jdbc.app.DB2Driver"); 
          }catch(Throwable theException) {theException.printStackTrace();} 
       Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , UserID, Password);  */
       Connection myconnection1=null;
 try {
        myconnection1 = new Connection_ASU_POL().getConnection();


       
     SimpleDateFormat dateFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
     SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd.MM.yyyy");
     SimpleDateFormat dateFormatter2_1 = new SimpleDateFormat("dd-MM-yyyy");
     SimpleDateFormat dateFormatter3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       
       
       
       String sys="";
      
      //поиск систем доступных админ
      
       
       
       sys=" select id_system,sn_system, count(ID_USER) as kol,SH_NAME from "+
       " (select  "+ 
       " distinct  a5.id, a5.id_system,a5.sn_system,a3.ID_USER,a3_1.SH_NAME  "+
       " from  "+
       " ASU_POL.POLYGON_SYSTEM  a5  "+
       " left join "+
       " (select * from "+
		" ASU_POL.SOOTV_USER_SYS a3 where a3.DT_END is null and del=0 and a3.id_role<>2)  a3 on a5.ID_SYSTEM=a3.ID_SYSTEM "+
       " left join ASU_POL.POLYGON_ROLE a4 on a4.id_role=a3.id_role   "+
       
       " left join ASU_ZIR.POLYGON_SYSTEM_SUPPORT a3_1 on a5.ID_PARRENT=a3_1.ID  "+ 
       " where a5.id_parrent<>0  "+
       " order by 1 ) as a1 "+
       " group by id_system,sn_system,SH_NAME "+
       " order by 2 ";
       
       
      
      
Statement stmt0 = myconnection1.createStatement(); 
ResultSet rs0 = stmt0.executeQuery(sys);
int sys_b=1;
int k=0;

 

while (rs0.next()){
    
  
   
       out=out+
  "<tr border=1>"+
  " <td NOWRAP >"+sys_b+"</td>"+
  " <td NOWRAP >"+rs0.getString("SN_SYSTEM").trim()+"</td>"+
  
  //"<td NOWRAP>"+rs0.getString("kol").trim()+"</td>"+
   "<td NOWRAP><a href="+req.getContextPath()+"/vvedennie_pol_dop.jsp?par=|"+rs0.getString("id_system").trim()+"| target=_blank>"+rs0.getString("kol").trim()+"</a></td>"+
 
  
  " <td NOWRAP >"+rs0.getString("SH_NAME").trim()+"</td>"+
  "<td NOWRAP><a href="+req.getContextPath()+"/otdel_vvod_adm.jsp?sys="+rs0.getInt("ID_SYSTEM")+" target=_blank>�������</a></td>"+
  "</tr>";
  kol_vse=kol_vse+rs0.getInt("kol");
  sys_b++;  
    
    
 
    
    
    
  }
rs0.close();
stmt0.close();    
    

   

out=out+
 "<tr border=1>"+
 " <td NOWRAP >-</td>"+
  " <td NOWRAP >Итог</td>"+
  "<td NOWRAP>"+kol_vse+"</td>"+
  
  "</tr>";

  out=out+"</table>"+
  "</form>" ;  
      
     
      
      //myconnection1.close();

   //   } catch (SQLException e) {out=out+e;}
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