<%@ page language="java" contentType="text/html;charset=gbk"%>
<jsp:include page="/inc/top.jsp"></jsp:include>
<%@ page import="java.io.*"%>
<%@ page import="model.MusicModel"%>
<%@ page import="java.util.*"%>
<%@ page import="control.bean.ManageMusic"%>
<jsp:useBean id="managemusic" class="control.bean.ManageMusic" scope="page"></jsp:useBean>
<jsp:useBean id="mmodel" class="model.MusicModel" scope="page"></jsp:useBean>
<!--��������!-->
<%
	String adminname = (String)session.getAttribute("adminname");
	if(adminname==null){
%>
	<script language="JavaScript">
		alert("���ȵ�½");
	</script>
<%
	response.sendRedirect(request.getContextPath()+"/index.jsp");
}%>
<%!
	int updatestate = 0;
	int searchstate = 0;
	int totalpages;
    int countperpage=5; 
    int totalcount;
    int currentpage=0;
    int pagecode = 1;
    Vector musicvector;
%>
<%--����ҳ�� --%>
<%
 	totalcount = managemusic.getTotalrow();
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
	musicvector = managemusic.displayQuery(5,currentpage,"* from MusicInfo order by MusicID","MusicID");
%>
<script language="JavaScript" >
	function page_check()
	{
		if(document.musicpage.page.value=="")
		{
			alert("������ҳ��");
			document.musicpage.page.focus();
			return false;
		}
		return true;
	}
