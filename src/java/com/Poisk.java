/*
 * Poisk.java
 *
 * проверка
 */


package com;



import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;
import java.sql.*;
import javax.naming.*;

/**
 *
 * @author  apopovkin
 * @version
 */
public class Poisk extends HttpServlet {
    
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
    public void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Context    initContext   = null;
 Context    envContext    = null;
 DataSource dataSource    = null;
 Connection connection    = null;
 ResultSet  resultSet     = null;
 ResultSet  resultSet1     = null;
 Statement  statement0     = null;
 Statement  statement1     = null;
 PrintWriter out = response.getWriter();
try {        
  

initContext = new InitialContext();
          dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/dbASY_Polzovatel");
            

  if (dataSource != null) {
                connection = dataSource.getConnection();
                }
                if (connection != null) {
                statement0 = connection.createStatement();
                
                }
if (statement0 != null) {
  resultSet = statement0.executeQuery(  
  
" select *  from ASU_POL.POLYGON_ROAD ");

out.print("11111111111111111111111111111111111111111111111");

 while (resultSet.next()) {
out.print(resultSet.getString("SN_ROAD"));

}}
 resultSet.close();
            statement0.close();
            
            
            connection.close();



  } catch (Exception e) {out.print(e); }
 
    }
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    Object lock = new Object(); 
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
       synchronized(lock)
       { processRequest(request, response);}
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       
        synchronized(lock)
        {processRequest(request, response);}
    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    
}