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
<script language="javascript" src="../../../../js/JsInclude.js"></script>
</head>
<script language="javascript">
function sub(str)
 {
    if(isWhitespace(document.form1.reason1.value))
    {
      alert("�����봦��ע��");
      document.form1.reason1.focus();
      return;
    }
     document.form1.type.value=str;
     document.form1.par.value="update";   
     document.form1.reason.value=document.form1.reason.value+document.form1.reason1.value+'<br><br>'; 
     document.form1.submit();
 }
</script>

<body leftmargin="0">
<%  
       String par = request.getParameter("par");
       String aid = session.getAttribute("aid").toString();
  String ordernum = request.getParameter("id");
  if(par!=null&&par.equals("update"))
   {
      String type = request.getParameter("type");
      String reason = request.getParameter("reason");
      ManageOrder.updateStatusSend(aid,ordernum,type,reason);  
   }
%>
<form name="form1" method="post">
<input type="hidden" name="par">
<input type="hidden" name="id" value="<%=ordernum%>">
<input type="hidden" name="type">
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
    Vector m_vct = ManageOrder.getOrderDetail(ordernum);
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
            <td height="20" bgcolor="#FFCC00"><font size="2">&nbsp;����ע:</font></td>
          </tr>
          <tr> 
            <td height="5"><img src="images/tmtp.gif" width="2" height="2"></td>
          </tr>
          <tr> 
            <td><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CD9501" bordercolordark="#FFFFFF">
                <tr> 
                  <td width="100" height="30" bgcolor="#FFFBEC"> <div align="center"> 
                      <font size="2"> ����ע: </font></div></td>
                  <td width="480" height="30"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td valign="center">&nbsp; <%=t_vct.get(16).toString()%> </td>
                        <input type="hidden" name="reason" value="<%=t_vct.get(16)==null?"":t_vct.get(16)%>">
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>            
          
          <tr> 
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CD9501" bordercolordark="#FFFFFF">
                <tr> 
                  <td width="100" height="30" bgcolor="#FFFBEC"> <div align="center"> 
                      <font size="2"> ����ע�� </font></div></td>
                  <td width="480" height="30"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td valign="center">&nbsp;  
                        <textarea name="reason1" cols="60" rows="5" maxlength="400" maxchar=400></textarea>
                        </td>
                      </tr>
                  </table></td>
                </tr>
              </table></td>
          </tr>            
        </table> 
  <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="button" value="�ɹ�δ�տ�" onclick="sub('00003')">&nbsp;&nbsp;<input type="button" value="�ɹ����տ�" onclick="sub('00004')">&nbsp;&nbsp;<input type="button" value="δ��ϵ�Ͽͻ�" onclick="sub('00002')">&nbsp;&nbsp;<input  type="button" value="ȡ������" onclick="sub('90000')">
    
        
        </td>
    </tr>
      </table>
</form>
</body>
</html>