</script>
<%--���¸��� --%>
<%
	String update = request.getParameter("action");
	int musicid = 0;
	if("update".equals(update)){
		if(request.getParameter("musicid")!=null)
		musicid = Integer.parseInt(request.getParameter("musicid"));
		String modmusicname = request.getParameter("modmusicname");
		String modmusictype = request.getParameter("modmusictype");
		String modsingername = request.getParameter("modsingername");
		int rowaffect = managemusic.updateMusic(musicid,modmusicname,modmusictype,modsingername);
		if(rowaffect>0){
		%>
		<script language="JavaScript">
			alert("�޸ĳɹ�");
			window.location = "music.jsp";
		</script>
<%}else{%>
	<script language="JavaScript">
		alert("�޸�ʧ��");
		window.location = "music.jsp";
	</script>
<%}}%>
<%
	String delete = request.getParameter("action");
	if("delete".equals(delete)){
		if(request.getParameter("musicid")!=null)
			musicid = Integer.parseInt(request.getParameter("musicid"));
			int rowaffect = managemusic.deleteMusic(musicid);
			if(rowaffect>0){
			%>
		<script language="JavaScript">
			alert("ɾ���ɹ�");
			window.location = "music.jsp";
		</script>
<%}else{%>
	<script language="JavaScript">
		alert("ɾ��ʧ��");
		window.location = "music.jsp";
	</script>
<%}}%>
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
                          <p><font color="#FFFFFF" size="3">��̨����--��������</font></p>
                          </div></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD width="62%" height="220">
                      <table width="196" height="245" align="left">
						  <tr>
                            <p></p>
                            <td width="188" height="50"><a href="<%=request.getContextPath()%>/Login?action=logout">ע��</a></td>
                          </tr>
						  <tr>
                            <td height="50"><a href="<%=request.getContextPath()%>/admin/user.jsp">�����û�</a></td>
                          </tr>
                          <tr>
						  <tr>
                            <td height="50"><a href="news.jsp">��������</a></td>
                          </tr>
						  <tr>
                            <td height="50"><a href="music.jsp">�������</a></td>
                          </tr><tr>
                            <td height="50"><a href="guestbook.jsp">��������</a></td>
                          </tr>
                        </table> 
                        <table width="40%" height="23" border="0" align="center">
                          <tr> 
                            <td width="42%"><a href="<%=request.getContextPath()%>/admin/user.jsp">�û�����</a></td>
                            <td width="30%"><a href="<%=request.getContextPath()%>/admin/music.jsp">��������</a></td>
                            <td width="28%"><a href="<%=request.getContextPath()%>/admin/index.jsp">������ҳ</a></td>
                          </tr>
                        </table>
					    <table width="550" border="0" cellpadding="3" cellspacing="1" bgcolor="#ffffff">
						  <tr bgcolor="#cccccc">
							<td align="center" nowrap width="25%"><b>��������</b></td>
							<td align="center" nowrap width="22%"><b>��������</b></td>
							<td align="center" nowrap width="21%"><b>�ϴ�ʱ��</b></td>
							<td align="center" nowrap width="15%"><b>����</b></td>
							<td align="center" nowrap width="17%"><b>����</b></td>
						  </tr>
						  <% 
						  	for(int i=0;i<musicvector.size();i++){
						  		mmodel.setMusicid(((MusicModel)musicvector.get(i)).getMusicid());
						    	mmodel.setMusicName(((MusicModel)musicvector.get(i)).getMusicName());
						    	mmodel.setSingerName(((MusicModel)musicvector.get(i)).getSingerName());
						    	mmodel.setSubmitime(((MusicModel)musicvector.get(i)).getSubmitime());
						    	mmodel.setMusicType(((MusicModel)musicvector.get(i)).getMusicType());
						 %><TR bgcolor="#6600CC">
						 	   <td align="center" nowrap width="25%">
						       <a href="music.jsp?action=modify&musicid=<%=mmodel.getMusicid()%>&position=<%=i%>">
						       <%=mmodel.getMusicName()%></a></td>
						       <td width="22%" align="center" nowrap><%=mmodel.getSingerName()%></td>
						       <td align="center" nowrap width="21%"><%=mmodel.getSubmitime()%></td>
						       <td align="center" nowrap width="15%"><%=mmodel.getMusicType()%></td>
						       <td align="center" nowrap width="17%">
						       <a href="music.jsp?action=delete&musicid=<%=mmodel.getMusicid()%>">ɾ��</a>
						       </td>
						   </TR>
						  	<%}%>
						 </table>
						 <FORM name="musicpage" method="post" onSubmit="return page_check();"action="music.jsp">
						<TABLE width="36%">
						<tr>
						<td >����<%out.print(totalpages);%>ҳ,�����ǵ�<%out.print(currentpage);%>ҳ</td>
						</tr>
						<tr>
						<td>
						<a href="<%=request.getContextPath()%>/admin/news.jsp?page=<%=currentpage-1%>">��һҳ</a>
						<a href="<%=request.getContextPath()%>/admin/news.jsp?page=<%=currentpage+1%>">��һҳ </a>
						<a href="<%=request.getContextPath()%>/admin/news.jsp?page=1">��ҳ </a>
						<a href="<%=request.getContextPath()%>/admin/news.jsp?page=<%=totalpages%>">βҳ </a>
						<input name="page" type="text" size="5">ҳ<input type="submit" value="Go">
						</td>
						</tr>
						</TABLE>
						</FORM>
						 <%--��ʾ���޸Ļ�Ա������ --%>
     					<%	
     						String modify = request.getParameter("action");
     						int position =0;
     						if(request.getParameter("musicid")!=null)
     						{
     							if(request.getParameter("position")!=null)
     							 position = Integer.parseInt(request.getParameter("position"));
     						}
     						if("modify".equals(modify)){
     							mmodel.setMusicid(((MusicModel)musicvector.get(position)).getMusicid());
						    	mmodel.setMusicName(((MusicModel)musicvector.get(position)).getMusicName());
						    	mmodel.setSingerName(((MusicModel)musicvector.get(position)).getSingerName());
						    	mmodel.setMusicType(((MusicModel)musicvector.get(position)).getMusicType());
						    	mmodel.setSubmitime(((MusicModel)musicvector.get(position)).getSubmitime());
     					%>
     					<FORM name="upmusicform" action="music.jsp?action=update&musicid=<%=mmodel.getMusicid()%>" method="post">
     						<TABLE width="40%" border="0" align=center>
     						<TR>
     						<TD width=24%>������</TD>
     						<TD width=76%><input type=text name="modmusicname" value="<%=mmodel.getMusicName()%>"></TD>
     						</TR>
     						<TR>
     						<TD width=24%>����</TD>
     						<TD width=76%><input type=text name="modsingername" value="<%=mmodel.getSingerName()%>"></TD>
     						</TR>
     						<TR>
     						<TD width=24%>��������</TD>
     						<TD width=76%><input type=text name="modmusictype" value="<%=mmodel.getMusicType()%>"></TD>
     						</TR>
     						<TR>
     						<TD width=24%><input type=submit value="�޸�"></TD>
     						<TD width=76%><input type=reset></TD>
     						</TR>
     						</TABLE>
     						</FORM>
     					<%}%>
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
	  </TD>
		<TD width=3 background=images/bian3.gif></TD>
	</TR>
   </TBODY>
  </TABLE>
  
<jsp:include page="/inc/footer.jsp"></jsp:include>