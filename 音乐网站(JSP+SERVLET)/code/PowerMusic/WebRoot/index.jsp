<!--��ҳ!-->
<%@ page language="java" contentType="text/html; charset=gbk"%>
<%! String username = "";%>
<jsp:include page="/inc/top.jsp"></jsp:include>
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
				   <TD background=images/hen.gif height=7></TD>
				   <TD width=6 background=images/right-shu.gif rowSpan=3></TD>
				</TR>
			    <TR>
			       <TD>
					<TABLE cellSpacing=0 cellPadding=0 width="100%" bgColor=#42748d 
					border=0>
					  <TBODY>
					  <TR vAlign=top>
						<TD width="62%">
						  <TABLE height=78 cellSpacing=0 cellPadding=0 width="97%" 
						  align=center border=0>
							<TBODY>
							  <TR>
								<TD colSpan=2 height=1><IMG height=25 src="images/news.gif" width=439></TD>
							  </TR>
							  <TR>
								<TD vAlign=top width="4%" height=83>
								<IMG height=81 src="images/news-1.gif" width=13></TD>
								<TD vAlign=top width="96%" height=83>
								  <TABLE cellSpacing=5 cellPadding=0 width="100%" border=0>
									<TBODY>
									  <jsp:include page="/board/cuenews.jsp" />
									</TBODY>
								   </TABLE>
								</TD>
							   </TR>
							</TBODY>
						  </TABLE>
						 </TD>
						<TD width="18%">
						  <TABLE cellSpacing=5 cellPadding=0 width=126 border=0>
							<TBODY>
							<TR>
							  <TD vAlign=bottom background=images/music.gif height=25>
								<DIV align=center>
								<TABLE cellSpacing=1 cellPadding=0 width="100%" border=0>
								   <TBODY>
									  <TR>
										<TD>
										<DIV align=center><%if(session.getAttribute("username")!=null){%>
										<a href="<%=request.getContextPath()%>/PostFile?action=open"><FONT color="#990033">�ϴ� ����</FONT></a>
										<%}%></DIV>
										</TD>
									  </TR>
							       </TBODY>
								</TABLE>
							    </DIV>
							   </TD>
							  </TR>
							<TR>
							  <TD vAlign=bottom background=images/music.gif height=25>
								<DIV align=center>
									<TABLE cellSpacing=1 cellPadding=0 width="100%" border=0>
									  <TBODY>
									  <TR>
										<TD>
										  <DIV align=center>
										<a href="<%=request.getContextPath()%>/show/music.jsp"><FONT color="#990033"> ����  ����</FONT></a>
										</DIV>
										</TD>
									  </TR>
									  </TBODY>
									 </TABLE>
								</DIV>
							  </TD>
							</TR>
							<TR>
							  <TD vAlign=bottom background=images/music.gif height=25>
								<DIV align=center>
								<TABLE cellSpacing=1 cellPadding=0 width="100%" border=0>
								  <TBODY>
								  <TR>
									<TD>
									  <DIV align=center>
									  <a href="<%=request.getContextPath()%>/show/news.jsp"><FONT color="#990033"> ����  �б�</FONT></a>
									  </DIV>
									</TD>
								  </TR>
								  </TBODY>
								 </TABLE>
								 </DIV>
							   </TD>
							</TR>
							<TR>
							  <TD vAlign=bottom background=images/music.gif height=25>
								<DIV align=center>
								<TABLE cellSpacing=1 cellPadding=0 width="100%" border=0>
								  <TBODY>
								  <TR>
									<TD>
									  <DIV align=center>
									  <a href="<%=request.getContextPath()%>/show/guestbook.jsp"><FONT color="#990033">�� ��  ��</FONT></a>
									  </DIV>
									</TD>
								  </TR>
								  </TBODY>
								</TABLE>
							    </DIV>
							  </TD>
							</TR>
							<TR>
							  <TD vAlign=bottom background=images/music.gif height=25>
								<TABLE cellSpacing=1 cellPadding=0 width="100%" border=0>
								  <TBODY>
									  <TR>
										<TD>
										  <DIV align=center></DIV>
										</TD>
									  </TR>
								  </TBODY>
								 </TABLE>
							   </TD>
							</TR>
						</TBODY>
						</TABLE>
						</TD>
						<TD align=center width="20%">
						  <TABLE cellSpacing=5 cellPadding=0 width=126 border=0>
							<TBODY>
							<TR>
							  <TD vAlign=bottom background=images/music.gif height=25>
								<DIV align=center>
								<TABLE cellSpacing=2 cellPadding=0 width="100%" border=0>
								  <TBODY>
								  <TR>
									<TD>
									  <DIV align=center></DIV>
									</TD>
									</TR>
									</TBODY>
									</TABLE>
								  </DIV>
							   </TD>
							 </TR>
							 <TR>
							   <TD vAlign=bottom background=images/music.gif height=25>
								<DIV align=center>
									<TABLE cellSpacing=2 cellPadding=0 width="100%" border=0>
									  <TBODY>
									  <TR>
										<TD>
										  <DIV align=center></DIV>
										</TD>
									  </TR>
									  </TBODY>
									</TABLE>
							    </DIV>
							    </TD>
							</TR>
							<TR>
							  <TD vAlign=bottom background=images/music.gif height=25>
								<DIV align=center>
								<TABLE cellSpacing=2 cellPadding=0 width="100%" border=0>
								  <TBODY>
								  <TR>
									<TD>
									  <DIV align=center><FONT color=#6633cc></FONT></DIV>
									</TD>
								  </TR>
								  </TBODY>
								 </TABLE>
								 </DIV>
							   </TD>
							</TR>
							<TR>
							  <TD vAlign=bottom background=images/music.gif height=25>
								<DIV align=center>
								<TABLE cellSpacing=2 cellPadding=0 width="100%" border=0>
								  <TBODY>
								  <TR>
									<TD>
									  <DIV align=center></DIV>
									 </TD>
								  </TR>
								  </TBODY>
								 </TABLE>
								 </DIV>
								</TD>
							</TR>
							<TR>
							  <TD vAlign=bottom background=images/music.gif 
							  height=25>
								<TABLE cellSpacing=2 cellPadding=0 width="100%" border=0>
								  <TBODY>
								  <TR>
									<TD>
									  <DIV align=center></DIV>
									</TD>
								   </TR>
								   </TBODY>
								</TABLE>
							   </TD>
							 </TR>
							</TBODY>
						  </TABLE>
						 </TD>
						</TR>
					  </TBODY>
					 </TABLE>
					</TD>
				</TR>
				<TR>
					<TD background=images/middle-shu.gif height=12></TD>
				</TR>
			</TBODY>
		 </TABLE>
	  </TD>
		<TD width=3 background=images/bian3.gif></TD>
	</TR>
   </TBODY>
  </TABLE>
  	<!--��վ�ϲ���Ϣ������!-->
	<!--��վ�в���Ϣ����ʼ!-->
	<!-- ������Ϣ����ʼ -->
  <TABLE cellSpacing=0 cellPadding=0 width=770 align=center border=0>
    <TBODY>
      <TR>
        <TD width=3 background=images/bian.gif></TD>
		<TD>
		  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
            <TBODY>
              <TR>
                <TD width=6 background=images/left-shu.gif rowSpan=2></TD>
                <TD>
				  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
				    <TBODY>
					  <TR vAlign=top>
						<TD width=240 bgColor=#7c0000>
						  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
							<TBODY>
							<TR>
							  <TD>
								<TABLE cellSpacing=0 cellPadding=0 width=114 border=0>
								  <TBODY>
								  <TR>
									<TD width=114 background=images/red-l.gif 
									height=17>
									  <DIV align=right><FONT color=#cccccc>�����Ƽ�&nbsp;&nbsp;</FONT></DIV>
									</TD>
								  </TR>
								  </TBODY>
								 </TABLE>
							   </TD>
							  </TR>
							<jsp:include page="/board/cuemusic.jsp" />
						  </TBODY>
						 </TABLE>
						</TD>
						<TD width=8 background=images/middle-hen.gif></TD>
							<TD width=240 bgColor=#7c0000>
							  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
								<TBODY>
								<TR>
								  <TD>
									<TABLE cellSpacing=0 cellPadding=0 width=114 border=0>
									  <TBODY>
									  <TR>
										<TD width=114 background=images/red-l.gif 
										height=17>
										  <DIV align=right><FONT color=#cccccc>���¼���&nbsp;&nbsp;</FONT>
										  </DIV>
										</TD>
								      </TR>
									  </TBODY>
							        </TABLE>
								  </TD>
								</TR>
								<jsp:include page="/board/cuemusic.jsp" />
								  </TD>
								</TR>
							  </TBODY>
							</TABLE>
					      </TD>
						  <TD width=8 background=images/middle-hen.gif>&nbsp;</TD>
						  <TD width=240 bgColor=#7c0000>
						    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
							  <TBODY>
							  <TR>
							    <TD>
								  <TABLE cellSpacing=0 cellPadding=0 width=114 border=0>
								    <TBODY>
								    <TR>
									  <TD width=114 background=images/red-l.gif height=17>
									  <DIV align=right><FONT color=#cccccc>���������&nbsp;</FONT></DIV>
									  </TD>
									</TR>
									</TBODY>
								  </TABLE>
								</TD>
							  </TR>
							  <TR>
							    
							    <jsp:include page="/board/cuemusic.jsp" />
						
						      </TR>
							</TBODY>
						  </TABLE>
						</TD>
					  </TR>
					</TBODY>
			      </TABLE>
				</TD>
			    <TD width=6 background=images/right-shu.gif rowSpan=2></TD>
			  </TR>
			  <TR>
			     <TD background=images/middle-shu.gif height=12></TD>
			  </TR>
		  </TBODY>
		</TABLE>
	  </TD>
	  <TD width=3 background=images/bian3.gif></TD>
	</TR>
  </TBODY>
