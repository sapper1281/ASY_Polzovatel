/*
 * Logout.java
 * 
 */

package com;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import java.io.IOException;
/**
 *
 * @author  apopovkin
 * @version
 */
public class Logout extends HttpServlet {
    
    /** Initializes the servlet.
     */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        
    }
    
    /** Destroys the servlet.
     */
    public void destroy() {
        
    }
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    public void processRequest(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setAttribute("LAST_NAME",null);
 session.setAttribute("FIRST_NAME",null);
 session.setAttribute("MIDDLE_NAME",null);
 session.setAttribute("login",null);
 session.setAttribute("id_role",null);
 session.setAttribute("fn_role",null);
 session.setAttribute("id_us",null);
        ServletContext servletContext = session.getServletContext();
        
        SessionTracking_class sessionTop= new SessionTracking_class();
             sessionTop.setses_Name(null);
             sessionTop.setses_Time(0);
             servletContext.setAttribute(session.getAttribute("attrName").toString(), sessionTop);
      
      

        if( session != null )
        {
            session.invalidate();
        }

        req.getRequestDispatcher("/").forward(req,res);
        
        
        
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
     { processRequest(request, response);}
    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    
}
