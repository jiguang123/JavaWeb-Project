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
  String ordernum = order.createOrder(userid,nickname);
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
    <td width="150" valign="top"> <table width="150" border="0" cellpadding="0" cellspacing="0">
        <%@include file="include/board3.jsp"%> 
        <tr> 
          <td height="1"><img src="images/hydl2.jpg" width="150" height="1"></td>
        </tr>
        <tr> 
          <td height="8"><img src="images/tmtp.gif" width="2" height="2"></td>
        </tr>
        <tr> 
          <td height="22" background="images/hydl3.jpg"><div align="center"><font size="2">��ϵ��ʽ</font></div></td>
        </tr>
        <tr> 
          <td height="20" valign="bottom" background="images/hydl.jpg"><font size="2">&nbsp;&nbsp;�绰:64704946</font></td>
        </tr>
        <tr> 
          <td height="18" background="images/hydl.jpg"> <p><font size="2">&nbsp;&nbsp;E-mail:</font></p></td>
        </tr>
        <tr> 
          <td height="18" background="images/hydl.jpg"><font size="2">&nbsp;&nbsp;MSN:</font></td>
        </tr>
        <tr> 
          <td height="18" valign="top" background="images/hydl.jpg"><font size="2">&nbsp;&nbsp;QQ:</font></td>
        </tr>
        <tr> 
          <td height="1"><img src="images/hydl2.jpg" width="150" height="1"></td>
        </tr>
        <tr> 
          <td height="8"><img src="images/tmtp.gif" width="2" height="2"></td>
        </tr>

                <%@include file="include/board2.jsp"%>
        <tr> 
          <td height="5" background="images/hydl.jpg"><img src="images/tmtp.gif" width="2" height="2"></td>
        </tr>
        <tr> 
          <td height="1"><img src="images/hydl2.jpg" width="150" height="1"></td>
        </tr>
        <tr> 
          <td height="5"><img src="images/tmtp.gif" width="2" height="2"></td>
        </tr>
        <tr> 
          <td height="22" background="images/hydl3.jpg"><div align="center"><font size="2">��������</font></div></td>
        </tr>
        <tr> 
          <td height="150" background="images/hydl.jpg">&nbsp;</td>
        </tr>
        <tr> 
          <td height="1"><img src="images/hydl2.jpg" width="150" height="1"></td>
        </tr>
      </table></td>
    <td width="610" valign="top"><table width="580" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="30"> <div align="center"><strong><font color="#000000" size="3">������ϸ��Ϣ</font></strong></div></td>
        </tr>
        <tr bgcolor="#FFFBEC"> 
          <td height="20" align="center"><font size="2">�����ţ� <%=ordernum%>
            </font></td>
        </tr>   
       <tr> 
          <td height="8"><img src="images/tmtp.gif" width="2" height="2"></td>
        </tr>        
        <tr> 
          <td height="20" bgcolor="#FFCC00"><font size="2">������Ϣ�� ����Ԥ��ʱ�������Ķ�<a href="#">Ԥ����֪</a>�� 
            </font></td>
        </tr>
        <tr> 
          <td height="8"><img src="images/tmtp.gif" width="2" height="2"></td>
        </tr>
        <tr> 
          <td> <table width="580" border="1" cellpadding="0" cellspacing="0" bordercolor="#CD9501" bordercolordark="#FFFFFF">
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
                <td width="20%" height="25"> <div align="center"> 
                    <%=t_vct.get(5)%>
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
          <td><table width="580" border="1" cellpadding="0" cellspacing="0" bordercolor="#CD9501" bordercolordark="#FFFFFF">
              <tr> 
                <td width="100" height="30"> <div align="center"><font size="2">��ϵ�ˣ�</font></div></td>
                <td width="480" height="30">&nbsp; <%=t_vct.get(6)%></td>
              </tr>
              <tr bgcolor="#FFFBEC"> 
                <td width="100" height="30"> <div align="center"><font size="2">�ֻ���</font></div></td>
                <td width="480" height="30">&nbsp; <%=t_vct.get(7)%></td>
              </tr>
              <tr> 
                <td width="100" height="30"> <div align="center"><font size="2">�绰��</font></div></td>
                <td width="480" height="30">&nbsp; <%=t_vct.get(8)%></td>
              </tr>
              <tr bgcolor="#FFFBEC"> 
                <td width="100" height="30"> <div align="center"><font size="2">���棺</font></div></td>
                <td width="480" height="30">&nbsp; <%=t_vct.get(9)%></td>
              </tr>
              <tr> 
                <td width="100" height="30"> <div align="center"><font size="2">E_mail��</font></div></td>
                <td width="480" height="30">&nbsp; <%=t_vct.get(10)%></td>
              </tr>              
              <tr bgcolor="#FFFBEC"> 
                <td width="100" height="30"> 
                <div align="center"><font size="2">ȷ�Ϸ�ʽ��</font></div>
                </td>
                <td width="480" height="30">&nbsp; 
                  <%=t_vct.get(11)%>
                </td>
              </tr>
              <tr > 
                <td width="100" height="30"> 
                <div align="center"><font size="2">���ʽ��</font></div>
                </td>
                <td width="480" height="30">&nbsp; 
                 <%=t_vct.get(12)%>   
                </td>
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
          <td><table width="580" border="1" cellpadding="0" cellspacing="0" bordercolor="#CD9501" bordercolordark="#FFFFFF">
              <tr> 
                <td width="100" height="30" bgcolor="#FFFBEC">
                 <div align="center">
                 <font size="2"> 
                    ����˵���� </font></div></td>
                <td width="480" height="30">
                  <table width="400" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td valign="center">&nbsp;
                      <%=t_vct.get(15)%>
                      </td>
                    </tr>                    
                  </table>
                  
                </td>
              </tr>              

            </table></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td align="center">&nbsp;<a href="orderlist.jsp">���붩������</a></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table> </td>
  </tr>
  <tr> 
    <td height="20" colspan="2" bgcolor="#FFCC00"><font size="2">&nbsp;&gt;&gt; 
      �������</font></td>
  </tr>
  <tr> 
    <td height="60" colspan="2" bgcolor="#FFFBEC">
<table width="750" border="0" cellspacing="0" cellpadding="0">
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
    <td height="10" colspan="2"><hr size="1"></td>
  </tr>
  <tr> 
    <td height="10" colspan="2"><div align="center"><font size="2">��˾��� | ��˾��� 
        | ��˾��� | ��˾��� | ��˾��� | ��˾��� | ��˾��� | ��˾��� </font></div></td>
  </tr>
  <tr> 
    <td height="30" colspan="2"> <div align="center"><font size="2">Copyright 
        &copy;��Ȥ������2rich.net �ͻ������������䣺2rich@2rich.net </font></div></td>
  </tr>
</table>
</form>
</body>
</html>
