
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

<%--������� ������� �������������--%>

<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>

<%if(session.getValue("id_role").equals("2")||session.getValue("id_role").equals("3")){%>
 <%Object lock = new Object(); 
synchronized(lock)
       {%>
  <script type="text/javascript"> 
  
  function CHEKSYSALL_all(oForm, cbName, nn) 
         {
        if(document.getElementsByName(nn)(0).checked){
        
        for (var i=0; i < document.getElementsByName(cbName).length; i++){ 
        document.getElementsByName(cbName)(i).checked=true;} }
        else{
for (var i=0; i < document.getElementsByName(cbName).length; i++){ 
        document.getElementsByName(cbName)(i).checked=false;} }
}      
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




function Vozvrat(cbName1,cbName2) {

for (var i=0; i < document.getElementsByName(cbName1).length; i++){ 
         if(document.getElementsByName(cbName1)(i).checked==true){
          document.getElementById(cbName2).value= document.getElementById(cbName2).value+'||'+document.getElementsByName(cbName1)(i).value;
          
}}
document.getElementById(cbName2).value=document.getElementById(cbName2).value+'||';
//alert(document.getElementById(cbName2).value);


var params = "par1=" + encodeURIComponent(document.getElementById(cbName2).value);
var url = "<%=request.getContextPath()%>/vozvrat_pol";
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



<tr><td><H3>������������� </H3></td></tr>


<tr><td><H3>�������� �������</H3></td></tr>
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
       Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "11111111");  

     Statement stmt_sys = myconnection1.createStatement(); 
     ResultSet rs_sys = stmt_sys.executeQuery(sys); %>


<tr><td> 
 

<div style="OVERFLOW: auto; WIDTH: 500px; HEIGHT: 200px"> 
<table> 

<tr>

<td  NOWRAP colspan='2' ><input id='IDSYS' name='IDSYS' type='checkbox' value='-1'
   onClick="CHEKSYSALL(this.form,'IDSYS','IDSYS')"
   > ��� �������</td></tr>
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
<tr><td  ><input type = "submit" value="�������" <%----%>onClick="check_import_asu_zir_param('tper1','vozvrat_pol','IDSYS','par')"<%----%>> </td></tr>
<tr><td>
   
   
 <%if("vozvrat_pol".equals(request.getParameter("tper1"))){%>


<table border='4'>
<tr>
<td>
<div style="OVERFLOW: auto; WIDTH: 1000px; HEIGHT: 600px"> <%--=request.getParameter("par")--%>	

         <%--IFRAME
		         frameBorder=0 height=600  scrolling=no style='z-index:1000;'
		         src="/ASY_Polzovatel/import_asu_zir_vved.jsp?par=<%=request.getParameter("par")%>"
		         width=1050
	             </IFRAME--%>
<% 
 String par=request.getParameter("par");
 String q=" where a1.DEL=3 and  (a1.ID_SYSTEM=-2 ";
int k1=-1;
 for (int j_1 = 0; j_1 < par.length(); j_1++){
        if (String.valueOf(par.charAt(j_1)).equals("|")){
        if(k1!=-1){
String k2=par.substring(k1+1,j_1);
q=q+" or a1.ID_SYSTEM="+k2;
}
            k1=j_1;
        }}	
	             
q=q+ " ) ";	            
	             
  String pol=" select a1.ID, a1.ID_USER, a1.ID_SYSTEM, a1.ID_USL, a1.ID_ROLE, a1.DT_BIG_Z, "+
   "  a1.DT_END_Z, a1.DT_BIG, a1.DT_END, a1.ID_STAN, a1.DEL, "+
	" a1_1.SN_SYSTEM, "+
        " a1_2.SN_STAN, "+
         " a1_3.CODE_USL, "+
        " a1_4.FN_ROLE, ";
  if(session.getValue("id_role").equals("2")){
        pol=pol+" a1_5.ID_USER as ID_USER1_5, a1_5.LOGIN, a1_5.PASSWORD, ";
        }
	 pol=pol+" a2.ID as id_2,a2.ROAD as ROAD_2, a2.ID_ROAD_ASU_TR as ID_ROAD_ASU_TR_2, a2.TAB_NUM as TAB_NUM_2, a2.ID_JOB as ID_JOB_2, a2.BLOCK_USER as BLOCK_USER_2, a2.PFR as PFR_2,  "+
    " a2.LAST_NAME as LAST_NAME_2, a2.FIRST_NAME as FIRST_NAME_2, a2.MIDDLE_NAME as MIDDLE_NAME_2, a2.TEL as TEL_2, a2.IP as IP_2, a2.E_MAIL as E_MAIL_2, a2.DT_BIG as DT_BIG_2, "+
    " a2.DT_END as DT_END_2, a2.PRIZ as PRIZ_2, "+
	
	" a3.ID as id_3,a3.ROAD as ROAD_3, a3.ID_ROAD_ASU_TR as ID_ROAD_ASU_TR_3, a3.TAB_NUM as TAB_NUM_3, a3.ID_JOB as ID_JOB_3, a3.BLOCK_USER as BLOCK_USER_3, a3.PFR as PFR_3,  "+
    " a3.LAST_NAME as LAST_NAME_3, a3.FIRST_NAME as FIRST_NAME_3, a3.MIDDLE_NAME as MIDDLE_NAME_3, a3.TEL as TEL_3, a3.IP as IP_3, a3.E_MAIL as E_MAIL_3, a3.DT_BIG as DT_BIG_3, "+
    " a3.DT_END as DT_END_3, a3.PRIZ as PRIZ_3 "+
	
" from ASU_POL.SOOTV_USER_SYS_BLOCK as a1 "+
 " left join ASU_POL.POLYGON_SYSTEM as a1_1 on a1.ID_SYSTEM=a1_1.ID_SYSTEM "+
 " left join ASU_POL.POLYGON_STAN as a1_2 on a1.ID_STAN=a1_2.ID_STAN "+
 " left join ASU_POL.POLYGON_usl as a1_3 on a1.ID_usl=a1_3.ID_usl "+
 " left join ASU_POL.POLYGON_ROLE as a1_4 on a1.ID_ROLE=a1_4.ID_ROLE ";
  if(session.getValue("id_role").equals("2")){
        pol=pol+" left join ASU_POL.ADMIN_PAS as a1_5 on a1_5.ID_SOOTV_USER_SYS=a1.ID ";
        }
 
  pol=pol+"  left join ASU_POL.MAIN_USER_ALL_BLOCK as a2 on a2.ID=a1.ID_USER "+

  
 "  left join ASU_POL.MAIN_USER_ALL as a3 on a3.LAST_NAME=a2.LAST_NAME and a3.FIRST_NAME=a2.FIRST_NAME and a3.MIDDLE_NAME=a2.MIDDLE_NAME "+
 q+" order by a1_1.SN_SYSTEM, a2.LAST_NAME , a2.FIRST_NAME , a2.MIDDLE_NAME ";
 

Statement stmt_pol = myconnection1.createStatement(); 
     ResultSet rs_pol = stmt_pol.executeQuery(pol);%>
     
<table cellspacing='0'>     

<tr bgcolor='#B2B2B2'>
<td colspan='12'> 

<input id='IDPOL_all' name='IDPOL_all' type='checkbox' value='' onClick="CHEKSYSALL_all(this.form,'IDPOL','IDPOL_all')" />���</td>


</tr> 
   
 <% String sys_pol="";
  int kol_1=2;
while (rs_pol.next()){  
    
        
 String  rs_polPFR_2="";//rs_pol.getString("PFR_2");
if((rs_pol.getString("PFR_2")!=null)&&!(rs_pol.getString("PFR_2").equals(""))){rs_polPFR_2=rs_pol.getString("PFR_2");}
else{rs_polPFR_2="2";};

    rs_polPFR_2=rs_polPFR_2.replace(' ', '-');
    rs_polPFR_2=rs_polPFR_2.replace('-', '-');
    String  rs_polPFR_3="";//rs_pol.getString("PFR_3");
    
 if((rs_pol.getString("PFR_3")!=null)&&!(rs_pol.getString("PFR_3").equals(""))){rs_polPFR_3=rs_pol.getString("PFR_3");}
else{rs_polPFR_3="3";};   
    
    rs_polPFR_3=rs_polPFR_3.replace(' ', '-');
    rs_polPFR_3=rs_polPFR_3.replace('-', '-');

if(rs_polPFR_2.equals(rs_polPFR_3)){
    
    
    
    
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
���������� ������ � �������������
</td>
<td>
������ �� ��������������� ������
</td>
</tr--%> 

<%}
 String Road_user = "";
if(rs_pol.getString("LAST_NAME_3")!=null){ 
    boolean t_dor=true;
   int Id_str=rs_pol.getInt("ID_ROAD_ASU_TR_3");
   if((Road_user=rs_pol.getString("ROAD_3"))==null){

Road_user="";
}
 
    
  /* while(t_dor){
  
   Statement stmt_2_0 = myconnection1.createStatement(); 
ResultSet rs_2_0 = stmt_2_0.executeQuery(" select ID, CODE_ROAD_ASU_TR, ID_ROAD_ASU_TR, SN_ROAD, FN_ROAD, "+
    " MY_ID_ROAD_ASU_TR, MY_ID_ROAD, DT_BIG, DT_END, STATUS, TYPE "+
    " from ASU_POL.POLYGON_ROAD  "+
    " where ID_ROAD_ASU_TR="+Id_str+" "+
     "and " +
   " DT_VVOD=(select DT_VVOD1 from(select max(DT_VVOD) as DT_VVOD1  from ASU_POL.POLYGON_ROAD ) as sa )  "
 
   ); 
if(rs_2_0.next()){
if(rs_2_0.getFetchSize()!=0){
Road_user=rs_2_0.getString("FN_ROAD").trim()+", "+Road_user;
Id_str=rs_2_0.getInt("MY_ID_ROAD_ASU_TR");
}
}
  else{
Road_user="�� ����������"+Road_user;
t_dor=false;
}
if(t_dor){t_dor=Id_str!=0;}
//t_dor=false;
stmt_2_0.close();
rs_2_0.close();
   }  */}  
 


boolean t_dor_1=true;
   int Id_str_1=rs_pol.getInt("ID_ROAD_ASU_TR_2");
  
   String Road_user_1 = "";
  if((Road_user_1=rs_pol.getString("ROAD_2"))==null){

Road_user_1="";
}
  
  /*  
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
Road_user_1="�� ����������"+Road_user_1;
t_dor_1=false;
}
if(t_dor_1){t_dor_1=Id_str_1!=0;}
//t_dor=false;
stmt_2_0_1.close();
rs_2_0_1.close();
   } */   



%>   



<tr
<%if(tt==1){%>bgcolor='#E4E2E0'<% }else {%> bgcolor='#F0F0F0'<%}%>


>
<td><%=kol_1-1%>.</td><td  NOWRAP  > 
<%if(rs_pol.getString("LAST_NAME_3")!=null){%>

<%if(!Road_user.equals("�� ����������")){%>

<input id='IDPOL' name='IDPOL' type='checkbox' 

value=' <%=rs_pol.getInt("ID_ROAD_ASU_TR_3")%>| <%=rs_pol.getInt("ID_STAN")%>| <%=rs_pol.getInt("ID_USL")%>| <%=rs_pol.getInt("ID_SYSTEM")%>| <%=rs_pol.getInt("ID_ROLE")%>| <%=rs_pol.getInt("id_3")%>| <%=rs_pol.getString("TEL_2").trim()%>| <%=rs_pol.getString("IP_2").trim()%>| <%=rs_pol.getString("E_MAIL_2").trim()%>| <%=rs_pol.getString("DT_BIG_Z")%>| <%=rs_pol.getString("DT_END_Z")%>| <%=rs_pol.getInt("ID")%><%if(session.getValue("id_role").equals("2")){%>| <%=rs_pol.getString("LOGIN")%>| <%=rs_pol.getString("PASSWORD")%>| <%=rs_pol.getInt("ID_USER1_5")%><%}else{%><%}%>'>


<%}%>

<%=rs_pol.getInt("id_3")%> <%=rs_pol.getInt("id_2")%></td>
<td>����������</td><td NOWRAP><%=rs_pol.getString("LAST_NAME_3")%>  <%=rs_pol.getString("FIRST_NAME_3")%> <%=rs_pol.getString("MIDDLE_NAME_3")%>
<%}else {%> <td>����������</td><td NOWRAP>���<%}%>  
</td>

<td NOWRAP><%=Road_user%></td><td  colspan='7'  NOWRAP></td></tr>


<tr
<%if(tt==1){%>bgcolor='#E4E2E0'<% tt=0;}else {%> bgcolor='#F0F0F0'<%tt=1;}%>
>
<td colspan='2'> </td> 
<td>�������������</td>  
   <td NOWRAP><%=rs_pol.getString("LAST_NAME_2")%>  <%=rs_pol.getString("FIRST_NAME_2")%> <%=rs_pol.getString("MIDDLE_NAME_2")%></td>
<td NOWRAP><%=Road_user_1%></td>
<td NOWRAP><%=rs_pol.getString("TEL_2")%></td>
<td NOWRAP><%=rs_pol.getString("IP_2")%></td>
<td><%=rs_pol.getString("E_MAIL_2")%></td>
<td NOWRAP ><%=rs_pol.getString("FN_ROLE")%></td>
<td NOWRAP><%=rs_pol.getString("DT_BIG_Z")%></td>
<td NOWRAP><%=rs_pol.getString("DT_END_Z")%></td>
<td NOWRAP ><%=rs_pol.getString("SN_STAN")%></td>
<%if(session.getValue("id_role").equals("2")){%>
<td NOWRAP><%=rs_pol.getString("LOGIN")%></td>
<td NOWRAP ><%=rs_pol.getString("PASSWORD")%></td><%}%>
</tr>







<%kol_1++;}
  } 
rs_pol.close();
stmt_pol.close();
%>    
</table>  
   


</div>
</td>
</tr>

<tr><td  ><input type = "button" value="�������" <%----%>onClick="Vozvrat('IDPOL','par1')"<%----%>> </td></tr>

</table>



<%}%>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   </td></tr>  
</table>
</div>
</form>
<% myconnection1.close();} catch (SQLException e) {%> <tr>������ <%=e%></tr> <%}%>
<HR>
<%}%> 
<%}%>