<%@ page language="java" contentType="text/html;charset=gbk"%>
<%@ include file="/inc/top.jsp"%>
<%@ page import="java.io.*"%>
<%@ page import="model.AdminModel"%>
<%@ page import="java.util.*"%>
<%@ page import="control.bean.ManageAdmin"%>
<jsp:useBean id="manageadmin" class="control.bean.ManageAdmin" scope="page"></jsp:useBean>
<jsp:useBean id="amodel" class="model.AdminModel" scope="page"></jsp:useBean>
<%--�����ǹ���Ա,�ض�����ҳ --%>
<%
	String adminname = (String)session.getAttribute("adminname");
	if(adminname==null)
		response.sendRedirect(request.getContextPath()+"/index.jsp");
%>
<%!
	int searchstate = 0;
	int totalpages;
    int countperpage=5; 
    int totalcount;
    int currentpage=0;
    int pagecode = 1;
    Vector adminvector;
%>
<%--����ҳ�� --%>
<%
 	totalcount = manageadmin.getTotalrow();
  	totalpages = totalcount/countperpage;
  	if(totalpages%countperpage>0||totalcount<countperpage){
   		totalpages+=1;
 	}
 	if(request.getParameter("page")==null){
		currentpage=1;
	}else{
		currentpage=Integer.parseInt(request.getParameter("page"));
		if(currentpage>totalpages)
			currentpage=totalpages;
		if(currentpage<1)
		currentpage=1;
	}//����nҳ����ȡ����
	adminvector = manageadmin.displayQuery(5,currentpage,"* from AdminInfo order by AdminID","AdminID");
%>
<script language="JavaScript" >
	function page_check()
	{
		if(document.adminpage.page.value=="")
		{
			alert("������ҳ��");
			document.adminpage.page.focus();
			return false;
		}
		return true;
	}
</script>
<%--���¹���Ա���� --%>
<%
	String update = request.getParameter("action");
	if("update".equals(update)){
		String adminid = request.getParameter("adminid");
		String modadminname = request.getParameter("modadminname");
		String modpassword = request.getParameter("modadminpwd");
		int rowaffect = manageadmin.updateAdmin(adminid,modadminname,modpassword);
		if(rowaffect>0){
		%>
		<script language="JavaScript">
			alert("�޸ĳɹ�");
			window.location = "admin.jsp";
		</script>
<%}else{%>
	<script language="JavaScript">
		alert("�޸ĳɹ�");
		window.location = "admin.jsp";
	</script><%}}%>
<%--����,��ӹ���Ա --%>
<%
	String search = request.getParameter("action");
	if("search".equals(search)){
		String searchadminname = request.getParameter("searchadminname");
		adminvector = manageadmin.displayQuery(5,currentpage,"* from AdminInfo where AdminName ='"+searchadminname+"'","AdminName");
		searchstate = 1;
	}
	String addadmin = request.getParameter("action");
	if("add".equals(addadmin)){
		String addadminname = request.getParameter("addadminname");
		String addadminpwd = request.getParameter("addadminpwd");
		int rowaffect = manageadmin.addAdmin(addadminname,addadminpwd);
		if(rowaffect>0){
			%>
			<script language="JavaScript">
				alert("��ӹ���Ա�ɹ�");
			</script>
<%}else{%><script language="JavaScript">
				alert("��ӹ���Աʧ��");
			</script>
			<%}}%>
