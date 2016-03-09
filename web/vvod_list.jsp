<%@page contentType="text/html;charset=WINDOWS-1251" pageEncoding="Cp1251" %>
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
<%@page import= " javax.sql.DataSource"%>
<%@page import= " org.apache.poi.hssf.util.*"%>
<%@page import= " org.apache.poi.hssf.usermodel.*"%>
<%@page import= " java.text.SimpleDateFormat"%>
<%@page import= " org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import= " org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import= " org.apache.commons.fileupload.*"%>
<%@page import= " javax.servlet.ServletException"%>
<%@page import= " java.text.SimpleDateFormat"%>





<script type="text/javascript">
   var request = false;
   try {
     request = new XMLHttpRequest();
     //request = new XMLHttpResponse();
   } catch (trymicrosoft) {
     try {
       request = new ActiveXObject("Msxml2.XMLHTTP");
      // response = new ActiveXObject("Msxml2.XMLHTTP");
     } catch (othermicrosoft) {
       try {
         request = new ActiveXObject("Microsoft.XMLHTTP");
         //response = new ActiveXObject("Microsoft.XMLHTTP");
       } catch (failed) {
         request = false;
        // response = false;
       }  
     }
   }

   if (!request)
     alert("Error initializing XMLHttpRequest!");

  
 function getCus_1(par_1,par_2,par_3,par_4) {
 
 //alert(document.getElementById(par_1).value);
 for (var i=0; i < document.getElementsByName(par_2).length; i++){ 
       if( document.getElementsByName(par_2)(i).checked){ 
document.getElementById(par_1).value= document.getElementsByName(par_2)(i).value; 
document.getElementById(par_3).value= document.getElementsByName(par_4)(i).innerHTML     }}
 //    document.getElementById(par_1).value=document.getElementById(par_2).value;
 //alert(document.getElementById(par_1).value); 
 //alert(document.getElementById(par_3).value); 
      // document.getElementById(par_3).value=par_4;
 //alert(document.getElementById(par_3).value);
}
        
     
     
     
 //function getCus(vvod_li) {
     // var vvod_li_1 = document.getElementById(vvod_li).value;
      
       
    //  alert(vvod_li_1); 

      
 //  var params = "vvod_li_1=" + encodeURIComponent(vvod_li_1);
 //alert(<%=request.getCharacterEncoding()%>);
    
  
 
 
  //   var url = "<%=request.getContextPath()%>/vvod_list_1";
  //   document.getElementById("vvod_lis").innerHTML="загрузка";
  //   request.open("POST", url, true);
  // request.setRequestHeader('Content-Type', 'multipart/form-data')
 //  request.setRequestHeader('Content-Type', 'application/octet-stream')

    
 //   request.onreadystatechange = upDate;
  //   request.send(params);
  // }

// function upDate() {
 //    if (request.readyState == 4) {
 //      if (request.status == 200) {
 //        var response = request.responseText;
        
  //       document.getElementById("vvod_lis").innerHTML =response;
         
  //     } else
          
   //      alert("status is " + request.status+response);
   //  }
  // }
      
    
     
 </script>

