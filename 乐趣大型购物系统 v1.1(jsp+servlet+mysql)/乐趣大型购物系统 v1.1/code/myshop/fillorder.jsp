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
<script language="JavaScript" src="../js/JsInclude.js"></script>
<script language="javascript">
function sub()
 {
    if(isWhitespace(document.form1.name.value))
     {
         alert("��������ϵ��������");
         document.form1.name.focus();
         return false;
     }
     
    if(isWhitespace(document.form1.mobilephone.value)&&isWhitespace(document.form1.tel.value))
     {
         alert("��������ϵ�ֻ���绰��");
         document.form1.mobilephone.focus();
         return false;
     }     
     
    if(isWhitespace(document.form1.email.value))
     {
         alert("����������ʼ���ַ��");
         document.form1.email.focus();
         return false;
     }    
    
    if(!isEmail(document.form1.email.value))
     {
         alert("��������ȷ�ĵ����ʼ���ַ��");
         document.form1.email.focus();
         return false;     
     }  

    if(isWhitespace(document.form1.address.value))
     {
         alert("��������ϵ��ַ��");
         document.form1.address.focus();
         return false;
     }   
     
    if(isWhitespace(document.form1.zipcode.value))
     {
         alert("�������������룡");
         document.form1.zipcode.focus();
         return false;
     }      
    
    if(document.form1.yudingxuzhi[1].checked)
     {
         alert("�����Ķ�Ԥ����֪��");        
         return false;     
     }
      
    document.form1.action="orderdetail.jsp";
    document.form1.submit();
 }
</script>

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
          <td height="30"> <div align="center"><strong><font color="#000000" size="3">�� 
              �� �� ��</font></strong></div></td>
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
                <td width="20%" height="25"> <div align="center"><font size="2">�ǻ�Ա�۸�</font></div></td>
                <td width="20%" height="25"> <div align="center"><font size="2">��Ա�۸�</font></div></td>
                <td width="20%" height="25"> <div align="center"><font size="2">��������</font></div></td>
              </tr>
            
<%
    m_vct = order.getGoodsInfo(id);
    Vector t_vct = (Vector)m_vct.get(0);
%>              
              <tr> 
                <td width="20%" height="25"> <div align="center"><%=((t_vct.get(0)).toString())==null?"":((t_vct.get(0).toString()))%></div></td>
                <td  height="25"> <div align="center"><font size="2"><%=((String)(t_vct.get(1)))==null?"":((String)(t_vct.get(1)))%></font></div></td>
                <td width="20%" height="25"> <div align="center"><font size="2"><%=((t_vct.get(3)).toString())==null?"":((t_vct.get(3).toString()))%></font></div></td>
                <td width="20%" height="25"> <div align="center"><font size="2"><%=((t_vct.get(4)).toString())==null?"":((t_vct.get(4)).toString())%></font></div></td>
                <td width="20%" height="25"> <div align="center"> 
                    <input name="ordernum" type="text" size="4" value="1">
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
<%
   Vector u_vct = order.getUserInfo(userid);  
   Vector t_u_vct = (Vector)u_vct.get(0);

%>        
        <tr> 
          <td><table width="580" border="1" cellpadding="0" cellspacing="0" bordercolor="#CD9501" bordercolordark="#FFFFFF">
              <tr> 
                <td width="100" height="30"> <div align="center"><font size="2">��  �ƣ�</font></div></td>
                <td width="480" height="30">&nbsp; <%=session.getAttribute("nickname")%></td>
              </tr>          
              <tr> 
                <td width="100" height="30"> <div align="center"><font size="2">��ϵ�ˣ�</font></div></td>
                <td width="480" height="30">&nbsp; <input type="text" name="name" value="<%=((String)(t_u_vct.get(0)))==null?"":((String)(t_u_vct.get(0)))%>"></td>
              </tr>
              <tr bgcolor="#FFFBEC"> 
                <td width="100" height="30"> <div align="center"><font size="2">�ֻ���</font></div></td>
                <td width="480" height="30">&nbsp; <input type="text" name="mobilephone" value="<%=((String)(t_u_vct.get(1)))==null?"":((String)(t_u_vct.get(1)))%>"></td>
              </tr>
              <tr> 
                <td width="100" height="30"> <div align="center"><font size="2">�绰��</font></div></td>
                <td width="480" height="30">&nbsp; <input type="text" name="tel"  value="<%=((String)(t_u_vct.get(2)))==null?"":((String)(t_u_vct.get(2)))%>"></td>
              </tr>
              <tr bgcolor="#FFFBEC"> 
                <td width="100" height="30"> <div align="center"><font size="2">���棺</font></div></td>
                <td width="480" height="30">&nbsp; <input type="text" name="fax" value="<%=((String)(t_u_vct.get(3)))==null?"":((String)(t_u_vct.get(3)))%>"></td>
              </tr>
              <tr> 
                <td width="100" height="30"> <div align="center"><font size="2">E_mail��</font></div></td>
                <td width="480" height="30">&nbsp; <input type="text" name="email" value="<%=((String)(t_u_vct.get(4)))==null?"":((String)(t_u_vct.get(4)))%>"></td>
              </tr>              
              <tr bgcolor="#FFFBEC"> 
                <td width="100" height="30"> 
                <div align="center"><font size="2">ȷ�Ϸ�ʽ��</font></div>
                </td>
                <td width="480" height="30">&nbsp; 
                  <select name="confirm_type">
                    <option value="01">�绰ȷ��</option>
                    <option value="00">����ȷ��</option>                    
                    <option value="02">FAXȷ��</option>
                    <option value="03">Emailȷ��</option>
                    <option value="10">����</option>                 
                  </select>               
                </td>
              </tr>
              <tr > 
                <td width="100" height="30"> 
                <div align="center"><font size="2">���ʽ��</font></div>
                </td>
                <td width="480" height="30">&nbsp; 
                  <select name="pay_type">
                    <option value="00">�����</option>
                    <option value="01">����ת��</option>
                    <option value="10">����</option>                 
                  </select>               
                </td>
              </tr>              
              <tr bgcolor="#FFFBEC"> 
                <td height="30"> <div align="center"><font size="2">�ʼĵ�ַ:</font></div></td>
                <td height="30">&nbsp; <input name="address" type="text" size="50" value="<%=((String)(t_u_vct.get(5)))==null?"":((String)(t_u_vct.get(5)))%>"></td>
              </tr>
              
              <tr> 
                <td height="30"> <div align="center"><font size="2">��������:</font></div></td>
                <td height="30">&nbsp; <input type="text" name="zipcode" value="<%=((String)(t_u_vct.get(6)))==null?"":((String)(t_u_vct.get(6)))%>"></td>
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
                      <textarea name="remark" cols="50" rows="6" maxlength="4000" maxchar=4000></textarea>
                      </td>
                    </tr>                    
                  </table>
                  
                </td>
              </tr>              
              <tr> 
                <td width="100" height="30" bgcolor="#FFFBEC">
                <div align="center"><font size="2">Ԥ����֪��</font></div></td>
                <td width="480" height="30">&nbsp;&nbsp;<font size="2"><input type="radio" name="yudingxuzhi" value="">ͬ�� <input type="radio" name="yudingxuzhi" value="2" checked="true">��ͬ��</font></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td align="center">&nbsp;<input type="button" onclick="sub()" value="�ύ����"></td>
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
