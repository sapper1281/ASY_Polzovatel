<%-- 
    Document   : exel_r3
    Created on : 20.12.2010, 9:46:22
    Author     : apopovkin
--%>


<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>



<%@page import= "java.io.*"%>
<%@page import= " java.util.*"%>

<%@page import= " javax.servlet.*"%>

<%@page import= " javax.servlet.http.*"%>
<%@page import= "java.sql.*"%>
<%@page import= " java.net.*"%>
<%@page import= " java.lang.*"%>

<%@page import= " java.io.*"%>
<%@page import= "java.net.*"%>
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
<%@page import= " java.io.*"%>
<%@page import= " java.util.Date"%>
<%@page import= " java.net.*"%>
<%@page import= " javax.servlet.*"%>
<%@page import= " javax.servlet.http.*"%>
<%@page import= " javax.naming.InitialContext"%>
<%@page import= " javax.sql.DataSource"%>
<%@page import= " java.sql.*"%>
<%@page import= " java.util.*"%>
<%@page import= " javax.naming.*"%>
<%@page import= " java.text.*"%>
<%@page import= " java.lang.*"%>

<%@page import= "org.apache.commons.fileupload.*"%>
<%@page import= "org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import= "org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import= "org.apache.poi.hssf.util.*"%>
<%@page import= "org.apache.poi.hssf.usermodel.*"%>



