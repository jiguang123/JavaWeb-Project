<%@ page contentType="text/html;charset=gb2312" %>
<% request.setCharacterEncoding("gb2312"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ӭ������Ȥ������!</title>
<SCRIPT language=JavaScript src="../js/JsInclude.js"></SCRIPT>
</head>
<script language="javascript">
function sub()
 {
      if(document.form1.id.value=="")
       {
           alert("�������û�ID��");
           document.form1.id.focus();
           return;
       }
      if(document.form1.nickname.value=="")
       {
           alert("�������ǳƣ�");
           document.form1.nickname.focus();
           return;
       }       
     if(document.form1.pwd.value=="")
       {
           alert("���������룡");
           document.form1.pwd.focus();
           return;
       }              
      if(document.form1.pwd.value!=document.form1.configpwd.value)
       {
           alert("������û����������ȷ�ϲ�һ�£����������룡");
           document.form1.pwd.focus();
           return;
       }                     

      if(document.form1.email.value=="")
       {
           alert("���������ĵ������䣡");
           document.form1.email.focus();
           return;
       } 
      
      if(!isEmail(document.form1.email.value))                     
       {
           alert("���������ʽ����ȷ��");
           document.form1.email.focus();
           return;       
       }
              
       
      if(document.form1.year.value=="")
       {
         alert("������������£�");
         document.form1.year.focus();
         return;
       }  
       
      if(!isInteger(document.form1.year.value))
       {
         alert("����������ֻ�������֣�");
         document.form1.year.focus();
         return;
       }        
    document.form1.birthday.value=document.form1.year.value+"-" +document.form1.month.value+"="+document.form1.days.value;
    document.form1.action="reg.jsp";
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
    <td height="5">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" valign="top"><font size="2">�������ڵ�λ�ã���ҳ--���û�ע�� </font></td>
  </tr>
<form name="form1" method="post">   
<input type="hidden" name="birthday">   
  <tr> 
    <td height="10" valign="top"><table width="760" border="1" cellpadding="0" cellspacing="0" bordercolor="#CD9501" bordercolordark="#FFFFFF">
        <tr> 
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
          <td width="120" height="30">
<div align="center"><font size="2">�û�ID:</font></div></td>
          <td width="240" height="30"><font size="2"> &nbsp; 
            <input type="text" name="id">
            </font></td>
          <td width="220" height="30"><div align="center"><font size="2">ֻ����&quot;����&quot;��&quot;��ĸ&quot;���»���&quot;_&quot;</font></div></td>
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
        </tr>
        <tr bgcolor="#FFFBEC"> 
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
          <td width="120" height="30"> 
            <div align="center"><font size="2">�ǳ�:</font></div></td>
          <td width="240" height="30"><font size="2"> &nbsp; 
            <input type="text" name="nickname">
            </font></td>
          <td width="220" height="30"><font size="2">&nbsp;</font></td>
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
        </tr>
        <tr> 
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
          <td width="120" height="30">
<div align="center"><font size="2">�û�����:</font></div></td>
          <td width="240" height="30"><font size="2"> &nbsp; 
            <input type="password" name="pwd">
            </font></td>
          <td width="220" height="30"><font size="2">&nbsp;</font></td>
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
        </tr>
        <tr bgcolor="#FFFBEC"> 
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
          <td width="120" height="30"> 
            <div align="center"><font size="2">����ȷ��:</font></div></td>
          <td width="240" height="30"><font size="2">&nbsp; 
            <input type="password" name="configpwd">
            </font></td>
          <td width="220" height="30"><font size="2">&nbsp;</font></td>
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
        </tr>
        <tr> 
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
          <td width="120" height="30">
<div align="center"><font size="2">�ʼ���ַ:</font></div></td>
          <td width="240" height="30"><font size="2"> &nbsp; 
            <input type="text" name="email">
            </font></td>
          <td width="220" height="30"><font size="2">&nbsp;</font></td>
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
        </tr>
        <tr bgcolor="#FFFBEC"> 
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
          <td width="120" height="30"> 
            <div align="center"><font size="2">����������:</font></div></td>
          <td width="240" height="30"><font size="2">&nbsp; 
            <input name="year" type="text" size="4">
            �� 
            <select name="month">
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
              <option>6</option>
              <option>7</option>
              <option>8</option>
              <option>9</option>
              <option>10</option>
              <option>11</option>
              <option>12</option>
            </select>
            �� 
            <select name="days">
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
              <option>6</option>
              <option>7</option>
              <option>8</option>
              <option>9</option>
              <option>10</option>
              <option>11</option>
              <option>12</option>
              <option>13</option>
              <option>14</option>
              <option>15</option>
              <option>16</option>
              <option>17</option>
              <option>18</option>
              <option>19</option>
              <option>20</option>
              <option>21</option>
              <option>22</option>
              <option>23</option>
              <option>24</option>
              <option>25</option>
              <option>26</option>
              <option>27</option>
              <option>28</option>
              <option>29</option>
              <option>30</option>
              <option>31</option>
            </select>
            �� </font> </td>
          <td width="220" height="30"> 
            <div align="center"><font size="2"> 
              <input type="button" name="Submit" onclick="sub()" value="�ύ">
              </font></div></td>
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
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
