<%@ page contentType="text/html;charset=gb2312" %>
<% request.setCharacterEncoding("gb2312"); %>
<%@ include file="include/config.jsp"%>
<%@include file="include/bean.jsp"%>
<%@include file="include/head.jsp"%>
<html>
<head>
<title>��ӭ������Ȥ������!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
</head>


<body leftmargin="0">
<%  
  String id = request.getParameter("nextpar")==null?request.getParameter("id"):request.getParameter("nextpar");  

%>

<form name="form1" method="post" action="../user/login.jsp">
<input type="hidden" name="nextpage" value="../myshop/fillorder.jsp">
<input type="hidden" name="nextpar" value="<%=id%>">
<input type="hidden" name="id" value="<%=id%>">


<%
  if(session.getAttribute("id") == null || session.getAttribute("id") == "")
   {   
     %>
      <script language="javascript">
       document.form1.submit();
      </script> 
     <%     
   }     
  String userid = (String)session.getAttribute("id"); 
  String nickname = (String)session.getAttribute("nickname");   
  String ordernum = request.getParameter("ordernum");
%>
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
    <td height="22" valign="middle" bgcolor="#FCCB05"> 
    <div align="center">
<%@include file="include/board1.jsp"%>    
        </div>
        </td>
  </tr>
  <tr> 
    <td height="17" bgcolor="#FC9803">&nbsp;</td>
  </tr>
  <tr> 
    <td height="10"><img src="images/tmtp.gif" width="2" height="2"></td>
  </tr>
</table>
  <table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr> 
      <td height="529" valign="top"> 
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td height="30"> <div align="center"><strong><font color="#000000" size="3">������ϸ��Ϣ</font></strong></div></td>
          </tr>
          <tr bgcolor="#FFFBEC"> 
            <td height="20" align="center"><font size="2">�����ţ� <%=ordernum%> </font></td>
          </tr>
          <tr> 
            <td height="8"><img src="images/tmtp.gif" width="2" height="2"></td>
          </tr>
          <tr> 
            <td height="20" bgcolor="#FFCC00"><font size="2">&nbsp; 
              </font></td>
          </tr>
          <tr> 
            <td height="8"><img src="images/tmtp.gif" width="2" height="2"></td>
          </tr>
          <tr> 
            <td> <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CD9501" bordercolordark="#FFFFFF">
                <tr bgcolor="#FFFBEC"> 
                  <td width="20%" height="25"> <div align="center"><font size="2">��Ʒ���</font></div></td>
                  <td width="20%" height="25"> <div align="center"><font size="2">��Ʒ����</font></div></td>
                  <td width="20%" height="25"> <div align="center"><font size="2">��Ա�۸�</font></div></td>
                  <td width="20%" height="25"> <div align="center"><font size="2">��������</font></div></td>
                  <td width="20%" height="25"> <div align="center"><font size="2">�ܽ��</font></div></td>
                </tr>
                <%
    m_vct = order.getOrderDetail(ordernum,userid);
    Vector t_vct = (Vector)m_vct.get(0);
    
%>
                <tr> 
                  <td width="20%" height="25"> <div align="center"><%=t_vct.get(1)%></div></td>
                  <td  height="25"> <div align="center"><font size="2"><%=t_vct.get(2)%></font></div></td>
                  <td width="20%" height="25"> <div align="center"><font size="2"><%=t_vct.get(3)%></font></div></td>
                  <td width="20%" height="25"> <div align="center"><font size="2"><%=t_vct.get(4)%></font></div></td>
                  <td width="20%" height="25"> <div align="center"> <%=t_vct.get(5)%> 
                    </div></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="8"><img src="images/tmtp.gif" width="2" height="2"></td>
          </tr>
          <tr> 
            <td height="20" bgcolor="#FFCC00"><font size="2">��ϵ��Ϣ��</font></td>
          </tr>
          <tr> 
            <td height="5"><img src="images/tmtp.gif" width="2" height="2"></td>
          </tr>
          <tr> 
            <td><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CD9501" bordercolordark="#FFFFFF">
                <tr> 
                  <td width="99" height="30"> <div align="center"><font size="2">��ϵ�ˣ�</font></div></td>
                  <td width="524" height="30">&nbsp; <%=t_vct.get(6)%></td>
                </tr>
                <tr bgcolor="#FFFBEC"> 
                  <td width="99" height="30"> <div align="center"><font size="2">�ֻ���</font></div></td>
                  <td width="524" height="30">&nbsp; <%=t_vct.get(7)%></td>
                </tr>
                <tr> 
                  <td width="99" height="30"> <div align="center"><font size="2">�绰��</font></div></td>
                  <td width="524" height="30">&nbsp; <%=t_vct.get(8)%></td>
                </tr>
                <tr bgcolor="#FFFBEC"> 
                  <td width="99" height="30"> <div align="center"><font size="2">���棺</font></div></td>
                  <td width="524" height="30">&nbsp; <%=t_vct.get(9)%></td>
                </tr>
                <tr> 
                  <td width="99" height="30"> <div align="center"><font size="2">E_mail��</font></div></td>
                  <td width="524" height="30">&nbsp; <%=t_vct.get(10)%></td>
                </tr>
                <tr bgcolor="#FFFBEC"> 
                  <td width="99" height="30"> <div align="center"><font size="2">ȷ�Ϸ�ʽ��</font></div></td>
                  <td width="524" height="30">&nbsp; <%=t_vct.get(11)%> </td>
                </tr>
                <tr > 
                  <td width="99" height="30"> <div align="center"><font size="2">���ʽ��</font></div></td>
                  <td width="524" height="30">&nbsp; <%=t_vct.get(12)%> </td>
                </tr>
                <tr bgcolor="#FFFBEC"> 
                  <td height="30"> <div align="center"><font size="2">�ʼĵ�ַ:</font></div></td>
                  <td height="30">&nbsp; <%=t_vct.get(13)%></td>
                </tr>
                <tr> 
                  <td height="30"> <div align="center"><font size="2">��������:</font></div></td>
                  <td height="30">&nbsp; <%=t_vct.get(14)%></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td height="8"><font size="2">&nbsp;<img src="images/tmtp.gif" width="2" height="2"></font></td>
          </tr>
          <tr> 
            <td height="20" bgcolor="#FFCC00"><font size="2">&nbsp;����Ҫ��:</font></td>
          </tr>
          <tr> 
            <td height="5"><img src="images/tmtp.gif" width="2" height="2"></td>
          </tr>
          <tr> 
            <td><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CD9501" bordercolordark="#FFFFFF">
                <tr> 
                  <td width="100" height="30" bgcolor="#FFFBEC"> <div align="center"> 
                      <font size="2"> ����˵���� </font></div></td>
                  <td width="480" height="30"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td valign="center">&nbsp; <%=t_vct.get(15)%> </td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
          </tr>
        </table> </td>
    </tr>
    <tr> 
      <td height="20" bgcolor="#FFCC00"><font size="2">&nbsp;&gt;&gt; �������</font></td>
    </tr>
    <tr> 
      <td height="60" bgcolor="#FFFBEC"> <table width="750" border="0" cellspacing="0" cellpadding="0">
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
      <td height="10"><div align="center"><font size="2">��˾��� | ��˾��� | ��˾��� | 
          ��˾��� | ��˾��� | ��˾��� | ��˾��� | ��˾��� </font></div></td>
    </tr>
    <tr> 
      <td height="30"> <div align="center"><font size="2">Copyright &copy;��Ȥ������2rich.net 
          �ͻ������������䣺howjoy@howjoy.com </font></div></td>
    </tr>
  </table>
</form>
</body>
</html>
