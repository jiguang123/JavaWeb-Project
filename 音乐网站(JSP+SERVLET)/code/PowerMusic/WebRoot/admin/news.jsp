<%@ page language="java" contentType="text/html;charset=gbk"%>
<%@ include file="/inc/top.jsp"%>
<%@ page import="java.io.*"%>
<%@ page import="model.NewsModel"%>
<%@ page import="java.util.*"%>
<%@ page import="control.bean.ManageNews"%>
<jsp:useBean id="managenews" class="control.bean.ManageNews" scope="page"></jsp:useBean>
<jsp:useBean id="nmodel" class="model.NewsModel" scope="page"></jsp:useBean>
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
	int showstate = 0;
	int updatestate = 0;
	int searchstate = 0;
	int totalpages;
    int countperpage=5; 
    int totalcount;
    int currentpage=0;
    int pagecode = 1;
    Vector newsvector;
%>
<%--����ҳ�� --%>
<%
 	totalcount = managenews.getTotalrow();
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
	newsvector = managenews.displayQuery(5,currentpage,"* from NewsInfo order by NewsID","NewsID");
%>
<script language="JavaScript" >
	function page_check()
	{
		if(document.newspage.page.value=="")
		{
			alert("������ҳ��");
			document.newspage.page.focus();
			return false;
		}
		return true;
	}
</script>
<%--�������� --%>
<%
	String update = request.getParameter("action");
	int newsid = 0;
	if("update".equals(update)){
		if(request.getParameter("newsid")!=null)
		newsid = Integer.parseInt(request.getParameter("newsid"));
		String modnewstitle = request.getParameter("modnewstitle");
		String modnewsarea = request.getParameter("modnewsarea");
		int rowaffect = managenews.updateNews(newsid,modnewstitle,modnewsarea);
		if(rowaffect>0){
		%>
		<script language="JavaScript">
			alert("�޸ĳɹ�");
			window.location = "news.jsp";
		</script>
<%}else{%>
	<script language="JavaScript">
		alert("�޸�ʧ��");
		window.location = "news.jsp";
	</script>
<%}}%>
<%
	String addnews = request.getParameter("action");
	if("add".equals(addnews)){
		String addadminname = (String)session.getAttribute("adminname");
		String addnewstitle = request.getParameter("addnewstitle");
		String addnewsarea = request.getParameter("addnewsarea");
		int rowaffect = managenews.addNews(addnewstitle,adminname,addnewsarea);
		if(rowaffect>0){
		%>
		<script language="JavaScript">
			alert("��ӳɹ�");
			window.location = "news.jsp";
		</script>
<%}else{%>
	<script language="JavaScript">
		alert("���ʧ��");
		window.location = "news.jsp";
	</script><%}}%>
<%
	if(request.getParameter("action")!=null||request.getParameter("state")!=null)
	showstate=1;
