<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.*" %>
<%@ include file="../include/config.jsp"%>
<%@ include file="../pub/control.jsp"%>
<%@ include file="../include/head.jsp"%>
<html>
<head>
<title>������Ŀά��</title>
<link rel="stylesheet" href="../../../../css/style.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript">
function sub()
 {
     
     document.form1.par.value="update";     
     document.form1.submit();
 }
</script>
<script language="javascript">
var arrayboardID=new Array();
var arrayboardName=new Array();
var arrayboardParentID=new Array();
<%
Vector type_vct = manageclass.getShopAllSubClass();
for(int i=0; i<type_vct.size(); i++)
{
    Vector atype_vct =(Vector)type_vct.get(i);
    %>
    arrayboardID[<%=i%>]=<%=atype_vct.get(0)%>; arrayboardName[<%=i%>]='<%=atype_vct.get(1)%>'; arrayboardParentID[<%=i%>]='<%=atype_vct.get(2)%>';
    <%
}
%>
function changeBoardParent()
{
/**
*@����һ����Ŀ
*/	   
	   setBoard(document.form1.parentid.value);
}
function setBoard(parentid)
{
	
/**
*@���ö�����Ŀ
*/		
document.form1.catalog_id.options.length=0;
var count=0;
document.form1.catalog_id.add(document.createElement('OPTION'));
document.form1.catalog_id.options[count].text="��ѡ������";
document.form1.catalog_id.options[count].value="all";
count++; 
if(parentid!="all"){
	for(var i=0; i<arrayboardParentID.length; ++i)
	{
	    if(arrayboardParentID[i]==parentid)
	    {
	         document.form1.catalog_id.add(document.createElement('OPTION'));
	         document.form1.catalog_id.options[count].text=arrayboardName[i];
	         document.form1.catalog_id.options[count].value=arrayboardID[i];
	         count++;
	    }
	}
    }   
}
//-->
</script>
</head>
<%
       String par = request.getParameter("par");
       String aid = session.getAttribute("aid").toString();
       String manufacturer = managegoods.getManufacturer()==null?"":managegoods.getManufacturer();
       String name = managegoods.getName()==null?"":managegoods.getName();
       String parentid = managegoods.getParentid()==null?"all":managegoods.getParentid();
       String catalog_id = managegoods.getCatalog_id()==null?"all":managegoods.getCatalog_id();
       Vector m_vct = managegoods.getGoodSList(); //ȡһ������
               
%>
<body bgcolor="#eff3f7" topmargin="0"  leftmargin="0">
</SCRIPT>
<form name="form1" method="post"> 
<input type="hidden" name="par">
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
<tr> <td align="left" valign="middle" height="2"></td></tr> 

<tr> 
<td align="left" valign="top"> 
<table align=center border=1 bordercolor=#095ab5 
                  bordercolordark=#ffffff cellpadding=0 cellspacing=0 
                  id=submenu1 width="90%">
                <tbody>
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="10%" colspan=3 BGCOLOR="#D0ECF9">
                        <font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;
                        ��Ʒ���ƣ�
                        </font>
                        </td>                                          
                    <td align=left height=25 valign=MIDDLE width="10%">
                    &nbsp;&nbsp;<font color="#000000">
                    <input type="text" name="name"></name>
                    </font>
                    </td>                        
                   <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1 BGCOLOR="#D0ECF9">
                   ����
                   </td>     
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=3>
                    <input type="text" name="manufacturer"></name>
                    </td>
                  </tr>  
                  
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="10%" colspan=3 BGCOLOR="#D0ECF9">
                        <font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;
                        ��Ʒ���ͣ�
                        </font>
                        </td>                                          
                    <td align=left height=25 valign=MIDDLE width="10%" colspan=2>
                    &nbsp;&nbsp;<font color="#000000">
                        <select name="parentid" onChange=changeBoardParent()>
                        <option value="all">��ѡ�����</option>
<%
   Vector shop_class = manageclass.getShopClass();
    if(shop_class!=null && shop_class.size()>0)
     {
          for(int i=0;i<shop_class.size();i++)
           {
             Vector t_vct = (Vector)shop_class.get(i);
             %>
              <option value="<%=t_vct.get(0)%>"><%=t_vct.get(1)%></option>
             <% 
           }
     }
%> 
                        </select>
                        <select name="catalog_id">
                        <option value="all">��ѡ������</option>
                        </select>
                    </font>
                    </td> 
                         <td align=left height=25 valign=MIDDLE 
                        width="10%" colspan=3 >
                        <font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" name="button_1" value="��ѯ" onclick="sub()">
                        </font>
                        </td>                      
                  </tr>                    
                </tbody>                     
              </table>
              </td>
              </tr> 
</table></td></tr> 

<tr>
<td align="left" valign="top" background="../../../image/line_hor.jpg" height="1"> 
</td>
</tr> 
</table>
<br>
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
<tr>
<td align="left" valign="top" background="../../../image/line_hor.jpg" height="1">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="4"><b><a href="goods_add.jsp">������Ʒ</a></b></font>
</td>
</tr> 
</table>
<br>
<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
<tr> <td align="left" valign="middle" height="2"></td></tr> 

<tr> 
<td align="left" valign="top"> 
<table align=center border=1 bordercolor=#095ab5 
                  bordercolordark=#ffffff cellpadding=0 cellspacing=0 
                  id=submenu1 width="90%">
                <tr valign=center BGCOLOR="#D0ECF9"> 
                  <td align=CENTER height=25 valign=MIDDLE COLSPAN="8"><B><FONT SIZE="2">&nbsp;</FONT></B></td>
                </tr>
                <tbody>
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="5%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;���</font></td>
                    <td align=left height=25 valign=MIDDLE 
                        width="15%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;��Ʒ����</font></td> 
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1>����</td>                                                 
                    <td align=left height=25 valign=MIDDLE 
                        width="15%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;ͼƬά��</font></td>                                            
                    <td align=CENTER height=25 valign=MIDDLE 
                        width="10%"><font color="#000000">˳��</font></td> 
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=3>ɾ��</td>
                  </tr>                      
                  
   <%
   if(m_vct!=null&&m_vct.size()>0)
    {
       for(int i=0;i<m_vct.size();i++)
        {
           Vector t_vct = (Vector)m_vct.get(i);
           %>
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="5%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;<%=t_vct.get(0)%></font></td>
                    <td align=left height=25 valign=MIDDLE 
                        width="15%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;<%=t_vct.get(1)%></font></td> 
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=1><%=t_vct.get(2)%>--><%=t_vct.get(3)%></td>                                                 
                    <td align=left height=25 valign=MIDDLE 
                        width="15%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;<a href="goods_images.jsp?inc=<%=t_vct.get(0)%>" target="_blank">ͼƬά��</a></font></td>                                            
                    <td align=CENTER height=25 valign=MIDDLE 
                        width="10%"><font color="#000000">˳��</font></td> 
                    <td width="10%" height=25 align=CENTER valign=MIDDLE colspan=3>ɾ��</td>
                  </tr>            
           <%
        }
    }

%>           
                  
              </table>
              <br> 
              <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              </p></td></tr> 
</table></td></tr> <tr> <td align="left" valign="top" background="../../../image/line_hor.jpg" height="1"> 
</td></tr> </table>

</form>

<script language="javascript">
document.form1.name.value='<%=name%>';
document.form1.manufacturer.value='<%=manufacturer%>';
document.form1.parentid.value='<%=parentid%>';
changeBoardParent();
document.form1.catalog_id.value='<%=catalog_id%>';
</script>
</body>
</html>
