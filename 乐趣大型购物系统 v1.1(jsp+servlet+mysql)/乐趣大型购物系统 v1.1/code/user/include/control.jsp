<%

  if(session.getAttribute("id") == null || session.getAttribute("id") == "")
  {
     throw new Exception("�㻹δ��¼���¼�ѹ��ڣ����¼��");
  }  

  String inc = session.getAttribute("inc").toString();
  String id = session.getAttribute("id").toString();
  String nickname = session.getAttribute("nickname").toString();
  
%>