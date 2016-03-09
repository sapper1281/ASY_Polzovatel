<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="UTF-8" %>
<%@page import= " java.io.*"%>
<%@page import= " java.util.*"%>
<%@page import= " javax.servlet.*"%>
<%@page import= " javax.servlet.http.*"%>
<%@page import= " java.sql.*"%>
<%@page import= " java.net.*"%>
<%@page import= " java.lang.*"%>
<%@page import= " java.io.*"%>
<%@page import= " java.net.*"%>
<%@page import= " javax.servlet.*"%>
<%@page import= " javax.servlet.http.*"%>
<%@page import= " java.util.Date"%>
<%@page import= " javax.naming.InitialContext"%>
<%@page import= " javax.sql.DataSource"%>
<%@page import= " java.sql.*"%>
<%@page import= " java.util.*"%>
<%@page import= " javax.naming.*"%>
<%@page import= " java.text.*"%>
<%@page import= " java.lang.*"%>
<%@page import= " javax.swing.*"%>
<%@page import= " java.awt.event.*"%>
<%@page import= " java.applet.*"%>
<%@page import= " java.text.ParseException"%>
<%@page import= " java.text.SimpleDateFormat"%>









<%if(session.getValue("id_role").equals("2")||session.getValue("id_role").equals("3")){
response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");

Object lock = new Object(); 
synchronized(lock)
{

String sys=request.getParameter("ss");
int ss1=Integer.parseInt(request.getParameter("ss1"));
int ss2=Integer.parseInt(request.getParameter("ss2"));
request.setCharacterEncoding("UTF-8");
        String charset = "windows-1251";
        response.setContentType("text/html; charset=" + charset);  
        
        
String out2= ss1+"-"+ss2;

String out1="";
String out0="";
String out3="";
String out4="";
try { 

String UserID = "db2admin";
       String Password = "11111111";

try {
         Class.forName("COM.ibm.db2.jdbc.app.DB2Driver"); 
          }catch(Throwable theException) {theException.printStackTrace();} 
       Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , UserID, Password);  
 SimpleDateFormat dateFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
     SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd.MM.yyyy");
     SimpleDateFormat dateFormatter2_1 = new SimpleDateFormat("dd-MM-yyyy");
     SimpleDateFormat dateFormatter3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
     

out0=out0+"<table>";
out1=//" <img src=\"images/status_anim.gif\" style=\"display:none\" id='img"+sys+"'>"+
     //" <div id=\"id1_"+sys+"\"  name=\"id1_"+sys+"\"  > style=\"display:none\" "+
     
     "<tr>"+
     "<td>"+
     " <table> "+
     " <tr  bgcolor='#B2B2B2'> "+
     //" <td NOWRAP bgcolor='#EEEEEE' > &nbsp </td>  "+ 
    " <td NOWRAP  > "+out2+" </td>  "+
 
"<td NOWRAP >№</td> "+
     "<td NOWRAP style=\"display:none\">id записи</td> "+
     "<td NOWRAP >инф. система</td> "+
     "<td NOWRAP style=\"display:none\">код</td> "+
     "<td NOWRAP style=\"display:none\">id пол.</td> "+
     "<td NOWRAP >Ф.И.О.</td> "+
     "<td NOWRAP >Телефон</td> "+
     "<td NOWRAP >E-MAIL</td> "+
     "<td NOWRAP >IP</td> "+
     "<td NOWRAP >Дт. начала действия заявки</td> "+
     "<td NOWRAP >Роль в инф. системе</td> "+
     "<td NOWRAP >Станция</td> "+
     "<td NOWRAP >id СП</td> "+
     "<td NOWRAP >Структурное подразделение</td> "+
     "<td NOWRAP >Должность</td> "+
     "<td NOWRAP >Блокировка</td> "+
     "<td NOWRAP >Дата начала актуальности</td> "+
     "<td NOWRAP >Дата окончания актуальности</td> "+
     "<td NOWRAP >Код услуги</td> "+
     "<td NOWRAP >Наименование услуги</td> "+
     "</tr> ";
    
    
     String rol_us="";
    if(session.getValue("id_role").equals("2")){rol_us= " ";}
    else{rol_us= " and a1.ID_ROLE<>2 ";}
    
    Statement stmt1 = myconnection1.createStatement(); 
    ResultSet rs1 = stmt1.executeQuery(

" select  a1.ID, a1.ID_USER,a1.DT_BIG_Z, a1.DT_END_Z,  "+
"   a2.ID_ROAD_ASU_TR,a2.TAB_NUM,a2.BLOCK_USER,a2.LAST_NAME,a2.FIRST_NAME,a2.MIDDLE_NAME,a2.TEL,a2.IP,a2.E_MAIL,a2.DT_BIG,a2.DT_END, "+ 
"   a3.CODE_SYSTEM,a3.SN_SYSTEM,  "+
"   a5.CODE_USL,a5.FN_USL,  "+
"   a6.id_role, a6.FN_ROLE,  "+
"   a8.FN_STAN,   "+
"   a2.ROAD,  "+
"   a2.SN_JOB  "+
"   from ASU_POL.MAIN_USER_ALL as a2  "+
"   inner join ASU_POL.SOOTV_USER_SYS as a1  on a1.ID_USER=a2.ID and a1.DT_END is  null and a1.ID_system  ="+sys+" "+rol_us+" "+
"   left join ASU_POL.POLYGON_SYSTEM as a3 on a1.ID_SYSTEM=a3.ID_system   "+
"   left join ASU_POL.SOOTV_SYS_USL as a4 on a1.ID_SYSTEM=a4.ID_system  "+ 
"   left join ASU_POL.POLYGON_USL as a5 on a1.ID_USL=a5.ID_USL   "+
"   left join ASU_POL.POLYGON_ROLE as a6 on a1.ID_ROLE=a6.ID_ROLE  "+
"   left join ASU_POL.POLYGON_STAN as a8 on a1.ID_STAN=a8.ID_STAN "+
"   order by a3.FN_SYSTEM,a2.LAST_NAME,a2.FIRST_NAME,a2.MIDDLE_NAME "

);
     int k=1;
     while (rs1.next()){
     if((ss1<=k)&&(k<=ss2)){
     String Road_user="";

     if((Road_user=rs1.getString("ROAD"))==null){Road_user="";}
     boolean t_dor=true;
     int Id_str=rs1.getInt("ID_ROAD_ASU_TR");     
 if(k%2==0){  
 out1=out1+"<tr> ";}else{out1=out1+"<tr bgcolor='#EEEEEE'> ";}
 
 


out1=out1+" <td NOWRAP   > "+
  " <table><tr><td> "+
  " <input type=\"checkbox\" name=\""+k+"_"+rs1.getString("CODE_SYSTEM").trim()+"\" "+ 
  " id=\""+k+"_"+rs1.getString("CODE_SYSTEM").trim()+"\" value=\"checkbox\" "+
  " onClick=\"getCustomerInfo_new_1(this.form, "+
  " '"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_tel', "+
  " '"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_E_MAIL', "+
  " '"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_IP', "+
  " 'd_"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_DT_BIG_Z',"+
  " '"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_FN_ROLE',"+
  " '"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_FN_STAN',"+
  " '"+k+"_button_save"+rs1.getString("CODE_SYSTEM").trim()+"', "+
  " '"+k+"_button_del"+rs1.getString("CODE_SYSTEM").trim()+"',"+ 
  " '"+k+"_"+rs1.getString("CODE_SYSTEM").trim()+"' "+ 
  " );\"> </td><td> "+
  " </td><td> "+
 
 
  " <input  type=\"button\" name=\""+k+"_button_save"+rs1.getString("CODE_SYSTEM").trim()+"\"  "+ 
  " id=\""+k+"_button_save"+rs1.getString("CODE_SYSTEM").trim()+"\" style=\"display:none\"  "+
  " onClick=\"getSave(this.form, "+
  " '"+k+"_button_save"+rs1.getString("CODE_SYSTEM").trim()+"',  "+
  " '"+k+"_button_del"+rs1.getString("CODE_SYSTEM").trim()+"', "+
  " '"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_ID',  "+
  " '"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_user', "+ 
  " '"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_tel', "+
  " '"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_E_MAIL', "+
  " '"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_IP', "+
  " 'd_"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_DT_BIG_Z', "+
  " '"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_FN_ROLE', "+
  " '"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_FN_STAN', "+
  " '"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_ID_ROAD_ASU_TR',  "+
  " '"+k+"_in"+rs1.getInt("ID_USER")+"_tel', "+
  " '"+k+"_in"+rs1.getInt("ID_USER")+"_E_MAIL', "+
  " '"+k+"_in"+rs1.getInt("ID_USER")+"_IP', "+
  " '"+k+"_in"+rs1.getInt("ID_USER")+"_FN_STAN', "+
  " '"+k+"_"+rs1.getString("CODE_SYSTEM").trim()+"' "+ 
  
  "  );\" value='Сохранить' > "+
  " </td><td><input  type=\"button\" name=\""+k+"_button_del"+rs1.getString("CODE_SYSTEM").trim()+"\"  "+
  " id=\""+k+"_button_del"+rs1.getString("CODE_SYSTEM").trim()+"\" style=\"display:none\"  "+
  " onClick=\"getDelet(this.form, "+
  " '"+k+"_button_save"+rs1.getString("CODE_SYSTEM").trim()+"', "+ 
  " '"+k+"_button_del"+rs1.getString("CODE_SYSTEM").trim()+"', "+
  " '"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_ID',  "+
  " '"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_user',  "+
  " '"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_tel', "+
  " '"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_E_MAIL', "+
  " '"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_IP', "+
  " 'd_"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_DT_BIG_Z', "+
  " '"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_FN_ROLE', "+
  " '"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_FN_STAN', "+
  " '"+k+"_"+rs1.getString("CODE_SYSTEM").trim()+"'  "+
  "  );\"  value='Удалить' > "+
  " </td></tr></table> "+
  " </td> "+
  " <td NOWRAP >"+k+"</td> "+
  " <td NOWRAP style=\"display:none\" "+
  
  " id=\""+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_ID\" "+
  " name=\""+k+"_"+rs1.getInt("ID_USER")+"_ID\" "+
  
  "  >"+rs1.getString("ID").trim()+"</td> "+
  
  
  "  <td NOWRAP >"+rs1.getString("SN_SYSTEM").trim()+"</td> "+
  "  <td NOWRAP  style=\"display:none\" >"+rs1.getString("CODE_SYSTEM").trim()+"</td> "+
  "  <td NOWRAP "+
  
  "  id=\""+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_user\" "+
  "  name=\""+k+"_"+rs1.getInt("ID_USER")+"_user\" "+
  
  " style=\"display:none\" >"+rs1.getInt("ID_USER")+"</td> "+
  "  <td NOWRAP >"+rs1.getString("LAST_NAME").trim()+" "+rs1.getString("FIRST_NAME").trim()+" "+rs1.getString("MIDDLE_NAME").trim()+"</td> "+
  " <td NOWRAP>   "+            
  " <div   "+
  "  id=\""+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_tel\" "+
  "  name=\""+k+"_in"+rs1.getInt("ID_USER")+"_tel\" "+
  "  >"+rs1.getString("TEL").trim()+" "+
  " </div> "+
  " </td> "+
  " <td NOWRAP  > "+      
  " <div  "+
  "  id=\""+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_E_MAIL\" "+
  "  name=\""+k+"_in"+rs1.getInt("ID_USER")+"_E_MAIL\" "+
  "  >"+rs1.getString("E_MAIL").trim()+" "+
  " </div> "+
  " </td> "+
  " <td NOWRAP>   "+              
  " <div   "+
   " id=\""+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_IP\" "+
   " name=\""+k+"_in"+rs1.getInt("ID_USER")+"_IP\" "+
   " >"+rs1.getString("IP").trim()+" "+
  " </div> "+
  " </td> "+
  " <td NOWRAP "+
  "  id=\"d_"+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_DT_BIG_Z\" "+
  "  name=\"d_"+k+"_"+rs1.getInt("ID_USER")+"_DT_BIG_Z\" "+
  "  >"+(dateFormatter2.format(rs1.getDate("DT_BIG_Z")).toString())+" "+
  " </td> "+
  

  
 "  <td NOWRAP "+
 "   id=\""+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_FN_ROLE\" "+
 "   name=\""+k+"_"+rs1.getInt("ID_USER")+"_FN_ROLE\" "+
 "   >"+rs1.getString("FN_ROLE").trim()+" "+
"  </td> "+
 "  <td NOWRAP>              "+  
"   <div   "+
 "   id=\""+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_FN_STAN\"  "+
 "   name=\""+k+"_in"+rs1.getInt("ID_USER")+"_FN_STAN\"  "+
 "   >"+rs1.getString("FN_STAN").trim()+" "+
 "  </div> "+
"   </td> "+
  
 "  <td NOWRAP "+
 "   id=\""+k+"_"+rs1.getInt("ID_USER")+"_"+rs1.getString("CODE_SYSTEM").trim()+"_ID_ROAD_ASU_TR\" "+
 "   name=\""+k+"_"+rs1.getInt("ID_USER")+"_ID_ROAD_ASU_TR\"  "+
 "   >"+rs1.getString("ID_ROAD_ASU_TR").trim()+"  "+
"  </td> "+
  
  
  
  
  
 "  <td NOWRAP  >"+Road_user.trim()+"</td> "+
 "  <td NOWRAP >"+rs1.getString("SN_JOB")+"</td> "+
 "  <td NOWRAP >"+rs1.getInt("BLOCK_USER")+"</td> "+
  
 "  <td NOWRAP >"+rs1.getDate("DT_BIG")+"</td> "+
 "  <td NOWRAP >"+rs1.getDate("DT_END")+"</td> "+
 "  <td NOWRAP >"+rs1.getString("CODE_USL").trim()+"</td> "+
 "  <td NOWRAP >"+rs1.getString("FN_USL").trim()+"</td> "+
 "  </tr> ";
  
  
  

   
   
   k=k+1;   }else{k++;}
   }
    //while (rs1.next()){k++;}
     
     
     
rs1.close();
stmt1.close(); 
 
 out1=out1+"   </table> "+
 "</td></tr>";
 


out3=out3+"<tr><td><table><tr>";
 int ke=0;
   if((k%30)==0){ke=k/30;}else{ke=(k-k%30)/30+1;}
   
for(int ki=0; ki<ke;ki++){
 if((ki*30+1)==ss1){
   out3=out3+"  <td style='cursor:pointer' bgcolor='#B2B2B2' NOWRAP onClick=\"CHEKSYS2(this.form,'id1_"+sys+"','in1_"+sys+"','"+sys+"','"+(ki*30+1)+"','"+((ki+1)*30)+"')\" >"
  +(ki+1)+" "+
// " <input id=\"in1_"+sys+"\" type=\"button\" value='Показать' "+
 //" onClick=\"CHEKSYS1(this.form,'id1_"+sys+"','in1_"+sys+"','"+sys+"','"+ki*30+1+"','"+(ki+1)*30+"')\" /  >  "+
 "  </td>";  
     
     }else{
 out3=out3+"  <td style='cursor:pointer' NOWRAP onClick=\"CHEKSYS2(this.form,'id1_"+sys+"','in1_"+sys+"','"+sys+"','"+(ki*30+1)+"','"+((ki+1)*30)+"')\" >"
  +(ki+1)+" "+
// " <input id=\"in1_"+sys+"\" type=\"button\" value='Показать' "+
 //" onClick=\"CHEKSYS1(this.form,'id1_"+sys+"','in1_"+sys+"','"+sys+"','"+ki*30+1+"','"+(ki+1)*30+"')\" /  >  "+
 "  </td>";}
}
 out3=out3+"   </tr></table></td></tr>";



out0=out0+out3+out1+out3+"</table> ";


 

 
 
 
 
 
 //"  </div> ";
  myconnection1.close();
 } catch (SQLException e) { out0="<tr>Ошибка "+e+"</tr>";} 
 
  
out.println(out0);
   

}}%>    