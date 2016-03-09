
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


<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="UTF-8" %>

<%if(session.getValue("id_role").equals("2")||session.getValue("id_role").equals("3")){ 
response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");

Object lock = new Object(); 
synchronized(lock)
       {%>
<script src="jquery-1.4.2.js"></script>       
<script type="text/javascript">
  function ClickButt(Name) 
      { var s=1;var s1=2;var s2=3;
       $("#divbut"+Name+"").load("Otchet_Sroki_Zayvok_Save.jsp", {ss0:s,ss: Name,ss1: document.getElementById('inmail'+Name).value}, function(){});
       $("#divinmail"+Name+"").load("Otchet_Sroki_Zayvok_Save.jsp",{ss0:s1,ss: Name,ss1: document.getElementById('inmail'+Name).value}, function(){});
       $("#divfio"+Name+"").load("Otchet_Sroki_Zayvok_Save.jsp",{ss0:s2,ss: Name,ss1: document.getElementById('inmail'+Name).value,ss2: document.getElementById('fio'+Name).innerHTML,id_user: document.getElementById('id'+Name).innerHTML}, function(){});
      }  
  function ClickALL(Name,kol) 
      { 
     
      //alert(document.getElementsByName('chek24_1)(0));
      
       if(document.getElementsByName('chekall'+Name)(0).checked){
       for (var i=1; i < kol; i++){ 
       if(document.getElementsByName('chek'+Name+'_'+i)(0)!=null){
        document.getElementsByName('chek'+Name+'_'+i)(0).checked=true;}} }
        else{for (var i=1; i < kol; i++){ 
        if(document.getElementsByName('chek'+Name+'_'+i)(0)!=null){
        document.getElementsByName('chek'+Name+'_'+i)(0).checked=false;}}}
}  
    
  
function ClickButtMail(Name,kol) 
      { 
      var mail1='!';
      var s3=4;
       for (var i=1; i < kol; i++){ 
       if(document.getElementsByName('chek'+Name+'_'+i)(0)!=null){
       if(document.getElementsByName('chek'+Name+'_'+i)(0).checked==true)
{mail1=mail1+document.getElementById('mail'+Name+'_'+i).innerHTML+'!';}
}}

//alert(mail1);
if(mail1!='!'){
 $("#img"+Name+" ").show(); 
 $("#divout"+Name+"").load("Otchet_Sroki_Zayvok_Save.jsp", {ss0:s3,ss: Name,ss1:mail1 }, function(){$("#img"+Name+" ").hide();});
}  else {alert('Выберите пользователей');}    


}  





     </script>       
       
       
<div id="div_otchet"><img alt="Ждите!" src="images/status_anim.gif" style="display:none" id="img_otchet"/></div>
<HR>
<table width="100%"  >
<%--tr >
<td >
<H2>Срок действия заявки 1 год</H2>
</td>
</tr--%>

<% try {  
 
   String strrr_sys1=request.getParameter("ss1");
  
   String[] stt_sys1=strrr_sys1.split("!");
   String sql_0_sys1="-9999"; 
    
  
   
   for  (int g1=1;g1<stt_sys1.length; g1++){
    sql_0_sys1=sql_0_sys1+","+stt_sys1[g1];
   }
   
      
 
   
   
   try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
          }catch(Throwable theException) {theException.printStackTrace();} 
       Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "11111111");  

       
       
       

      String pol=" select  a1.ID, a1.ID_USER,a1.DT_BIG_Z, a1.DT_END_Z,  "+
"  a2.id as id_user, a2.ID_ROAD_ASU_TR,a2.TAB_NUM,a2.BLOCK_USER,a2.LAST_NAME,a2.FIRST_NAME,a2.MIDDLE_NAME,a2.TEL,a2.IP,a2.E_MAIL,a2.DT_BIG,a2.DT_END, "+ 
"   a3.CODE_SYSTEM,a3.SN_SYSTEM,a3.id_system,  "+
"   a5.CODE_USL,a5.FN_USL,  "+
"   a6.FN_ROLE,  "+
"   a8.FN_STAN,   "+
"   a2.ROAD,  "+
"   a2.SN_JOB  "+
"   from ASU_POL.MAIN_USER_ALL as a2  "+
"   inner join ASU_POL.SOOTV_USER_SYS as a1  on a1.ID_USER=a2.ID and a1.DT_END is  null and a1.ID_SYSTEM in ("+sql_0_sys1+") and a1.ID_ROLE<>2 "+
"   left join ASU_POL.POLYGON_SYSTEM as a3 on a1.ID_SYSTEM=a3.ID_system   "+
"   left join ASU_POL.SOOTV_SYS_USL as a4 on a1.ID_SYSTEM=a4.ID_system  "+ 
"   left join ASU_POL.POLYGON_USL as a5 on a1.ID_USL=a5.ID_USL   "+
"   left join ASU_POL.POLYGON_ROLE as a6 on a1.ID_ROLE=a6.ID_ROLE  "+
"   left join ASU_POL.POLYGON_STAN as a8 on a1.ID_STAN=a8.ID_STAN "+
"   order by a3.FN_SYSTEM,a2.LAST_NAME,a2.FIRST_NAME,a2.MIDDLE_NAME "; %>	
       
       
<tr  >
<td >       
  <table border='4'>
<tr>
<td>
<div style="OVERFLOW: auto; WIDTH: 1300px; HEIGHT: 600px">
    
       
  <% Statement stmt_pol = myconnection1.createStatement(); 
     ResultSet rs_pol = stmt_pol.executeQuery(pol);%>
     
<table >     
 
   
 <% String sys_pol="";  
    String id_system=""; 
    int tt=1;
  int kol_1=2;
while (rs_pol.next()){  
String sys_pol_1=rs_pol.getString("SN_SYSTEM");

 if(!sys_pol_1.equals(sys_pol)){
     
     
   if(!sys_pol.equals("")) { 
       int ki=kol_1-1;
     %> 
  <tr><td>&nbsp;</td>
<td NOWRAP><input type="checkbox" id="Chekall<%=id_system%>" name="Chekall<%=id_system%>" value='123'
onClick="ClickALL('<%=id_system%>',<%=ki%>)"/>
<b>Отметить все</b></td>
<td>
<input type="button" value='Отправить'
onClick="ClickButtMail('<%=id_system%>',<%=ki%>)"/>
</td>
<td colspan='7'><img src="images/status_anim.gif" style="display:none" id='img<%=id_system%>'/>
<div id="divout<%=id_system%>" name="divout<%=id_system%>"></div></td>

</tr>
<%
   }  
     
     sys_pol=sys_pol_1;
     id_system=rs_pol.getString("id_system"); kol_1=2;
     
       
 
     
     
%>
<tr>
<td colspan='19'>
<HR>
</td>
</tr> 
<tr bgcolor='#B2B2B2'>
<td colspan='19'> <h3><%=sys_pol%></h3></td>
</tr> 
<tr bgcolor='#B2B2B2'>
<td  NOWRAP> № </td>
<td  NOWRAP> Go </td>
<td  NOWRAP> ФИО </td>
<td  NOWRAP> e-mail </td>
<td  NOWRAP> Дт. начала </td>
<td  NOWRAP> Дт. окончания </td>
<td  NOWRAP> Телефон </td>
<td  NOWRAP> Место работы </td>
<td  NOWRAP> Должность </td>
<td  NOWRAP> IP </td>
<td  NOWRAP> Роль </td>
<td  NOWRAP> Станция </td>


</tr> 


<%}
      SimpleDateFormat dateFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
      SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd-MM-yyyy");
      SimpleDateFormat dateFormatter3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       

        String  yyear_p = rs_pol.getString("DT_BIG_Z").substring(0,4); 
        int  yyear1_p=Integer.parseInt(yyear_p);
        String mmonth_p = rs_pol.getString("DT_BIG_Z").substring(5,7);
        int mmonth1_p=Integer.parseInt(mmonth_p)-1;
        String dday_p = rs_pol.getString("DT_BIG_Z").substring(8,10);
        int dday1_p=Integer.parseInt(dday_p);   
        
        
        String  yyear_p_e = rs_pol.getString("DT_END_Z").substring(0,4); 
        int  yyear1_p_e=Integer.parseInt(yyear_p_e);
        String mmonth_p_e = rs_pol.getString("DT_END_Z").substring(5,7);
        int mmonth1_p_e=Integer.parseInt(mmonth_p_e)-1;
        String dday_p_e = rs_pol.getString("DT_END_Z").substring(8,10);
        int dday1_p_e=Integer.parseInt(dday_p_e);   
        
        
        
        
        Calendar DT_NOW=Calendar.getInstance(); 
        
        Calendar DT_NOW_B=Calendar.getInstance(); 
        Calendar DT_NOW_E=Calendar.getInstance(); 
        //String date=dateFormatter1.format(DT_NOW_1.getTime()).toString();
        //String date_1=dateFormatter3.format(DT_NOW_1.getTime()).toString();
        
        DT_NOW_B.set(yyear1_p,mmonth1_p,dday1_p,0,0,0);
        //dt_big_z=dateFormatter1.format(DT_NOW.getTime()).toString();
        DT_NOW_E.set(yyear1_p_e,mmonth1_p_e,dday1_p_e,0,0,0);
        //DT_NOW_E.add(Calendar.YEAR,1);
        //dt_end_z=dateFormatter1.format(DT_NOW.getTime()).toString();




 String Road_user = "";
if(rs_pol.getString("FIRST_NAME")!=null){ 
if((Road_user=rs_pol.getString("ROAD"))==null){
Road_user="";
}
int Id_str=rs_pol.getInt("ID_ROAD_ASU_TR");     
}  
 


if(DT_NOW.after(DT_NOW_E)){%>  
<tr id="tr<%=id_system%>_<%=kol_1-1%>" name="tr<%=id_system%>_<%=kol_1-1%>"
<%if(tt==1){%>
style="background: #E4E2E0;"
<% tt=0;}else {%>
style="background: #F0F0F0;"
 <%tt=1;}%>
>

<td NOWRAP><%=kol_1-1%>.</td>


<td  NOWRAP>
<%if(!rs_pol.getString("E_MAIL").trim().contains(" ")&&(rs_pol.getString("E_MAIL").contains("@SERW.RZD")||rs_pol.getString("E_MAIL").contains("@serw.rzd"))&&rs_pol.getString("E_MAIL").contains("@serw.rzd")&&!rs_pol.getString("E_MAIL").trim().startsWith("@",0)){%>
<input type="checkbox" id="chek<%=id_system%>_<%=kol_1-1%>" name="chek<%=id_system%>_<%=kol_1-1%>"/>
<%}else{%>

<div id="divbut<%=id_system%>_<%=kol_1-1%>" name="divbut<%=id_system%>_<%=kol_1-1%>">

<input type="button" id="but<%=id_system%>_<%=kol_1-1%>" name="but<%=id_system%>_<%=kol_1-1%>" value='Сохранить'
onClick="ClickButt('<%=id_system%>_<%=kol_1-1%>')"/>

</div>

<%}%>
</td>
<td NOWRAP style="display:none" id="id<%=id_system%>_<%=kol_1-1%>" name="id<%=id_system%>_<%=kol_1-1%>"><%=rs_pol.getInt("id_user")%> </td>
<td>
<div id="divfio<%=id_system%>_<%=kol_1-1%>" name="divfio<%=id_system%>_<%=kol_1-1%>">
<table>
<tr>
<td
<%if(!rs_pol.getString("E_MAIL").trim().contains(" ")&&(rs_pol.getString("E_MAIL").contains("@SERW.RZD")||rs_pol.getString("E_MAIL").contains("@serw.rzd"))&&rs_pol.getString("E_MAIL").contains("@serw.rzd")&&!rs_pol.getString("E_MAIL").trim().startsWith("@",0)){%>
<%}else{%>style="background: #FF0000;"<%}%>
NOWRAP id="fio<%=id_system%>_<%=kol_1-1%>" name="fio<%=id_system%>_<%=kol_1-1%>"><%=rs_pol.getString("LAST_NAME")%>  <%=rs_pol.getString("FIRST_NAME")%> <%=rs_pol.getString("MIDDLE_NAME")%></td>
</tr>
</table>
</div>
</td>

<td NOWRAP id="mail<%=id_system%>_<%=kol_1-1%>" name="mail<%=id_system%>_<%=kol_1-1%>">
<%if(!rs_pol.getString("E_MAIL").trim().contains(" ")&&rs_pol.getString("E_MAIL").contains("@")&&(rs_pol.getString("E_MAIL").contains("@SERW.RZD")||rs_pol.getString("E_MAIL").contains("@serw.rzd"))&&!rs_pol.getString("E_MAIL").trim().startsWith("@",0)){%>
 <%=rs_pol.getString("E_MAIL").trim()%>
<%}else{%>
<div id="divinmail<%=id_system%>_<%=kol_1-1%>" name="divinmail<%=id_system%>_<%=kol_1-1%>">

<input type="text"  id="inmail<%=id_system%>_<%=kol_1-1%>" name="inmail<%=id_system%>_<%=kol_1-1%>" value='<%=rs_pol.getString("E_MAIL").trim()%>'/>
</div >

<%}%></td>





<td NOWRAP> <%=rs_pol.getString("DT_BIG_Z")%></td>
<td NOWRAP> <%=rs_pol.getString("DT_END_Z")%></td>
<td NOWRAP> <%=rs_pol.getString("TEL")%></td>
<td NOWRAP> <%=Road_user%></td>
<td NOWRAP > <%=rs_pol.getString("SN_JOB")%></td>
<td NOWRAP> <%=rs_pol.getString("IP")%></td>
<td NOWRAP > <%=rs_pol.getString("FN_ROLE")%></td>
<td NOWRAP > <%=rs_pol.getString("FN_STAN")%></td>


</tr>










<%kol_1++;}
 

 
 
  }

rs_pol.close();
stmt_pol.close();
 int ki=kol_1-1;%>  
  
 <tr><td>&nbsp;</td>
<td NOWRAP><input type="checkbox" id="Chekall<%=id_system%>" name="Chekall<%=id_system%>"
onClick="ClickALL('<%=id_system%>',<%=ki%>)"/>
<b>Отметить все</b></td>
<td>
<input type="button" value='Отправить'
onClick="ClickButtMail('<%=id_system%>',<%=ki%>)"/>
</td>
<td  colspan='7'><img src="images/status_anim.gif" style="display:none" id='img<%=id_system%>'/>
<div id="divout<%=id_system%>" name="divout<%=id_system%>"></div></td>

</tr>

 

</table>  
   



</div>
</td>
</tr>


</table>   
       
       
       
 </td>
</tr>      
       
       
       
       
       
       
       
       
       
       
<% myconnection1.close();} catch (SQLException e) {   %> <tr>Ошибка <%=e%></tr> <%}%>


</table>
<HR>
<%}%> 
<%}%>
