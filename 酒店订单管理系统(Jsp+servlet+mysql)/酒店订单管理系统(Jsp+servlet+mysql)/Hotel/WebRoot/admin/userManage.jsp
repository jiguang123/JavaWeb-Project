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
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
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
	if (confirm("ȷ��Ҫɾ�����˼�¼��")) return(true);
	else return(false);
}
</script>
<script type="javascript" src="../yjj.js"></script>
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
       <table border="1" width="100%">
              <tr>
                  <td colspan="4">����ǰλ��&gt;&gt;��Ա����</td>
              </tr>
              <tr align="center" >
                  <td><strong>��Ա��</strong></td>
                  <td><strong>��ʵ����</strong></td>
                  <td><strong>ע������</strong></td>
                  <td><strong>��ز���</strong></td>
              </tr>
              
              <c:forEach items="${requestScope.userList}" var="map">
              <tr align="center">
                  <td>${map['userName'] }</td>
                  <td>${map['name'] }</td>
                  <td>${ map['regDate']}</td>
                  <td><a href="servlet/UserManageServlet?action=delete&id=${map['userId'] }" onclick="return AlertDel()">ɾ��</a> <a href="servlet/UserManageServlet?action=selectById&id=${map['userId'] }">��ϸ��Ϣ</a></td>
              </tr>
              
              </c:forEach>
              
              <tr>
                  
                  <td colspan="4" align="center"><a href="servlet/UserManageServlet?action=select">��ҳ</a>&nbsp;&nbsp;<a href="servlet/UserManageServlet?action=page&page=${requestScope.befPage }">��һҳ</a>&nbsp;&nbsp;<a href="servlet/UserManageServlet?action=page&page=${requestScope.nextPage}">��һҳ</a>&nbsp;&nbsp;<a href="servlet/UserManageServlet?action=page&page=${ requestScope.pb.sumPage}">βҳ</a>&nbsp;&nbsp;��${requestScope.pb.sumSava }����¼</td>
              </tr>
       </table>
  </body>
</html>
