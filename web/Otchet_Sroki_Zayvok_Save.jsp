
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
<%@page import= " javax.mail.internet.*"%>
<%@page import= " javax.mail.*"%>

<%@page import= " javax.activation.*"%>


<%@page import= " java.text.ParseException"%>
<%@page import= " java.text.SimpleDateFormat"%>


<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="UTF-8" %>

<%if(session.getValue("id_role").equals("2")||session.getValue("id_role").equals("3")){ 
response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");

Object lock = new Object(); 
synchronized(lock)
       {%>
<%try {         
 try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
          }catch(Throwable theException) {theException.printStackTrace();} 
       Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "11111111");  


request.setCharacterEncoding("UTF-8");
        String charset = "windows-1251";
        response.setContentType("text/html; charset=" + charset);  

String ss0=request.getParameter("ss0"); 
 String ss=request.getParameter("ss"); 
 String ss1=request.getParameter("ss1"); 

if(ss0.equals("1")){
if(!ss1.trim().contains(" ")&&ss1.contains("@")&&(ss1.contains("@SERW.RZD")||ss1.contains("@serw.rzd"))&&!ss1.trim().startsWith("@",0)){%>

 
<input type="checkbox" id="chek<%=ss%>" name="chek<%=ss%>" checked/>
<%}else{  %> 
<input type="button" id="but<%=ss%>" name="but<%=ss%>" value='Сохранить'
onClick="ClickButt('<%=ss%>')"/> 


<%}%>
<%}else{
    
if(ss0.equals("2")){   
if(!ss1.trim().contains(" ")&&ss1.contains("@")&&(ss1.contains("@SERW.RZD")||ss1.contains("@serw.rzd"))&&!ss1.trim().startsWith("@",0)){%>
<%=ss1%>
<%}else{  %> 
<input type="text"  id="inmail<%=ss%>" name="inmail<%=ss%>" value='<%=ss1%>'/>
<%}%>
<%}else{

if(ss0.equals("3")){
String ss2=request.getParameter("ss2");     
    
if(!ss1.trim().contains(" ")&&ss1.contains("@")&&(ss1.contains("@SERW.RZD")||ss1.contains("@serw.rzd"))&&!ss1.trim().startsWith("@",0)){
String id_user=request.getParameter("id_user");

%>
<table>
<tr>
<td 
NOWRAP id="fio<%=ss%>" name="fio<%=ss%>"><%=ss2%></td>
</tr>
</table>

<% 
PreparedStatement stmt_up = myconnection1.prepareStatement(
  " UPDATE ASU_POL.MAIN_USER_ALL SET  " +
  " e_mail= '"+ss1.trim()+"'" +
  " where ID="+id_user+" ");
  stmt_up.executeUpdate();
  stmt_up.close();   %>







<%}else{  %> 
<table>
<tr><td style="background: #FF0000;"
NOWRAP id="fio<%=ss%>" name="fio<%=ss%>"><%=ss2%></td>
</tr>
</table>

<%}%>
<%}}




}















if(ss0.equals("4")){ 
  
    
    Statement stmt_s = myconnection1.createStatement(); 
ResultSet rs_s = stmt_s.executeQuery(

  " select ID, ID_SYSTEM, CODE_SYSTEM, SN_SYSTEM, FN_SYSTEM, MY_SYSTEM "+
  "   , DT_BIG, DT_END, ID_PARRENT "+
  " from ASU_POL.POLYGON_SYSTEM where ID_SYSTEM="+ss+" "+
  " order by ID; ");
   while(rs_s.next()){ 
    ss=rs_s.getString("SN_SYSTEM").trim();
   } 
    
    rs_s.close() ;  
 stmt_s.close() ; 
    
  
 Statement stmt = myconnection1.createStatement(); 
ResultSet rs = stmt.executeQuery(

  " select ID, ID_ROAD_ASU_TR, TAB_NUM, ID_JOB, BLOCK_USER, PFR, "+
  " LAST_NAME||' '||FIRST_NAME||' '||MIDDLE_NAME as fio, TEL, IP, E_MAIL, DT_BIG, "+
  " DT_END, PRIZ, ROAD, SN_JOB, R3_YES_OR_NIOT "+
  " from ASU_POL.MAIN_USER_ALL where ID="+session.getValue("id_us")+" "+
  " order by 1; ");
String mailuser="";
String fio="";
String tel="";
String sql_0_mail="";
while(rs.next()){  
    fio=rs.getString("fio");
    tel=rs.getString("TEL");
    mailuser=rs.getString("E_MAIL");
    
   // ss1="!apopovkin@serw.rzd!";
   String[] stt_mail=ss1.split("!");  


    for  (int g1=1;g1<stt_mail.length; g1++){
    sql_0_mail=sql_0_mail+","+stt_mail[g1];
    String us="<h4> Добрый день!</h4>"+
"<H4>Истек срок действия заявки на подключение системы "+ss+"</h4>"+
"<H4>Прошу переоформить заявку в системе <a href=\"http://asuzir.serw.rzd/asu_zir/main.jsp\"  target=_blank>АСУ ЗИР</a></h4>"+
"<H4>С Уважением "+fio+", тел.:"+tel+"</H4> ";
     String from = mailuser;
      String host = "10.58.0.47";
      Properties properties = System.getProperties();
      properties.setProperty("mail.smtp.host", host);
      Session session1 = Session.getDefaultInstance(properties);

      try{
         MimeMessage message = new MimeMessage(session1);
         message.setFrom(new InternetAddress(from));
         message.addRecipient(Message.RecipientType.TO,
                                  new InternetAddress(stt_mail[g1]));
         message.setSubject("ASU Polzovatel");
         message.setContent(us,"text/html; charset=windows-1251" );
       

         
         
  
         Transport.send(message);
         System.out.println("Sent message successfully....");
      }catch (MessagingException mex) {
         mex.printStackTrace();
   }

} }
 rs.close() ;  
 stmt.close() ;   
 
 
 %> 
Сообщения отправлено по следующим адресам: <%=sql_0_mail%>
<% 
}



%>

<%myconnection1.close();} catch (SQLException e) {   %> <tr>Ошибка <%=e%></tr> <%}%>       
<%}}%>
