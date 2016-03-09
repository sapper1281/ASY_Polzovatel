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

<%--системы возврат пользователей--%>

<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>

<%if(session.getValue("id_role").equals("2")||session.getValue("id_role").equals("3")){%>
 <%Object lock = new Object(); 
synchronized(lock)
       {%>
  <script type="text/javascript"> 
  function CHEKSYSALL(oForm, cbName, nn) 
         {
        if(document.getElementsByName(cbName)(0).checked){
        for (var i=0; i < document.getElementsByName(cbName).length; i++){ 
        document.getElementsByName(cbName)(i).checked=true;} }
        else{
for (var i=0; i < document.getElementsByName(cbName).length; i++){ 
        document.getElementsByName(cbName)(i).checked=false;} }
}      
  



function check_import_asu_zir_param( cbName, sd, cbName1,cbName2) 
         { 
         
         document.getElementById(cbName).value=sd;
         for (var i=0; i < document.getElementsByName(cbName1).length; i++){ 
         if(document.getElementsByName(cbName1)(i).checked==true){
          document.getElementById(cbName2).value= document.getElementById(cbName2).value+'|'+document.getElementsByName(cbName1)(i).value;
          
}}
document.getElementById(cbName2).value=document.getElementById(cbName2).value+'|';}





  var request = false;
   try {
     request = new XMLHttpRequest();
   } catch (trymicrosoft) {
     try {
       request = new ActiveXObject("Msxml2.XMLHTTP");
     } catch (othermicrosoft) {
       try {
         request = new ActiveXObject("Microsoft.XMLHTTP");
       } catch (failed) {
         request = false;
       }  
     }
   }

   if (!request)
     alert("Error initializing XMLHttpRequest!");




function ASU_ZIR_Vozvrat(cbName1,cbName2) {

for (var i=0; i < document.getElementsByName(cbName1).length; i++){ 
         if(document.getElementsByName(cbName1)(i).checked==true){
          document.getElementById(cbName2).value= document.getElementById(cbName2).value+'||'+document.getElementsByName(cbName1)(i).value;
          
}}
document.getElementById(cbName2).value=document.getElementById(cbName2).value+'||';
//alert(document.getElementById(cbName2).value);


var params = "par1=" + encodeURIComponent(document.getElementById(cbName2).value);
var url = "<%=request.getContextPath()%>/asu_zir_vorvrat_pol";
request.open("POST", url, true);
request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
request.onreadystatechange = updatePage1_1;
request.send(params);

document.getElementById(cbName2).value="";
}


function updatePage1_1() {
     if (request.readyState == 4) {
       if (request.status == 200) {
         var response = request.responseText;
        document.getElementById("voz").innerHTML =response;
         
       } else
         alert("status is " + request.status+response);
     }
   }
   


















</script>     
       
       
       
       
       
       
       
       
<HR>
<%try { %> 
<%--action="/ASY_Polzovatel/import_asu_zir_vved.jsp"--%>
<form    name="senddata" <%--action="/ASY_Polzovatel/import_asu_zir_vved.jsp"--%> method="post">
<input type=hidden id="tper1" name="tper1" value="0"/ > 
<input type=hidden id="par" name="par" value=""/ > 
<input type=hidden id="par1" name="par1" value=""/ > 
<div id='voz'>
<table width="100%" border="1" >
<tr><td><H3>Ввод не переданных из АСУ ЗИР</H3></td></tr>




<tr><td><H3>Выберите системы</H3></td></tr>
   <% String sys=""; int tt=1;
      if(session.getValue("id_role").equals("2")){         
      sys=" select a1.id, a1.id_system,a1.sn_system "+
      " from ASU_POL.POLYGON_system a1  order by a1.sn_system";
      }else{
      sys="  select  "+
	   " a5.id, a5.id_system,a5.sn_system  "+
	   " from ASU_POL.MAIN_USER_ALL a1   "+
           " left join ASU_POL.SOOTV_USER_SYS a3 on a1.ID=a3.ID_USER   "+
           " left join ASU_POL.POLYGON_ROLE a4 on a4.id_role=a3.id_role  "+
	   " left join ASU_POL.POLYGON_SYSTEM a5 on a5.ID_SYSTEM=a3.ID_SYSTEM  "+
	   " where a3.id_system<>1  "+
" and a1.id="+session.getValue("id_us")+
" and a3.id_role=2 and  a3.del=0 "+
           " order by a5.sn_system";
     }
    
    try { Class.forName("COM.ibm.db2.jdbc.app.DB2Driver");
          }catch(Throwable theException) {theException.printStackTrace();} 
       //Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL" , "db2admin", "11111111");  
      Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "11111111");  

     Statement stmt_sys = myconnection1.createStatement(); 
     ResultSet rs_sys = stmt_sys.executeQuery(sys); %>


<tr><td> 
 

<div style="OVERFLOW: auto; WIDTH: 500px; HEIGHT: 200px"> 
<table> 

<tr>

<td  NOWRAP colspan='2' ><input id='IDSYS' name='IDSYS' type='checkbox' value='-1'
   onClick="CHEKSYSALL(this.form,'IDSYS','IDSYS')"
   > Все системы</td></tr>
 <% int k=2;
while (rs_sys.next()){  %>
<tr><td  NOWRAP  ><%=k-1%>. <input id='IDSYS' name='IDSYS' type='checkbox' value='<%=rs_sys.getInt("id_system")%>'
  <%--onClick="CHEKSYSALLV(this.form,'IDSYS','IDSYS')"--%>
   ><%=rs_sys.getString("sn_system").trim()%></td></tr>
 <%k++;
  } 
rs_sys.close();
stmt_sys.close();
%>

</table>
</div> 


   
   </td></tr>
<tr><td  ><input type = "submit" value="Вывести" <%----%>onClick="check_import_asu_zir_param('tper1','asu_zir_vozvrat_pol','IDSYS','par')"<%----%>> </td></tr>
<tr><td>
   
   
 <%if("asu_zir_vozvrat_pol".equals(request.getParameter("tper1"))){%>


<table border='4' >
<tr>
<td>
<div  style="OVERFLOW: auto; WIDTH: 1300px; HEIGHT: 600px"> <%--=request.getParameter("par")--%>	

         <%--IFRAME
		         frameBorder=0 height=600  scrolling=no style='z-index:1000;'
		         src="/ASY_Polzovatel/import_asu_zir_vved.jsp?par=<%=request.getParameter("par")%>"
		         width=1050
	             </IFRAME--%>
<% 
 String par=request.getParameter("par");
 String q=" where "+
//" a1.prizis<>1 and  "+ 
" (a1.ID_RES=-2 ";
int k1=-1;
 for (int j_1 = 0; j_1 < par.length(); j_1++){
        if (String.valueOf(par.charAt(j_1)).equals("|")){
        if(k1!=-1){
String k2=par.substring(k1+1,j_1);
q=q+" or a1.ID_RES="+k2;
}
            k1=j_1;
        }}	
	             
q=q+ " ) ";	            
	             
  String pol=" select a1.prizis, a1.ID_ZAYAV, a1.ID_REG, a1.ID_USER, a1.START_DATE, a1.END_DATE, a1.OP_STATION, "+
    " a1.LN_USER, a1.FN_USER, a1.SN_USER, a1.TEL_USER, a1.MAIL_USER, a1.T_NO,  "+
    " a1.ORGTX, a1.ID_RES, a1.DT_IMPORT, a1.PERNR, a1.NACHN, a1.VORNA, a1.MIDNM,  "+
    " a1.MASSN, a1.BEGDA, a1.ORGTX_1, a1.PODR, a1.DIV_ID, a1.EN_ID, a1_3.ID_USL,  "+
    " a1_1.SN_SYSTEM,  b1.EN_NAME, 3 as ID_ROLE, 'Пользователь' as FN_ROLE, a1_2.SN_STAN, "+
    " a2.ROAD as ROAD_2,a2.ID as id_2, a2.ID_ROAD_ASU_TR as ID_ROAD_ASU_TR_2, a2.TAB_NUM as TAB_NUM_2, a2.ID_JOB as ID_JOB_2, a2.BLOCK_USER as BLOCK_USER_2, a2.PFR as PFR_2,   "+
    " a2.LAST_NAME as LAST_NAME_2, a2.FIRST_NAME as FIRST_NAME_2, a2.MIDDLE_NAME as MIDDLE_NAME_2, a2.TEL as TEL_2, a2.IP as IP_2, a2.E_MAIL as E_MAIL_2, a2.DT_BIG as DT_BIG_2,  "+
    " a2.DT_END as DT_END_2, a2.PRIZ as PRIZ_2 "+
	" from (select a1.* from ASU_POL.ASU_ZIR_NEP as a1 "+q+"  )as a1  "+
        " left join  ASU_ZIR.ORGAN_NEW as b1 on a1.EN_ID=b1.EN_ID "+
 
 /*" left join    "+
  	" ASU_POL.ASU_ZIR_VSE_VVED as a2_0 on   "+
 	" a2_0.ID_ZAYAV=a1.ID_ZAYAV and  a2_0.ID_REG=a1.ID_REG  and  a2_0.ID_USER=a1.ID_USER and    "+
        "     a2_0.START_DATE=a1.START_DATE and  a2_0.END_DATE=a1.END_DATE and a2_0.OP_STATION=a1.OP_STATION and   "+  
        "      a2_0.LN_USER=a1.LN_USER and  a2_0.FN_USER=a1.FN_USER and  a2_0.SN_USER=a1.SN_USER and    "+
      //  "      a2_0.TEL_USER=a1.TEL_USER and  a2_0.MAIL_USER=a1.MAIL_USER and  "+
 " a2_0.T_NO=a1.T_NO and    "+
   //     "      a2_0.ORGTX=a1.ORGTX and 
 " a2_0.ID_RES=a1.ID_RES and    "+
        "      a2_0.pernr=a1.pernr and "+
 //a2_0.nachn=a1.nachn and  a2_0.vorna=a1.vorna and    "+ 
       //  "     a2_0.midnm=a1.midnm and "+
//" a2_0.massn=a1.massn and  a2_0.begda=a1.begda and    "+
 	" 		 a2_0.orgtx_1=a1.orgtx_1 " +
//"and  a2_0.podr= a1.podr    "+
  
 "  left join    "+
  " 	ASU_POL.ASU_ZIR_DOB_1 as a2_1 on  "+ 
 " 	a2_1.ID_ZAYAV=a1.ID_ZAYAV and  a2_1.ID_REG=a1.ID_REG  and  a2_1.ID_USER=a1.ID_USER and    "+
   "          a2_1.START_DATE=a1.START_DATE and  a2_1.END_DATE=a1.END_DATE and a2_1.OP_STATION=a1.OP_STATION and    "+ 
   "           a2_1.LN_USER=a1.LN_USER and  a2_1.FN_USER=a1.FN_USER and  a2_1.SN_USER=a1.SN_USER and    "+
  // "           a2_1.TEL_USER=a1.TEL_USER and  a2_1.MAIL_USER=a1.MAIL_USER and  "+
 "  a2_1.T_NO=a1.T_NO and    "+
  // "           a2_1.ORGTX=a1.ORGTX and 
 " a2_1.ID_RES=a1.ID_RES and    "+
   "           a2_1.pernr=a1.pernr and "+
 //a2_1.nachn=a1.nachn and  a2_1.vorna=a1.vorna and     "+
 //  "           a2_1.midnm=a1.midnm and "+
//a2_1.massn=a1.massn and  a2_1.begda=a1.begda and    "+
 " 			 a2_1.orgtx_1=a1.orgtx_1 " +
//"and  a2_1.podr= a1.podr   "+
  
 "  left join    "+
  " 	ASU_POL.ASU_ZIR_DOB as a2_2 on   "+
 " 	a2_2.ID_ZAYAV=a1.ID_ZAYAV and  a2_2.ID_REG=a1.ID_REG  and  a2_2.ID_USER=a1.ID_USER and    "+
   "          a2_2.START_DATE=a1.START_DATE and  a2_2.END_DATE=a1.END_DATE and a2_2.OP_STATION=a1.OP_STATION and   "+  
   "           a2_2.LN_USER=a1.LN_USER and  a2_2.FN_USER=a1.FN_USER and  a2_2.SN_USER=a1.SN_USER and   "+ 
  // "           a2_2.TEL_USER=a1.TEL_USER and  a2_2.MAIL_USER=a1.MAIL_USER and  "+
 "  a2_2.T_NO=a1.T_NO and   "+ 
 // "            a2_2.ORGTX=a1.ORGTX and 
 " a2_2.ID_RES=a1.ID_RES  "+*/
   " left join ASU_POL.POLYGON_SYSTEM as a1_1 on a1.ID_RES=a1_1.ID_SYSTEM  "+
  " left join ASU_POL.POLYGON_STAN as a1_2 on a1.OP_STATION=a1_2.ID_STAN  "+
  " left join ASU_POL.SOOTV_SYS_USL as a1_2_1 on a1_1.ID_SYSTEM=a1_2_1.ID_SYSTEM "+
  
  
  
  " left join ASU_POL.POLYGON_usl as a1_3 on a1_3.ID_usl=a1_2_1.ID_usl  "+
  " left join ASU_POL.MAIN_USER_ALL as a2 on a1.LN_USER=a2.LAST_NAME and a1.FN_USER=a2.FIRST_NAME and a1.SN_USER=a2.MIDDLE_NAME  "+
  
  " left join ASU_POL.SOOTV_USER_SYS as a2_2_1 on a2.ID=a2_2_1.ID_USER and a1.ID_RES=a2_2_1.ID_SYSTEM "+
  
//q+ 
"  where  "+
//a1.prizis is null and "+ 
//" a2_0.ID_ZAYAV is null and a2_1.ID_ZAYAV is null and a2_2.ID_ZAYAV is null and"+
" a2_2_1.ID_USER is null  "+
 "  order by a1_1.SN_SYSTEM, a2.LAST_NAME , a2.FIRST_NAME , a2.MIDDLE_NAME ";
 %>

<%--=pol--%>

<%Statement stmt_pol = myconnection1.createStatement(); 
     ResultSet rs_pol = stmt_pol.executeQuery(pol);%>
     
<table >     
 
   
 <% String sys_pol="";
  int kol_1=2;
while (rs_pol.next()){
  if(rs_pol.getInt("prizis")==0){
    
String sys_pol_1=rs_pol.getString("SN_SYSTEM");
 if(!sys_pol_1.equals(sys_pol)){
     sys_pol=sys_pol_1;kol_1=2;
%>
<tr >
<td colspan='12'>
<HR>
</td>
</tr> 
<tr bgcolor='#B2B2B2'>
<td colspan='12'> <h3><%=sys_pol%></h3></td>
</tr> 
<%--tr>
<td colspan='3'> </td>
<td >
Актуальные данные о пользователях
</td>
<td>
Данные из заблокированной заявки
</td>
</tr--%> 

<%}

String Road_user_1="";

if((Road_user_1=rs_pol.getString("ROAD_2"))==null){

Road_user_1="";
}
 String Road_user = "";


boolean t_dor_1=true;
   int Id_str_1=rs_pol.getInt("ID_ROAD_ASU_TR_2");
  
 /*  String Road_user_1 = "";
    
   while(t_dor_1){
  
   Statement stmt_2_0_1 = myconnection1.createStatement(); 
ResultSet rs_2_0_1 = stmt_2_0_1.executeQuery(" select ID, CODE_ROAD_ASU_TR, ID_ROAD_ASU_TR, SN_ROAD, FN_ROAD, "+
    " MY_ID_ROAD_ASU_TR, MY_ID_ROAD, DT_BIG, DT_END, STATUS, TYPE "+
    " from ASU_POL.POLYGON_ROAD  "+
    " where ID_ROAD_ASU_TR="+Id_str_1+" "//+
   //  "and " +
  // " DT_VVOD=(select DT_VVOD1 from(select max(DT_VVOD) as DT_VVOD1  from ASU_POL.POLYGON_ROAD ) as sa )  "
 
   ); 
if(rs_2_0_1.next()){
if(rs_2_0_1.getFetchSize()!=0){
Road_user_1=rs_2_0_1.getString("FN_ROAD").trim()+", "+Road_user_1;
Id_str_1=rs_2_0_1.getInt("MY_ID_ROAD_ASU_TR");
}
}
else{
Road_user_1="Не определено"+Road_user_1;
t_dor_1=false;
}
if(t_dor_1){t_dor_1=Id_str_1!=0;}
//t_dor=false;
stmt_2_0_1.close();
rs_2_0_1.close();
   }  */  



%>   



<tr
<%if(tt==1){%>bgcolor='#E4E2E0'<% }else {%> bgcolor='#F0F0F0'<%}%>


>
<td><%=kol_1-1%>.</td><td  NOWRAP  > 
<%if(rs_pol.getString("LAST_NAME_2")!=null){%>

<%if(!Road_user_1.equals("Не определено")){%>

<input id='IDPOL' name='IDPOL' type='checkbox' 

value='<%=rs_pol.getInt("ID_ROAD_ASU_TR_2")%>|  <%=rs_pol.getInt("OP_STATION")%>| <%=rs_pol.getInt("ID_USL")%>| <%=rs_pol.getInt("ID_RES")%>| <%=rs_pol.getInt("ID_ROLE")%>| <%=rs_pol.getInt("id_2")%>|<%=rs_pol.getString("START_DATE")%>| <%=rs_pol.getString("END_DATE")%>| <%=rs_pol.getInt("ID_ZAYAV")%>| <%=rs_pol.getString("ID_REG")%><%if(rs_pol.getString("TEL_2")==null){%>| <%=rs_pol.getString("TEL_USER")%>| не опред.| <%=rs_pol.getString("MAIL_USER")%><%}else{%>| <%=rs_pol.getString("TEL_2")%>| <%=rs_pol.getString("IP_2")%>| <%=rs_pol.getString("E_MAIL_2")%><%}%>'>


<%}%>

<%=rs_pol.getInt("id_2")%></td>
<td >актуальные</td><td NOWRAP><%=rs_pol.getString("LAST_NAME_2")%>  <%=rs_pol.getString("FIRST_NAME_2")%> <%=rs_pol.getString("MIDDLE_NAME_2")%>
<%}else {%> <td>актуальные</td><td NOWRAP>нет<%}%>  
</td>

<td NOWRAP><%=Road_user_1%></td>
<td id='TEL_USER' name='TEL_USER' NOWRAP><%=rs_pol.getString("TEL_2")%></td>
<td id='IP' name='IP' NOWRAP><%=rs_pol.getString("IP_2")%></td>
<td  id='MAIL_USER' name='MAIL_USER' NOWRAP><%=rs_pol.getString("E_MAIL_2")%></td>
<td NOWRAP ><%=rs_pol.getString("FN_ROLE")%></td>
<td NOWRAP > </td>
<td NOWRAP > </td>
<td NOWRAP > </td>
</tr>
<tr 
<%if(tt==1){%>bgcolor='#E4E2E0'<% tt=0;}else {%> bgcolor='#F0F0F0'<%tt=1;}%>
>
<td colspan='2'><%=rs_pol.getString("ID_REG")%></td> 
<td>Данные из заявки</td>  
   <td NOWRAP><%=rs_pol.getString("LN_USER")%>  <%=rs_pol.getString("FN_USER")%> <%=rs_pol.getString("SN_USER")%></td>
<td NOWRAP><%=rs_pol.getString("EN_NAME")%></td>
<td id='TEL_USER1' name='TEL_USER1' NOWRAP><%=rs_pol.getString("TEL_USER")%></td>
<td id='IP1' name='IP1' NOWRAP> </td>
<td id='MAIL_USER1' name='MAIL_USER1'  NOWRAP><%=rs_pol.getString("MAIL_USER")%></td>
<td NOWRAP > не определено</td>
<td NOWRAP><%=rs_pol.getString("START_DATE")%></td>
<td NOWRAP><%=rs_pol.getString("END_DATE")%></td>
<td NOWRAP ><%=rs_pol.getString("SN_STAN")%></td>

</tr>





<%kol_1++;
 } } 
rs_pol.close();
stmt_pol.close();
%>    
</table>  
   


</DIV>
</td>
</tr>

<tr><td  ><input type = "button" value="Ввести" onClick="ASU_ZIR_Vozvrat('IDPOL','par1')"> </td></tr>

</TABLE>

<%}%>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   </td></tr>  
</table>
</div>
</form>
<% myconnection1.close();} catch (SQLException e) {%> <tr>Ошибка <%=e%></tr> <%}%>
<HR>
<%}%> 
<%}%>