<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
    function getPoisk_fio(ss,ss1) {
        $("#img_load_"+ss1).show();
        document.getElementById('poisk_'+ss1).innerHTML="";
        $("#poisk_"+ss1).load("<%=request.getContextPath()%>/exel_r3_1.jsp",{fio: ss,fio1:ss1}, function(){$("#img_load_"+ss1).hide();});

    }</script>






    <% Object lock = new Object();
                synchronized (lock) {
                    response.setHeader("Expires", "Sun Aug 08 00:00:01 EEST 2010");
                    SimpleDateFormat dateFormatter2 = new SimpleDateFormat("dd.MM.yyyy");

                    request.setCharacterEncoding("UTF-8");
                    String charset = "windows-1251";
                    response.setContentType("text/html; charset=" + charset);

                    String par = request.getParameter("fio").toUpperCase().trim();
                    String sys = request.getParameter("fio1").trim();
                    String sys1 = request.getParameter("fio2").trim();
                   // String par = "58ADM01";
                   // String sys = "CSS_633";
                   // String sys1 = "CSS_640";
 String lang1_1 = " ";

if(!sys1.equals("1")){
%>

<img src="images/status_anim.gif" style="display:none" id="img_load_0_<%=sys1%>"/>
<div id='poisk_0_<%=sys1%>'>
</div>
<%
}
%>

  <%
                        boolean t1 = true;
if(sys.equals("CSS_633")||sys.equals("CSS_640")||sys.equals("RSI_200")||sys.equals("EXP_200")||sys.equals("FRM_600")
   ||sys.equals("P58_658")||sys.equals("PCT_632")||sys.equals("PFK_636")
   ||sys.equals("R00_200")||sys.equals("SOD_615")||sys.equals("SOD_634")||sys.equals("U00_200")
   ){ boolean t_find=true;
      File FL = new File("D:\\exel\\" + sys + ".XLS");
                        InputStream inputStream = new FileInputStream(FL);
                        HSSFWorkbook wb = new HSSFWorkbook(inputStream);

                        HSSFSheet sheet = wb.getSheetAt(0);
                        String lang0 = " ";
                        String lang1 = " ";
                       
                        String lang2 = " ";
                        String lang4 = " ";String langq = " ";
                        Calendar BW_DT_0 = Calendar.getInstance();


                        HSSFRow rowNq=sheet.getRow((short) 0);
                        HSSFCell cellNq = rowNq.getCell((short) 0);
                        if ((cellNq != null) && (cellNq.getCellType() == 1)) {
                                langq = cellNq.getStringCellValue();
                            } else {
                                langq = "нет информации";
                            }
  
                        Date lang3 = BW_DT_0.getTime();
                        Date lang5 = BW_DT_0.getTime();
                        for (Iterator i1 = sheet.rowIterator(); i1.hasNext();) {
                            HSSFRow rowN2 = (HSSFRow) i1.next();
                            HSSFCell cellN0 = rowN2.getCell((short) 0);//начиная со столбца (+1=столбц)
                            HSSFCell cellN1 = rowN2.getCell((short) 1);
                            HSSFCell cellN2 = rowN2.getCell((short) 2);
                            HSSFCell cellN3 = rowN2.getCell((short) 3);
                            HSSFCell cellN4 = rowN2.getCell((short) 4);

                            int ik1=5;int ik2=6;
                            if(sys.equals("R00_200")||sys.equals("EXP_200")||sys.equals("FRM_600")||sys.equals("U00_200")){
                            ik1++;ik2++;

                            }
                            HSSFCell cellN5 = rowN2.getCell((short) ik1);
                            HSSFCell cellN6 = rowN2.getCell((short) ik2);

                            if ((cellN0 != null) && (cellN0.getCellType() == 1)) {
                                lang0 = cellN0.getStringCellValue();
                            } else {
                                lang0 = "нет информации";
                            }

                            if ((cellN1 != null) && (cellN1.getCellType() == 1)) {
                                lang1 = cellN1.getStringCellValue();
                            } else {
                                lang1 = "нет информации";
                            }


                            if ((cellN2 != null) && (cellN2.getCellType() == 1)) {
                                lang2 = cellN2.getStringCellValue();
                            } else {
                                lang2 = "нет информации";
                            }

                            if ((cellN4 != null) && (cellN4.getCellType() == 1)) {
                                lang4 = cellN4.getStringCellValue();
                            } else {
                                lang4 = "нет информации";
                            }


                            String lang3_1 = "";
                            String lang5_1 = "";
                           

                            t1 = !lang0.equals(par);
                            if (!t1) {
                                lang1_1 = lang1;
                                double razn = 0;
t_find=!t_find;





                                if ((cellN5 != null) && (cellN5.getCellType() == 0)) {
                                    lang5 = cellN5.getDateCellValue();}
                                else {
                                    lang5_1 = "нет информации";
                                }


                                if ((cellN6 != null) && (cellN6.getCellType() == 0)) {
                                    lang3 = cellN6.getDateCellValue();


                                    Calendar BW_DT_1 = Calendar.getInstance();
                                    long vr = lang3.getTime() - BW_DT_1.getTime().getTime();
                                    double vr1 = (double) vr;
                                    razn = (double) vr1 / (1000 * 60 * 60 * 24);
                                } else {
                                    lang3_1 = "нет информации";
                                }
  
 
    %>

    <table border="1">
    <tr bgcolor='#A0A0A0'><td colspan="7">Система: <%=sys.substring(0,3)%>; мандат: <%=sys.substring(4,7)%>; от: <%=langq.substring(0,10)%></td></tr>

    <tr bgcolor='#F0F0F0'><td>Пользов.</td><td>Полное имя</td><td>Группа</td><td>Блокир.</td><td>Действ. с</td><td>Действ. по</td><td>Осталось дней</td></tr>
    <%
                                
                                
                                %>





    <tr><td><%=lang0%></td><td><%=lang1%></td><td><%=lang2%></td>




        <%if (lang4.equals("06")){%>
        <td>Блокирован</td>
        <%}%>
        <%if (lang4.equals("5F")){%>
        <td>Не блокирован</td>
        <%}%>

        <%if (!lang4.equals("5F")&&!lang4.equals("06")){%>
        <td>Не определено(<%=lang4%>)</td>
        <%}%>


        <%if (lang5_1.equals("")) {%>
        <td><%=dateFormatter2.format(lang5)%></td>

        <%} else {%><td><%=lang5_1%></td><%}%>



        <%if (lang3_1.equals("")) {%>
        <td><%=dateFormatter2.format(lang3)%></td>

        <%} else {%><td><%=lang3_1%></td><%}%>

        <%if (razn > 0) {%>

        <td bgcolor='#ccff99'><%=Math.round(razn)%></td>
        <%} else {%>


        <%if (lang3_1.equals("")) {%>

        <td bgcolor='#ff9999'>истек</td>

        <%} else {%><td bgcolor='yellow'>нет информации</td><%}%>


        <%}%>
    </tr>




    <%
       %>
 <tr><td colspan='7'>Продолжить поиск по ФИО в той же системе<input type="button" value="найти" onClick="getPoisk_fio('<%=lang1_1%>','<%=sys%>');" /></td></tr>
    <tr><td colspan='7'>
            <img alt="загрузка" src='images/status_anim.gif' style='display:none' id='img_load_<%=sys%>'/>
            <div id='poisk_<%=sys%>'>
            </div>
        </td></tr></table>
<%






                            }
                        }


if(t_find){
%>
<table border="1">
    <tr bgcolor='#A0A0A0'><td colspan="7">Система: <%=sys.substring(0,3)%>; мандат: <%=sys.substring(4,7)%>; от: <%=langq.substring(0,10)%>; нет информации</td></tr>
      </table>
<%
}

}


   else{
//--------------------------------------------

boolean t_find=true;


                            
                            
                            
                            
                        File FL = new File("D:\\exel\\" + sys + "_U.XLS");
                        InputStream inputStream = new FileInputStream(FL);
                        HSSFWorkbook wb = new HSSFWorkbook(inputStream);

                        HSSFSheet sheet = wb.getSheetAt(0);
                        String lang0 = " ";
                        String lang1 = " ";
String lang2 = " ";
                        String lang4 = " ";String langq = " ";

                        String lang0_L = " ";
                        String lang1_L = " ";
                        String lang2_L = " ";
                        String lang4_L = " ";String langq_L = " ";
                        Calendar BW_DT_0 = Calendar.getInstance();


                        HSSFRow rowNq=sheet.getRow((short) 0);
                        HSSFCell cellNq = rowNq.getCell((short) 0);
                        if ((cellNq != null) && (cellNq.getCellType() == 1)) {
                                langq = cellNq.getStringCellValue();
                            } else {
                                langq = "нет информации";
                            }
   
                        Date lang3 = BW_DT_0.getTime();
                        Date lang5 = BW_DT_0.getTime();
                        for (Iterator i1 = sheet.rowIterator(); i1.hasNext();) {
                            HSSFRow rowN2 = (HSSFRow) i1.next();
                            HSSFCell cellN0 = rowN2.getCell((short) 0);//начиная со столбца (+1=столбц)
                            HSSFCell cellN1 = rowN2.getCell((short) 1);
                            HSSFCell cellN2 = rowN2.getCell((short) 2);
                            HSSFCell cellN3 = rowN2.getCell((short) 3);
                           // HSSFCell cellN4 = rowN2.getCell((short) 4);
                           // HSSFCell cellN5 = rowN2.getCell((short) 5);
                           // HSSFCell cellN6 = rowN2.getCell((short) 6);

                            if ((cellN0 != null) && (cellN0.getCellType() == 1)) {
                                lang0 = cellN0.getStringCellValue();
                            } else {
                                lang0 = "нет информации";
                            }

                            if ((cellN1 != null) && (cellN1.getCellType() == 1)) {
                                lang1 = cellN1.getStringCellValue();
                            } else {
                                lang1 = "нет информации";
                            }


                            if ((cellN2 != null) && (cellN2.getCellType() == 1)) {
                                lang2 = cellN2.getStringCellValue();
                            } else {
                                lang2 = "нет информации";
                            }

                            if ((cellN3 != null) && (cellN3.getCellType() == 1)) {
                                lang4 = cellN3.getStringCellValue();
                            } else {
                                lang4 = " ";
                            }






                           t1 = !lang0.equals(par);
                            if (!t1) {
 t_find=!t_find;
                        File FL1 = new File("D:\\exel\\" + sys + "_L.XLS");
                        InputStream inputStream1 = new FileInputStream(FL1);
                        HSSFWorkbook wb_L = new HSSFWorkbook(inputStream1);

                        HSSFSheet sheet_L = wb_L.getSheetAt(0);
                         String lang3_1 = "";
                            String lang5_1 = "";



                                lang1_1 = lang2.trim()+lang4.trim();
                                double razn = 0;



                        for (Iterator i1_L = sheet_L.rowIterator(); i1_L.hasNext();) {
                            HSSFRow rowN2_L = (HSSFRow) i1_L.next();
                            HSSFCell cellN0_L = rowN2_L.getCell((short) 0);//начиная со столбца (+1=столбц)
                            HSSFCell cellN1_L = rowN2_L.getCell((short) 1);
                            HSSFCell cellN2_L = rowN2_L.getCell((short) 2);
                            HSSFCell cellN3_L = rowN2_L.getCell((short) 5);

                            if ((cellN0_L != null) && (cellN0_L.getCellType() == 1)) {
                                lang0_L = cellN0_L.getStringCellValue();
                            } else {
                                lang0_L = "нет информации";
                            }

                            

                           

                        if(lang0_L.equals(par)){
                            if ((cellN3_L != null) && (cellN3_L.getCellType() == 1)) {
                                lang4_L = cellN3_L.getStringCellValue();
                            } else {
                                lang4_L = "нет информации";
                            }

                            if ((cellN1_L != null) && (cellN1_L.getCellType() == 0)) {
                                    lang5 = cellN1_L.getDateCellValue();}
                                else {
                                    lang5_1 = "нет информации";
                                }


                                if ((cellN2_L != null) && (cellN2_L.getCellType() == 0)) {
                                    lang3 = cellN2_L.getDateCellValue();


                                    Calendar BW_DT_1 = Calendar.getInstance();
                                    long vr = lang3.getTime() - BW_DT_1.getTime().getTime();
                                    double vr1 = (double) vr;
                                    razn = (double) vr1 / (1000 * 60 * 60 * 24);
                                } else {
                                    lang3_1 = "нет информации";
                                }


                         }



                                         }







                           


    %>
 

    <table border="1">

   <tr bgcolor='#A0A0A0'><td colspan="7">Система: <%=sys.substring(0,3)%>; мандат: <%=sys.substring(4,7)%>; от: <%=langq.substring(0,10)%></td></tr>

    <tr bgcolor='#F0F0F0'><td>Пользов.</td><td>Полное имя</td><td>Группа</td><td>Блокир.</td><td>Действ. с</td><td>Действ. по</td><td>Осталось дней</td></tr>
    <%



                                
    %> <tr><td><%=lang0%></td><td><%=lang2%> <%=lang4%></td><td><%=lang1%> </td>



 <%if (lang4_L.equals("нет информации")){%>
        <td>Не блокирован</td>
        <%}else{%>
        
        <td><%=lang4_L%></td>
       <%}%>


        <%if (lang5_1.equals("")) {%>
        <td><%=dateFormatter2.format(lang5)%></td>

        <%} else {%><td><%=lang5_1%></td><%}%>



        <%if (lang3_1.equals("")) {%>
        <td><%=dateFormatter2.format(lang3)%></td>

        <%} else {%><td><%=lang3_1%></td><%}%>

        <%if (razn > 0) {%>

        <td bgcolor='#ccff99'><%=Math.round(razn)%></td>
        <%} else {%>


        <%if (lang3_1.equals("")) {%>

        <td bgcolor='#ff9999'>истек</td>

        <%} else {%><td bgcolor='yellow'>нет информации</td><%}%>


        <%}%>
    </tr>
  <%  %>
 <tr><td colspan='7'>Продолжить поиск по ФИО в той же системе<input type="button" value="найти" onClick="getPoisk_fio('<%=lang1_1%>','<%=sys%>');" /></td></tr>
    <tr><td colspan='7'>
            <img alt="загрузка" src='images/status_anim.gif' style='display:none' id='img_load_<%=sys%>'/>
            <div id='poisk_<%=sys%>'>
            </div>
        </td></tr></table>

    <%}
 


                                                         }





if(t_find){
%>
<table border="1">
    <tr bgcolor='#A0A0A0'><td colspan="7">Система: <%=sys.substring(0,3)%>; мандат: <%=sys.substring(4,7)%>; от: <%=langq.substring(0,10)%>; нет информации</td></tr>
      </table>
<%

}








//--------------------------------------------------
   }














    %>

<%
             
            }%>

           
           