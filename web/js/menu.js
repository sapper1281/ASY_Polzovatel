var browser_name = navigator.appName.substring(0,9);
var forms1=document.forms;

var oncolor= '#C0C0C0';
var offcolor='#D8D8D8';

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
                //alert(typ);
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
var menu_button;
var menu_down;
var menu_down_button;
var menu_right;
var form_hidden;
var clmenu=0;
//Вызывается при наведенни на кнопку после чего снизу выпадает меню
// obg - это кнопка, objnm - название кнопки obj1 - фрейм который всплывает при нажатии на кнопку
function vfunc1 (obj,objnm,obj1)
{
 clmenu=1;
 try
  {
    if (menu_button!=null)
    {
      menu_button.style.background="#C0C0C0";
    }
    if (menu_down!=null)
    {
      menu_down.style.visibility="hidden";
    }
     if (menu_right!=null)
    {
      menu_right.style.visibility="hidden";
    }
  }
  catch (e){}

 if (obj!=menu_button)
 {

  menu_button= obj;
  menu_down=obj1;
  hideform ();
  var vis;
  obj.style.background="#D8D8D8";
  if (obj1!=null)
    {
       vis = obj1.style.visibility;
       obj1.style.background = "#D8D8D8";
    //   var tabx = document.getElementById('menu').offsetTop+document.getElementById('t1').offsetTop+document.getElementById('d1').offsetTop+document.getElementById('t2').offsetTop+document.getElementById('d2').offsetTop+document.getElementById('d4').offsetTop;
     //  var taby = document.getElementById('menu').offsetLeft+document.getElementById('t1').offsetLeft+document.getElementById('d1').offsetLeft+document.getElementById('t2').offsetLeft+document.getElementById('d2').offsetLeft+document.getElementById('t3').offsetLeft+document.getElementById('d4').offsetLeft;
 var tabx = document.getElementById('menu').offsetTop;
 var taby = document.getElementById('menu').offsetLeft;

 var x = document.getElementById(objnm).offsetTop;
       var y = document.getElementById(objnm).offsetLeft;
       var wid1 = obj1.style.width;
       wid1 = wid1.substr(0, wid1.length-2);
       var right = y + taby + parseInt(wid1);
       if (right > 840)
       {
            var wid = obj.width;
            obj1.style.left = y + taby - parseInt(wid1) + parseInt(wid) + Math.ceil(taby/2) + 1;
       }
       else {
           obj1.style.left = y + taby;
       }
       obj1.style.top = x + tabx + 28 + 2;

       obj1.style.visibility = "visible";
    }
  }
  else
  {
    menu_button=null;menu_down=null;menu_right=null;showform ();
  }

}
//Вызывается при наведенни на фрейм изменяет кнопку и сам фрейм
// obg - это кнопка,obj1 - фрейм который всплывает при нажатии на кнопку
function vfunc (obj, obj1)
{
    hideform ();
    obj.style.background=oncolor;
}

function vfuncoff (obj, obj1)
{
    obj.style.background=offcolor;
}

function vfunc2 (obj, obj1)
{
    hideform ();
    obj.style.background=offcolor;
}

function vfuncoff2 (obj, obj1)
{
    obj.style.background=oncolor;
}
//Вызывается при наведеннии на пункт горизонтального меню изменяет фон пункта
//если передан фрейм бокового меню отображает его
//obj - пункт меню,objnm - название пункта меню,
//obj1 - фрейм в котором расположен пункт меню для получения координат бокового меню
//obj2 - фрейм который всплывает при нажатии на кнопку
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


