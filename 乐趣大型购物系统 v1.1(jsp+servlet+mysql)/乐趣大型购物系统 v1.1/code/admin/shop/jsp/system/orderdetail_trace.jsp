<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.*" %>
<%@ include file="../pub/control.jsp"%>
<%@ include file="../include/config.jsp"%>
<%@ include file="../include/head.jsp"%>
<html>
<head>
<title>��ӭ������Ȥ������!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../css/style.css" rel=stylesheet type=text/css>
</head>


<body leftmargin="0">
<%
  String ordernum = request.getParameter("id");
%>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
 
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
    Vector m_vct = ManageOrder.getOrderTraceDetail(ordernum);
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
            <td height="8"><font size="2">&nbsp;<img src="images/tmtp.gif" width="2" height="2"></font></td>
          </tr>          
 <tr> 
            <td height="20" bgcolor="#FFCC00"><font size="2">&nbsp;�������:</font></td>
          </tr>          
          <tr> 
            <td height="5"><img src="images/tmtp.gif" width="2" height="2"></td>
          </tr>
          <tr> 
            <td><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CD9501" bordercolordark="#FFFFFF">
                <tr> 
                  <td width="100" height="30" bgcolor="#FFFBEC"> <div align="center"> 
                      <font size="2"> ��������� </font></div></td>
                  <td width="480" height="30"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td valign="center">&nbsp; <%=t_vct.get(16)==null?"":t_vct.get(16)%> </td>
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

    
  </table>
</form>
</body>
</html>
