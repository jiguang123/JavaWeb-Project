<%@ page contentType="text/html;charset=gb2312" %>
<% request.setCharacterEncoding("gb2312"); %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ӭ������Ȥ������!</title>
</head>
<script language="javascript">
 function judegpwduser()
 {
    if(document.form1.username.value==null||document.form1.username.value=="")
     {
        alert("�������û�����");
        document.form1.username.focus();
        return;
     }

    if(document.form1.password.value==null||document.form1.password.value=="")
     {
        alert("���������룡");
        document.form1.password.focus();
        return;
     }
    document.form1.submit();
 }
</script>
<body leftmargin="0">
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td><table width="760" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr> 
          <td width="150"><img src="images/logo.gif" width="150" height="42"></td>
          <td width="500"> <div align="center"><img src="images/bannar.gif" width="458" height="60"></div></td>
          <td width="110"><table width="110" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" valign="middle"> <div align="center"><font size="2">��Ϊ��ҳ 
                    </font></div></td>
              </tr>
              <tr> 
                <td height="20" valign="middle"> <div align="center"><font size="2">��Ϊ��ҳ 
                    </font></div></td>
              </tr>
              <tr> 
                <td height="20" valign="middle"> <div align="center"><font size="2">��Ϊ��ҳ 
                    </font></div></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="8"><img src="images/tmtp.gif" width="2" height="2"></td>
  </tr>
  <tr> 
    <td height="22" valign="middle" bgcolor="#FCCB05"> <div align="center"><font size="2">��ҳ 
        | �����̳� | �ʼǱ����� | Ӳ���̳� | �칫�豸 | ͨ�Ų�Ʒ | ����ͼ�� | �ʻ���Ʒ | ����Ʒ | �����Ϸ </font></div></td>
  </tr>
  <tr> 
    <td height="17" bgcolor="#FC9803">&nbsp;</td>
  </tr>
  <tr> 
    <td height="10">&nbsp;</td>
  </tr>
  <tr>
    <td height="10" valign="top"> <table width="400" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFCC00" bordercolordark="#FFFFFF">
        <tr>
          <td height="25" bgcolor="#FFCC00"><font size="2">&nbsp;���������Ȥ�̳ǵ�ע���û�����ֱ�ӵ�¼��</font></td>
        </tr>
<form name="form1" action="log.jsp" method="post">  
<input type="hidden" name="nextpage" value="<%=request.getParameter("nextpage")==null?"../myshop/index.jsp":request.getParameter("nextpage")%>">
<input type="hidden" name="nextpar" value="<%=request.getParameter("nextpar")==null?"":request.getParameter("nextpar")%>">
        <tr>
          <td height="120">
<table width="350" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr valign="bottom"> 
                <td width="82" height="29"> <div align="center"><font size="2">�û�ID��</font></div></td>
                <td width="165" height="29" valign="bottom"> <font size="2"> 
                  <input name="username" type="text" size="20">
                  </font></td>
                <td width="103" height="29"><font size="2">&nbsp;</font></td>
              </tr>
              <tr> 
                <td width="82" height="35"> <div align="center"><font size="2">�ܡ��룺</font></div></td>
                <td width="165" height="35"> <font size="2"> 
                  <input name="password" type="password" size="20">
                  </font></td>
                <td width="103" height="35"><font size="2">����������λ��</font></td>
              </tr>
              <tr> 
                <td height="35" colspan="3"><div align="center">
                <a href="javascript:judegpwduser()"><img src="images/login1.gif" width="34" height="20" border="0"></a>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <a href="register.jsp"><img src="images/reg.gif" width="34" height="20" border="0"></a> 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
              </tr>
            </table>
          </td>
        </tr>
      </table></td>
  </tr>
  </form>
  <tr>
    <td height="10">&nbsp;</td>
  </tr>
</table>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr bgcolor="#FFCC00"> 
    <td width="760" height="20" bgcolor="#FFCC00"><font size="2">&nbsp;&gt;&gt; 
      �������</font></td>
  </tr>
  <tr bgcolor="#FFFBEC"> 
    <td height="60"><table width="750" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><div align="center"><img src="images/2rich.gif" width="88" height="31"></div></td>
          <td><div align="center"><img src="images/2rich.gif" width="88" height="31"></div></td>
          <td><div align="center"><img src="images/2rich.gif" width="88" height="31"></div></td>
          <td><div align="center"><img src="images/2rich.gif" width="88" height="31"></div></td>
          <td><div align="center"><img src="images/2rich.gif" width="88" height="31"></div></td>
          <td><div align="center"><img src="images/2rich.gif" width="88" height="31"></div></td>
        </tr>
        <tr> 
          <td><div align="center"></div></td>
          <td><div align="center"></div></td>
          <td><div align="center"></div></td>
          <td><div align="center"></div></td>
          <td><div align="center"></div></td>
          <td><div align="center"></div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="10"><hr size="1"></td>
  </tr>
  <tr> 
    <td height="10"><div align="center"><font size="2">��˾��� | ��˾��� | ��˾��� | ��˾��� 
        | ��˾��� | ��˾��� | ��˾��� | ��˾��� </font></div></td>
  </tr>
  <tr> 
    <td height="30"> <div align="center"><font size="2">Copyright &copy;��Ȥ������2rich.net 
        �ͻ������������䣺howjoy@howjoy.com </font></div></td>
  </tr>
</table>
</body>
</html>
