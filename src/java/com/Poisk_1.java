/*
 * Poisk_1.java
 *
 * 
 */

package com;





import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
/**
 *
 * @author  apopovkin
 * @version
 */
public class Poisk_1 extends HttpServlet {
    
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
        request.setCharacterEncoding("UTF-8");
        String charset = "WINDOWS-1251";
        response.setContentType("text/html; charset=" + charset);  
        PrintWriter out = response.getWriter();
       String requestEnc = "ISO-8859-1";
       HttpSession session = request.getSession();
       
       
  // if(!session.isNew()&&(session.getValue("id_role").equals("2")||session.getValue("id_role").equals("3"))){         
        
       
   // String clientEnc = request.getParameter("charset");
   //if( clientEnc==null ) 
  String clientEnc="UTF-8";    
   String d = request.getParameter("fio");
  // out.println(d);
   String out1="";
   out1=out1;//+d;
if(d.length()>5){
 //  if( d!=null )
   //  d = new String(d.getBytes("UTF-8"),"Cp1251");
        
     /*  try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
      
          }catch(Throwable theException) {theException.printStackTrace();} 
        
       
        try {     
      String UserID = "db2admin";
      String Password = "11111111";
     //String Password = "D2_12345678";
      
      Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , UserID, Password);*/
     Connection myconnection1=null;
      try {
        myconnection1 = new Connection_ASU_POL().getConnection();
    
 d=d+" ";
      String LAST_NAME_1="";
        String FIRST_NAME_1="";
        String MIDDLE_NAME_1="";
      int i=0;
        boolean t_nas=true;
        boolean t_end=true;
        boolean end=true;
        int i_nas=0;
        int i_end=d.length()-1;
        while( (i<d.length())&&(t_nas||t_end)&&end){
         i_nas=0;
         i_end=d.length()-1;    
        while(t_nas && (i<d.length()) && (String.valueOf(d.charAt(i)).equals(" "))  ){i++;}
        if(t_nas && (i<d.length()) && (!(String.valueOf(d.charAt(i)).equals(" ")))  )
        {t_nas=false;i_nas=i;i++;}
        while(t_end && (i<d.length()) && (!(String.valueOf(d.charAt(i)).equals(" ")))  ) {i++;}
        if(t_end && (i<d.length()) && (String.valueOf(d.charAt(i)).equals(" "))  )
        {t_end=false;i_end=i;i++;}
        if((i_nas!=i_end)&&(i_end!=0)&&!t_nas&&!t_end){
        if(LAST_NAME_1.equals("")){
           LAST_NAME_1=d.substring(i_nas,i_end);
        }
        else{
        if(FIRST_NAME_1.equals("")){
            FIRST_NAME_1=d.substring(i_nas,i_end);
        }else{
        if(MIDDLE_NAME_1.equals("")){
            MIDDLE_NAME_1=d.substring(i_nas,i_end);
        end=false;
        }}}}
        t_nas=true;
        t_end=true;
        }
      d=LAST_NAME_1+FIRST_NAME_1+MIDDLE_NAME_1;
      
      
Statement stmt = myconnection1.createStatement(); 
ResultSet rs = stmt.executeQuery(


" select a1.ID, a1.ID_ROAD_ASU_TR, a1.TAB_NUM, a1.ID_JOB, a1.BLOCK_USER, a1.PFR,  " +
 "    a1.LAST_NAME, a1.FIRST_NAME, a1.MIDDLE_NAME, a1.TEL, a1.IP, a1.E_MAIL, a1.DT_BIG, a1.DT_END,  " +
   // --a2.FN_ROAD 
" 	a1.ROAD  " +
"     from ASU_POL.MAIN_USER_ALL as a1   " +
  //  -- left join ASU_POL.POLYGON_ROAD as a2 on a1.ID_ROAD_ASU_TR=a2.ID_ROAD_ASU_TR 
"      where BLOCK_USER<>1  and (R3_YES_OR_NIOT='yes' or R3_YES_OR_NIOT is null) " +
"   and  " +
"   LCASE(rtrim(LAST_NAME)||rtrim(FIRST_NAME)||rtrim(MIDDLE_NAME))  like LCASE(rtrim('"+d+"%')) " +
 //-- and 
//  -- a2.DT_VVOD=(select DT_VVOD1 from(select max(DT_VVOD) as DT_VVOD1  from ASU_POL.POLYGON_ROAD ) as sa )  
 "   order by LAST_NAME,FIRST_NAME,MIDDLE_NAME  " 

); 
 i=1;


out1=out1+"<div  width=\"100%\" align=\"top\" name=\"td11_11\" id=\"td11_11\"  >"+
"<table><tr><td><div style=\"OVERFLOW: auto; WIDTH: 1000px; HEIGHT: 500px\"   ><table>";

boolean r=true; 
boolean r1=true;
while(rs.next()){
    int ID_JOB=rs.getInt("ID_JOB");
    int ID=rs.getInt("ID");
    int ID_ROAD_ASU_TR=rs.getInt("ID_ROAD_ASU_TR");
    String LAST_NAME=rs.getString("LAST_NAME").trim();
    String FIRST_NAME=rs.getString("FIRST_NAME").trim();
    String MIDDLE_NAME=rs.getString("MIDDLE_NAME").trim();
    String ROAD=rs.getString("ROAD").trim();
    if (r1){
  out1=out1+"<tr  bgcolor='#E4E2E0' >";r1=false;}
    else{out1=out1+"<tr  bgcolor='#F0F0F0' >"; r1=true;}
  
  if(!ROAD.equals("Не определено")) {
  if(r){
  out1=out1+ 
  "<td><input id='Poi_1' name='Poi_1' type='radio' checked value='"+ID_JOB+"|"+ID+"|"+ID_ROAD_ASU_TR+"|"+
  LAST_NAME+"|"+FIRST_NAME+"|"+MIDDLE_NAME+"'></td>";
  r=false;
  }
  else{
   out1=out1+ "<td><input id='Poi_1' name='Poi_1' type='radio'  value='"+ID_JOB+"|"+ID+"|"+ID_ROAD_ASU_TR+"|"+
   LAST_NAME+"|"+FIRST_NAME+"|"+MIDDLE_NAME+"'></td>";
  } }else{out1=out1+"<td>&nbsp;</td>";}
   
  
   
   out1=out1+"<td>"+   LAST_NAME+" "+FIRST_NAME+" "+MIDDLE_NAME+" ["+ROAD+"]"+" </td>";
   
  out1= out1+"</tr>";
   
   // i++;
 }

 out1= out1+
"</table></div></td></tr><tr>"+
"<td align=center>"+
"<input type=\"button\" value=\"Вывести\" onClick=\"getCustomerInfoPoisk_1('Poi_1','yes');\" style=\"cursor:pointer;\" class=button></td>"+
"</tr>"+
"</table>"+
"</div>";
  
//finalize();
  rs.close();
  stmt.close();
  
  
  out.println(out1);
 myconnection1.commit();
            } catch (Exception e) {
            e.printStackTrace();
            } finally {
            // Обязательно закрываем соединение с БД!
            new Connection_ASU_POL().closeConnection(myconnection1);
            }
      
}

   // }
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