<%@ page contentType="text/html;charset=gb2312" %>
<%@ include file="include/config.jsp"%>
<%@include file="include/bean.jsp"%>
<%@include file="include/head.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ӭ������Ȥ������!</title>
<LINK href="../css/style.css" rel=stylesheet type=text/css>
</head>

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
    <td height="22" valign="middle" bgcolor="#FCCB05"> 
    <div align="center">
    <%@include file="include/board1.jsp"%> 
    </div></td>
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
    <td width="150" valign="top"> 
    <table width="150" border="0" cellpadding="0" cellspacing="0">
       <%@include file="include/board3.jsp"%>
        <tr> 
          <td height="5" background="images/hydl.jpg"> <div align="center"><img src="images/tmtp.gif" width="2" height="2"></div></td>
        </tr>
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
          <td height="22" background="images/hydl3.jpg"><div align="center"><font size="2">���Ź���</font></div></td>
        </tr>
        <tr> 
          <td height="150" background="images/hydl.jpg">&nbsp;</td>
        </tr>
        <tr> 
          <td height="1"><img src="images/hydl2.jpg" width="150" height="1"></td>
        </tr>
      </table></td>
<%
    
    m_vct = shop.getGoodsDetail(request.getParameter("id"));
    Vector t_vct = (Vector)m_vct.get(0);
    Vector img_vct = shop.getGoodsImage(t_vct.get(0).toString(),"01");
              String img_url = "image/upload/shop/1.jpg";
              if(img_vct!=null&&img_vct.size()>0)
               {
                   img_url = (String)(((Vector)img_vct.get(0)).get(1));
               }    
%>      
    <td width="610" valign="top"> 
      <table width="600" border="0" align="right" cellpadding="0" cellspacing="0">
        <tr> 
          <td><br> <table width="600" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="300"> <div align="center"><img src="../../<%=img_url%>" width="135" height="200"></div></td>
                <td width="300" rowspan="2" valign="top"><table width="300" border="1" cellpadding="0" cellspacing="0" bordercolor="#CD9501" bordercolordark="#FFFFFF">
                    <tr> 
                      <td valign="top" bgcolor="#FFFCF0"> <table width="260" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td height="8"><img src="images/tmtp.gif" width="2" height="2"></td>
                          </tr>
                          <tr> 
                            <td height="25"><font color="#000000" size="2">
                            <strong>
                              <%=((Vector)m_vct.get(0)).get(1)%> 
                            </strong>
                            </font>
                            </td>
                          </tr>
                          <tr> 
                            <td height="25"><font color="#000000" size="2">��Ʒ��ţ����� 
                             <%=((Vector)m_vct.get(0)).get(0)%> </font></td>
                          </tr>
                          <tr> 
                            <td height="25"><font color="#000000" size="2">��&nbsp;&nbsp;&nbsp;&nbsp;�̣����� 
                               <%=((Vector)m_vct.get(0)).get(10)%> </font></td>
                          </tr>
                          <tr> 
                            <td height="25"><font color="#000000" size="2">����ͺţ����� 
                              һ��/�� </font></td>
                          </tr>
                          <tr> 
                            <td height="25"><font color="#000000" size="2">��Ʒ���أ����� 
                              �й� </font></td>
                          </tr>
                          <tr> 
                            <td height="25"><font color="#000000" size="2">
                            �ϼ����ڣ����� 
                               <%=((t_vct.get(7).toString()).substring(0,10))%>���� 
                               </font></td>
                          </tr>
                          <tr> 
                            <td height="25"><font color="#000000" size="2">
                            �������ڣ����� 
                               <%=((t_vct.get(8).toString()).substring(0,10))%>��</font></td>
                          </tr>                                                    
                          <tr> 
                            <td height="25"><font color="#000000" size="2">�� �� 
                              �ۣ����� 
                                <%=((Vector)m_vct.get(0)).get(3)%>  Ԫ </font></td>
                          </tr>
                          <tr> 
                            <td height="25"><font color="#000000" size="2">�ǻ�Ա�ۣ����� 
                                <%=((Vector)m_vct.get(0)).get(4)%> Ԫ </font></td>
                          </tr>                          
                          <tr> 
                            <td height="25"><font color="#000000" size="2">�� Ա 
                              �ۣ����� 
                                <font color="red"><%=((Vector)m_vct.get(0)).get(5)%></font> Ԫ </font></td>
                          </tr>  
                          <tr> 
                            <td height="25"><font color="#000000" size="2">�Ƿ��л������� 
                                <%=((Vector)m_vct.get(0)).get(9).equals("00")?"�л�":"�޻�"%> </font></td>
                          </tr>                                                                             
                          <tr> 
                            <td height="25" valign="bottom"> <div align="left"><font color="#000000" size="2"><a href="fillorder.jsp?id=<%=request.getParameter("id")%>"><img src="images/buy.gif" width="70" height="18" border="0"></a>&nbsp;&nbsp;&nbsp;<img src="images/fav.gif" width="70" height="18"></font></div></td>
                          </tr>
                          <tr> 
                            <td height="5"><img src="images/tmtp.gif" width="2" height="2"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td width="300" height="30"> <div align="center"><img src="images/button_big.gif" width="76" height="18"></div></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="5"><img src="images/tmtp.gif" width="2" height="2"></td>
        </tr>
        <tr> 
          <td height="20" bgcolor="#FFCC00"><font size="2">&gt;&gt;��ϸ���� 
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href="comment.jsp?id=<%=request.getParameter("id")%>" target="_blank">����&gt;&gt;</a></font>
          </td>
        </tr>
        <tr> 
          <td><font size="2"> 
            <p> <%=((Vector)m_vct.get(0)).get(6)%>    </p></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td height="20" bgcolor="#FFCC00"><table width="600" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="300"><font size="2">&gt;&gt; �ͻ�����</font></td>
                <td width="300"><div align="right"><font size="2"><a href="comment.jsp?id=<%=request.getParameter("id")%>" target="_blank">����&gt;&gt;</a>&nbsp;&nbsp;</font></div></td>
              </tr>
            </table></td>
        </tr>       

        <tr>
          <td height="20">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
  <tr bgcolor="#FFCC00"> 
    <td height="20" colspan="2"><font size="2">&nbsp;&gt;&gt; �������</font></td>
  </tr>
  <tr bgcolor="#FFFBEC"> 
    <td height="60" colspan="2"><table width="750" border="0" cellspacing="0" cellpadding="0">
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
<%@include file="include/foot.jsp"%>  
</table>
</body>
</html>
