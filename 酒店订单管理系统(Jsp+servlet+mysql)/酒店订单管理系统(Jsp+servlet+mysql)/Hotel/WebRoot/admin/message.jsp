<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'message.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
	             function AlertDel() {
	if (confirm("ȷ��Ҫɾ����¼��")) return(true);
	else return(false);
	}
	
	function check(){
	  alert("11");
	 var th=document.getElementById("userform"); 
     for(var i=0;i<th.elements.length;i++) 
     { 
        var o=th.elements[i]; 
        if(o.name=="ids") 
         { 
            o.checked=true;  
         } 
     } 
	  
	
	}
	</script>
     <style type="text/css">
       body,table{
    font-size:12px;
}
table{
    table-layout:fixed;
    empty-cells:show; 
    border-collapse: collapse;
    margin:0 auto;
   
}
td{
    height:20px;
}
</style>
<style>
		a:link {text-decoration: none;}
		a:visited {text-decoration: none;}
		a:active {text-decora tion: none;}
		a:hover {text-decoration: none;}
</style>
  </head>
  
  <body>
        <form action="servlet/MessageServlet" onsubmit="return AlertDel()" method="post" id="userform">
               <table border="1" width="100%">
               
                      <tr>
                         <td colspan="5">����ǰλ��&gt;&gt;��Ϣ����</td>
                      </tr>
                      <tr align="center">
                          <td width="5%"></td>
                          <td width="15%"><strong>����</strong></td>
		                  <td ><strong>����</strong></td>
		                  <td width="20%"><strong>��������</strong></td>
		                  <td width="10%"><strong>��ز���</strong></td>
                      </tr>
                      <c:forEach items="${requestScope.messages}" var="m">
                            <tr align="center">
                                <td><input type="checkbox" id="ids" value="${m.id}" name="ids" ></td>
                                <td>${m.type }</td>
                                <td>${m.topic }</td>
                                <td>${m.date}</td>
                                <td><a href="servlet/MessageServlet?action=selectById&id=${m.id }">�鿴</a></td>
                            </tr>
                      </c:forEach>
                      <tr align="center">
                          
                           <td colspan="5"><input type="submit"  value="ɾ��" >
                           
                           <input type="hidden" name="action" value="delete">
                      </tr>
               </table>
               
        </form>
  </body>
</html>
