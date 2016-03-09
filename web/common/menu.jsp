<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>


<form name="form" id="form" method="post" >
              <input type=hidden id="tper" name="tper" value="0"/ >  
             
<table height="25" id="menu" cellspacing=1  cellpadding=2 style="border-right-style: double;
    border-left-style: double;
    border-bottom-style: double;
    border-top-style: double;

    border-right-color: #C0C0C0;
    border-left-color: #C0C0C0;
    border-bottom-color: #C0C0C0;
    border-top-color: #C0C0C0;"">
  <tr >
 <%--if(session.getValue("id_role").equals("2")||session.getValue("id_role").equals("3")){--%>                  

     <td  style=" border-right-style: inset;
     cursor:hand" id="vvod" height="25" width="120" onClick="vfunc1(vvod,'vvod', vvod_FR)">
           <table >
           <tr>
           <td  ><font >Ввод данных</font></td>
           </tr>
           </table >
           
            
  <div  align="left"  style="position: absolute; visibility: hidden; width:100;top: 20px;  z-index:100;" id="vvod_FR">
   <table border=0 cellspacing=1 cellpadding=0
 
style="border-right-style: double;
    border-left-style: double;
    border-bottom-style: double;
    border-top-style: double;
    border-right-color: #C0C0C0;
    border-left-color: #C0C0C0;
    border-bottom-color: #C0C0C0;
    border-top-color: #C0C0C0;"
>
    <tr  id="vvod_1">
     <td NOWRAP style=" border-bottom-style: double;" onClick="check_1(this.form,'tper','vvod_1')">
Единичный ввод
     </td>
    </tr>
    <tr id="vvod_2">
     <td NOWRAP style=" border-bottom-style: double;" onClick="check_1(this.form,'tper','vvod_2')">
Редактрирование
     </td>
    </tr>   
    <tr id="vvod_3">
     <td NOWRAP style=" border-bottom-style: double;" onClick="check_1(this.form,'tper','vvod_3')">
Блокировка
     </td>
    </tr> 
    <tr id="vvod_4">
     <td NOWRAP style=" border-bottom-style: double;" onClick="check_1(this.form,'tper','vvod_4')">
АСУ ЗИР
     </td>
    </tr>
   <tr id="vvod_5">
     <td NOWRAP style=" border-bottom-style: double;"  onClick="check_1(this.form,'tper','vvod_5')">
Разблокировать
     </td>
    </tr> 
    
    <tr id="vvod_6">
     <td NOWRAP  style=" border-bottom-style: double;"  onClick="check_1(this.form,'tper','vvod_6')">
Введенные пол.
     </td>
    </tr> 
    
    <tr id="vvod_7">
     <td  NOWRAP  style=" border-bottom-style: double;" onClick="check_1(this.form,'tper','vvod_7')">
      Ввод непереданных из АСУ ЗИР
     </td>
    </tr> 
    
    <tr id="vvod_8">
     <td  NOWRAP  style=" border-bottom-style: double;" onClick="check_1(this.form,'tper','vvod_8')">
      Ввод пользователей не R3
     </td>
    </tr>  
    
    
    
     <tr id="vvod_9">                                 
    <td  NOWRAP onClick= "check_1(this.form,'tper','vvod_9')" >
 Просроченные заявки
                
   </td>
  </tr>  
    
    <%--tr id="vvod_9">
     <td  style="  width:100;top: 20px;  z-index:105;">       
      <input type="submit" value="Ввод не найденных пол-й" onClick="check_1(this.form,'tper','vvod_9')">
     </td>
    </tr--%> 
    
   </table>                 
  </div>
              
            
    </td> 
      <%--}--%>        
    
   
    
    
         <td  style=" border-right-style: inset;cursor:hand" id="Otch" height="25" width="120" onClick="vfunc1(Otch,'Otch', Otch_FR)">
           <table >
           <tr>
           <td ><font >Отчеты</font></td>
           </tr>
           </table >
            <!--Выпадающее меню Оперативные отчеты-->
            
            
            
            
              <div  align="left"  style="position: absolute; visibility: hidden; width:150;top: 40px;  z-index:100;" id="Otch_FR">
                   <table cellspacing=1 cellpadding=0 style="border-right-style: double;
    border-left-style: double;
    border-bottom-style: double;
    border-top-style: double;

    border-right-color: #C0C0C0;
    border-left-color: #C0C0C0;
    border-bottom-color: #C0C0C0;
    border-top-color: #C0C0C0;"">
            
  <tr  id="Otch_1">
  <td NOWRAP  style=" border-bottom-style: double;border-top-color: black;"  onClick="check_1(this.form,'tper','Otch_1')">
 Кол-во введенных
                            
 </td>
  </tr>
                   
                   
   <tr id="Otch_2">
   <td  NOWRAP style=" border-bottom-style: double;border-top-color: black;" onClick= "check_1(this.form,'tper','Otch_2')" >
 Админ.систем
                
   </td>
  </tr>     
           
  <tr id="Otch_3">
   <td NOWRAP  style=" border-bottom-style: double;border-top-color: black;" onClick= "check_1(this.form,'tper','Otch_3')" >
 Выгрузка из АСУ ЗИР
                
   </td>
  </tr>  
            
   <tr id="Otch_4">                                 
    <td  NOWRAP style=" border-bottom-style: double;border-top-color: black;" onClick= "check_1(this.form,'tper','Otch_4')" >
 Отделы вводящие инф.
                
   </td>
  </tr>  
  <tr id="Otch_5">                                 
    <td NOWRAP  style=" border-bottom-style: double;border-top-color: black;" onClick= "check_1(this.form,'tper','Otch_5')" >
 Кол-во введенных пользователей ФПК
                
   </td>
  </tr>  
  <tr id="Otch_6">                                 
    <td  NOWRAP style=" border-bottom-style: double;border-top-color: black;" onClick= "check_1(this.form,'tper','Otch_6')" >
 Введенные пользователи ФПК
                
   </td>
  </tr>  
  
 <%-- <tr id="Otch_7">                                 
    <td>  
         
   <input type="submit" value="Отчет о введенных пользователей по СП" onClick= "check_1(this.form,'tper','Otch_7')" >
 
                
   </td>
  </tr> --%> 
  <tr id="Otch_8">                                 
    <td  NOWRAP  onClick= "check_1(this.form,'tper','Otch_8')" >
  Пользователи по СП
                
   </td>
  </tr>  
  
  
  
                   
                    </table>
                </div>
                
                 <!--Спарвки ВЦ-->
               
                
    </td> 
    
    
    
   
    
    
    
    <td  style="cursor:hand" id="adm" height="25" width="120" onClick="vfunc1(adm,'adm', adm_FR)">
           <table border='0'>
           <tr>
           <td ><font >Администрирование</font></td>
           </tr>
           </table >
            <!--Выпадающее меню Оперативные отчеты-->
              <div  align="left"  style="position: absolute; visibility: hidden; width:150;top: 40px;  z-index:100;" id="adm_FR">
                   <table  cellspacing=1 cellpadding=0 style="border-right-style: double;
    border-left-style: double;
    border-bottom-style: double;
    border-top-style: double;

    border-right-color: #C0C0C0;
    border-left-color: #C0C0C0;
    border-bottom-color: #C0C0C0;
    border-top-color: #C0C0C0;"" >
  <tr id="adm_1">
   <tt><td  NOWRAP  style=" border-bottom-style: double;border-top-color: black;"    
  onClick= "check_1(this.form,'tper','adm_1')"  >
 Админ1
  </td></tt>

  </tr>
                   
                   
   <tr id="adm_2">
   <td   NOWRAP style=" border-bottom-style: double;border-top-color: black;" onClick= "check_1(this.form,'tper','adm_2')" >
 Админ2
  </td>
  </tr>    

