<%@ page language="java" contentType="text/html;charset=gbk"%>
<jsp:include page="inc/top.jsp"></jsp:include>
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
									<p><a href="index.jsp"><FONT color="#ffffff">��������<FONT color="#000000"
										style="BACKGROUND-COLOR: #ffffff"></FONT></FONT>
										</a></p></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD height="8" bgcolor="#000000"> 
                        <div align="center">
                          <p><font color="#FFFFFF" size="3">ע�����û�</font></p>
                          </div></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD width="62%" height="220">
                        <P>&nbsp;</P>
						<SCRIPT Language = "Javascript">
								 //����ĸ�����ִ�����ϼ�� 
							function isValid()
							{	
								if(regform.username.value == "")
								{	
								  	window.alert("����������ʺŵ�����!"); 
									regform.username.focus();
								  	return false;
								}
								if(regform.password.value == "")
								{
								  	window.alert("������������������!");
								  	regform.password.focus();
								  	return false;  //�뿪����
								}
								if(regform.confirmpwd.value != regform.password.value)
								{
								  	window.alert("������������벻һ��!");
								  	regform.confirmpwd.focus();
								  	return false;  //�뿪����
								}	
								if(!verifyAddress(regform.useremail.value))
								{
									
								��	alert("���ǺϷ���E-Mail ��ַ�����������룡"); 
									regform.useremail.focus();
									return false;
								}
								
								
							 regform.submit(); //�ͳ����е�����
							}
								function verifyAddress(obj){ 
							������	var email = obj.email.value; 
							������	var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/; 
							������	flag = pattern.test(email); 
							������	if(!flag){ 
							������
							��������return false;} 
							����} 
							</SCRIPT>			
                        <form name="regform" action="<%=request.getContextPath()%>/Register?action=save" method="post" 
                        	onSubmit="return isValid(this);">
						  <table width="586" height="200" border="0" align="center">
                            <tr>
						<td width="280">�û���</td>
						<TD width="294"><INPUT type="text" name="username"></TD>
						</tr>
						<tr>
						<td>����</td>
						<TD><INPUT type="password" name="password"></TD>
						</tr>
						<tr>
						<td>ȷ������</td>
						<TD><INPUT type="password" name="confirmpwd"></TD>
						</tr>
						<tr>
						<td>E-Mail</td>
						<TD><INPUT type="text" name="useremail"></TD>
						</tr>
						<tr>
						<td>�Ա�</td>
						<TD>
						<SELECT name="usersex">
							<OPTION value=male>��</OPTION>
							<OPTION value=female>Ů</OPTION>
						</SELECT>
						</TD>
						</tr>
						<tr>
						<td>QQ</td>
						<TD><INPUT type="text" name="userqq"></TD>
						</tr>
						<tr>
						</table>
						  <table align="center">
                            <tr>
						    <td>
							  <input type="submit" value="�ύ">
							</td>
							<td>
							  <input type="reset" value="����">
							</td>
						  </tr>
						</table>
                        </form>
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


  