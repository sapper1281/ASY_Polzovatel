<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@page import= "com.Vvod_Save"%>



 <% 
 
 
Object lock = new Object(); 
synchronized(lock)
     {
 
   if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)&&((session.getValue("id_role").equals("2"))||(session.getValue("id_role").equals("3")))){
response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");

      
       
request.setCharacterEncoding("UTF-8");
        String charset = "windows-1251";
        response.setContentType("text/html; charset=" + charset);  

//Vvod_Save.Vvod_Save();%>
<jsp:useBean id="Bean_Vvod_Save" class="com.Vvod_Save" scope="request"/>
<jsp:setProperty name="Bean_Vvod_Save" property="*"/>
<%
String dtt=request.getParameter("ss");

String[] param=dtt.split("/"); 
String vse=" ";
String vse_out=" ";

vse_out=vse_out+"<tr style='position: relative;top: expression(this.parentElement.parentElement.parentElement.scrollTop);z-index: 1000;' bgcolor='#B2B2B2'><td>№</td> "+
  " <td  NOWRAP >ФИО</td> "+
  " <td  NOWRAP >СП</td> "+
  " <td  NOWRAP >Станция</td> "+
  " <td  NOWRAP >Система</td> "+
  " <td NOWRAP >Роль</td> "+
  " <td NOWRAP >№ заявки</td> "+
  " <td NOWRAP >Должность</td> "+
  " <td NOWRAP >Дата нач. действия заявки</td> "+
  " <td NOWRAP >Тел.</td> "+
  " <td NOWRAP >IP</td> "+
  " <td NOWRAP >E-Mail</td> "+
  " </tr>";




boolean t_pr=true;





//String sql_param="<td>-9999";
//String sql_sys_role="<td>-999";
//String sql_sys_role_open_sys="<td>-999";
//String sql_sys_role_open_role="<td>-999";

int g_fio_1=1;
int g_road_1=2;
int g_stan_1=3;
int g_num_z_1=5;
int g_job_1=6 ; 
int g_dt_big_z_1=7  ;
int g_tel_1=8 ;  
int g_ip_1=9 ;  
int g_mail_1=10 ; 
int g_param_1=4;
int g_param=1;
int iff=1;


while(g_param<param.length){
   
      String fio=" "; 
      String road = " ";
      String stan = " ";
      String usl = " "; 
      String system=" ";
      String role = " ";
      String num_z = " ";
      String job = " ";
      String dt_big_z = " ";
      String tel = " ";
      String ip = " ";
      String mail = " ";
      String dt_end_z = " ";      
      String user_log = "log";
      String user_pas = "pas";
 if(g_param==g_fio_1){fio=param[g_param];g_fio_1=g_fio_1+10;} 
 if((g_param+1)==g_road_1){road=param[(g_param+1)];g_road_1=g_road_1+10;}    
 if((g_param+2)==g_stan_1){stan=param[(g_param+2)];g_stan_1=g_stan_1+10;}    
 if((g_param+4)==g_num_z_1){num_z=param[(g_param+4)];g_num_z_1=g_num_z_1+10;}    
 if((g_param+5)==g_job_1){job=param[(g_param+5)];g_job_1=g_job_1+10;}    
 if((g_param+6)==g_dt_big_z_1){dt_big_z=param[(g_param+6)];g_dt_big_z_1=g_dt_big_z_1+10;}    
 if((g_param+7)==g_tel_1){tel=param[(g_param+7)];g_tel_1=g_tel_1+10;}    
 if((g_param+8)==g_ip_1){ip=param[(g_param+8)];g_ip_1=g_ip_1+10;}    
 if((g_param+9)==g_mail_1){mail=param[(g_param+9)];g_mail_1=g_mail_1+10;}  

      
if((g_param+3)==g_param_1){
String[] sys_role= param[(g_param+3)].split("!");
for  (int g_sys_role=1;g_sys_role<sys_role.length-1; g_sys_role++){
String[] sys_role_open= sys_role[g_sys_role].split("_");

for  (int g_sys_role_open=1;g_sys_role_open<sys_role_open.length-1; g_sys_role_open++){
if(g_sys_role_open==1){system=sys_role_open[g_sys_role_open];//}
//if(g_sys_role_open==2){
role=sys_role_open[(g_sys_role_open+1)];}

//system=sys_role_open[1];
//role=sys_role_open[2];

if(!system.equals("-1")){


String priz="not_r3";



if(t_pr){
  
vse_out=  vse_out+ "<tr bgcolor='#E4E2E0'><td>"+iff+"</td>"+Bean_Vvod_Save.Vvod_Save(priz,fio,road,stan,system,role,num_z,job,dt_big_z,tel,ip,mail,request,response,user_log,user_pas)+" ";    
t_pr=!t_pr;

}else{
vse_out=  vse_out+ "<tr bgcolor='#F0F0F0'><td>"+iff+"</td>"+Bean_Vvod_Save.Vvod_Save(priz,fio,road,stan,system,role,num_z,job,dt_big_z,tel,ip,mail,request,response,user_log,user_pas)+" ";    

t_pr=!t_pr;
}


//vse_out=vse_out+"<tr><td>"+fio+"</td><td>"+road+"</td><td>"+stan+"</td><td>"+system+"</td><td>"+role+"</td><td>"+num_z+"</td><td>"+job+
//"</td><td>"+dt_big_z+"</td><td>"+tel+"</td><td>"+ip+"</td><td>"+mail+"</td></tr>"; 
 
iff++;

}




}




} 
g_param_1=g_param_1+10;
}






g_param=g_param+10;
}



//String  dt_param="<table border='1'><tr>"+sql_param+"</td></tr></table>";
//String  dt_sys_role="<table border='1'><tr>"+sql_sys_role+"</td></tr></table>";
//String  dt_sql_sys_role_open_sys="<table border='1'><tr>"+sql_sys_role_open_sys+"</td></tr></table>";
//String  dt_sql_sys_role_open_role="<table border='1'><tr>"+sql_sys_role_open_role+"</td></tr></table>";
String  dt_Vse=

"<div style=\"OVERFLOW: auto; WIDTH: 1000px; HEIGHT: 500px\">"+ 
"<table border='1'>"+vse_out+"</table>"+
"</div>"

;



out.println(dt_Vse/*dt_param+dt_sys_role+dt_sql_sys_role_open_sys+dt_sql_sys_role_open_role+dt_Vse*/);
  }} %>