<tr id="adm_3">
   <td   NOWRAP onClick= "check_1(this.form,'tper','adm_3')" >
 Админ3
  </td>
  </tr> 




                                       
 <%--tr  id="oper_rep_11" onMouseOver="vfunc4(oper_rep_11,'oper_rep_11',oper_rep_FR,oper_rep_11FR)" ><td><a href="<%=request.getContextPath()%>/index_1.jsp" >rrrrrrrrr</td></tr--%>
                    
                    </table>
                </div>
                
                 <!--Спарвки ВЦ-->
                <%--div  align="left" style="position: absolute; visibility: hidden; left: 300px; top: 40px; width: 350px; height: 98px;z-index:100;" id="oper_rep_11FR">
                                          <table  cellspacing=1 cellpadding=0>
                   
                       
                  <tr  id="oper_rep_11_1" onMouseOver="vfunc(oper_rep_11_1)" 
                  onMouseOut="vfuncoff(oper_rep_11_1)"><td  height="25"  >&nbsp;&nbsp;
                  <a href="<%=request.getContextPath()%>/index_1.jsp" >
                  ВЦ-4 Справка о локомотивах в НЭП</a></td></tr>
                  
                                       
                                          </table>
                </div>
       
                
                <!--Спарвки ВЦ-->
                <div  align="left" style="position: absolute; visibility: hidden; left: 300px; top: 40px; width: 350px; height: 98px;z-index:100;" id="oper_rep_10FR">
                                          <table  cellspacing=1 cellpadding=0>
                   
                       
                  <tr  id="oper_rep_10_1" onMouseOver="vfunc(oper_rep_10_1)" 
                  onMouseOut="vfuncoff(oper_rep_10_1)"><td  height="25"  >&nbsp;&nbsp;
                  <a href="<%=request.getContextPath()%>/index_1.jsp" >
                  ВЦ-4 Справка о локомотивах в НЭП</a></td></tr>
                  
                                       
                                          </table>
                </div--%>
                
    </td> 
    
    
    
    
    
    
  </tr>
  
  
  
  
  
