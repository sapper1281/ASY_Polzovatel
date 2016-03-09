<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<script src="jquery-1.4.2.js"></script>
<script > 
    function Click_but_SP(s){
        
         $("#div"+s+" ").load("exampl_3.jsp", {ss: s}, function(){});    
       
    }      
</script>
<table border='1'>

<tr><td ><button onclick="Click_but_SP('2')">Нажми меня</button></td></tr>

<tr><td ><div id='div2'></div></td></tr>

</table>



