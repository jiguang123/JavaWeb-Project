<%
  if(session.getAttribute("aid") == null || session.getAttribute("name") == "")
  {
     throw new Exception("�㻹δ��¼���ѹ��ڣ����¼��");
  }
%>