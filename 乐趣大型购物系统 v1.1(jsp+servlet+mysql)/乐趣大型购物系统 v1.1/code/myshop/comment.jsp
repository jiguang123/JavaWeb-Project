<%@ page contentType="text/html;charset=gb2312" %>
<% request.setCharacterEncoding("gb2312"); %>
<%@ include file="include/config.jsp"%>
<%@include file="include/bean.jsp"%>
<%@include file="include/head.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ӭ������Ȥ������!</title>
<LINK href="../css/style.css" rel=stylesheet type=text/css>
<script language="JavaScript" src="../js/JsInclude.js"></script>
<jsp:useBean id="user" scope="page" class="com.rich.project.user.User" />
<jsp:setProperty name="user" property="*" />
</head>
<%
     String par = request.getParameter("par");
     String id = request.getParameter("id");
     
     if(par!=null&&par.equals("add"))
      {
          String userid = request.getParameter("userid");
          String password = request.getParameter("password");     
           String ip = request.getRemoteAddr();      
          Vector username_vct = user.login(userid,password);           
          
          if(username_vct!=null&&username_vct.size()>0)
           {
                       //��¼��Ϣ
                         Vector t_vct =(Vector)username_vct.get(0);                         
                         session.setAttribute("inc",t_vct.get(0));                         
                         session.setAttribute("id",t_vct.get(1));                         
                         session.setAttribute("nickname",t_vct.get(2));  
                         //�������userid,id=tbs051.tbs051_inc
                          
                         comment.createComment(userid,id,ip);
           }
          else
           {
               throw new Exception("����Ļ�ԱID�����벻��ȷ�����������룡");
           } 
          
            
      }
   
   


%>
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
        </div>
        </td>
  </tr>
  <tr> 
    <td height="17" bgcolor="#FC9803">&nbsp;</td>
  </tr>
  <tr> 
    <td height="10"><img src="images/tmtp.gif" width="2" height="2"></td>
  </tr>
  <tr> 
 
    <td height="10"><table width="760" border="1" cellpadding="0" cellspacing="0" bordercolor="#CD9501" bordercolordark="#FFFFFF">

        
<%
     //m_vct = pageCtl.getcurData(comment.getComment(id),20,curpage);    
     
    m_vct = comment.getComment(id); 


    
    if(m_vct!=null&&m_vct.size()>0)
     {

%>
        <tr> 
          <td bgcolor="#FFCC00"><font size="2">�������������۹� <%=m_vct.size()%> �� �� �� </font></td>
        </tr>
<%           
       
       
       for(int i=0;i<m_vct.size();i++)
        {
          Vector t_vct = (Vector)m_vct.get(i);
          
           %>
        <tr> 
          <td height="5"><img src="images/tmtp.gif" width="2" height="2"></td>
        </tr>       
        <tr> 
          <td height="25" bgcolor="#FFFBEC"> &nbsp;&nbsp;<img src="images/dis01.gif" width="13" height="18"> 
            <font size="2">�����ˣ� <%=t_vct.get(1)%>  ʱ�䣺 <%=(t_vct.get(3).toString()).substring(0,19)%>  ��IP:<%=((String)t_vct.get(2)).substring(0,((String)t_vct.get(2)).lastIndexOf("."))%>.*</font></td>
        </tr>
        
        <tr> 
          <td><br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=t_vct.get(0)%> 
          <br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=t_vct.get(4)%> <br>&nbsp;
          </td>
        </tr>
       
           <%       
        }
     }
   else
    {
%>
        <tr> 
          <td bgcolor="#FFCC00"><font size="2">�������������۹� 0 �� �� �� </font></td>
        </tr>
<%        
    
    }     
%>         

      
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="10">&nbsp;</td>
  </tr>
<form name="commentform" method="post">  
<input type="hidden" name="par">
  <tr> 
    <td><table width="760" border="1" cellpadding="0" cellspacing="0" bordercolor="#CD9501" bordercolordark="#FFFFFF">
        <tr> 
          <td width="50%" bgcolor="#FFFBEC">&nbsp;&nbsp;<img src="images/dis01.gif" width="13" height="18"> 
            <font size="2"> 
            ��ԱID: 
            <input name="userid" type="text" size="10">
            ����: 
            <input name="password" type="password" size="10">
            </font> </td>
          <td width="50%" bgcolor="#FFFBEC">&nbsp;&nbsp;<img src="images/dis01.gif" width="13" height="18"> 
            <font size="2"><strong>��ز�Ʒ </strong></font></td>
        </tr>
        <tr> 
          <td width="50%" height="130"> <div align="center"> 
              <table width="380" border="0" cellspacing="0" cellpadding="0">
               <tr> 
                  <td height="1"> 
                  <div align="left"> 
                     &nbsp;&nbsp;&nbsp;&nbsp;
                    </div></td>
                </tr>               
               <tr> 
                  <td height="20"> 
                  <div align="left"> 
                     &nbsp;&nbsp;&nbsp;&nbsp;�� �� �� <input name="title" type="text">
                    </div></td>
                </tr>              
                <tr> 
                  <td height="130"> <div align="center"> 
                      <textarea name="content" cols="45" rows="7"></textarea>
                    </div></td>
                </tr>
                <tr> 
                  <td height="30" valign="top"> <div align="center"> 
                      <input type="button" name="Submit" value="�ύ" onclick="subcomment()">
                    </div></td>
                </tr>
              </table>
            </div></td>
          <td width="50%" valign="top"> <br> <table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="20"><font size="2">�� ��ʲ��������������ίԱ����������������鱨</font></td>
              </tr>
              <tr> 
                <td height="20"><font size="2">�� ��ʲ��������������ίԱ����������������鱨</font></td>
              </tr>
              <tr> 
                <td height="20"><font size="2">�� ��ʲ��������������ίԱ����������������鱨</font></td>
              </tr>
              <tr> 
                <td height="20"><font size="2">�� ��ʲ��������������ίԱ����������������鱨</font></td>
              </tr>
              <tr> 
                <td height="20"><font size="2">�� ��ʲ��������������ίԱ����������������鱨</font></td>
              </tr>
              <tr> 
                <td height="20"><font size="2">�� ��ʲ��������������ίԱ����������������鱨</font></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
<script language="javascript">  
function subcomment()
{

   if(isWhitespace(document.commentform.userid.value))
    {
       alert("�������ԱID��");
       document.commentform.userid.focus();
       return;
    }
    
   if(isWhitespace(document.commentform.password.value))
    {
       alert("���������룡");
       document.commentform.password.focus();
       return;
    }    

   if(isWhitespace(document.commentform.title.value))
    {
       alert("���������۱��⣡");
       document.commentform.title.focus();
       return;
    }
    
   if(isWhitespace(document.commentform.content.value))
    {
       alert("�������������ݣ�");
       document.commentform.title.focus();
       return;
    } 
  document.commentform.par.value="add";
  document.commentform.submit();       
}
</script>
</form>  
  <tr> 
    <td> <div align="left"> &nbsp;&nbsp;&nbsp;&nbsp; </div></td>
  </tr>
</table>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="760" height="20" bgcolor="#FFCC00"><font size="2">&nbsp;&gt;&gt; 
      �������</font></td>
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
