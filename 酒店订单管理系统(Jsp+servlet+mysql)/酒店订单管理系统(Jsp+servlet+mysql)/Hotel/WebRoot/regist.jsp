<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">  
    <title>�ɸ�������</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	
   
    
	-->
	<script type='text/javascript' src='/Hotel/dwr/interface/JUserCheck.js'></script>
    <script type='text/javascript' src='/Hotel/dwr/engine.js'></script>
	<script type='text/javascript' src='/Hotel/dwr/util.js'></script>
	
	
	
	
	<script type="text/javascript">
	       function checkInfo(frm){
	             var result=true;
	              if(frm.pwd.value != frm.pwdSure.value){
	                 DWRUtil.setValue("pwdInfo","<font color='red' size='2'>*����ȷ�ϴ���</font>");
	                 result=false;
	              }
	              if(frm.userName.value==""){
	                 DWRUtil.setValue("info","<font color='red' size='2'>*�û�������Ϊ��</font>");
	                 result=false;
	              }
	              if(frm.name.value==""){
	                DWRUtil.setValue("nameInfo","<font color='red' size='2'>*��ʵ����������д</font>");
	                result=false;
	              }

	              if(frm.tel.value==""){
	                 DWRUtil.setValue("telInfo","<font color='red' size='2'>*��ϵ�绰������д</font>");
	                 result=false;
	              }
	              if(frm.pwd.value==""){
	                 DWRUtil.setValue("pInfo","<font color='red' size='2'>*���������д</font>");
	                 result=false;
	              }
	              return result;
	       }
	       
	       
	       function clearInfo(){
	            DWRUtil.setValue("pwdInfo","");
	            DWRUtil.setValue("pInfo","");
	            DWRUtil.setValue("emailInfo","");
	            DWRUtil.setValue("telInfo","");
	            DWRUtil.setValue("nameInfo","");
	       
	       }
	       
	       
	       
	       function checkName(a){
	           var name=a.value
	           JUserCheck.checkUser(name,callback);
	          
	       }
	       function callback(msg){
	       
	          DWRUtil.setValue("info","<font color='red' size='2'>"+msg+"</font>");
	       
	       }
	</script>
  </head>
  
  <body>
        <table width="100%" border="1" cellpadding="0" cellspacing="0" >
                <tr>
                    <td><font size="5" ><strong>�ɸ�������</strong></font></td>
                </tr>
                <tr>
                    <td background=photos/reg_12.gif><font size="3">���û�ע��</font></td>
                </tr>
                <tr>
                    <td>
                    <form action="servlet/UserServlet" method="post" onsubmit="return checkInfo(this)" >
                        <table align="center">
                              <tr>
                                  <td width="20%">�û���</td>
                                  <td width="80%"><input type="text" name="userName" onblur="checkName(this)" maxlength="12">
									<span id="info"></span>
								</td>
                       
                              </tr>
                              <tr>
                                  <td>����</td>
                                  <td><input type="password" name="pwd" onblur="clearInfo()" maxlength="6"><span id="pInfo"></span></td>
                                  
                              </tr>
                              <tr>
                                  <td>����ȷ��</td>
                                  <td><input type="password" name="pwdSure" maxlength="6">
                                      <span id="pwdInfo"></span>
                                  </td>
                                  
                              </tr>
                              <tr>
                                  <td>�Ա�</td>
                                  <td><input type="radio" name="sex" checked="checked" value="1" >��<input type="radio" name="sex" value="0">Ů</td>
                                  
                              </tr>
                              <tr>
                                  <td>��ʵ����</td>
                                  <td><input type="text" name="name" onblur="clearInfo()" maxlength="6"><span id="nameInfo"></span></td>
                                  
                              </tr>
                              <tr>
                                  <td>��ϵ�绰</td>
                                  <td><input type="text" name="tel" onblur="clearInfo()" maxlength="6"><span id="telInfo"></span></td>
                                  
                              </tr>
                              <tr>
                                  <td>��������</td>
                                  <td><input type="text" name="email" maxlength="6"s><span id="emailInfo"></span></td>
                                  
                              </tr>
                              <tr>
                                  <td><input type="submit" value="ȷ��" name="" ></td>
                                  <td><input type="reset" value="����" name=""></td>
                                 
                              </tr>
                        </table>
                        </form>
                    </td>
                </tr>
        </table>
  </body>
</html>