</table>

 </form >
<%--/td>

<td align="right">




<table>
<tr>
<td>
<tr>
<form name="senddata1" method=post>
<td ><input type=hidden name="trep1" value="1">

<input type = "submit" value="Выход"></td>
</form>
</tr>
</td></tr>
</table>
</td>
</tr>
</table--%>

<%--Script language="Javascript" type="text/javascript">
var people = { "programmers": [
  { "firstName": "Иван", "lastName":"Иванов", "email": "ivan@test.ru" },
  { "firstName": "Петр", "lastName":"Петров", "email": "peter@test.ru" },
  { "firstName": "Сидор", "lastName":"Сидоров", "email": "sidor@test.ru" }
 ],
"authors": [
  { "firstName": "Сергей", "lastName":"Сергеев", "email": "sergey@test.ru" },
   { "firstName": "Алексей", "lastName":"Алексеев", "email": "alexey@test.ru" }
 ],
"musicians": [
  { "firstName": "Дмитрий", "lastName":"Дмитриев", "email": "dmitry@test.ru" },
   { "firstName": "Александр", "lastName":"Александров", "email": "alexander@test.ru" }
 ]
}


   var request = false;
   // Создаем объект XMLHttpRequest. Обратите внимание, что для каждого типа браузера этот объект
	 // создается по-разному.
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

   // Если не удалось создать объект XMLHttpRequest, сообщаем об ошибке
   if (!request)
     alert("Не могу создать объект XMLHttpRequest!");

// Данная функция вызывается JavaScript’ом при выполнении пользователем какого-либо действия,
// например, нажатия на кнопку.
function updateUserData() {
var url = "<%=request.getContextPath()%>/index_1.jsp?tper=1";
request.open("POST", url, true);
request.onreadystatechange = updatePage;
request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
request.send(people.toJSONString());
 }


// Данная функция вызывается после того, как ответ от сервера получен. JavaScript в этой функции
// изменяет DOM-дерево (содержимое) HTML-страницы без ее перезагрузки.
 function updatePage() {
     if (request.readyState == 4) {
       if (request.status == 200) {
         var response = request.responseText;
         document.getElementById("senddata"). innerHTML = response;
} else
         alert("status is " + request.status);
     }
   }
 </script--%>


<Script language="Javascript" >




var browser_name = navigator.appName.substring(0,9);
var forms1=document.forms;

var oncolor= '#ffffff';
var offcolor='#ffffff';
var b1=1;
var b2=2;
var b3=3;
var b4=4;
var menu_button;
var menu_down;
var menu_down_button;
var menu_right;
var form_hidden;
var clmenu=0;
 

function check_1(oForm, cbName, sd) 
         { 
document.getElementById(cbName).value=sd;
//document.getElementById("img_otchet").style.display="block";

obj = document.getElementById('form');  
obj.setAttribute("action","<%=request.getContextPath()%>/index.jsp");  
obj.setAttribute("method","post");
obj.submit(); 

      
      
      
          }

          
        
          
          
          
          
