/*
 * SessionTracking.java
 *
 */

package com;

/**
 *
 * @author  apopovkin
 */

import java.util.Enumeration;
import java.util.GregorianCalendar;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;

public class SessionTracking implements HttpSessionListener
{
    private static int SessionsCount;
    
    public SessionTracking()
    {
        this.SessionsCount=0;
    }
    
    
    
    
    
    
    public void SessionCount( HttpServletRequest request)
    {
       
         
      HttpSession session=   request.getSession();
      SessionsCount=0;
      String SessionsName="";
      
      
      
      ServletContext servletContext = session.getServletContext();
      SessionTracking_class sessionTop= new SessionTracking_class();
      
      GregorianCalendar calendar = new GregorianCalendar();
      
      
    
      Enumeration attributes = servletContext.getAttributeNames();
      
     
      
      
        do
        {
         if(!attributes.hasMoreElements())
            break;
            String attrName = (String)attributes.nextElement();
            SessionTracking_class attrValue=null;
            
            
            if(attrName.substring(0, 8).equals("___id___")){
            
            attrValue = (SessionTracking_class)servletContext.getAttribute(attrName);
            
          
            
            if(attrValue.getses_Name()!=null)
            {
             
                    { SessionsCount++;
                      SessionsName=attrValue.getses_Name()+","+SessionsName;
                      //System.out.println(" � �� "+SessionsCount);
                }}}
        } while(true);

    
     
    // session.setAttribute("attrName", "___id___"+session.getId());
     session.setAttribute("SessionsCount", SessionsCount+"");
     session.setAttribute("SessionsName", SessionsName);
    // session.setAttribute("SessionsTime", String.valueOf(SessionsTime));
     
   
        
        
    }
    
    
    
     
       
        
      
        
   
    
    
    
    
     
       
   
     public void sessionCreated(javax.servlet.http.HttpSessionEvent httpSessionEvent) {
      
    //  System.out.println(" BEGIN  ");    
         
      HttpSession session=   httpSessionEvent.getSession();
      SessionsCount=1;
      String SessionsName="";
      
      
      
      ServletContext servletContext = session.getServletContext();
      SessionTracking_class sessionTop= new SessionTracking_class();
      
      GregorianCalendar calendar = new GregorianCalendar();
      long SessionsTime=calendar.getTimeInMillis();
      
      sessionTop.setses_Name(null);
      sessionTop.setses_Time(SessionsTime);
      
      servletContext.setAttribute("___id___"+session.getId(), sessionTop);
    
      
      
      
      
      Enumeration attributes = servletContext.getAttributeNames();
      
     
      
      
        do
        {
         if(!attributes.hasMoreElements())
            break;
            String attrName = (String)attributes.nextElement();
            SessionTracking_class attrValue=null;
            
            
            if(attrName.substring(0, 8).equals("___id___")){
            
            attrValue = (SessionTracking_class)servletContext.getAttribute(attrName);
            
              
            if(attrValue.getses_Name()!=null)
            {
                   { SessionsCount++;
                      SessionsName=attrValue.getses_Name()+","+SessionsName;
                    }}}
        } while(true);

 
     
     session.setAttribute("attrName", "___id___"+session.getId());
     session.setAttribute("SessionsCount", SessionsCount+"");
     session.setAttribute("SessionsName", SessionsName);
     session.setAttribute("SessionsTime", String.valueOf(SessionsTime));
     
 
  
     }
     
     
     
     
     
     
     public void sessionDestroyed(javax.servlet.http.HttpSessionEvent httpSessionEvent) {
       HttpSession session=   httpSessionEvent.getSession();
       
       ServletContext servletContext = session.getServletContext();
       Enumeration attributes = servletContext.getAttributeNames();
        do
        {
         if(!attributes.hasMoreElements())
            break;
            String attrName = (String)attributes.nextElement(); 
            
            if(attrName.substring(0, 8).equals("___id___")){
            SessionTracking_class attrValue = (SessionTracking_class)servletContext.getAttribute(attrName);
           
            
          
            
            if(attrName.equals("___id___"+session.getId())){
             SessionTracking_class sessionTop= new SessionTracking_class();
             sessionTop.setses_Name(null);
             sessionTop.setses_Time(0);
             servletContext.setAttribute("___id___"+session.getId(), sessionTop);
             }
            
            
            
       
            
            }
           
        } while(true);
      
     session.setAttribute("attrName", null);
     session.setAttribute("SessionsCount", null);
     session.setAttribute("SessionsName", null);
     session.setAttribute("SessionsTime", null);
      session.setAttribute("LAST_NAME",null);
 session.setAttribute("FIRST_NAME",null);
 session.setAttribute("MIDDLE_NAME",null);
 session.setAttribute("login",null);
 session.setAttribute("id_role",null);
 session.setAttribute("fn_role",null);
 session.setAttribute("id_us",null);
 
     }
     
   
    
    
    
    
    
    
}