%>
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
                          <p><font color="#FFFFFF" size="3">��̨����-���Ź���</font></p>
                          </div></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD width="62%" height="220">
                      <table width="283" height="266" align="left">
                          <tr>
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
                            <td width="30%"><a href="<%=request.getContextPath()%>/admin/news.jsp?state=1">�������</a></td>
                            <td width="28%"><a href="<%=request.getContextPath()%>/admin/index.jsp">������ҳ</a></td>
                          </tr>
                        </table>
                        <% if(showstate==0){%>
                        <table width="450" border="0" cellpadding="3" cellspacing="1" bgcolor="#ffffff">
						  <tr bgcolor="#cccccc">
							<td width="32%" align="center" nowrap><b>����</b></td>
							<td align="center" nowrap width="34%"><b>��������</b></td>
							<td align="center" nowrap width="34%"><b>������</b></td>
						  </tr>
						  <% 
						  	for(int i=0;i<newsvector.size();i++){
						  		nmodel.setNewsID(((NewsModel)newsvector.get(i)).getNewsID());
						    	nmodel.setNewsTitle(((NewsModel)newsvector.get(i)).getNewsTitle());
						    	nmodel.setPromulgator(((NewsModel)newsvector.get(i)).getPromulgator());
						    	nmodel.setSubmitime(((NewsModel)newsvector.get(i)).getSubmitime());
						 %><TR bgcolor="#6600CC">
						 	   <td align="center" nowrap width="32%">
						       <a href="news.jsp?action=modify&newsid=<%=nmodel.getNewsID()%>&position=<%=i%>">
						       <%=nmodel.getNewsTitle()%></a></td>
						       <td width="34%" align="center" nowrap><%=nmodel.getSubmitime()%></td>
						       <td align="center" nowrap width="34%"><%=nmodel.getPromulgator()%></td>
						   </TR>
						  	<%}%>
						 </table>
						 <FORM name="newspage" method="post" onSubmit="return page_check();"action="news.jsp">
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
						<%}else{%>
                        <%--��ʾ���鿴���µ��������� --%>
                        <%	
     						String modify = request.getParameter("action");
     						int position =0;
     						if(request.getParameter("newsid")!=null)
     						{
     							if(request.getParameter("position")!=null)
     							 position = Integer.parseInt(request.getParameter("position"));
     						}
     						if("modify".equals(modify)){
     							nmodel.setNewsID(((NewsModel)newsvector.get(position)).getNewsID());
						    	nmodel.setNewsTitle(((NewsModel)newsvector.get(position)).getNewsTitle());
						    	nmodel.setPromulgator(((NewsModel)newsvector.get(position)).getPromulgator());
						    	nmodel.setSubmitime(((NewsModel)newsvector.get(position)).getSubmitime());
						    	nmodel.setNewsContent(((NewsModel)newsvector.get(position)).getNewsContent());
     					%>
     					<FORM action="news.jsp?action=update&newsid=<%=nmodel.getNewsID()%>" method=post>
     					 <table width="550" height="175" border="0" align=center>
                            <tr align="center"> 
                              <td colspan="3"><b>�޸�����</b></td>
                          </tr>
                          <tr> 
                              <td width="19%" align="right"><strong>���ű���</strong></td>
                            <td width="81%" colspan="3" align="left">
                             <input type="text" name="modnewstitle" value="<%=nmodel.getNewsTitle()%>">
                             </td>
                          </tr>
                          <tr align="center"> 
                            <td colspan="3"><strong>��������</strong></td>
                          </tr>
                          <tr align="left"> 
                            <td height="41" colspan="3"> 
                            <textarea name="modnewsarea" rows="8" cols="50" wrap="soft"><%=nmodel.getNewsContent()%></textarea> 
                            </td>
                          </tr>
                          <tr align="center"> 
                            <td align="right" width="37%"> 
                              <input type="submit" value="�ύ">
                            </td>
                            <td align="left"> 
                              <input type="reset">
                            </td>
                          </tr>
                        </table>
                        </FORM>
     					 <%}showstate=0;}%>
					    
						 <!-- ������ſ�ʼ!-->
						 <%
						 	String state = request.getParameter("state");
						 	if("1".equals(state)){
						 %>
						 <FORM action="news.jsp?action=add" method=post>
                        <table width="550" height="175" border="0">
                          <tr align="center"> 
                            <td colspan="2"><b>�������</b></td>
                          </tr>
                          <tr> 
                            <td align="center"><strong>���ű���</strong></td>
                            <td colspan="2" align="left"> <input type="text" name="addnewstitle"></td>
                          </tr>
                          <tr align="center"> 
                            <td><strong>��������</strong></td>
                          </tr>
                          <tr align="left"> 
                            <td height="41" colspan="3">
							 <textarea  name="addnewsarea" rows="8" cols="50"></textarea> 
                            </td>
                          </tr>
                          <tr align="center"> 
                            <td align="right" width="39%"> 
                              <input type="submit" value="�ύ">
                            </td>
                            <td align="left"> 
                              <input type="reset">
                            </td>
                          </tr>
                        </table>
                        </FORM>
                        <%}%>
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