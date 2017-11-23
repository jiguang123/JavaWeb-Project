<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@taglib uri="/tags/struts-bean" prefix="bean"%>
<%@taglib uri="/tags/struts-html" prefix="html"%>
<%@taglib uri="/tags/struts-logic" prefix="logic"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><bean:message key="register.title" /></title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@include file="header.jsp"%>
<table width="759" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td align="center"><html:form action="Register.do">
			<table width="400" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="title"><bean:message key="register.title" /></td>
				</tr>
				<tr>
					<td align="center" class="body"><html:errors />
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="37%" height="25" align="right"><bean:message
								key="register.username" /></td>
							<td width="63%" height="25"><html:text property="username"
								styleClass="login" /></td>
						</tr>
						<tr>
							<td height="25" align="right"><bean:message
								key="register.password" /></td>
							<td height="25"><html:password property="password"
								styleClass="login" /></td>
						</tr>
						<tr>
							<td height="25" align="right"><bean:message
								key="register.confirm" /></td>
							<td height="25"><html:password property="confirm"
								styleClass="login" /></td>
						</tr>
						<tr>
							<td height="25" align="right"><bean:message key="register.email" /></td>
							<td height="25"><html:text property="email" styleClass="login" /></td>
						</tr>
						<tr>
							<td height="25" align="right"><bean:message
								key="register.address" /></td>
							<td height="25"><html:text property="address" styleClass="login" /></td>
						</tr>
						<tr>
							<td height="25" align="right"><bean:message
								key="register.postcode" /></td>
							<td height="25"><html:text property="postcode" styleClass="login" /></td>
						</tr>
					</table>
					<hr style="height:1pt " width="90%">
					<html:submit>
						<bean:message key="register.register" />
					</html:submit> <html:reset>
						<bean:message key="register.reset" />
					</html:reset></td>
				</tr>
			</table>
		</html:form></td>
	</tr>
</table>
<%@include file="footer.jsp"%>
</body>
</html>
