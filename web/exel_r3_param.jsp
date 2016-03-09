<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
<head><title>JSP Page</title></head>
<body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
 function getPoisk(ss,ss1,ssi) {
   
  // for(i=0;i<6;i++){

  // alert(document.getElementById('sel')(i).value);


 //  }
   if(document.getElementById('sel').value!='not'){

   $("#img_load_0_CSS_633").show();
   document.getElementById('poisk_0_CSS_633').innerHTML="";
   var fio = document.getElementById(ss).value;
   var fio1 = document.getElementById(ss1).value;
   var fio2 ='1';
   $("#poisk_0_CSS_633").load("<%=request.getContextPath()%>/exel_r3.jsp",{fio: fio,fio1:fio1,fio2:fio2}, function(){$("#img_load_0_CSS_633").hide();});
   }
else{
//document.getElementById('poisk').innerHTML='Введите параметры';
//$("#img_load").hide();
//for(i=1;i<4;i++){
   //alert(document.getElementById('sel').length);
   if(ssi<document.getElementById('sel').length){
   $("#img_load_0_"+document.getElementById('sel')(ssi).value).show();}
  // document.getElementById("poisk_0_"+document.getElementById('sel')(i).value).innerHTML="";

   var fio = document.getElementById(ss).value;

   if(ssi<document.getElementById('sel').length){
   var fio1 =document.getElementById('sel')(ssi).value;} //document.getElementById(ss1).value;
   var fio2 ='1';
   if(ssi<document.getElementById('sel').length-1){
   fio2=document.getElementById('sel')(ssi+1).value;}

   if(ssi<document.getElementById('sel').length){
   $("#poisk_0_"+fio1).load("<%=request.getContextPath()%>/exel_r3.jsp",{fio: fio,fio1:fio1,fio2:fio2},
   function(){$("#img_load_0_"+fio1).hide();  getPoisk(ss,ss1,ssi+1)   });
   }

   //}

}
}

</script>
<%Object lock = new Object();
synchronized(lock)
     {

response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");

 %>


<center><H3>Сроки окончания действия полномочий</H3></center>










<center><H3>Введите параметры</H3></center>
<table align='center'>

<tr>
<td  align='left'>Выберите систему
</td>
<td colspan="2" align='left'>
<select id='sel'>
<option value='not'>Все системы</option>
<%--option value='OCO'>OCO</option--%>
<option value='CSS_633'>система CSS мандат 633</option>
<option value='CSS_640'>система CSS мандат 640</option>
<option value='D58_910'>система D58 мандат 910</option>
<option value='DRV_440'>система DRV мандат 440</option>
<option value='EXP_200'>система EXP мандат 200</option>
<option value='FRM_600'>система FRM мандат 600</option>
<option value='P58_658'>система P58 мандат 658</option>
<option value='PCT_632'>система PCT мандат 632</option>
<option value='PFK_636'>система PFK мандат 636</option>
<option value='R00_200'>система R00 мандат 200</option>
<option value='RSI_200'>система RSI мандат 200</option>
<option value='TFS_400'>система TFS мандат 400</option>
<option value='TFS_420'>система TFS мандат 420</option>
<option value='TFS_630'>система TFS мандат 630</option>
<option value='SOD_615'>система SOD мандат 615</option>
<option value='SOD_634'>система SOD мандат 634</option>
<option value='U00_200'>система U00 мандат 200</option>
</select>
</td>
</tr>


<tr>
<td  align='left'>Введите логин
</td>
<td  align='left'>
<div>
<input name="searchqPoisk" type="text" id="searchqPoisk" size="50" maxlength=250 value=""  />
</div>
</td>


<td align='left'>
<input type="button" value="найти" onClick="getPoisk('searchqPoisk','sel',1);" />
</td>
</tr>

<tr><td colspan='3'>
        <table>

<tr>
<td  align='left'>
<img src="images/status_anim.gif" style="display:none" id='img_load_0_CSS_633'/>
<div id='poisk_0_CSS_633'>
</div>
</td>
</tr>

    </table></td></tr>

</table>




 <%} %>
</body>
</html>
