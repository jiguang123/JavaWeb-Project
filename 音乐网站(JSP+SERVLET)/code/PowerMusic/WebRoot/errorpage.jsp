<%@ page contentType="text/html; charset=gbk" buffer="20kb"language="java" import="java.io.*" %>
	<% 
	  if(request.getAttribute("error")!=null)
	  {
		  String str = (String)request.getAttribute("error");
		  out.println(str);
	  }	
	%>
	<p>
<a href="index.jsp">��ҳ</a><br/>
<A href="<%=request.getContextPath()%>/Register?action=confirm">����ע��</A>
<p> <a href="javascript:history.back();"> &lt;&lt;����</a> </p>
	