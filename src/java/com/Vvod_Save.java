/*
 * Vvod_Save.java
 *
 *
 */

package com;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import java.text.*;
 
/**
 *
 * @author  apopovkin
 */
public class Vvod_Save {
    
    /** Creates a new instance of Vvod_Save */
    
    private String out="";
   /* public void setOUT(String out){
    this.out=out;
    }
 
    public String getOUT(){
    return out;
    }*/
        
    
    public String Vvod_Save(String priz,String fio,String road,String stan,
    String system,String role,String num_z,String job,String dt_big_z,
    String tel,String ip,String mail,HttpServletRequest request, HttpServletResponse response,String user_log,String user_pas) 
    throws ServletException, IOException {
        
    Object lock = new Object(); 
synchronized(lock)
     {    
        
        
        
        
        
     out="";
     String usl="";
     int id_user=0;
     request.setCharacterEncoding("UTF-8");
        String charset = "windows-1251";
        response.setContentType("text/html; charset=" + charset);  
     
     
     HttpSession session = request.getSession();   
      if((!session.isNew())&&(session.getAttribute("FIRST_NAME")!=null)&&((session.getAttribute("id_role").equals("2"))||(session.getAttribute("id_role").equals("3")))){
response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");
    
    /* try {
      String UserID = "db2admin";
      String Password = "11111111";
      Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , UserID, Password);          
     */
Connection myconnection1=null;
 try {
        myconnection1 = new Connection_ASU_POL().getConnection();



 /*     
   String query1 = "insert into ASU_POL.SOOTV_ROAD_STAN_1(ID_ROAD, ID_STAN,DT_BIG,STR) values (1,2,'2010-02-10','333')";
      PreparedStatement myStmt1 = myconnection1.prepareStatement(query1);
    //  myStmt.setInt(1,Integer.parseInt(road));
    //  myStmt.setInt(2,Integer.parseInt(stan));
    //  myStmt.setString(3,fio);
      myStmt1.executeUpdate();
      myStmt1.close();*/
        
      
        if(priz.equals("r3")){
        id_user=Integer.parseInt(fio);//добавить запись ид фамилии
        }
        
      
      
        
        
     
      
      
      
        SimpleDateFormat dateFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat dateFormatter3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        String yyear_p = dt_big_z.substring(0,4); 
        int yyear1_p=Integer.parseInt(yyear_p);
        String mmonth_p = dt_big_z.substring(5,7);
        int mmonth1_p=Integer.parseInt(mmonth_p)-1;
        String   dday_p= dt_big_z.substring(8,10);
        int   dday1_p=Integer.parseInt(dday_p);   
        Calendar DT_NOW=Calendar.getInstance(); 
        Calendar DT_NOW_1=Calendar.getInstance(); 
        String date=dateFormatter1.format(DT_NOW_1.getTime()).toString();
        String date_1=dateFormatter3.format(DT_NOW_1.getTime()).toString();
        
        DT_NOW.set(yyear1_p,mmonth1_p,dday1_p,0,0,0);
        dt_big_z=dateFormatter1.format(DT_NOW.getTime()).toString();
      
        DT_NOW.set(yyear1_p+1,mmonth1_p,dday1_p,0,0,0);
        String dt_end_z=dateFormatter1.format(DT_NOW.getTime()).toString();                               
        
        
      int id_sootv_org=0;
      int id_SOOTV_USER_SYS=0;
      int id_pas=0;
      //ввод соотвествия станции организации
      Statement stmt = myconnection1.createStatement(); 
      ResultSet rs = stmt.executeQuery(" select a1.ID "+
      " from ASU_POL.SOOTV_ROAD_STAN a1 where a1.ID_ROAD="+road+" and   a1.ID_STAN="+stan+"  "
      ); 
      
      if(!rs.next()){
       String query = "insert into ASU_POL.SOOTV_ROAD_STAN(ID_ROAD, ID_STAN,DT_BIG) values ("+road+","+stan+",'"+date+"')";
      PreparedStatement myStmt = myconnection1.prepareStatement(query);
      //myStmt.setInt(1,Integer.parseInt(road));
      //myStmt.setInt(2,Integer.parseInt(stan));
      myStmt.executeUpdate();
      myStmt.close();

         Statement stmt1 = myconnection1.createStatement(); 
         ResultSet rs1 = stmt1.executeQuery(" select a1.ID "+
         " from ASU_POL.SOOTV_ROAD_STAN a1 where a1.ID_ROAD="+road+"  and a1.ID_STAN="+stan+"  ");
            while (rs1.next()){
            id_sootv_org=rs1.getInt("ID");
            out=out+"<tr><td>&nbsp;</td><td colspan='11'>id введенной записи соотв. орг. стан.: "+id_sootv_org+"</td></tr>";}

         rs1.close();
         stmt1.close();      
     }else{id_sootv_org=rs.getInt("ID"); 
     out=out+"<tr><td>&nbsp;</td><td colspan='11'>id существующей записи соотв. орг. стан.: "+id_sootv_org+"</td></tr>";}
     rs.close();    
     stmt.close();    
        
        
     
     
   
     
     //поиск услуги
     Statement stmt5_1 = myconnection1.createStatement(); 
     ResultSet rs5_1 = stmt5_1.executeQuery(
      " select a1.ID, a1.ID_SYSTEM, a1.ID_USL, a1.DT_BIG, a1.DT_END "+
      " from ASU_POL.SOOTV_SYS_USL as a1 "+
      " where a1.id_system="+system+" "+
      " order by a1.ID ");
     
     if(!rs5_1.next()){
     usl="0";
     String query = "insert into ASU_POL.SOOTV_SYS_USL ( ID_SYSTEM, ID_USL,DT_BIG) values ( "+system+", "+usl+", '"+date+"')";
     PreparedStatement myStmt5_1 = myconnection1.prepareStatement(query);
     //myStmt5_1.setInt(1,Integer.parseInt(system));
     //myStmt5_1.setInt(2,Integer.parseInt(usl ));
     myStmt5_1.executeUpdate();
     myStmt5_1.close();
     
     Statement stmt6_1 = myconnection1.createStatement(); 
     ResultSet rs6_1 = stmt6_1.executeQuery(
     " select a1.ID, a1.ID_SYSTEM, a1.ID_USL, a1.DT_BIG, a1.DT_END "+
     " from ASU_POL.SOOTV_SYS_USL as a1 "+
     " where a1.id_usl="+usl+" and a1.id_system="+system+" "+
     " order by a1.ID ");
     while (rs6_1.next()){
     out=out+"<tr><td>&nbsp;</td><td colspan='11'>id введенной записи  сист. соотв. усл.: "+rs6_1.getInt("ID")+"</td></tr>";}
     rs6_1.close();
     stmt6_1.close();
     }
     else{
     usl=rs5_1.getString("ID_USL");    
     id_SOOTV_USER_SYS=rs5_1.getInt("ID"); 
     out=out+"<tr><td>&nbsp;</td><td colspan='11'>id существующей записи  сист. соотв. усл.: "+rs5_1.getInt("ID")+"</td></tr>";}
     rs5_1.close();  
     stmt5_1.close(); 
     
  
     

     
     
     
    
 
     //ввод новых данных пользователя для R3
     
  if(priz.equals("r3")){   
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
   out=out+"<tr><td>&nbsp;</td><td colspan='11'>id пользователя: "+id_user+"</td></tr>";
   out=out+"<tr><td>&nbsp;</td><td colspan='11'>обнавлен тел.: "+tel+"</td></tr>";
   out=out+"<tr><td>&nbsp;</td><td colspan='11'>обнавлен ip: "+ip+"</td></tr>";
   out=out+"<tr><td>&nbsp;</td><td colspan='11'>обнавлен e-mail: "+mail+"</td></tr>";
  }   
     
   
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
        String LAST_NAME="";
        String FIRST_NAME="";
        String MIDDLE_NAME="";
        
        if(priz.equals("not_r3")){
            fio=fio+" ";
        int i=0;
        boolean t_nas=true;
        boolean t_end=true;
        boolean end=true;
        int i_nas=0;
        int i_end=fio.length()-1;
        //out=out+"<tr>";
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
       // out=out+"</tr>";
        }
         
     
     
     
     
        
        
        // поиск наименования дороги
         String SN_ROAD=""; 
         Statement stmt_road = myconnection1.createStatement(); 
         ResultSet rs_road  = stmt_road.executeQuery(" select SN_ROAD "+
         " from ASU_POL.POLYGON_ROAD where ID_ROAD_ASU_TR="+road);
            while (rs_road .next()){
            SN_ROAD=rs_road .getString("SN_ROAD");
            }
         rs_road .close();
         stmt_road .close(); 
        
        
        
         
     if(priz.equals("not_r3")){   
     // поиск фамилии
     Statement stmt5_fio = myconnection1.createStatement(); 
     ResultSet rs5_fio = stmt5_fio.executeQuery(
     " select ID, ID_ROAD_ASU_TR, TAB_NUM, ID_JOB, BLOCK_USER, PFR, "+ 
     " LAST_NAME, FIRST_NAME, MIDDLE_NAME, TEL, IP, E_MAIL, DT_BIG, "+
     " DT_END, PRIZ, ROAD, SN_JOB, R3_YES_OR_NIOT "+
     " from ASU_POL.MAIN_USER_ALL where LAST_NAME='"+LAST_NAME+"' " +
     " and FIRST_NAME='"+FIRST_NAME+"' and MIDDLE_NAME='"+MIDDLE_NAME+"'"+
     " and ID_ROAD_ASU_TR="+road+" and BLOCK_USER=0 and R3_YES_OR_NIOT='not'");
     
     
     if(!rs5_fio.next()){
     String query = "insert into ASU_POL.MAIN_USER_ALL " +
     " ( ID_ROAD_ASU_TR, TAB_NUM, ID_JOB, BLOCK_USER, PFR, "+ 
     " LAST_NAME, FIRST_NAME, MIDDLE_NAME, TEL, IP, E_MAIL, DT_BIG, "+
     "  PRIZ, ROAD, SN_JOB, R3_YES_OR_NIOT ) values " +
     " ( "+road+",-1,-1,0,'not','"+LAST_NAME+"','"+FIRST_NAME+"','"+MIDDLE_NAME+"'," +
     " '"+tel+"','"+ip+"','"+mail+"','"+date+"',-1,'"+SN_ROAD.trim()+", ','"+job+"','not')";
     PreparedStatement myStmt5_fio = myconnection1.prepareStatement(query);
     //myStmt5_1.setInt(1,Integer.parseInt(system));
     //myStmt5_1.setInt(2,Integer.parseInt(usl ));
     myStmt5_fio.executeUpdate();
     myStmt5_fio.close();
     
     Statement stmt6_fio = myconnection1.createStatement(); 
     ResultSet rs6_fio = stmt6_fio.executeQuery(
     " select ID, ID_ROAD_ASU_TR, TAB_NUM, ID_JOB, BLOCK_USER, PFR, "+ 
     " LAST_NAME, FIRST_NAME, MIDDLE_NAME, TEL, IP, E_MAIL, DT_BIG, "+
     " DT_END, PRIZ, ROAD, SN_JOB, R3_YES_OR_NIOT "+
     " from ASU_POL.MAIN_USER_ALL where LAST_NAME='"+LAST_NAME+"' " +
     " and FIRST_NAME='"+FIRST_NAME+"' and MIDDLE_NAME='"+MIDDLE_NAME+"'"+
     " and ID_ROAD_ASU_TR="+road+" and BLOCK_USER=0 ");
     while (rs6_fio.next()){
     id_user=rs6_fio.getInt("ID");
     out=out+"<tr><td>&nbsp;</td><td colspan='11'>id id введенной записи  сист. соотв. персоналу.: "+id_user+"</td></tr>";}
     rs6_fio.close();
     stmt6_fio.close();
     }
     else{
     id_user=rs5_fio.getInt("ID");
     out=out+"<tr><td>&nbsp;</td><td colspan='11'>id существующей записи  сист. соотв. персоналу.: "+id_user+"</td></tr>";
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
     }  
     rs5_fio.close();  
     stmt5_fio.close(); 
     }
     

         
         
         
         
         
         
         
  //соответствия пользов и станции
      Statement stmt4_1 = myconnection1.createStatement(); 
ResultSet rs4_1 = stmt4_1.executeQuery(" select ID, ID_USER, ID_STAN, DT_BIG, DT_END "+
  " from ASU_POL.SOOTV_USER_STAN "+
  " where ID_USER="+id_user+" and  ID_STAN="+stan+" "+
  " order by ID "
  );
 if (!rs4_1.next()){   
      String query = "insert into ASU_POL.SOOTV_USER_STAN ( id_user, ID_STAN, DT_BIG " +
      ") values ( "+id_user+", "+stan+",'"+date+"')";
      PreparedStatement myStmt = myconnection1.prepareStatement(query);
      //myStmt.setInt(1,id_user);
      //myStmt.setInt(2,Integer.parseInt(stan ));
      myStmt.executeUpdate();
      myStmt.close();     
      Statement stmt4 = myconnection1.createStatement(); 
      ResultSet rs4 = stmt4.executeQuery(" select ID, ID_USER, ID_STAN, DT_BIG, DT_END "+
  " from ASU_POL.SOOTV_USER_STAN "+
  " where ID_USER="+id_user+" and  ID_STAN="+stan+" "+
  " order by ID "
  );
while (rs4.next()){out=out+"<tr><td>&nbsp;</td><td colspan='11'>id введенной записи соотв пол. стан.: "+rs4.getInt("ID")+"</td></tr>";}
rs4.close();
stmt4.close(); }
   else{out=out+"<tr><td>&nbsp;</td><td colspan='11'>id существующий записи соотв пол. стан.: "+rs4_1.getInt("ID")+"</td></tr>";}

rs4_1.close();
stmt4_1.close();     
         
         
         








//R3_YES_OR_NIOT
//DOK_ZAYVKI
//ввод соответствия системе

String pr_r3="";
String sql_pr_r3="";
if(priz.equals("not_r3")){pr_r3="not"; }

if(priz.equals("r3")){pr_r3="yes"; }






Statement stmt5 = myconnection1.createStatement(); 
ResultSet rs5 = stmt5.executeQuery(" select a1.ID "+
  " from ASU_POL.SOOTV_USER_SYS a1 where a1.id_user="+id_user+" and a1.id_system="+system+" " +
  " and a1.id_usl="+usl+" and a1.id_role="+role+" " +
  " and a1.dt_big_z='"+dt_big_z+"' and a1.dt_end_z='"+dt_end_z+"' " +
  " and R3_YES_OR_NIOT='"+pr_r3+"' and  (DOK_ZAYVKI='"+num_z+"' or DOK_ZAYVKI is null) and " +
  " a1.ID_STAN="+stan+"  and a1.dt_end is null   "
  );
 
//доработать



if(!rs5.next()){
    
 Statement stmt5_d = myconnection1.createStatement(); 
ResultSet rs5_d = stmt5_d.executeQuery(" select a1.ID "+
  " from ASU_POL.SOOTV_USER_SYS a1 where a1.id_user="+id_user+" and a1.id_system="+system+" " +
  " and a1.id_usl="+usl+" and a1.id_role="+role+" "+ 
  //" and a1.dt_big_z='"+dt_big_z+"' and a1.dt_end_z='"+dt_end_z+"' " +
  //" and " +
  " and R3_YES_OR_NIOT='"+pr_r3+"' and " +
  " a1.ID_STAN="+stan+"   "
  );

while(rs5_d.next()){      

PreparedStatement stmt_up_1 = myconnection1.prepareStatement(
  " UPDATE ASU_POL.SOOTV_USER_SYS SET  " +
  " dt_end = '"+date+"' "+
   " , " +
   " del=2 " +
  " where ID="+rs5_d.getInt("ID")+" and del<>2 ");
  stmt_up_1.executeUpdate();
  stmt_up_1.close();   
out=out+"<tr><td>&nbsp;</td><td colspan='11'>id записи соотв сисстемы блокирована: "+rs5_d.getInt("ID")+"</td></tr>";}
rs5_d.close(); 
stmt5_d.close(); 



      String query = "insert into ASU_POL.SOOTV_USER_SYS ( id_user, id_system, id_usl, id_role, dt_big_z, dt_end_z,DT_BIG" +
      ", ID_STAN,del, R3_YES_OR_NIOT, DOK_ZAYVKI" +
      ") values ( "+id_user+", "+system+", "+usl+", "+role+", '"+dt_big_z+"', '"+dt_end_z+"','"+date+"'" +
      ","+stan+",0,'"+pr_r3+"','"+num_z+"' " +
      ")";
      PreparedStatement myStmt = myconnection1.prepareStatement(query);
     // myStmt.setInt(1,Integer.parseInt(id_user));
     // myStmt.setInt(2,Integer.parseInt(system ));
     // myStmt.setInt(3,Integer.parseInt(usl ));
     // myStmt.setInt(4,Integer.parseInt(role ));
     // myStmt.setInt(5,Integer.parseInt(stan ));
      myStmt.executeUpdate();
      myStmt.close();
   
   
   Statement stmt6 = myconnection1.createStatement(); 
ResultSet rs6 = stmt6.executeQuery(" select a1.ID "+
  " from ASU_POL.SOOTV_USER_SYS a1 where a1.id_user="+id_user+" and a1.id_system="+system+" " +
  " and a1.id_usl="+usl+" and a1.id_role="+role+"  and a1.dt_big_z='"+dt_big_z+"' and a1.dt_end_z='"+dt_end_z+"' and DT_BIG='"+date+"' and " +
  "  a1.ID_STAN="+stan+"   and R3_YES_OR_NIOT='"+pr_r3+"' and  (DOK_ZAYVKI='"+num_z+"' or DOK_ZAYVKI is null) " 
 );
  while (rs6.next()){
  id_SOOTV_USER_SYS=rs6.getInt("ID");
    out=out+"<tr><td>&nbsp;</td><td colspan='11'>id введенной записи соотв. сист.: "+rs6.getInt("ID")+"</td></tr>";}
rs6.close();
stmt6.close(); 
 }
else{id_SOOTV_USER_SYS=rs5.getInt("ID"); 
        out=out+"<tr><td>&nbsp;</td><td colspan='11'>лid существующей записи соотв. сист.: "+rs5.getInt("ID")+"</td></tr>";}
rs5.close();
stmt5.close();




String info=id_sootv_org+" "+id_user+" "+tel+" "+ip+" "+mail+" "+id_SOOTV_USER_SYS+" "+id_pas;   

      String query = "insert into ASU_POL.ADMIN_LOGS (  ID_USER, IP, DT_TIME, INFO,ID_SOOTV_USER_SYS) " +
      " values ("+ session.getAttribute("id_us")+", '"+request.getRemoteAddr()+"','"+date_1+"','"+info+"',"+id_SOOTV_USER_SYS+")";
      PreparedStatement myStmt1 = myconnection1.prepareStatement(query);
      
      myStmt1.executeUpdate();
      myStmt1.close();

      
      Statement stmt8 = myconnection1.createStatement(); 
      ResultSet rs8 = stmt8.executeQuery(" select a1.ID "+
      " from ASU_POL.ADMIN_LOGS a1 where a1.ID_USER="+session.getAttribute("id_us")+
      "  and a1.IP='"+request.getRemoteAddr()+"' and a1.DT_TIME='"+date_1+"' and a1.INFO='"+info+"' and ID_SOOTV_USER_SYS="+id_SOOTV_USER_SYS+"  "
  );
  while (rs8.next()){
   out=out+"<tr><td>&nbsp;</td><td colspan='11'>id записи log: "+rs8.getInt("ID")+"</td></tr>";
  }

rs8.close();
stmt8.close(); 































//ввод пароля

 if (session.getAttribute("id_role").equals("2")&&system.equals("1")){
     //out=out+"<tr><td>"+session.getValue("id_role")+"</td></tr>";
      //user_log = req.getParameter("user_log");
      //user_pas = req.getParameter("user_pas");
       
      
    Statement stmt9 = myconnection1.createStatement(); 
    ResultSet rs9 = stmt9.executeQuery( " select a1.ID "+
      " from ASU_POL.ADMIN_PAS a1 where a1.ID_USER="+id_user+"  " +
      " and ID_SOOTV_USER_SYS="+id_SOOTV_USER_SYS+""
   );
 
if(!rs9.next()){  
      
      
      query = "insert into ASU_POL.ADMIN_PAS (  ID_USER, LOGIN, PASSWORD, DT_BIG, ID_SOOTV_USER_SYS) values ( ?, ?,?,'2010-01-01',?)";
      PreparedStatement myStmt = myconnection1.prepareStatement(query);
      myStmt.setInt(1,id_user);
      myStmt.setString(2,user_log);
      myStmt.setString(3,user_pas);
      myStmt.setInt(4,id_SOOTV_USER_SYS);
      myStmt.executeUpdate();
      myStmt.close();
      
      
      Statement stmt7 = myconnection1.createStatement(); 
      ResultSet rs7 = stmt7.executeQuery(" select a1.ID "+
      " from ASU_POL.ADMIN_PAS a1 where a1.ID_USER="+id_user+"  " +
      " and a1.LOGIN='"+user_log+"' and a1.PASSWORD='"+user_pas+"'" +
      " and ID_SOOTV_USER_SYS="+id_SOOTV_USER_SYS+" and a1.DT_BIG='2010-01-01'   "
  );
  while (rs7.next()){
  id_pas=rs7.getInt("ID");
    out=out+"<tr><td>&nbsp;</td><td colspan='11'>id введенной записи pass.: "+rs7.getInt("ID")+"</td></tr>";
  }

rs7.close();
stmt7.close();  
      
      
      
      
}else{

PreparedStatement stmt_up_pas = myconnection1.prepareStatement(
  " UPDATE ASU_POL.ADMIN_PAS SET  " +
  " LOGIN = '"+user_log+"' "+
  " , " +
  " PASSWORD= '"+user_pas+"'" +
  " where ID="+rs9.getInt("ID")+"  ");
  stmt_up_pas.executeUpdate();
  stmt_up_pas.close();  

  out=out+"<tr><td>&nbsp;</td><td colspan='11'>id сущ. записи pass.: "+rs9.getInt("ID")+"</td></tr>";
}
rs9.close();
stmt9.close();      
 }














//поиск стан
String SN_STAN=""; 
         Statement stmt_STAN = myconnection1.createStatement(); 
         ResultSet rs_STAN  = stmt_STAN.executeQuery(" select SN_STAN "+
         " from ASU_POL.POLYGON_STAN where ID_STAN="+stan);
            while (rs_STAN .next()){
            SN_STAN=rs_STAN .getString("SN_STAN");
            }
         rs_STAN .close();
         stmt_STAN .close(); 
//поиск сист
String SN_SYSTEM=""; 
         Statement stmt_SYSTEM = myconnection1.createStatement(); 
         ResultSet rs_SYSTEM  = stmt_SYSTEM.executeQuery(" select SN_SYSTEM "+
         " from ASU_POL.POLYGON_SYSTEM where ID_SYSTEM="+system);
            while (rs_SYSTEM .next()){
            SN_SYSTEM=rs_SYSTEM .getString("SN_SYSTEM");
            }
         rs_SYSTEM .close();
         stmt_SYSTEM .close(); 
        
//поиск роль
String SN_ROLE=""; 
         Statement stmt_ROLE = myconnection1.createStatement(); 
         ResultSet rs_ROLE  = stmt_ROLE.executeQuery(" select FN_ROLE "+
         " from ASU_POL.POLYGON_ROLE where ID_ROLE="+role);
            while (rs_ROLE .next()){
            SN_ROLE=rs_ROLE .getString("FN_ROLE");
            }
         rs_ROLE .close();
         stmt_ROLE .close(); 

if(priz.equals("r3")){
         Statement stmt_fio = myconnection1.createStatement(); 
         ResultSet rs_fio  = stmt_fio.executeQuery(" select LAST_NAME, FIRST_NAME, MIDDLE_NAME "+
         " from ASU_POL.MAIN_USER_ALL where ID="+id_user+" ");
            while (rs_fio .next()){
            fio=rs_fio .getString("LAST_NAME")+" "+rs_fio .getString("FIRST_NAME")+" "+rs_fio .getString("MIDDLE_NAME");
            }
         rs_fio .close();
         stmt_fio .close();  
}

String out_new=
"<td NOWRAP >"+fio+"</td><td NOWRAP >"+SN_ROAD+"</td><td NOWRAP >"+SN_STAN+"</td><td NOWRAP >"+SN_SYSTEM+"</td><td NOWRAP >"+SN_ROLE+"</td><td NOWRAP >"+num_z+"</td><td NOWRAP >"+job+
"</td>" +
" <td NOWRAP >"+dt_big_z+"</td><td NOWRAP >"+tel+"</td><td NOWRAP >"+ip+"</td><td NOWRAP >"+mail+"</td></tr>";
//" <td>1</td><td>2</td><td>3</td><td>4</td></tr>";




out=out_new+out;









         
         
         
         
         
         
         
         
         
     
     
     
  
     
     
     
     
    
     
       


myconnection1.commit();
            } catch (Exception e) {
            e.printStackTrace();
            } finally {
            // Обязательно закрываем соединение с БД!
            new Connection_ASU_POL().closeConnection(myconnection1);
            }

    
      }
    return(out);
    }}
    
}
