package control.web;

/**
 *@�����ϴ���
 *
 */
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import control.DataBaseConnector;
import control.ExceptionHandler;
import org.apache.commons.fileupload.*;

public class PostFile extends HttpServlet {
	private Connection con = null;
	private DataBaseConnector db = null;
	private String realpath = "";
	private String uploadpath = "";
	private String temppath = ""; 
	private static final String message = "�ϴ�ʧ��";
	
	
	public void init() throws ServletException {
		db = new DataBaseConnector();//�������ݿ�
		
	}
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String action = action = req.getParameter("action");
		if("open".equals(action)){
			req.setAttribute("upstate","open");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/upload.jsp");
			if(rd!=null){
				rd.forward(req,resp);
				return;
			}
		}
		if("upfile".equals(action)){
			if(doUpFile(req,resp)){
				req.setAttribute("upstate","upsucessed");
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/upload.jsp");
				rd.forward(req,resp);
				return;
			}
		/*		resp.sendRedirect(req.getContextPath()+"/upload.jsp?state=upsucessed");
			return;*/
		}
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
	 * @�ϴ��ļ�
	 */
	  public boolean doUpFile(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		  boolean upsucceed = true;
		  try{//��Ŀ¼�ľ���·��
			//  realpath = new File(req.getSession().getServletContext().getRealPath(req.getRequestURI())).getParent();
			  realpath = new File(req.getSession().getServletContext().getRealPath(req.getContextPath())).getParent();
			  //realpath = req.getContextPath();
			  String extname = "";
			  String musicname = "";
			  String singername = "";
			  String singersex = "";
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
					  		if("musicname".equals(fieldname))
					  			musicname = item.getString().trim();
					  		if("singername".equals(fieldname))
					  			singername = item.getString().trim();
					  		if("singersex".equals(fieldname))
					  			singersex = item.getString().trim();
				  }
				  if(extname.equalsIgnoreCase("wav")||extname.equalsIgnoreCase("wma")||extname.equalsIgnoreCase("mp3"))
				{//���ļ�д��ָ��Ŀ¼
					String finalname = addMusicInfo(req,resp,extname,musicname,singername,singersex);
					item.write(new File(uploadpath+finalname+"."+extname));
				}
			}
		  }catch(Exception e){
			doError(req,resp,message,e);
			upsucceed = false;
		}
		return upsucceed;
	}
			/**
			 *@����ظ��ֺ͸�����Ϣ��ӵ����ݿ�
			 */
	public String addMusicInfo(HttpServletRequest req,HttpServletResponse resp,
			String musictype,String musicname,String singername,String singersex)
			throws ServletException,IOException,SQLException{
		int rowaffect = 0;
		String finalsingername = "";
		try{//��������Ϣд�����ݿ�
			con = db.getConnection();
			String query = "select singername from singerinfo where singername=?";
			PreparedStatement pst1 = con.prepareStatement(query);
			pst1.setString(1,singername);
			ResultSet rs1 = pst1.executeQuery();
			if(!rs1.next()){
				String insertsinger = "insert into SingerInfo(SingerName,SingerSex) VALUES(?,?)";
				PreparedStatement pst = con.prepareStatement(insertsinger);
				pst.setString(1,singername);
				pst.setString(2,singersex);
				rowaffect = pst.executeUpdate();
				if(rowaffect<1){
					throw new ExceptionHandler("��Ӹ�����Ϣʧ��");
				}
			}
		}catch(SQLException e){
			doError(req,resp,message,e);
		}
		catch(ExceptionHandler e1){
			doError(req,resp,message,e1);
		}
		finally{ 
			finalsingername = singername;
		}
			
		if(rowaffect>=1){//��������Ϣд�����ݿ�
			try{
				String insertmusic = "insert into MusicInfo(MusicName,MusicType,SingerName) VALUES(?,?,?)";
				PreparedStatement pst = con.prepareStatement(insertmusic);
				pst.setString(1,musicname);
				pst.setString(2,musictype);
				pst.setString(3,finalsingername);
				rowaffect = pst.executeUpdate();
				if(rowaffect<1){
						throw new ExceptionHandler("��Ӹ�����Ϣʧ��");
					}
				}catch(SQLException e){
					doError(req,resp,message,e);
				}
				catch(ExceptionHandler e1){
					doError(req,resp,message,e1);
				}
		}
		if(con!=null)
			con.close();
		return singername+musicname;
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
