<%@ page contentType="text/html;charset=gb2312"%>
<%@ page errorPage="../pub/error.jsp"%>
<%@ page import="java.util.*" %>
<%@ include file="../pub/control.jsp"%>
<%@ include file="../include/config.jsp"%>
<%@ include file="../include/head.jsp"%>
<html>
<head>
<title>������Ʒά��</title>
<link rel="stylesheet" href="../../../../css/style.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="javascript" src="../../js/shop.js"></script>
<script language="javascript" src="../../../../js/JsInclude.js"></script>
<script language="javascript">
function sub()
 {     
     if(goodsadd())
      {
         document.form1.par.value="add";     
         document.form1.submit();      
      }   
    
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
       if(par!=null&&par.equals("add"))
        {
           managegoods.createGoods(aid);
           response.sendRedirect("manage_goods.jsp");   
        }

        
%>
<body bgcolor="#eff3f7" topmargin="0"  leftmargin="0">
</SCRIPT>
<form name="form1" method="post"> 
<input type="hidden" name="par">
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
                        width="20%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;��Ʒ���ƣ�</font></td>
                    <td align=left height=25 valign=MIDDLE 
                        colspan=7><font color="#000000">&nbsp;&nbsp;<input type="text" name="name" /></font></td>
                  </tr>  
                                     
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="20%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;��Ʒ���ͣ�</font></td>
                    <td align=left height=25 valign=MIDDLE 
                        colspan=3><font color="#000000">&nbsp;
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
                        </font></td>
                    <td align=left height=25 valign=MIDDLE 
                        width="20%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;���̣�</font></td>
                    <td align=left height=25 valign=MIDDLE 
                        colspan=3><font color="#000000">&nbsp;
                         <input type="text" name="manufacturer" />
                        </font>
                        </td>                          
                  </tr>     
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="20%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;�г��۸�</font></td>
                    <td align=left height=25 valign=MIDDLE 
                        colspan=3><font color="#000000">&nbsp;
                         <input type="text" name="market_price" />
                        </font>
                        </td>
                    <td align=left height=25 valign=MIDDLE 
                        width="20%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;�ǻ�Ա�۸�</font></td>
                    <td align=left height=25 valign=MIDDLE 
                        colspan=3><font color="#000000">&nbsp;
                         <input type="text" name="price" />
                        </font>
                        </td>                         
                  </tr>                                    
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="20%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;��Ա�۸�</font></td>
                    <td align=left height=25 valign=MIDDLE 
                        colspan=3><font color="#000000">&nbsp;
                         <input type="text" name="member_price" />
                        </font>
                        </td>
                    <td align=left height=25 valign=MIDDLE 
                        width="20%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;�ɱ��۸�</font></td>
                    <td align=left height=25 valign=MIDDLE 
                        colspan=3><font color="#000000">&nbsp;
                         <input type="text" name="cost_price" />
                        </font>
                        </td>                         
                  </tr>                     
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="20%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;��Ʒ�ؼ��֣�</font></td>
                    <td align=left height=25 valign=MIDDLE 
                        colspan=7><font color="#000000">&nbsp;
                          <textarea name="keywords" cols="60" rows="6"></textarea>
                        </font></td>
                  </tr>  
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="20%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;�򵥽��ܣ�</font></td>
                    <td align=left height=25 valign=MIDDLE 
                        colspan=7><font color="#000000">&nbsp;
                          <textarea name="brief" cols="60" rows="6"></textarea>
                        </font></td>
                  </tr>                   
                  <tr valign=center> 
                    <td align=left height=25 valign=MIDDLE 
                        width="20%" colspan=1><font color="#000000">&nbsp;&nbsp;&nbsp;&nbsp;��ϸ���ܣ�</font></td>
                    <td align=left height=25 valign=MIDDLE 
                        colspan=7><font color="#000000">&nbsp;
                          <textarea name="product_intr" cols="60" rows="15"></textarea>
                        </font>
                    </td>
                  </tr>                                  
               </tbody>   
              </table>
              <br> 
              <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" name="button_1" value="����" onclick="sub()"></p></td></tr> 
</table></td></tr> <tr> <td align="left" valign="top" background="../../../image/line_hor.jpg" height="1"> 
</td></tr> </table>

</form>
</body>
</html>
