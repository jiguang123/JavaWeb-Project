package control.bean;
/**
 *@�ϴ��ļ������ݿ�
 *
 */
import javax.naming.*;
import javax.rmi.PortableRemoteObject;
import ejb.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import control.DataBaseConnector;
import control.ExceptionHandler;
import org.apache.commons.fileupload.*;

public class PostFileDb extends HttpServlet {
	private Connection con = null;
	private DataBaseConnector db = null;
	private String realpath = "";
	private String uploadpath = "";
	private String temppath = ""; 
	private String finalmusicname = "";
	private String finalsingername = "";
	private String finalsingersex = "";
	private String extname = "";
	private UpFileHome sessionhome;
	private UpFileRemote sessionremote;
	private static final String message = "�ϴ�ʧ��";
	
	
	public void init() throws ServletException {
		db = new DataBaseConnector();//�������ݿ�
		try{
			Context ic = new InitialContext();
	   	    java.lang.Object obj = ic.lookup("UpSessionBean");
	   	    sessionhome = (UpFileHome)PortableRemoteObject.narrow(obj,UpFileHome.class);   
	    }catch(Exception e){
	         e.printStackTrace();
	     }   
	}
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String action = action = req.getParameter("action");
		if("upfile".equals(action)){
		/*	if(doUpFile(req,resp)){
				req.setAttribute("upstate","upsucessed");
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/upload.jsp");
				rd.forward(req,resp);
				return;
			}
			resp.sendRedirect(req.getContextPath()+"/upload.jsp?state=upsucessed");
			return;*/
		}
	}
	/**
	 * ���ļ�д�����ݿ�
	 */
	public boolean PostFileDb(HttpServletRequest req, HttpServletResponse resp,String finalpath,
					String musicname,String singername,String musictype){
		boolean succeed = false;
		try{
			sessionremote = sessionhome.Create(finalpath,musicname,musictype,singername);
			if(sessionremote.startEntBean(finalpath,musicname,musictype,singername)){
				succeed = true;
			}
	     }catch(Exception e){
	           e.printStackTrace();
	      }
	     return succeed;
	}
	/**
	 * @ȡ���ļ���չ��
	 */
	public String getTypePart(String filename) { 
	    int point = filename.lastIndexOf('.'); 
	    int length = filename.length(); 
	    if (point == -1 || point == length - 1) { 
	      return ""; 
	    } 
	    else { 
	      return filename.substring(point + 1, length); 
	    } 
	  } 
	/**
	 * 
	 * @throws Exception 
	 * @throws SQLException 
	 * @�ϴ��ļ�
	 */
	  public String doUpFile(HttpServletRequest req, HttpServletResponse resp)
			throws SQLException, Exception{
		  String finalpath = "";
		  try{//��Ŀ¼�ľ���·��
			//  realpath = new File(req.getSession().getServletContext().getRealPath(req.getRequestURI())).getParent();
			  realpath = new File(req.getSession().getServletContext().getRealPath(req.getContextPath())).getParent();
			  //realpath = req.getContextPath();
			  
			  uploadpath = realpath+"/Upload/";
			  temppath = realpath+"/Upload/temp/"; 
			  if(!new File(uploadpath).isDirectory())
					new File(uploadpath).mkdirs();
			  if(!new File(temppath).isDirectory())
					new File(temppath).mkdirs();
			  DiskFileUpload fileupload = new DiskFileUpload();
			  fileupload.setSizeMax(10240000);//�ϴ��ļ����Ϊ10MB
			  fileupload.setSizeThreshold(10240);//������Ϊ1MB
			  fileupload.setRepositoryPath(temppath);//������ʱ�ļ���
			  List list = fileupload.parseRequest(req);
			  //�õ������ļ�
			  Iterator iter = list.iterator();
			  while(iter.hasNext())//���δ���ÿһ���ļ�
			  { 
				  FileItem item = (FileItem)iter.next();
				  if(!item.isFormField()){//������Ǳ���,��ȡ���ļ���Ϣ
					  String filename = item.getName().trim();
					  long filesize = item.getSize();
					  extname = getTypePart(filename);
					  if(filename==null&&filesize==0)
						  continue;
				  }else if(item.isFormField()){//ȡ�ñ������Ϣ
					  		String fieldname = item.getFieldName();
					  		if("dbmusicname".equals(fieldname))
					  			finalmusicname = item.getString().trim();
					  		if("dbsingername".equals(fieldname))
					  			finalsingername = item.getString().trim();
					  		if("dbsingersex".equals(fieldname))
					  			finalsingersex = item.getString().trim();
				  }
				  if(extname.equalsIgnoreCase("wav")||extname.equalsIgnoreCase("wma")||extname.equalsIgnoreCase("mp3"))
				{//���ļ�д��ָ��Ŀ¼
					  if(checkMusicInfo(req,resp,extname,finalmusicname,finalsingername)){
						  String finalname = finalsingername+finalmusicname;
						  finalpath = uploadpath+finalname+"."+extname;
					      item.write(new File(finalpath));
					  }else{
						  throw new ExceptionHandler("�ļ��Ѵ���!");
					  }
				}
			}
		  }catch(ExceptionHandler e){
			doError(req,resp,message,e);
		}
		return finalpath;
	}
			/**
			 *@���������Ƿ��Ѵ���
			 *@����:ͬ��,ͬ����,ͬ��׺��
			 */
	public boolean checkMusicInfo(HttpServletRequest req,HttpServletResponse resp,
			String musictype,String musicname,String singername)
			throws ServletException,IOException,SQLException{
		boolean canupload = true;
		String cmusicname = "";
		String csingername = "";
		String cmusictype = "";
		try{
			con = db.getConnection();
			String query = "select * from singerinfo where singername=?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1,singername);
			ResultSet rs = pst.executeQuery();
			if(rs.next()){
				cmusicname = rs.getString("MusicName");
				csingername = rs.getString("SingerName");
				cmusictype = rs.getString("MusicType");
				if(cmusicname.equalsIgnoreCase(musicname)||csingername.equalsIgnoreCase(singername)||cmusictype.equalsIgnoreCase(musictype))
					canupload = false;
			}
		}catch(SQLException e){
			doError(req,resp,message,e);
		}
		return canupload;
	}
	/**
	*������
	*/
	public void doError(HttpServletRequest req,
			HttpServletResponse resp,String errorstr,Exception e)
	    throws ServletException,IOException {
        req.setAttribute("error", errorstr+"<br/>"+e.getMessage()); 
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/errorpage.jsp"); 
        rd.forward(req,resp);
        return;
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req,resp);
	}

}


	
	