<!--��������!-->
<TABLE cellSpacing=0 cellPadding=0 width=770 align=center border=0>
   <TBODY>
     <TR>
		<TD width=3 background=images/bian.gif></TD>
		<TD>
		  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
			<TBODY>
				<TR>
				   <TD width=6 background=images/left-shu.gif rowSpan=3></TD>
				   
              <TD background=images/hen.gif height=16></TD>
				   <TD width=6 background=images/right-shu.gif rowSpan=3></TD>
				</TR>
			    <TR>
			       
              <TD height="233"> 
                <TABLE width="100%" height="480" 
					border=0 cellPadding=0 cellSpacing=0 bgColor=#42748d>
                  <TBODY>
                    <TR vAlign=top> 
                      <TD height="40" bgcolor="#3300cc">
									<p>&nbsp;</p>
									<p><a href="index.jsp"><FONT color="#ffffff">��ҳ<FONT color="#000000"
										style="BACKGROUND-COLOR: #ffffff"></FONT></FONT>
										</a></p></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD height="8" bgcolor="#000000"> 
                        <div align="center">
                          <p><font color="#FFFFFF" size="3">��̨����--����Ա��Ϣ</font></p>
                          </div></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD width="62%" height="220">
                      <table width="100" height="245" align="left">
						  <tr>
                            <p></p>
                            <td height="50"><a href="<%=request.getContextPath()%>/Login?action=logout">ע��</a></td>
                          </tr>
						  <tr>
                            <td height="50"><a href="<%=request.getContextPath()%>/admin/user.jsp">�����û�</a></td>
                          </tr>
                          <tr>
						  <tr>
                            <td height="50"><a href="<%=request.getContextPath()%>/admin/news.jsp">��������</a></td>
                          </tr>
						  <tr>
                            <td height="50"><a href="music.jsp">�������</a></td>
                          </tr><tr>
                            <td height="50"><a href="guestbook.jsp">��������</a></td>
                          </tr>
                        </table> 
					    <table width="40%" height="23" border="0" align="center">
                          <tr> 
                            <td width="42%"><a href="<%=request.getContextPath()%>/admin/user.jsp">�û�������ҳ</a></td>
                            <td width="30%"><a href="<%=request.getContextPath()%>/admin/user.jsp?action=common">��ͨ�û�</a></td>
                            <td width="28%"><a href="admin.jsp?action=common">����Ա</a></td>
                          </tr>
                        </table>
						<!--�û�������ҳ-->
                        <p></p>
                        <p></p>
                        <%--��ʾ���޸Ĺ���Ա������ --%>
     					<%	
     						String modify = request.getParameter("action");
     						int position = 0;
     						if(request.getParameter("adminid")!=null)
     						{
     							position = Integer.parseInt(request.getParameter("position"));
     						}
     						if("modify".equals(modify)){
     							amodel.setAdminid(((AdminModel)adminvector.get(position)).getAdminid());
						    	amodel.setAdminname(((AdminModel)adminvector.get(position)).getAdminname());
						    	amodel.setAdminpwd(((AdminModel)adminvector.get(position)).getAdminpwd());
						    	amodel.setRegtime(((AdminModel)adminvector.get(position)).getRegtime());
     					%><FORM name="upadminform" action="admin.jsp?action=update&adminid=<%=amodel.getAdminid()%>" method="post">
     						<TABLE width="40%" border="0" align=center>
     						<TR>
     						<TD width=24%>����Ա</TD>
     						<TD width=76%><input type=text name="modadminname" value="<%=amodel.getAdminname()%>"></TD>
     						</TR>
     						<TR>
     						<TD width=24%>����</TD>
     						<TD width=76%><input type=text name="modadminpwd" value="<%=amodel.getAdminpwd()%>"></TD>
     						</TR>
     						<TR>
     						<TD width=24%><input type=submit value="�޸�"></TD>
     						<TD width=76%><input type=reset></TD>
     						</TR>
     						</TABLE>
     						</FORM>
     					<%}%>
     					<%--����Ա��Ϣ�Ĺ���ҳ�� --%>
                        <%
                        	String action = request.getParameter("action");
                       	    if("common".equals(action)||searchstate==1){
                       	%>
                       	  <table width="550" border="0" cellpadding="3" cellspacing="1" bgcolor="#ffffff">
						  <tr bgcolor="#cccccc">
						  	<td align="center" nowrap width="15%"><b>ID</b></td>
							<td align="center" nowrap width="25%"><b>�û���</b></td>
							<td align="center" nowrap width="25%"><b>����</b></td>
							<td align="center" nowrap width="35%"><b>ע��ʱ��</b></td>
							 <% 
						    for(int i=0;i<adminvector.size();i++){
						    	amodel.setAdminid(((AdminModel)adminvector.get(i)).getAdminid());
						    	amodel.setAdminname(((AdminModel)adminvector.get(i)).getAdminname());
						    	amodel.setAdminpwd(((AdminModel)adminvector.get(i)).getAdminpwd());
						    	amodel.setRegtime(((AdminModel)adminvector.get(i)).getRegtime());
						   %><TR bgcolor="#6600CC">
						        <td align="center" nowrap width="15%"><%=amodel.getAdminid()%></td>
						        <td align="center" nowrap width="25%">
						        <a href="admin.jsp?action=modify&adminid=<%=amodel.getAdminid()%>&position=<%=i%>">
						        <%=amodel.getAdminname()%></a></td>
						        <td align="center" nowrap width="25%"><%=amodel.getAdminpwd()%></td>
						        <td align="center" nowrap width="35%"><%=amodel.getRegtime()%></td>
						   </TR>
						 <%}%>
						   </table>
						<FORM name="adminpage" method="post" onSubmit="return page_check();"action="admin.jsp?action=common">
						<TABLE width="36%">
						<tr>
						<td >����<%out.print(totalpages);%>ҳ,�����ǵ�<%out.print(currentpage);%>ҳ</td>
						</tr>
						<tr>
						<td>
						<a href="<%=request.getContextPath()%>/admin/admin.jsp?action=common&page=<%=currentpage-1%>">��һҳ</a>
						<a href="<%=request.getContextPath()%>/admin/admin.jsp?action=common&page=<%=currentpage+1%>">��һҳ </a>
						<a href="<%=request.getContextPath()%>/admin/admin.jsp?action=common&page=1">��ҳ </a>
						<a href="<%=request.getContextPath()%>/admin/admin.jsp?action=common&page=<%=totalpages%>">βҳ </a>
						<input name="page" type="text" size="5">ҳ<input type="submit" name="Submit" value="Go">
						</td>
						</tr>
						</TABLE>
						</FORM>
                       	<%}%>
                       	<TABLE align= center>
                       	  <TR>
                       	    <TD>
		                       	<%--��������Ա--%>
		                        <FORM action="admin.jsp?action=search" method="post">
		                        <table width="40%" border="0" align="right">
		                        <TR><td colspan=2 align="center">��������Ա</td>
		                        </TR>
		                          <tr> 
		                            <td width="19%">�û���</td>
		                            <td width="81%"><input type="text" name="searchadminname"></td>
		                          </tr>
		                          <tr> 
		                            <td width=19%><input type="submit" value="�ύ"></td>
									<td width=81%><input type="reset" ></td>
		                          </tr>
		                        </table>
		                        </FORM>
                       	    </TD>
                       	    <TD>
                       	      <FORM action="admin.jsp?action=add" method="post">
		                        <table width="60%" border="0" align="right">
		                        <TR><td colspan=2 align="center">��ӹ���Ա</td>
		                        </TR>
		                          <tr> 
		                            <td width="19%">�û���</td>
		                            <td width="81%"><input type="text" name="addadminname"></td>
		                          </tr>
		                          <tr> 
		                            <td width="19%">����</td>
		                            <td width="81%"><input type="text" name="addadminpwd"></td>
		                          </tr>
		                          <tr> 
		                            <td width=19%><input type="submit" value="���"></td>
									<td width=81%><input type="reset" ></td>
		                          </tr>
		                        </table>
		                        </FORM>
                       	    </TD>
                       	  </TR>
                       	</TABLE>
                        <p>&nbsp;</p></td>
						  </TR>
						</table>
                      </TD>
                    </TR>
                  </TBODY>
                </TABLE>
					</TD>
				</TR>
				
            <TR> 
              <TD background=images/middle-shu.gif height=60>
              </TD>
			</TR>
			</TBODY>
		 </TABLE>

  
  <%@include file="/inc/footer.jsp"%>