<%if((!session.isNew())&&(session.getValue("FIRST_NAME")!=null)){%>
 <%Object lock = new Object(); 
synchronized(lock)
       {%>
<HR>


<tr><td><H3>Ввод списка</H3></td></tr>
<HR>

<tr><td><H3>Выберите системы</H3></td></tr>
<%try { %> 
   <% 
String sys=""; int tt=1;
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
       Connection myconnection1 = DriverManager.getConnection("jdbc:db2:ASU_POL4" , "db2admin", "D2_12345678");  

     Statement stmt_sys = myconnection1.createStatement(); 
     ResultSet rs_sys = stmt_sys.executeQuery(sys); %>


<tr><td> 
<div style="OVERFLOW: auto; WIDTH: 500px; HEIGHT: 200px"> 
<table> 

<tr>

<%--td  NOWRAP colspan='2' ><input id='IDSYS' name='IDSYS' type='radio' value='-1'
   onClick="CHEKSYSALL(this.form,'IDSYS','IDSYS')"
   > Все системы</td></tr--%>
 <% int k=2;
 boolean r=true;
while (rs_sys.next()){  %>
<tr><td  NOWRAP id='IDSYS_td' name='IDSYS_td' ><%=k-1%>. <input id='IDSYS' name='IDSYS' type='radio' <%if(r){%>checked<%}%> value='<%=rs_sys.getInt("id_system")%>'
  
   ><%=rs_sys.getString("sn_system").trim()%></td></tr>
 <%k++; if(r){r=false;}
  } 
rs_sys.close();
stmt_sys.close();
%>

</table>
</div> 
</td></tr>


<% myconnection1.close();} catch (SQLException e) {%> <tr>Ошибка <%=e%></tr> <%}%>





   <form name="sendfile" method=post enctype="multipart/form-data" action="<%=request.getContextPath()%>/vvod_list_3">
<table width=60%>
       <input type=hidden id="tper1" name="tper1" value=""/> 
        <input type=hidden id="tper2" name="tper2" value=""/> 
	<%--tr><td width=20%>Куда</td><td><input type="text" style="width:100%" name="where"></td></tr--%>
	<tr><td>Файл</td><td><input type="file" style="width:100%" name="sendfile"></td></tr>
	<tr><td colspan=2 align=center><input type=submit value="Отправить" onClick="getCus_1('tper1','IDSYS','tper2','IDSYS_td')"> <input type=reset></td></tr>
</table>
</form>
    
    <%--form  method="post" action="<%=request.getContextPath()%>/vvod_list_2" enctype="multipart/form-data" >
    <%--input type=hidden id="tper1" name="tper1" value=""/> 
    <input type=file name=ufile>
    <input type=submit value="Добавить"  onClick="getCus_1('tper1','vvod_list')" >
    </form--%>
   


<tr><td>



<div id='vvod_lis' name='vvod_lis'>
</div>






   <%--        try { 
               //Список загружаемых файлов 
               List files = new ArrayList(); 
               //Список обычных параметров из HTML-формы 
               Map params = new HashMap(); 
               //Инициализируем структуры files и params 
              // init(request, params, files); 
                DiskFileItemFactory factory = new DiskFileItemFactory(); 
           //Устанавливаем каталог для временных файлов 
          
           factory.setRepository(new File("C:/Temp")); 
           ServletFileUpload upload = new ServletFileUpload(factory); 
           //Установим ограничение на размер загружаемого файла в битах 
        //   upload.setSizeMax(102400); 
           List items = upload.parseRequest(request); 
          for (Iterator i = items.iterator(); i.hasNext();) { 
               FileItem item = (FileItem) i.next(); 
              //Проверяем, является ли параметр обычным полем из HTML-формы, 
              //если да, то помещаем в Map пару name=value... 
               if (item.isFormField()) { 
                   params.put(item.getFieldName(), item.getString()); 
               } 
              //... если нет, то конструируем объект AttachmentDataSource и 
               //помещаем его в список прикрепленных файлов 
               else { 
                  if (item.getSize() <= 0) continue; 
                  files.add(item); 
               } 
          } 
               
               
               //Сохраняем файл на сервере 
                response.setContentType("text/html; charset=windows-1251"); 
               final PrintWriter writer = response.getWriter(); 
               //---------------
                try { 
               for (Iterator i = files.iterator(); i.hasNext();) { 
                   FileItem item = (FileItem) i.next(); 
                   //Файл, в который нужно произвести запись 
                //   final File file = new File(params.get("where") + File.separator + item.getName()); 
                  // HttpSession session = request.getSession();
                 // String name_ses=session.getId();%>
                   
                  <tr><td>Файл ----<%=params.get("tper1")%></td></tr>
                   
                   <tr><td>Файл <%=params.get("where")%></td></tr>
                   
                   <tr><td>Файл <%=File.separator%> </td></tr>
                   <tr><td>Файл <%=item.getName()%> </td></tr>
                   <tr><td>Файл <%=item.getFieldName()%> </td></tr>
                   <tr><td>Файл <%=params.get("where")%> + <%=File.separator%> + <%=item.getName()%></td></tr>
                   
                <% 
                String tper2_1=(String)params.get("tper2");
  if(tper2_1.equals("vvod_list")){%>

<tr><td>Файл +++++++++++++++++</td></tr>

<%
}
//HttpSession session = request.getSession();
                   String name_ses=session.getId();
                   
                   final File file = new File("D:\\file"+name_ses+".xls"); 
                  FileOutputStream fos = new FileOutputStream(file); 
                  fos.write(item.get()); 
                   fos.close(); 
                   if(file.isFile()){%>
               <tr><td>Файл успешно загружен<br> </td></tr>
                 <% } else{%>
               <tr><td>Файл не загружен<br> </td></tr>
             <% } } 
           } 
           catch (IOException e) {
                e.printStackTrace(); 
                 // writer.println("Файл "+e+"<br>");
              
               throw e; 
          }
               
            //------------------   
               
               
               
               
              // save(files, params); 
              
             //  writer.println("<a href='" + request.getContextPath() + "/uploadform.html'>Загрузить еще >></a>"); 
               
               
             request.setAttribute("Detail", "vvv");
             request.setAttribute("writer", writer);
             ServletContext servletContext = this.getServletContext();
             RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/vvod_list.jsp");
             dispatcher.forward(request, response); 
               
               writer.close(); 
               
           } 
           catch (FileUploadException fue) { 
               fue.printStackTrace(); 
               throw new ServletException(fue); 
           } 
           catch (Exception e) { 
               e.printStackTrace(); 
               throw new ServletException(e); 
           } %>


<%--if("vvod_list".equals(request.getParameter("tper1"))){%>

<%//Поток, в который будет писаться содержимое (в принципе может быть любой OutputStream)
    //HttpSession session = request.getSession();

String CONTENT_TYPE = "text/html; charset=windows-1251";
   int CR = (int)'\r';
   int LF = (int)'\n';

    String name_ses=session.getId();
    FileOutputStream fos = new FileOutputStream("D:\\file"+name_ses+".xls");
    
    //InputStream fos = new FileInputStream();
    
    
      InputStream is = request.getInputStream();
    int[] data = new int[request.getContentLength()];
    int bytes;
    int counter = 0;
    while((bytes=is.read())!=-1)
      {
      data[counter]=bytes;
      counter++;
      }
    is.close();

// Определение индексов срезки
    int i;
    int beginSliceIndex = 0;
// Конечный индекс срезки - длина границы + доп. символы.
    String cType = request.getContentType();
   
    
    
    int endSliceIndex = data.length - (cType.substring(cType.indexOf("boundary=")+9)).length()-9;

    for(i = 0; i < data.length; i++)
      {
// Начальный индекс срезки: после того как встретятся 2 раза подряд \r\n
      if(data[i] == CR && data[i+1] == LF && data[i+2] == CR && data[i+3] == LF)
        {
        beginSliceIndex = i+4;
        break;
      }
    }

  int[] dataSlice1 = new int[endSliceIndex-beginSliceIndex+1];
  for(i = beginSliceIndex; i<=endSliceIndex; i++)
    {
    dataSlice1[i-beginSliceIndex]=data[i];
    }

   

    
    
    
    
    
    int[] dataSlice = dataSlice1;
   
   // for(i=0; i     fos.write(dataSlice[i]);
    for(i = 0; i < dataSlice.length; i++) fos.write(dataSlice[i]);
    fos.flush();
    fos.close();

// HTML форма отправляемая методом post
    response.setContentType(CONTENT_TYPE);
    
   // String charset = "windows-1251";
    //            response.setContentType( "text/html; charset=" + charset );  
      
    //PrintWriter out = response.getWriter();
    File FL=new File("D:\\file"+name_ses+".xls");
    InputStream inputStream = new FileInputStream(FL); 
    
    HSSFWorkbook wb = new HSSFWorkbook(inputStream);
       HSSFSheet sheet = wb.getSheetAt(0);
       HSSFRow rowN2 = sheet.getRow(1);//начиная с какой строчки (+1=строка)
       HSSFCell cellN2 = rowN2.getCell((short)1);//начиная со столбца (+1=столбц)
       String st= cellN2.getStringCellValue();
       
     //out=out+"   999999999"+st+"99999999999999";
        
    %>
    
    <tr>   999999999 <%=st%> 99999999999999</tr>
   <% if(!FL.delete()){
   %>
   <tr>   не  удален file<%=name_ses%>.xls 99999999999999</tr>
   <%
    }else{
    %>
   <tr>   удален file<%=name_ses%>.xls 99999999999999</tr>
   <%
    }
    inputStream.close();
   // out.println("<html>");
   // out.println("<head><title>UploadServlet‹/title></head>");
  // out.println("<body>");
   // out.println("<form action=\"vvod_list_1\" method=\"post\" enctype=\"multipart/form-data\">");
  //  out.println("<input type=file name=ufile>");
  //  out.println("<input type=submit value=\"Attach\">");
  //  out.println("</form>");
  //  out.println("</body></html>");
    out.close();
  
/*
  private int[] extractData(HttpServletRequest request) throws IOException
    {
// Содержимое пришедших байтов их запроса (содержимое приходящего файла)
    InputStream is = request.getInputStream();
    int[] data = new int[request.getContentLength()];
    int bytes;
    int counter = 0;
    while((bytes=is.read())!=-1)
      {
      data[counter]=bytes;
      counter++;
      }
    is.close();

// Определение индексов срезки
    int i;
    int beginSliceIndex = 0;
// Конечный индекс срезки - длина границы + доп. символы.
    int endSliceIndex = data.length - getBoundary(request).length()-9;

    for(i = 0; i < data.length; i++)
      {
// Начальный индекс срезки: после того как встретятся 2 раза подряд \r\n
      if(data[i] == CR && data[i+1] == LF && data[i+2] == CR && data[i+3] == LF)
        {
        beginSliceIndex = i+4;
        break;
      }
    }

  int[] dataSlice = new int[endSliceIndex-beginSliceIndex+1];
  for(i = beginSliceIndex; i<=endSliceIndex; i++)
    {
    dataSlice[i-beginSliceIndex]=data[i];
    }

  return dataSlice;

 }*/

// Поиск границы
/*private String getBoundary(HttpServletRequest request)
  {
  String cType = request.getContentType();
  return cType.substring(cType.indexOf("boundary=")+9);
  }*/%>



<%}--%> 
</td>
</tr>
<HR>
<%}%> 
<%}%> 
