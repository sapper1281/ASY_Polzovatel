/*
 * vozvrat_pol.java
 * ввод не переданных из асу зир
 */

package com;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import java.text.*;
 
public class vozvrat_pol extends HttpServlet {
    
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
      String tel = "";
      String ip = "";
      String mail = "";
      String dt_big_z = "";
      String dt_end_z = "";
       String bloc = ""; 
       String user_log="";
       String user_pas ="";
       String id_user_pas ="";
       out="<table border='1'>"+
       "<tr width=\"100%\"><td colspan='9'> Данные записанные в бд </td></tr>"
       ;
       
  if(!session.isNew()&&(session.getAttribute("id_role").equals("2")||session.getAttribute("id_role").equals("3"))){
      
    Connection myconnection1=null;
 try {
        myconnection1 = new Connection_ASU_POL().getConnection();
    
  // ||32006330|12|22|23|143466|5-08-72|10.58.146.31|STishanskiy@serw.rzd|2010-03-30|2012-03-30|10603||     
int kk=1;        
int k1=-1;
 for (int j_1 = 0; j_1 < par.length()-1; j_1++){
        if (String.valueOf(par.charAt(j_1)).equals("|")&&String.valueOf(par.charAt(j_1+1)).equals("|")){
        if(k1!=-1){
String k2=par.substring(k1+1,j_1)+"|";

int k1_1=-1;
 for (int j_1_1 = 0; j_1_1 < k2.length(); j_1_1++){
        if (String.valueOf(k2.charAt(j_1_1)).equals("|")){
        if(k1_1!=-1){
String k2_1=k2.substring(k1_1+1,j_1_1);
if(kk==1){road=k2_1.trim(); }
if(kk==2){stan=k2_1.trim(); }
if(kk==3){usl=k2_1.trim(); }
if(kk==4){system=k2_1.trim(); }
if(kk==5){role=k2_1.trim(); }
if(kk==6){id_user=k2_1.trim(); }
if(kk==7){tel=k2_1; }
if(kk==8){ip=k2_1; }
if(kk==9){mail=k2_1; }
if(kk==10){dt_big_z=k2_1.trim(); }
if(kk==11){dt_end_z=k2_1.trim();}
if(kk==12){bloc=k2_1.trim(); }
if(session.getValue("id_role").equals("2")){
 if(kk==13){user_log = k2_1.trim();}
 if(kk==14){user_pas = k2_1.trim();}
 if(kk==15){id_user_pas = k2_1.trim();}
          
}
kk++;


//out=out+"<tr><td>'"+k2_1+"'</td></tr>";
}
            k1_1=j_1_1;
        }}
kk=1;
//-----------------------------------------------


           
 
      //out=out+//"<tr><td><table  width=\"100%\" align=\"top\">" +
      
       
     SimpleDateFormat dateFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
     SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd-MM-yyyy");
     SimpleDateFormat dateFormatter3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        Calendar DT_NOW=Calendar.getInstance(); 
        Calendar DT_NOW_1=Calendar.getInstance(); 
        String date=dateFormatter1.format(DT_NOW_1.getTime()).toString();
        String date_1=dateFormatter3.format(DT_NOW_1.getTime()).toString();
      
      int id_sootv_org=0;
      int id_SOOTV_USER_SYS=0;
      int id_pas=0;
   
      
      Statement stmt = myconnection1.createStatement(); 
ResultSet rs = stmt.executeQuery(" select a1.ID "+
  " from ASU_POL.SOOTV_ROAD_STAN a1 where a1.ID_ROAD="+road+" and   a1.ID_STAN="+stan+"  "
  ); 
if(!rs.next()){
      String query = "insert into ASU_POL.SOOTV_ROAD_STAN (  ID_ROAD, ID_STAN,DT_BIG) values ( ?, ?, '"+date+"')";
      PreparedStatement myStmt = myconnection1.prepareStatement(query);
      myStmt.setInt(1,Integer.parseInt(road));
      myStmt.setInt(2,Integer.parseInt(stan));
      myStmt.executeUpdate();
      myStmt.close();

Statement stmt1 = myconnection1.createStatement(); 
ResultSet rs1 = stmt1.executeQuery(" select a1.ID "+
  " from ASU_POL.SOOTV_ROAD_STAN a1 where a1.ID_ROAD="+road+"  and a1.ID_STAN="+stan+"  "
  );
  while (rs1.next()){
  id_sootv_org=rs1.getInt("ID");
    out=out+"<tr><td>id введенной записи соотв. орг. стан.: "+rs1.getInt("ID")+"</td>";
  }

rs1.close();
stmt1.close();      
}  else{id_sootv_org=rs.getInt("ID"); 
       out=out+"<tr><td>id существующей записи соотв. орг. стан.: "+rs.getInt("ID")+"</td>";
}  
      
   rs.close();    
   stmt.close();    
      
     
    PreparedStatement stmt_up = myconnection1.prepareStatement(
  " UPDATE ASU_POL.MAIN_USER_ALL SET  " +
  " tel = '"+tel+"' "+
  " , " +
  " ip= '"+ip+"'" +
  " , " +
  " e_mail= '"+mail+"'" +
   " where ID="+id_user+" ");
  stmt_up.executeUpdate();
  stmt_up.close();   
   
   out=out+"<td>id пользователя:  "+id_user+"</td>";
   out=out+"<td>обнавлен тел.: "+tel+"</td>";
   out=out+"<td>обнавлен ip: "+ip+"</td>";
   out=out+"<td>обнавлен e-mail: "+mail+"</td>";
      
      
 
   
   
//-----------------------------------------------  

 
   
   
  if (session.getAttribute("id_role").equals("2")){
    
Statement stmt5_1 = myconnection1.createStatement(); 
ResultSet rs5_1 = stmt5_1.executeQuery(
  " select a1.ID, a1.ID_SYSTEM, a1.ID_USL, a1.DT_BIG, a1.DT_END "+
  " from ASU_POL.SOOTV_SYS_USL as a1 "+
  " where a1.id_usl="+usl+" and a1.id_system="+system+" "+
  " order by a1.ID "
  );
 


if(!rs5_1.next()){
    
 
      String query = "insert into ASU_POL.SOOTV_SYS_USL ( ID_SYSTEM, ID_USL,DT_BIG) values ( ?, ?, '"+date+"')";
      PreparedStatement myStmt5_1 = myconnection1.prepareStatement(query);
      myStmt5_1.setInt(1,Integer.parseInt(system));
      myStmt5_1.setInt(2,Integer.parseInt(usl ));
      myStmt5_1.executeUpdate();
      myStmt5_1.close();
   
   
Statement stmt6_1 = myconnection1.createStatement(); 
ResultSet rs6_1 = stmt6_1.executeQuery(
  " select a1.ID, a1.ID_SYSTEM, a1.ID_USL, a1.DT_BIG, a1.DT_END "+
  " from ASU_POL.SOOTV_SYS_USL as a1 "+
  " where a1.id_usl="+usl+" and a1.id_system="+system+" "+
  " order by a1.ID "
  );
  while (rs6_1.next()){
  
    out=out+"<td>id введенный записи сис. орг. усл.: "+rs6_1.getInt("ID")+"</td>";
  }

rs6_1.close();
stmt6_1.close(); 
 }
else{id_SOOTV_USER_SYS=rs5_1.getInt("ID"); 
        out=out+"<td>id существующей записи сис. орг. усл: "+rs5_1.getInt("ID")+"</td>";}

rs5_1.close();  
stmt5_1.close(); 
   
   
   
   
  }
   
  
   
   
//----------------------------------------------   
     // a1.ID_STAN="+stan+" 
   Statement stmt5 = myconnection1.createStatement(); 
ResultSet rs5 = stmt5.executeQuery(" select a1.ID "+
  " from ASU_POL.SOOTV_USER_SYS a1 where a1.id_user="+id_user+" and a1.id_system="+system+" " +
  " and a1.id_usl="+usl+" and a1.id_role="+role+" " +
  " and a1.dt_big_z='"+dt_big_z+"' and a1.dt_end_z='"+dt_end_z+"' " +
  " and " +
  " a1.ID_STAN="+stan+"   "
  );
 


if(!rs5.next()){
    
 Statement stmt5_d = myconnection1.createStatement(); 
ResultSet rs5_d = stmt5_d.executeQuery(" select a1.ID "+
  " from ASU_POL.SOOTV_USER_SYS a1 where a1.id_user="+id_user+" and a1.id_system="+system+" " +
  " and a1.id_usl="+usl+" and a1.id_role="+role+" " +
  //" and a1.dt_big_z='"+dt_big_z+"' and a1.dt_end_z='"+dt_end_z+"' " +
  " and " +
  " a1.ID_STAN="+stan+"   "
  );

if(rs5_d.next()){      

PreparedStatement stmt_up_1 = myconnection1.prepareStatement(
  " UPDATE ASU_POL.SOOTV_USER_SYS SET  " +
  " dt_end = '"+date+"' "+
   " , " +
   " del=2 " +
  " where ID="+rs5_d.getInt("ID")+" ");
  stmt_up_1.executeUpdate();
  stmt_up_1.close();   

out=out+"<td>id записи  соотв. системы блокирована: "+rs5_d.getInt("ID")+"</td>";}


rs5_d.close(); 
stmt5_d.close(); 



      String query = "insert into ASU_POL.SOOTV_USER_SYS ( id_user, id_system, id_usl, id_role, dt_big_z, dt_end_z,DT_BIG" +
      ", ID_STAN,del, R3_YES_OR_NIOT, DOK_ZAYVKI " +
      ") values ( ?, ?, ?, ?, '"+dt_big_z+"', '"+dt_end_z+"','"+date+"'" +
      ",?,0,'yes','-'" +
      ")";
      PreparedStatement myStmt = myconnection1.prepareStatement(query);
      myStmt.setInt(1,Integer.parseInt(id_user));
      myStmt.setInt(2,Integer.parseInt(system ));
      myStmt.setInt(3,Integer.parseInt(usl ));
      myStmt.setInt(4,Integer.parseInt(role ));
      myStmt.setInt(5,Integer.parseInt(stan ));
      myStmt.executeUpdate();
      myStmt.close();
   
   
   Statement stmt6 = myconnection1.createStatement(); 
ResultSet rs6 = stmt6.executeQuery(" select a1.ID "+
  " from ASU_POL.SOOTV_USER_SYS a1 where a1.id_user="+id_user+" and a1.id_system="+system+" " +
  " and a1.id_usl="+usl+" and a1.id_role="+role+"  and a1.dt_big_z='"+dt_big_z+"' and a1.dt_end_z='"+dt_end_z+"' and DT_BIG='"+date+"' and " +
  "  a1.ID_STAN="+stan+"   "
  
  );
  while (rs6.next()){
  id_SOOTV_USER_SYS=rs6.getInt("ID");
    out=out+"<td>id введенной записи  соотв. системы: "+rs6.getInt("ID")+"</td>";
  }

rs6.close();
stmt6.close(); 
 }
else{id_SOOTV_USER_SYS=rs5.getInt("ID"); 
        out=out+"<td>id существующей записи  соотв. системы: "+rs5.getInt("ID")+"</td>";}

rs5.close();
stmt5.close();

















   Statement stmt4_1 = myconnection1.createStatement(); 
ResultSet rs4_1 = stmt4_1.executeQuery(" select ID, ID_USER, ID_STAN, DT_BIG, DT_END "+
  " from ASU_POL.SOOTV_USER_STAN "+
  " where ID_USER="+id_user+" and  ID_STAN="+stan+" "+
  " order by ID "
  );



    
     if (!rs4_1.next()){   
      String query = "insert into ASU_POL.SOOTV_USER_STAN ( id_user, ID_STAN, DT_BIG " +
      ") values ( ?, ?,'"+date+"')";
      PreparedStatement myStmt = myconnection1.prepareStatement(query);
      myStmt.setInt(1,Integer.parseInt(id_user));
      myStmt.setInt(2,Integer.parseInt(stan ));
      myStmt.executeUpdate();
      myStmt.close();     
         
         
         
     Statement stmt4 = myconnection1.createStatement(); 
ResultSet rs4 = stmt4.executeQuery(" select ID, ID_USER, ID_STAN, DT_BIG, DT_END "+
  " from ASU_POL.SOOTV_USER_STAN "+
  " where ID_USER="+id_user+" and  ID_STAN="+stan+" "+
  " order by ID "
  );

         
     while (rs4.next()){
     out=out+"<td>id введенной записи соотв. пол. стан.: "+rs4.getInt("ID")+"</td>";
     }    
rs4.close();
stmt4.close();  

  }
   else{
     
     out=out+"<td>id существующей записи соотв. пол. стан.: "+rs4_1.getInt("ID")+"</td>";
     
     
     
     }

rs4_1.close();
stmt4_1.close();  






















  if (session.getAttribute("id_role").equals("2")&&system.equals("1")){
     //out=out+"<tr><td>"+session.getValue("id_role")+"</td></tr>";
      //String user_log = req.getParameter("user_log");
      //String user_pas = req.getParameter("user_pas");
       
      
      
      
      
    Statement stmt9 = myconnection1.createStatement(); 
ResultSet rs9 = stmt9.executeQuery( " select a1.ID "+
      " from ASU_POL.ADMIN_PAS a1 where a1.ID_USER="+id_user+"  " +
      //" and a1.LOGIN='"+user_log+"' and a1.PASSWORD='"+user_pas+"'" +
      " and ID_SOOTV_USER_SYS="+id_SOOTV_USER_SYS+""// +
      //" and a1.DT_BIG='2010-01-01'   "
  );
 
if(!rs9.next()){  
      
      
      String query = "insert into ASU_POL.ADMIN_PAS (  ID_USER, LOGIN, PASSWORD, DT_BIG, ID_SOOTV_USER_SYS) values ( ?, ?,?,'"+date+"',?)";
      PreparedStatement myStmt = myconnection1.prepareStatement(query);
      myStmt.setInt(1,Integer.parseInt(id_user));
      myStmt.setString(2,user_log);
      myStmt.setString(3,user_pas);
      myStmt.setInt(4,id_SOOTV_USER_SYS);
      myStmt.executeUpdate();
      myStmt.close();
      
      
      
      
      
      Statement stmt7 = myconnection1.createStatement(); 
      ResultSet rs7 = stmt7.executeQuery(" select a1.ID "+
      " from ASU_POL.ADMIN_PAS a1 where a1.ID_USER="+id_user+"  " +
      " and a1.LOGIN='"+user_log+"' and a1.PASSWORD='"+user_pas+"'" +
      " and ID_SOOTV_USER_SYS="+id_SOOTV_USER_SYS+" and a1.DT_BIG='"+date+"'   "
  );
  while (rs7.next()){
  id_pas=rs7.getInt("ID");
    out=out+"<td>id введенной pass.: "+rs7.getInt("ID")+"</td>";
  }

rs7.close();
stmt7.close();  
      
      
      
      
}else{

PreparedStatement stmt_up_pas = myconnection1.prepareStatement(
  " UPDATE ASU_POL.ADMIN_PAS SET  " +
  " LOGIN = '"+user_log+"' "+
  " , " +
  " PASSWORD= '"+user_pas+"'" +
 // " , " +
  //" e_mail= '"+mail+"'" +
   " where ID="+rs9.getInt("ID")+"  ");
  stmt_up_pas.executeUpdate();
  stmt_up_pas.close();  

  out=out+"<td>id обнавленной pass.: "+rs9.getInt("ID")+"</td>";
  
  
}
 rs9.close();
stmt9.close();      
      
 


PreparedStatement stmt_bloc_pas= myconnection1.prepareStatement(
  " UPDATE ASU_POL.ADMIN_PAS SET  " +
  " DT_END = '"+date+"'   "+
  
   " where ID_USER="+id_user_pas+"  ");
  stmt_bloc_pas.executeUpdate();
  stmt_bloc_pas.close();  

  out=out+"<td>id пол. блок. зап. пароль: "+id_user_pas+"</td></tr>";


      


      
      }


String info=id_sootv_org+" "+id_user+" "+tel+" "+ip+" "+mail+" "+id_SOOTV_USER_SYS+" "+id_pas;   


 


      String query = "insert into ASU_POL.ADMIN_LOGS (  ID_USER, IP, DT_TIME, INFO) " +
      " values ("+ session.getAttribute("id_us")+", '"+req.getRemoteAddr()+"','"+date_1+"','"+info+"')";
      PreparedStatement myStmt1 = myconnection1.prepareStatement(query);
      
      myStmt1.executeUpdate();
      myStmt1.close();

      
      Statement stmt8 = myconnection1.createStatement(); 
      ResultSet rs8 = stmt8.executeQuery(" select a1.ID "+
      " from ASU_POL.ADMIN_LOGS a1 where a1.ID_USER="+session.getAttribute("id_us")+
      "  and a1.IP='"+req.getRemoteAddr()+"' and a1.DT_TIME='"+date_1+"' and a1.INFO='"+info+"'  "
  );
  while (rs8.next()){
   out=out+"<td>id записи log: "+rs8.getInt("ID")+"</td>";
  }

rs8.close();
stmt8.close(); 




 

PreparedStatement stmt_bloc = myconnection1.prepareStatement(
  " UPDATE ASU_POL.SOOTV_USER_SYS_BLOCK SET  " +
  " DEL = 4 "+
  
   " where ID="+bloc+"  ");
  stmt_bloc.executeUpdate();
  stmt_bloc.close();  

  out=out+"<td>id блокированной записи.: "+bloc+"</td></tr>";






    
           
          
 

//-----------------------------------------------
/*out=out+"<tr><td>road='"+road+"'</td></tr><tr><td>stan'"+stan+"'</td></tr><tr><td>usl'"+usl+"'</td></tr><tr><td>system'"+system+"'</td></tr><tr><td>role'"+role+"'</td></tr><tr><td>id_user'"+id_user+"'</td>" +
"<td>tel'"+tel+"'</td></tr><tr><td>ip'"+ip+"'</td></tr><tr><td>mail'"+mail+"'</td></tr><tr><td>dt_big_z'"+dt_big_z+"'</td></tr><tr><td>dt_end_z'"+dt_end_z+"'</td></tr><tr><td>bloc'"+bloc+"'</td></tr>"+
"<tr><td>user_log='"+user_log+"'</td></tr>"+
"<tr><td>user_pas='"+user_pas+"'</td></tr>";*/
//if(kk==13){user_log = k2_1;}
// if(kk==14){user_pas = k2_1;}
//out=out+"<tr><td>"+k2+"</td></tr>";
}
            k1=j_1;
        }}
       
    myconnection1.commit();
            } catch (Exception e) {
            e.printStackTrace();
            } finally {
            // Обязательно закрываем соединение с БД!
            new Connection_ASU_POL().closeConnection(myconnection1);
            }
    
     
      
   //out=out+"</table></td></tr>" ;   
      
      
      

      } 
 

              
      out=out+"</table>";
      out11.println(out); 
   }
    
   Object lock = new Object(); 
   
   
   public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        synchronized(lock)
       {response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010"); 
        processRequest(request, response);}
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        synchronized(lock)
       {response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010"); 
        processRequest(request, response);}
    }
   
   public String getServletInfo() {
      return "A session tracking servlet";
   }
} 