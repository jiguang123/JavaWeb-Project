<%@ page language="java" contentType="text/html;charset=gbk"%>
<%@include file="/inc/top.jsp" %>
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
									<p><a href="<%=request.getContextPath()%>/index.jsp"><FONT color="#ffffff">��������<FONT color="#000000"
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
                      <table width="196" height="245" align="left">
                            <p></p>
                              <%
								String adminname = (String)session.getAttribute("adminname"); 
									if(adminname==null){
										response.sendRedirect(request.getContextPath()+"/index.jsp");
									}else{
									 %><tr>
                            <td width="188" height="50">
                              <a href="<%=request.getContextPath() %>/Login?action=logout">ע��</a>
                            </td>
                          </tr>
                          <%}%>
						  <tr>
                            <td height="50">
                              <a href="<%=request.getContextPath() %>/admin/user.jsp">�����û�</a>
                            </td>
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
						  
                          <tr>
                        </table> 
					    <table width="63%" height="86" border="0">
                          <tr> 
                            <form action="" name="searchuserform" method="post">
                              <td height="82" colspan="3">
								<div align="right">�����û�</div></td>
                              <td width="50%"><input type="text" name="searchuser"></td>
                              <td width="20%"><input type="submit" name="subupfile" value="�ύ"></td>
                            </form>
                          </tr>
               			</table>
						<form>
                        <table width="60%" height="175" border="0">
                          <tr> 
                            <td colspan="2"><div align="center">�ϴ��ļ������ݿ�,������ʹ��</div></td>
                          </tr>
                          <tr> 
                            <td colspan="2"> <div align="center">�����ϴ�����&lt;wma,mp3,wav&gt;</div></td>
                          </tr>
                          <tr> 
                            <td height="20"> <div align="right">��������</div></td>
                            <td width="58%" align="left"> <input name="dbmusicname" type="text" size="15"> 
                            </td>
                          </tr>
                          <tr align="right"> 
                            <td>��������</td>
                            <td align="left"> <input name="dbsingername" type="text" size="15"> 
                            </td>
                          </tr>
                          <tr> 
                            <td height="23" align="right">�����Ա�</td>
                            <td> <SELECT name="dbsingersex">
                                <OPTION value="male">��</OPTION>
                                <OPTION value="female">Ů</OPTION>
                              </SELECT> </td>
                          </tr>
                          <tr align="center">
                            <td  colspan="2">
							<input type="file" name="dbupfile" size=20>
							</td>
                          </tr>
                          <tr align="center"> 
                            <td height="39" colspan="2"> 
                              <input type="submit" value="�ύ">
                              <INPUT type="reset">
							</td>
                          </tr>
                        </table>
						</form>
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
	  </TD>
		<TD width=3 background=images/bian3.gif></TD>
	</TR>
   </TBODY>
  </TABLE>
<%@ include file="/inc/footer.jsp" %>