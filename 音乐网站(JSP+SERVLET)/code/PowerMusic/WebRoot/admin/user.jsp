<%@ page language="java" contentType="text/html;charset=gbk"%>
<%@ include file="/inc/top.jsp"%>
<%@ page import="java.io.*"%>
<%@ page import="model.UserModel"%>
<%@ page import="java.util.*"%>
<%@ page import="control.bean.ManageUser"%>
<jsp:useBean id="manageuser" class="control.bean.ManageUser" scope="page"></jsp:useBean>
<jsp:useBean id="umodel" class="model.UserModel" scope="page"></jsp:useBean>
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
    Vector uservector;
%>
<%--����ҳ�� --%>
<%
 	totalcount = manageuser.getTotalrow();
  	totalpages = totalcount/countperpage;
  	if(totalpages%countperpage>0){
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
	uservector = manageuser.displayQuery(5,currentpage,"* from UserInfo order by UserID","UserID");
%>
<script language="JavaScript" >
	function page_check()
	{
		if(document.userpage.page.value=="")
		{
			alert("������ҳ��");
			document.userpage.page.focus();
			return false;
		}
		return true;
	}
</script>
<%--���»�Ա���� --%>
<%
	String update = request.getParameter("action");
	if("update".equals(update)){
		String userid = request.getParameter("userid");
		String username = request.getParameter("modusername");
		String password = request.getParameter("moduserpwd");
		String useremail = request.getParameter("moduseremail");
		String usersex = request.getParameter("modusersex");
		String userqq = request.getParameter("moduserqq");
		int rowaffect = manageuser.updateUser(userid,username,password,useremail,usersex,userqq);
		if(rowaffect>0){
		%>
		<script language="JavaScript">
			alert("�޸ĳɹ�");
		</script>
<%}}%>
<%--�����û� --%>
<%
	String search = request.getParameter("action");
	if("search".equals(search)){
		String searchusername = request.getParameter("searchusername");
		uservector = manageuser.displayQuery(5,currentpage,"* from UserInfo where UserName ='"+searchusername+"'","UserName");
		searchstate = 1;
	}
%>
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
                          <p><font color="#FFFFFF" size="3">��̨����</font></p>
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
                            <td height="50"><a href="<%=request.getContextPath()%>/admin/music.jsp">�������</a></td>
                          </tr><tr>
                            <td height="50"><a href="guestbook.jsp">��������</a></td>
                          </tr>
                        </table> 
					    <table width="40%" height="23" border="0" align="center">
                          <tr> 
                            <td width="42%"><a href="<%=request.getContextPath()%>/admin/user.jsp">�û�������ҳ</a></td>
                            <td width="30%"><a href="<%=request.getContextPath()%>/admin/user.jsp?action=common">��ͨ�û�</a></td>
                            <td width="28%"><a href="<%=request.getContextPath()%>/admin/admin.jsp?action=common">����Ա</a></td>
                          </tr>
                        </table>
						<!--�û�������ҳ-->
                        <p></p>
                        <p></p>
                        <%--��ʾ���޸Ļ�Ա������ --%>
     					<%	
     						String modify = request.getParameter("action");
     						int userid = 0;
     						if(request.getParameter("userid")!=null)
     						{
     							 userid = Integer.parseInt(request.getParameter("userid"));
     							 if(userid>5)
     							 	userid = userid-5;
     						}
     						if("modify".equals(modify)){
     							umodel.setUserid(((UserModel)uservector.get(userid-1)).getUserid());
						    	umodel.setUsername(((UserModel)uservector.get(userid-1)).getUsername());
						    	umodel.setPassword(((UserModel)uservector.get(userid-1)).getPassword());
						    	umodel.setUseremail(((UserModel)uservector.get(userid-1)).getUseremail());
						    	umodel.setUsersex(((UserModel)uservector.get(userid-1)).getUsersex());
						    	umodel.setUserqq(((UserModel)uservector.get(userid-1)).getUserqq());
						    	umodel.setUserRule(((UserModel)uservector.get(userid-1)).getUserRule());
						    	umodel.setRegtime(((UserModel)uservector.get(userid-1)).getRegtime());
     					%><FORM name="upuserform" action="user.jsp?action=update&userid=<%=umodel.getUserid()%>" method="post">
     						<TABLE width="40%" border="0" align=center>
     						<TR>
     						<TD width=24%>�û���</TD>
     						<TD width=76%><input type=text name="modusername" value="<%=umodel.getUsername()%>"></TD>
     						</TR>
     						<TR>
     						<TD width=24%>����</TD>
     						<TD width=76%><input type=text name="moduserpwd" value="<%=umodel.getPassword()%>"></TD>
     						</TR>
     						<TR>
     						<TD width=24%>E-mail</TD>
     						<TD width=76%><input type=text name="moduseremail" value="<%=umodel.getUseremail()%>"></TD>
     						</TR>
     						<TR>
     						<TD width=24%>�Ա�</TD>
     						<TD width=76%><input type=text name="modusersex" value="<%=umodel.getUsersex()%>"></TD>
     						</TR>
     						<TR>
     						<TD width=24%>QQ</TD>
     						<TD width=76%><input type=text name="moduserqq" value="<%=umodel.getUserqq()%>"></TD>
     						</TR>
     						<TR>
     						<TD width=24%><input type=submit value="�޸�"></TD>
     						<TD width=76%><input type=reset></TD>
     						</TR>
     						</TABLE>
     						</FORM>
     					<%}%>
     					<%--��ͨ�û��Ĺ���ҳ�� --%>
                        <%
                        	String action = request.getParameter("action");
                       	    if("common".equals(action)||searchstate==1){
                       	%>
                       	  <table width="650" border="0" cellpadding="3" cellspacing="1" bgcolor="#ffffff">
						  <tr bgcolor="#cccccc">
						  	<td align="center" nowrap width="9%"><b>ID</b></td>
							<td align="center" nowrap width="15%"><b>�û���</b></td>
							<td align="center" nowrap width="15%"><b>����</b></td>
							<td align="center" nowrap width="17%"><b>E-Mail</b></td>
							<td align="center" nowrap width="8%"><b>�Ա�</b></td>
							<td align="center" nowrap width="10%"><b>QQ</b></td>
							<td align="center" nowrap width="11%"><b>��ɫ</b></td>
							<td align="center" nowrap width="15%"><b>ע��ʱ��</b></td>
							 <% 
						    for(int i=0;i<uservector.size();i++){
						    	umodel.setUserid(((UserModel)uservector.get(i)).getUserid());
						    	umodel.setUsername(((UserModel)uservector.get(i)).getUsername());
						    	umodel.setPassword(((UserModel)uservector.get(i)).getPassword());
						    	umodel.setUseremail(((UserModel)uservector.get(i)).getUseremail());
						    	umodel.setUsersex(((UserModel)uservector.get(i)).getUsersex());
						    	umodel.setUserqq(((UserModel)uservector.get(i)).getUserqq());
						    	umodel.setUserRule(((UserModel)uservector.get(i)).getUserRule());
						    	umodel.setRegtime(((UserModel)uservector.get(i)).getRegtime());
						   %><TR bgcolor="#6600CC">
						        <td align="center" nowrap width="9%"><%=umodel.getUserid()%></td>
						        <td align="center" nowrap width="15%">
						        <a href="user.jsp?action=modify&userid=<%=umodel.getUserid()%>">
						        <%=umodel.getUsername()%></a></td>
						        <td align="center" nowrap width="15%"><%=umodel.getPassword()%></td>
						        <td align="center" nowrap width="17%"><%=umodel.getUseremail()%></td>
						        <td align="center" nowrap width="8%"><%=umodel.getUsersex()%></td>
						        <td align="center" nowrap width="10%"><%=umodel.getUserqq()%></td>
						        <td align="center" nowrap width="11%">
						        <%if(umodel.getUserRule()==0){
						        	out.print("��ͨ�û�");}else{out.print("����Ա");}%></td>
						        <td align="center" nowrap width="15%"><%=umodel.getRegtime()%></td>
						   </TR>
						 <%}%>
						   </table>
						<FORM name="userpage" method="post" onSubmit="return page_check();"action="user.jsp?action=common">
						<TABLE width="36%">
						<tr>
						<td >����<%out.print(totalpages);%>ҳ,�����ǵ�<%out.print(currentpage);%>ҳ</td>
						</tr>
						<tr>
						<td>
						<a href="<%=request.getContextPath()%>/admin/user.jsp?action=common&page=<%=currentpage-1%>">��һҳ</a>
						<a href="<%=request.getContextPath()%>/admin/user.jsp?action=common&page=<%=currentpage+1%>">��һҳ </a>
						<a href="<%=request.getContextPath()%>/admin/user.jsp?action=common&page=1">��ҳ </a>
						<a href="<%=request.getContextPath()%>/admin/user.jsp?action=common&page=<%=totalpages%>">βҳ </a>
						<input name="page" type="text" size="5">ҳ<input type="submit" name="Submit" value="Go">
						</td>
						</tr>
						</TABLE>
						</FORM>
                       	<%}%>
                       	<%--�����û�--%>
                        <FORM action="user.jsp?action=search" method="post">
                        <table width="40%" border="0" align="center">
                        <TR><td colspan=2 align="center">�����û�</td>
                        </TR>
                          <tr> 
                            <td width="19%">�û���</td>
                            <td width="81%"><input type="text" name="searchusername"></td>
                          </tr>
                          <tr> 
                            <td width=19%><input type="submit" value="�ύ"></td>
							<td width=81%><input type="reset" ></td>
                          </tr>
                        </table>
                        </FORM>
                      <%--  <%}%>--%>
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