</TABLE>
<!-- ������Ϣ������ -->
<!-- �в���Ϣ������ -->
<!-- ��½ע������ʼ -->
<TABLE cellSpacing=0 cellPadding=0 width=770 align=center border=0>
  <TBODY>
	<TR>
	  <TD width=3 background=images/bian.gif></TD>
		<TD>
		  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
			<TBODY>
			<TR>
			  <TD width=6 background=images/left-shu.gif rowSpan=2></TD>
			  <TD>
				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
				  <TBODY>
				  <TR vAlign=top>
					<TD width=245 bgColor=#41758d>
					  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
						<TBODY>
						<TR>
						  <TD>
							<TABLE cellSpacing=0 cellPadding=0 width=114 border=0>
							  <TBODY>
							  <TR>
							    <TD width=114 background=images/blue-l.gif height=17> 
								<div align="right"><FONT color=#000000>�û�����</FONT>
								  <FONT color=#cccccc>&nbsp;&nbsp;</FONT>
								</div>
								</TD>
							  </TR>
							  </TBODY>
							</TABLE>
					      </TD>
						</TR>
						<TR>
						  <TD height=60>
						  <%
						  	username = (String)session.getAttribute("username");
							if(username==null||"".equals(username)){
						  %>
						   <SCRIPT Language = "Javascript">
								 //����ĸ�����ִ�����ϼ�� 
								 function isValid()
								  {	
								  	if(loginform.username.value == "")
								  	{	
								  		window.alert("����������ʺŵ�����!"); 
										loginform.username.focus();
								  		return false;
								  	}
								  	if(loginform.password.value == "")
								  	{
								  		window.alert("������������������!");
								  		loginform.password.focus();
								  		return false;  //�뿪����
								  	}
								  	loginform.submit(); //�ͳ����е�����
								 }
							</SCRIPT>		
						  <FORM style="MARGIN-TOP: 1px; MARGIN-BOTTOM: 1px" name=loginform 
							action="<%=request.getContextPath()%>/Login?action=attempt" method=post
							onSubmit="return isValid(this);">
							  <TABLE cellSpacing=5 cellPadding=0 width="100%" border=0>
								<TBODY>
								  <TR>
									<TD vAlign=bottom width="68%" height=22>
									  <DIV align=center>
									    <p><FONT color=#f8d49f>�û���:</FONT> 
										  <INPUT class=forms 
										  style="BORDER-LEFT-COLOR: #41758d; BORDER-BOTTOM-COLOR: #f8d49f; BORDER-TOP-STYLE: solid; BORDER-TOP-COLOR: #41758d; BORDER-RIGHT-STYLE: solid; BORDER-LEFT-STYLE: solid; BACKGROUND-COLOR: #41758d; BORDER-RIGHT-COLOR: #41758d; BORDER-BOTTOM-STYLE: solid" 
										  maxLength=30 name=username>
										  <BR>
										  <FONT color=#f8d49f>�� &nbsp;��:</FONT> 
										  <INPUT class=forms 
										  style="BORDER-LEFT-COLOR: #41758d; BORDER-BOTTOM-COLOR: #f8d49f; BORDER-TOP-STYLE: solid; BORDER-TOP-COLOR: #41758d; BORDER-RIGHT-STYLE: solid; BORDER-LEFT-STYLE: solid; BACKGROUND-COLOR: #41758d; BORDER-RIGHT-COLOR: #41758d; BORDER-BOTTOM-STYLE: solid" 
										  type=password maxLength=30 name=password>
										  <BR>
                                          <FONT color=#f8d49f>��֤��:</FONT> 
                                          <INPUT class=forms 
										  style="BORDER-LEFT-COLOR: #41758d; BORDER-BOTTOM-COLOR: #f8d49f; BORDER-TOP-STYLE: solid; BORDER-TOP-COLOR: #41758d; BORDER-RIGHT-STYLE: solid; BORDER-LEFT-STYLE: solid; BACKGROUND-COLOR: #41758d; BORDER-RIGHT-COLOR: #41758d; BORDER-BOTTOM-STYLE: solid" 
										  type=text maxLength=4 name=validatecode>
                                          <BR>
                                          <INPUT type=image height=22 width=58 
										  src="images/logon.gif" align=middle name=image>
                                          <A href="<%=request.getContextPath()%>/Register?action=confirm">
										  <IMG height=22 src="images/register.gif" width=58 align=middle border=0>
										  </A>
										 </p>
                                       </DIV>
									 </TD>
								   </TR>
								 </TBODY>
							   </TABLE>
							 </FORM>
							 <% }else{%>
							 <FORM style="MARGIN-TOP: 1px; MARGIN-BOTTOM: 1px" name=logon 
							action= method=post target=_blank>
							  <TABLE cellSpacing=5 cellPadding=0 width="100%" border=0>
								<TBODY>
								  <TR>
									<TD vAlign=bottom width="68%" height=22>
									  <DIV align=center>
									    <p>
                                          <BR>
                                          <a href="<%= request.getContextPath() %>/Login?action=logout">
                                          <image height=22 width=58 
										  src="images/logout.jpg" align=middle name=image border=0>
										  </a>
                                          <A href="<%=request.getContextPath()%>/Register?action=confirm">
										  <IMG height=22 src="images/register.gif" width=58 align=middle border=0>
										  </A>
										  <A href="<%=request.getContextPath()%>/admin/login.jsp">
										  <IMG height=22 src="images/manage.jpg" width=58 align=middle border=0>
										  </A>
										 </p>
                                       </DIV>
									 </TD>
								   </TR>
								 </TBODY>
							   </TABLE>
							 </FORM>
							 <%}%>
						   </TD>
						 </TR>
					   </TBODY>
					 </TABLE>
					 <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
					   <TBODY>
					   <TR>
					     <TD>
						   <TABLE cellSpacing=0 cellPadding=0 width=114 border=0>
							 <TBODY>
							 <TR>
							   <TD vAlign=bottom width=114 background=images/blue-l.gif height=17>
								  <DIV align=right><FONT color=#000000>��վ��Ϣ</FONT></DIV>
							   </TD>
							 </TR>
						     </TBODY>
						   </TABLE>
						 </TD>
					   </TR>
					   <TR>
						 <TD align=center height=60>
	
						 </TD>
					   </TR>
					   </TBODY>
					 </TABLE>
				   </TD>
				   <TD width=8 background=images/middle-hen.gif></TD>
				   <TD bgColor=#41758d>
				     <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                       <TBODY>
                       <TR>
                         <TD colSpan=2><IMG height=28 src="images/bbs.gif" width=392></TD>
					   </TR>
					   <TR>
					
                         <TD vAlign=top width="98%"><jsp:include page="/board/cuemsg.jsp" /></TD>
                       </TR>
					   </TBODY>
					 </TABLE>
				   </TD>
				 </TR>
				 </TBODY>
			   </TABLE>
			 </TD>
			 <TD width=6 background=images/right-shu.gif rowSpan=2></TD>
		   </TR>
		   <TR>
			 <TD background=images/middle-shu.gif height=12></TD>
	       </TR>
	       </TBODY>
		 </TABLE>
	</TD>
    <TD width=3 background=images/bian3.gif></TD>
  </TR>
  </TBODY>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=770 align=center border=0>
  <TBODY>
  <TR>
    <TD width=3 background=images/bian.gif></TD>
    <TD width=764 background=images/botton.gif height=7></TD>
    <TD width=3 background=images/bian3.gif></TD>
  </TR>
  </TBODY>
</TABLE>
<jsp:include page="/inc/footer.jsp"></jsp:include>

