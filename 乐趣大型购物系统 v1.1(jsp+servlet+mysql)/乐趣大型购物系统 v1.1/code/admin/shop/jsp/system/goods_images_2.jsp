<%@ page contentType="text/html;charset=gb2312"%>
<%@ page errorPage="errorPage.jsp" session="true" %>
<%@ page import="java.util.*" %>
<%@ include file="../include/head.jsp"%>
<%
    
    String aid =(String)session.getAttribute("aid");
    Date d1 = new Date();
    String d_int=d1.getYear()+""+d1.getMonth()+""+d1.getDate()+ ""+d1.getHours()+""+d1.getMinutes()+""+d1.getSeconds();                
    com.jspsmart.upload.SmartUpload mySmartUpload=new com.jspsmart.upload.SmartUpload();

    mySmartUpload.initialize(pageContext); 
    //�������ص����ֵ
    mySmartUpload.setMaxFileSize(500 * 1024*1024);
    //�����ļ�
    mySmartUpload.upload();
    com.jspsmart.upload.Request req = mySmartUpload.getRequest();
    String inc = req.getParameter("inc");
    String brief=req.getParameter("brief");;
    d_int = inc + "s" + d_int;
    String pic_url="image/upload/shop/"+d_int;     
    //ѭ��ȡ���������ص��ļ�
    for (int i=0;i<mySmartUpload.getFiles().getCount();i++){
	   //ȡ�����ص��ļ�
	   com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(i);
	   
	   if (!myFile.isMissing())
	    {
	   //ȡ�����ص��ļ����ļ���
	    String myFileName=myFile.getFileName();	    
	    	    
	//    out.println("filename---------------->"+myFileName);
	//    out.println("<br>");
	    
	    //ȡ�ò�����׺���ļ���
	    String  suffix=myFileName.substring(0,myFileName.lastIndexOf('.'));
	 //   out.println("suffix---------------->"+suffix);
	//    out.println("<br>");
	    
	    //ȡ�ú�׺��
	    String  ext= mySmartUpload.getFiles().getFile(0).getFileExt();  
	    pic_url += "."+ext;
	    myFileName = d_int+"."+ext;
	    out.println("ext---------------->"+myFileName);
	   // out.println("<br>");
	    boolean is_image = ext.equals("gif")||ext.equals("jpg")||ext.equals("GIF")||ext.equals("JPG");
	    if(!is_image)
	    {
	       //out.println("not image!!");
	       throw new Exception("�ϴ�ͼƬ����ֻ����gif��jpg�ļ����������ͼƬ·�����ļ�����!");
	    }
	    //ȡ���ļ��Ĵ�С  
	    int fileSize=myFile.getSize();
	   // out.println("fileSize---------------->"+fileSize);
	   // out.println("<br>");
	    
	    if(fileSize>1*1024*1024 )
	    {
	       throw new Exception("�ϴ�ͼƬ���ܴ���1M!!");
	    }
	    
	    if(fileSize==0)
	    {
	       throw new Exception("�ϴ�ͼƬ�����ڣ���ȷ����ѡ���ͼƬ·���Ƿ���ȷ!!");
	    }	    
	    //����·��
	    String aa=getServletContext().getRealPath("/")+"/"+"image/upload/shop/";
	    String trace=aa+myFileName;
	    System.out.println("path----------->"+trace);
	   // out.println("<br>");
	    //���ļ������ڷ������� 
	    myFile.saveAs(trace,mySmartUpload.SAVE_PHYSICAL);   
	    managegoods.createImages(inc,pic_url,brief,aid); 
            response.sendRedirect("goods_images.jsp?inc="+inc+"");   
	    //out.println(("���سɹ�������").toString());
	   }
	  } 	
%>