<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<%@page import= "java.io.*"%>
<%@page import= " org.json.*"%>
<%@page import= " java.util.*"%>

<%@page import= " javax.servlet.*"%>

<%@page import= " javax.servlet.http.*"%>
<%@page import= "java.sql.*"%>
<%@page import= " java.net.*"%>
<%@page import= " java.lang.*"%>

<%@page import= " java.io.*"%>
<%@page import= "java.net.*"%>
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
<%@page import= " java.io.*"%>
<%@page import= " java.util.Date"%>
<%@page import= " java.net.*"%>
<%@page import= " javax.servlet.*"%>
<%@page import= " javax.servlet.http.*"%>
<%@page import= " javax.naming.InitialContext"%>
<%@page import= " javax.sql.DataSource"%>
<%@page import= " java.sql.*"%>
<%@page import= " java.util.*"%>
<%@page import= " javax.naming.*"%>
<%@page import= " java.text.*"%>
<%@page import= " java.lang.*"%>
<%@page import= " java.math.*"%>





<table border='1'>
<%

Object lock = new Object(); 
synchronized(lock)
     {
%> <tr><td>g123465</td></tr>
<%

response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");




SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd.MM.yyyy");


out.println("par0");
  
       try {  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
          }catch(Throwable theException) {out.println(theException);}  
  


try {     
        request.setCharacterEncoding("UTF-8");
        String charset = "windows-1251";
        response.setContentType("text/html; charset=" + charset);  

       String par="Сергей Ильич Жемчужников";
       String sys="P58";

       Connection connection1 = DriverManager.getConnection ("jdbc:odbc:P58");
       
       out.println(par);
       
       
   %>
<%    
       
       
       
    out.println("par0_1");
  
       
       
       out.println(par);
       out.println("par1");
       Statement stmt10 = connection1.createStatement(); 
       out.println("par2");
      
ResultSet rs10 = stmt10.executeQuery("SELECT * FROM A ");
 out.println("par3");
      
   %><%  
   int t=1;
   boolean d=false;
   out.println("Результат поиска: " +par);
   
   %> <tr bgcolor='#F0F0F0'><td>Пользов.</td><td>Полное имя</td><td>Блокир.</td><td>Действ. по</td><td>Осталось дней</td></tr>
      
<%
   //String lang1 = "";
   
      boolean t1=true;
        while (rs10.next()) {
            
         String lang0 = rs10.getString(1);
         //String lang1 = rs10.getString(2);
       //  String lang2 = rs10.getString(3);String lang3 = rs10.getString(4);
         
       //  Date lang3 = rs10.getDate(7);
         String lang3_1="";
         %>
         <tr><td><%=lang0%></td>
         </tr>
         
         <%--
         
         
         if(lang0==null){lang0="нет информации";}
         if(lang1==null){lang1="нет информации";}
         if(lang2==null){lang2="нет информации";}
         
         t1=!lang1.equals(par);
         if(!t1){
             double razn=0;
             int razn_1=0;
          if(lang3!=null){    
        /*  Calendar BW_DT_1=Calendar.getInstance();
          long vr=lang3.getTime()-BW_DT_1.getTime().getTime();  
          double vr1=(double)vr;
          razn=(double)vr1/(1000*60*60*24);*/
          

           }else{  lang3_1="нет информации";}
             
         %> <tr><td><%=lang0%></td><td><%=lang1%></td><td><%=lang2%></td>

<%if(lang3_1.equals("")){%>
<td><%=dateFormatter2.format(lang3)%></td>

<%}else{%><td><%=lang3_1%></td><%}%>

<%if(razn>0){%>

<td  bgcolor='#ccff99'><%=Math.round(razn)%></td>
<%}else{%>


<%if(lang3_1.equals("")){%>
<td bgcolor='#ff9999'>истек</td>
<%}else{%><td bgcolor='yellow'>нет информации</td><%}%>

<%}%>
</tr>
      <%}


 --%><%
t++;
}
 %>
</table>


<%

      %><%
 rs10.close();
stmt10.close(); 
       
%>
  <%   
connection1.close();
     } catch (SQLException e){ out.println(e);}
 } %>

