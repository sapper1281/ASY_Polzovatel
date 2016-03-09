<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>



 <% if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){
response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");
      
       
     /*  try{
       Thread.sleep(1000);
} catch(Exception ex){ex.printStackTrace();}     
 */
int ss= Integer.parseInt(request.getParameter("ss"));
//int v=Integer.parseInt(session.getValue("v").toString())-ss;
//String d=""+ss;
//session.putValue("v", d) ;

String dt="<div id=\"div"+ss+"\"><img src=\"images/status_anim.gif\" style=\"display:none\" id=\"img"+ss+"\"/></div>";



out.println(dt);
  } %>