<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�ɸ�Ƶ��̨����</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="admin.css">

	<script type="text/javascript">
	          function menus(objectName){
	           var divs=document.getElementById(objectName);
	             if(divs.style.display=="")
			        {
			            divs.style.display="none";
			        }
				        else
				        {
				            divs.style.display="";
				        }
	          }
	</script>
     <style>
		a:link {text-decoration: none;}
		a:visited {text-decoration: none;}
		a:active {text-decora tion: none;}
		a:hover {text-decoration: none;}
    </style> 
  </head>
  
  <body bgcolor="#ff6600">
        <table align="center">
               <tr onclick="menus('userManage')" style=cursor:hand>
                   <td><font size="5"><b>�ͻ�</b></font></td>
               </tr>
               <tr id="userManage">
                   <td>
	                   <table>
	                         <tr>
	                            <td><a href="servlet/UserManageServlet?action=select" target="mainFrame"><font size="3">|--�û�����</font></a></td>
	                         </tr>
	                   </table>
                   <td>
               </tr>
               
               
               <tr onclick="menus('orderMange')" style=cursor:hand>
                   <td> <font size="5"><b>����</b></font></td>
               </tr>
               <tr id="orderMange" ">
                   <td>
	                   <table>
	                         <tr>
	                            <td><a href=""><font size="3">|--��������</font></a></td>
	                         </tr>
	                   </table>
                   <td>
               </tr>
               
               <tr onclick="menus('hotelMange')" style=cursor:hand>
                   <td><font size="5"><b>�Ƶ�</b></font></td>
               </tr>
               <tr id="hotelMange" >
                   <td>
	                   <table>
	                         <tr>
	                            <td><a href="admin/roomFabu.jsp" target="mainFrame"> <font size="3">|--���ݷ���</font></a></td>
	                         </tr>
	                         <tr>
	                             <td><a href=""><font size="3">|--�������</font></a></td>
	                         </tr>
	                   </table>
                   <td>
                   
               </tr>
               
               
               <tr onclick="menus('messageMange')" style=cursor:hand>
                   <td><font size="5"><b>��Ϣ</b></font></td>
               </tr>
               <tr id="messageMange" >
                   <td>
	                   <table>
	                         <tr>
	                            <td><a href="servlet/MessageServlet?action=select" target="mainFrame"><font size="3">|--��Ϣ����</font></a></td>
	                         </tr>
	                         <tr>
	                            <td><a href="admin/messageFabu.jsp" target="mainFrame"><font size="3">|--��Ϣ����</font></a></td>
	                         </tr>
	                   </table>
                   <td>
               </tr>
               
                <tr onclick="menus('sysMange')" style=cursor:hand>
                   <td><font size="5"><b>ϵͳ</b></font></td>
               </tr>
                <tr id="sysMange" >
                   
                   <td>
	                   <table>
	                         <tr>
	                            <td><a href=""><font size="3">|--ע��</font></a></td>
	                         </tr>
	                   </table>
                   <td>
                   
               </tr>
        </table>
  </body>
</html>
