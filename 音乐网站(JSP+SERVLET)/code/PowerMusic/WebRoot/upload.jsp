<!--�ϴ��ļ�ҳ��!-->
<%@ page language="java" contentType="text/html; charset=gbk"%>
<jsp:include page="inc/top.jsp"></jsp:include>
<%
	if(session.getAttribute("username")==null){
%>
	<script language="JavaScript">
		alert("���ȵ�½");
	</script>
<%
	response.sendRedirect(request.getContextPath()+"/index.jsp");
}%>
<!--��������!-->
<p>
<table border=0 width=20%>
  <tr>
    <td align=right><a href="index.jsp">��ҳ</a></td>
    <td align=center><a href="<%=request.getContextPath()%>/show/music.jsp">��������</a></td>
  </tr>
</table>
</p>
<%
		String upstate = (String)request.getAttribute("upstate");
		if("open".equals(upstate)){
	%>
<div align="left"></div>
<p align="center">�ϴ��ļ�ѡ��</p>
<%
	}if("upsucessed".equals(upstate)){
%>
		<p align="center">�ϴ��ɹ�</p>
		<p align="center">����Լ����ϴ�</p>
<%}%>
<FORM ACTION="<%=request.getContextPath()%>/PostFile?action=upfile" METHOD="POST" 
	ENCTYPE="multipart/form-data" name="upform" 
	id="upfomrid" onSubmit="return Validator.Validate(this)">
	<script language="JavaScript" src="inc/ValidaFileType.js"></script>
 <table width="75%" border="0" align="center">
    <TR>
    <TD><div align="center">������</div></TD>
    <TD><input type="text" name="musicname"></TD>
    </TR>
     <TR>
    <TD><div align="center">����</div></TD>
    <TD><input type="text" name="singername"></TD>
    </TR>
    <TR>
    <TD><div align="center">�Ա�</div></TD>
    <TD>
    	<SELECT name="singersex">
					<OPTION value="male">��</OPTION>
					<OPTION value="female">Ů</OPTION>
		</SELECT>
	</TD>
    </TR>
 </table>
    <TABLE width="75%">
    <tr> 
      <td><div align="center">
          <input name="upflie" dataType="Filter" msg="��������ļ���ʽ" type="file" accept="mp3, wma,wav" size="20">
        </div></td>
	</tr>
	<TR>
      <td><div align="center">
         <input value="�ϴ�" type="submit">
         <INPUT type="reset">
      </div></td>
    </tr>
    </TABLE>
</FORM>

<jsp:include page="inc/footer.jsp"></jsp:include>