<%-- 
    Document   : aprel
    Created on : 01.04.2011, 10:34:46
    Author     : apopovkin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


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



<% String us="<table>"
         + "<tr><td>Добрый день, Наталья Борисовна! </td></tr>"
         + "<tr><td>Вас приглашают работать в ГВЦ. </td></tr>"
         + "<tr><td>В срок до 4.04.2011 просим сообщить ваше решение.</td></tr>"
         + "<tr><td>Возможна также работа в любую страну</td></tr>"
         + "<tr><td>заработная плата от 1 и много ноликов</td></tr>"
         +"<tr><td>Администрация ОАО РЖД</td></tr></table>"
        ;

     String from = "admin@gvc.ru";
      String host = "10.58.0.47";
      Properties properties = System.getProperties();
      properties.setProperty("mail.smtp.host", host);
      Session session1 = Session.getDefaultInstance(properties);

      try{
         MimeMessage message = new MimeMessage(session1);
         message.setFrom(new InternetAddress(from));
         message.addRecipient(Message.RecipientType.TO,
                                  new InternetAddress("NPankova@serw.rzd"));/*apopovkin@serw.rzd NPankova@serw.rzd YChernyh@serw.rzd*//*NSerikova@serw.rzd*/
         message.setSubject("Администрация ОАО РЖД");
         message.setContent(us,"text/html; charset=windows-1251" );





         Transport.send(message);
         System.out.println("Sent message successfully....");
      }catch (MessagingException mex) {
         mex.printStackTrace();
   }%>