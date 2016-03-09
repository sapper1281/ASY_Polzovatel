
<%@page import= "com.Logout"%>

<%--@include file = "common/header.jsp"--%>                 
<%@page contentType="text/html;charset=WINDOWS-1251" %>


<%@include file = "common/header.jsp"%>








<%if((!session.isNew())&&(session.getAttribute("FIRST_NAME")!=null)){%>
<%if("1".equals(request.getParameter("logout"))){%>
<jsp:useBean id="Logoutit" class="com.Logout" scope="request"/>
<jsp:setProperty name="Logoutit" property="*"/>

<%Logoutit.doPost(request,response);%>




<%}else{%>


<tr><%@include file = "common/menu.jsp"%></tr>

<%if("vvod_1".equals(request.getParameter("tper"))){%>

<%@include file = "Vvod_Pol_One.jsp"%>



<%}%>

<%if("vvod_2".equals(request.getParameter("tper"))){%>
<%@include file = "Redak_Pol.jsp"%>



<%}%>
<%if("vvod_3".equals(request.getParameter("tper"))){%>
<%@include file = "block_user.jsp"%>



<%}%>

<%if(("vvod_4".equals(request.getParameter("tper")))||("vvod_4_import_asu_zir_vved".equals(request.getParameter("tper1")))){%>
<%@include file = "import_asu_zir_param.jsp"%>



<%}%>

<%if(("vvod_5".equals(request.getParameter("tper")))||("vozvrat_pol".equals(request.getParameter("tper1")))){%>
<%@include file = "vozvrat_pol.jsp"%>



<%}%>

<%if(("vvod_6".equals(request.getParameter("tper")))||("vozvrat_pol1".equals(request.getParameter("tper1")))){%>
<%@include file = "vvedennie_pol.jsp"%>



<%}%>

<%if(("vvod_7".equals(request.getParameter("tper")))||("asu_zir_vozvrat_pol".equals(request.getParameter("tper1")))){%>
<%@include file = "asu_zir_vozvrat_pol.jsp"%>
<%--@include file = "razrabotka.jsp"--%>


<%}%>
<%--=request.getParameter("tper1")%>
<%=request.getParameter("tper")%>
<%=request.getInputStream()--%>

<%if("vvod_8".equals(request.getParameter("tper"))){%>
<%--||("vvod_list".equals(request.getParameter("tper1"))))    =request.getParameter("tper1")%>
<%=request.getParameter("tper")--%>
<%--if((session.getValue("id_us").equals("35341"))){--%>
<%@include file = "Vvod_Pol_Not_R3_Import_Excel.jsp"%>
<%--} else{%>
<%@include file = "razrabotka.jsp"--%>
<%--}--%>
<%}%>



<%if("vvod_9".equals(request.getParameter("tper"))){%>
<%@include file = "Otchet_Select_Sroki_Zayvok.jsp"%>



<%}%>



<%--if("vvod_9".equals(request.getParameter("tper"))){%>
<%@include file = "JTable_3_class.jsp"%>



<%}--%>

<%if("Otch_1".equals(request.getParameter("tper"))){%>
<%@include file = "li_user_sys.jsp"%>



<%}%>
<%if("Otch_2".equals(request.getParameter("tper"))){%>
<%@include file = "li_adm_sys.jsp"%>



<%}%>

<%if("Otch_3".equals(request.getParameter("tper"))){%>
<%@include file = "import_asuzir.jsp"%>



<%}%>

<%if("Otch_4".equals(request.getParameter("tper"))){%>
<%@include file = "otdel_vvod.jsp"%>



<%}%>


<%if("Otch_5".equals(request.getParameter("tper"))){%>
<%@include file = "otchet_fed_pas_kom.jsp"%>



<%}%>

<%if("Otch_6".equals(request.getParameter("tper"))){%>
<%@include file = "otchet_fed_pas_kom_FIO.jsp"%>



<%}%>
<%if("Otch_7".equals(request.getParameter("tper"))){%>
<%@include file = "otchet_SP.jsp"%>



<%}%>

<%if("Otch_8".equals(request.getParameter("tper"))){%>
<%@include file = "Tree_Select_SP.jsp"%>



<%}%>




<%if("adm_1".equals(request.getParameter("tper"))){%>
<%@include file = "pass.jsp"%>



<%}%>
<%--=request.getParameter("tper")--%>


<%if("adm_2".equals(request.getParameter("tper"))){%>
<%@include file = "vvod_list_organ.jsp"%>



<%}%>


<%if("adm_3".equals(request.getParameter("tper"))){%>
<%@include file = "UploadJsp_Form.jsp"%>



<%}%>






<%}%>
<%}else{%>

<form method="POST" <%--action="<%=request.getContextPath()%>/welcome.jsp"--%> >
 <table width="50%" height="25%" align="Center" border="0" cellspacing="0" cellpadding="0" style="" summary="">
 <tr>
     <td colspan="2"><p align="Center"><b>Вход в систему:</b></p></td>
 </tr>
 <%if(request.getParameter("j_username")!=null){%>
 <tr>
     <td colspan="2" align="Center" style="color: RED"><h3>* Не верный логин или пароль</h3></td>
    
 </tr>
 <%}%>
 <tr>
     <td width="30%">Имя пользователя:</td>
     <td width="50%"><input type="text"  name= "j_username" style="width: 100%;"/></td>
 </tr>
 <tr>
     <td width="30%">Пароль:</td>
     <td width="50%"><input type="password"  name= "j_password" style="width: 100%;"/></td>
     <td ><input type=hidden name="trep1" value="0"></td>
 </tr>
 <tr>
     <td colspan="2"><p align="Right"><input type="submit" value="Войти" /></p></td>
 </tr>
 </table>
</form>

<HR><%}%>

</body>
</html>