//Вызывается при наведенни на кнопку после чего снизу выпадает меню
// obg - это кнопка, objnm - название кнопки obj1 - фрейм который всплывает при нажатии на кнопку
function vfunc1 (obj,objnm,obj1)
{
 clmenu=1;
 try
  {
    if (menu_button!=null)
    {
      menu_button.style.background="#ffffff";//alert(b1);
    }
    if (menu_down!=null)
    {
      menu_down.style.visibility="hidden";//alert(b2);
    }
     if (menu_right!=null)
    {
      menu_right.style.visibility="hidden";//alert(b3);
    }
  }
  catch (e){}

 if (obj!=menu_button)
 {

  menu_button= obj;
  menu_down=obj1;
  hideform ();
  var vis;
  obj.style.background="#ffffff";
  if (obj1!=null)
    { //alert(b4);
       vis = obj1.style.visibility;
       obj1.style.background = "#ffffff";
      // var tabx = document.getElementById('menu').offsetTop+document.getElementById('t1').offsetTop+document.getElementById('d1').offsetTop+document.getElementById('t2').offsetTop+document.getElementById('d2').offsetTop+document.getElementById('d4').offsetTop;
var tabx = document.getElementById('menu').offsetTop;
            
//var taby = document.getElementById('menu').offsetLeft+document.getElementById('t1').offsetLeft+document.getElementById('d1').offsetLeft+document.getElementById('t2').offsetLeft+document.getElementById('d2').offsetLeft+document.getElementById('t3').offsetLeft+document.getElementById('d4').offsetLeft;
 var taby = document.getElementById('menu').offsetLeft;
      var x = document.getElementById(objnm).offsetTop;
       var y = document.getElementById(objnm).offsetLeft;
       var wid1 = obj1.style.width;
       //alert(taby);
       //alert(y);
       //alert(wid1);
       wid1 = wid1.substr(0, wid1.length-2);
       var right = y + taby + parseInt(wid1);
       if (right > 840)
       { //alert(right);
            var wid = obj.width;
            obj1.style.left = y + taby - parseInt(wid1) + parseInt(wid) + Math.ceil(taby/2) + 1;
       }
       else { //alert(right);
           obj1.style.left = y + taby;
       }
       //alert(x);
       //alert(tabx);
       obj1.style.top = x + tabx + 28 + 2;
//alert(obj1.style.top);
       obj1.style.visibility = "visible";
    }
  }
  else
  {
    menu_button=null;menu_down=null;menu_right=null;showform ();
  }

}



function vfunc (obj, obj1)
{
    hideform ();
    obj.style.background=oncolor;
}

function vfunc4 (obj,objnm,obj1,obj2)
{
 if (obj!=menu_down_button)
 {
 try
  {
    if (menu_down_button!=null)
    {
      menu_down_button.style.background=offcolor;
    }
     if (menu_right!=null)
    {
      menu_right.style.visibility="hidden";
    }
  }
  catch (e){}
 }
  menu_down_button=obj;
  menu_right=obj2;
hideform ();
obj.style.background=oncolor;
if (obj1!=null)
  {
     var x = obj1.style.left;
     var wid = obj1.style.width;
     wid = wid.substr(0,wid.length-2);
     x = x.substr(0,x.length-2);
     x = parseInt(x) + parseInt(wid) - 1;
     if (x > 840) {
        var wid1 = obj2.style.width;
        x = obj1.style.left;
        x = x.substr(0, x.length-2);
        x = parseInt(x) - parseInt(wid1);
     }
     x = parseInt(x) + "px";
     var y = obj1.style.top;
     var dy = document.getElementById(objnm).offsetTop;
     y = y.substr(0,y.length-2);
     y = parseInt(y) + parseInt(dy) - 1 + "px";
     try
      {obj2.style.left = x;}
     catch (err){}//alert(x+y+' ');
     obj2.style.top = y.substr(0, y.length-2);
     obj2.style.visibility = "visible";
  }
}

function showform ()
{
if (browser_name=="Microsoft")
{
 form_hidden=0;
for (i=0;i<forms1.length;i++)
        {
           if ((forms1[i].name!='formlogoff')&&(forms1[i].id!='excel_form')&&(forms1[i].id!='print_form'))
           {
             elements1=forms1[i].elements;
           for (j=0;j<elements1.length;j++)
           {
                var typ=elements1[j].type;
               // alert(typ);
                 //typ=typ.substring(0,6);
                 if ((typ=="select-one")||(typ=="select-multiple"))
                {

                 elements1[j].style.visibility="visible";
                }
           }
          }
        }
 }
}

function hideform ()
{
if ( form_hidden!=1)
{
if (browser_name=="Microsoft")
{
 form_hidden=1;
for (i=0;i<forms1.length;i++)
        {
           if ((forms1[i].name!='formlogoff')&&(forms1[i].id!='excel_form')&&(forms1[i].id!='print_form'))
           {
            elements1=forms1[i].elements;
           for (j=0;j<elements1.length;j++)
           {

             var typ=elements1[j].type;
                  //typ=typ.substring(0,6);
                 if ((typ=="select-one")||(typ=="select-multiple"))
                {
                  elements1[j].style.visibility="hidden";
                }
           }
          }
        }
 }
 }
}

</Script>






