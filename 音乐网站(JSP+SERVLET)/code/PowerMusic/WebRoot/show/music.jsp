<%@ page language="java" contentType="text/html;charset=gbk"%>
<jsp:include page="/inc/top.jsp"></jsp:include>
<%@ page import="java.io.*"%>
<%@ page import="model.MusicModel"%>
<%@ page import="java.util.*"%>
<%@ page import="control.bean.ManageMusic"%>
<jsp:useBean id="showmusic" class="control.bean.ManageMusic" scope="page"></jsp:useBean>
<jsp:useBean id="mmodel" class="model.MusicModel" scope="page"></jsp:useBean>
<!--��������!-->

<%!
	int searchstate = 0;
	int totalpages;
    int countperpage=5; 
    int totalcount;
    int currentpage=0;
    int pagecode = 1;
    int playstate = 0;
    Vector musicvector;
%>
<%--����ҳ�� --%>
<%
 	totalcount = showmusic.getTotalrow();
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
	musicvector = showmusic.displayQuery(10,currentpage,"* from MusicInfo order by MusicID","MusicID");
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

<%
	if(request.getParameter("action")!=null)
		playstate=1;
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
									<p><a href="<%=request.getContextPath()%>/index.jsp">
									<FONT color="#ffffff">��������<FONT color="#000000"
										style="BACKGROUND-COLOR: #ffffff"></FONT></FONT>
										</a></p></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD height="8" bgcolor="#000000"> 
                        <div align="center">
                          <p><font color="#FFFFFF" size="3">��������</font></p>
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
                    <% if(playstate==0){%>
					<table width="550" border="0" cellpadding="3" cellspacing="1" bgcolor="#ffffff" align=center>
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
						 	   <td align="center" nowrap width="25%"><%=mmodel.getMusicName()%></td>
						       <td width="22%" align="center" nowrap><%=mmodel.getSingerName()%></td>
						       <td align="center" nowrap width="21%"><%=mmodel.getSubmitime()%></td>
						       <td align="center" nowrap width="15%"><%=mmodel.getMusicType()%></td>
						       <td align="center" nowrap width="17%">
						  <a href="music.jsp?action=audition&musicname=<%=mmodel.getMusicName()%>&musictype=<%=mmodel.getMusicType()%>&singername=<%=mmodel.getSingerName()%>">
						       Go</a>
						       </td>
						   </TR>
						  	<%}%>
						 </table>
						 <FORM name="musicpage" method="post" onSubmit="return page_check();"action="music.jsp">
						<TABLE align = right width="36%">
						<tr>
						<td >����<%out.print(totalpages);%>ҳ,�����ǵ�<%out.print(currentpage);%>ҳ</td>
						</tr>
						<tr>
						<td>
						<a href="<%=request.getContextPath()%>/show/music.jsp?page=<%=currentpage-1%>">��һҳ</a>
						<a href="<%=request.getContextPath()%>/show/music.jsp?page=<%=currentpage+1%>">��һҳ </a>
						<a href="<%=request.getContextPath()%>/show/music.jsp?page=1">��ҳ </a>
						<a href="<%=request.getContextPath()%>/show/music.jsp?page=<%=totalpages%>">βҳ </a>
						<input name="page" type="text" size="5">ҳ<input type="submit" value="Go">
						</td>
						</tr>
						</TABLE>
						</FORM>
						<%}else{%>
                   	 <%
                    	String action = request.getParameter("action");
						//String realpath = new File(request.getSession().getServletContext().getRealPath(request.getContextPath())).getParent();
						String realpath = request.getContextPath();
						String musicroot = realpath+"/Upload/";
						String musicname = "";
						String musictype = "";
						String singername = "";
						if("audition".equals(action)){
							if(session.getAttribute("username")==null){
						%>
							<script language="JavaScript">
								alert("���ȵ�½");
								window.location = "<%=request.getContextPath()%>/index.jsp";
							</script>
						<%}
							if(request.getParameter("musicname")!=null){
								musicname = request.getParameter("musicname");
								musictype = request.getParameter("musictype");
								singername = request.getParameter("singername");
						}%>
					 <table border=0 align=center>
					  <tr>
					    <td><object id="player" height="240" width="320" classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6">
					    <param NAME="AutoStart" VALUE="-1">
					    <!--�Ƿ��Զ�����-->
					    <param NAME="Balance" VALUE="0">
					    <!--������������ƽ��,ͬ����ɲ���������-->
					    <param name="enabled" value="-1">
					    <!--�������Ƿ����Ϊ����-->
					    <param NAME="EnableContextMenu" VALUE="-1">
					    <!--�Ƿ����������Ĳ˵�-->
					    <param NAME="url" value="<%=(musicroot+singername+musicname+"."+musictype)%>">
					    <!--���ŵ��ļ���ַ-->
					    <param NAME="PlayCount" VALUE="1">
					    <!--���Ŵ�������,Ϊ����-->
					    <param name="rate" value="1">
					    <!--�������ʿ���,1Ϊ����,����С��,1.0-2.0-->
					    <param name="currentPosition" value="0">
					    <!--�ؼ�����:��ǰλ��-->
					    <param name="currentMarker" value="0">
					    <!--�ؼ�����:��ǰ���-->
					    <param name="defaultFrame" value="">
					    <!--��ʾĬ�Ͽ��-->
					    <param name="invokeURLs" value="0">
					    <!--�ű���������:�Ƿ����URL-->
					    <param name="baseURL" value="">
					    <!--�ű���������:�����õ�URL-->
					    <param name="stretchToFit" value="0">
					    <!--�Ƿ񰴱�����չ-->
					    <param name="volume" value="500">
					    <!--Ĭ��������С0%-100%,50��Ϊ50%-->
					    <param name="mute" value="0">
					    <!--�Ƿ���-->
					    <param name="uiMode" value="Full">
					    <!--��������ʾģʽ:Full��ʾȫ��;mini���;None����ʾ���ſ���,ֻ��ʾ��Ƶ����;invisibleȫ������ʾ-->
					    <param name="windowlessVideo" value="0">
					    <!--�����0��������ȫ��,����ֻ���ڴ����в鿴-->
					    <param name="fullScreen" value="0">
					    <!--��ʼ�����Ƿ��Զ�ȫ��-->
					    <param name="enableErrorDialogs" value="-1">
					    <!--�Ƿ����ô�����ʾ����-->
					    <param name="SAMIStyle" value>
					    <!--SAMI��ʽ-->
					    <param name="SAMILang" value>
					    <!--SAMI����-->
					    <param name="SAMIFilename" value>
					    <!--��ĻID-->
					</object></td>
					  </tr>
					</table>
					<%}playstate=0;}%>
					
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


  