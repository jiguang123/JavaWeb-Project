<%@ page language="java" contentType="text/html;charset=gbk"%>
<jsp:include page="/inc/top.jsp"></jsp:include>
<%@ page import="java.io.*"%>
<%@ page import="model.NewsModel"%>
<%@ page import="java.util.*"%>
<%@ page import="control.bean.ManageNews"%>
<jsp:useBean id="shownews" class="control.bean.ManageNews" scope="page"></jsp:useBean>
<jsp:useBean id="nmodel" class="model.NewsModel" scope="page"></jsp:useBean>
<!--��������!-->

<%!
	int showstate = 0;
	int totalpages;
    int countperpage=5; 
    int totalcount;
    int currentpage=0;
    int pagecode = 1;
    int playstate = 0;
    Vector newsvector;
%>
<%--����ҳ�� --%>
<%
 	totalcount = shownews.getTotalrow();
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
	newsvector = shownews.displayQuery(10,currentpage,"* from NewsInfo order by NewsID","NewsID");
%>
<%
	if(request.getParameter("action")!=null)
	showstate=1;
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
									<p><a href="<%=request.getContextPath()%>/index.jsp">
									<FONT color="#ffffff">��������<FONT color="#000000"
										style="BACKGROUND-COLOR: #ffffff"></FONT></FONT>
										</a></p></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD height="8" bgcolor="#000000"> 
                        <div align="center">
                          <p><font color="#FFFFFF" size="3">�鿴����</font></p>
                          </div></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD width="62%" height="220">
                        <P>&nbsp;</P>
					<table width="40%" height="23" border="0" align="center">
                       <tr> 
                          <td width="42%"><a href="<%=request.getContextPath()%>/PostFile?action=open">�ϴ��ļ�</a></td>
                          <td width="30%"><a href="<%=request.getContextPath()%>/show/music.jsp">�����б�</a></td>
                          <td width="28%"><a href="<%=request.getContextPath()%>/show/news.jsp">�����б�</a></td>
                       </tr>
                    </table>
                    <% if(showstate==0){%>
					<table width="450" border="0" cellpadding="3" cellspacing="1" bgcolor="#ffffff" align="center">
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
						       <a href="news.jsp?action=show&newsid=<%=nmodel.getNewsID()%>&position=<%=i%>">
						       <%=nmodel.getNewsTitle()%></a></td>
						       <td width="34%" align="center" nowrap><%=nmodel.getSubmitime()%></td>
						       <td align="center" nowrap width="34%"><%=nmodel.getPromulgator()%></td>
						   </TR>
						  	<%}%>
						 </table>
						 <FORM name="newspage" method="post" onSubmit="return page_check();"action="news.jsp">
						<TABLE width="36%" align=right>
						<tr>
						<td >����<%out.print(totalpages);%>ҳ,�����ǵ�<%out.print(currentpage);%>ҳ</td>
						</tr>
						<tr>
						<td>
						<a href="<%=request.getContextPath()%>/show/news.jsp?page=<%=currentpage-1%>">��һҳ</a>
						<a href="<%=request.getContextPath()%>/show/news.jsp?page=<%=currentpage+1%>">��һҳ </a>
						<a href="<%=request.getContextPath()%>/show/news.jsp?page=1">��ҳ </a>
						<a href="<%=request.getContextPath()%>/show/news.jsp?page=<%=totalpages%>">βҳ </a>
						<input name="page" type="text" size="5">ҳ<input type="submit" value="Go">
						</td>
						</tr>
						</TABLE>
						</FORM>
						<%}else{%>
						<%--��ʾ���鿴���������� --%>
                        <%	
     						String show = request.getParameter("action");
     						int position =0;
     						if(request.getParameter("newsid")!=null)
     						{
     							if(request.getParameter("position")!=null)
     							 position = Integer.parseInt(request.getParameter("position"));
     						}
     						if("show".equals(show)){
     							nmodel.setNewsID(((NewsModel)newsvector.get(position)).getNewsID());
						    	nmodel.setNewsTitle(((NewsModel)newsvector.get(position)).getNewsTitle());
						    	nmodel.setPromulgator(((NewsModel)newsvector.get(position)).getPromulgator());
						    	nmodel.setSubmitime(((NewsModel)newsvector.get(position)).getSubmitime());
						    	nmodel.setNewsContent(((NewsModel)newsvector.get(position)).getNewsContent());
     					%>
     					
     					 <table width="550" height="175" border="0" align=center>
                            <tr align="center"> 
                              <td colspan="3"><font color="#990066"><b>���� : <%=nmodel.getNewsTitle()%></b></font></td>
                          </tr>
                          <tr> 
                              
                            <td width="192" align="center"><strong>������ : <%=nmodel.getPromulgator()%></strong></td>
                            <td width="348"  align="center">����ʱ��: <%=nmodel.getSubmitime()%></td>
                          </tr>
                          <tr align="center"> 
                            <td colspan="3"><font color="#FFFF99"><%=nmodel.getNewsContent()%></font></TD>
                          </tr>
                        </table>
               		 <%}showstate=0;}%>
                        <P>&nbsp;</P>
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
  
<jsp:include page="inc/footer.jsp"></jsp:include>

