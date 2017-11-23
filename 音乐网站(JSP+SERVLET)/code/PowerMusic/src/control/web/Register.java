package control.web;
/**
 *@����ע������ 
 */
import java.io.*;
import java.util.regex.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import control.ExceptionHandler;
import control.DataBaseConnector;

public class Register extends HttpServlet{
	private RequestDispatcher rd = null;
	private Connection con = null;
	private DataBaseConnector db = null;
	private static final String message = "ע��ʧ��";
	
	public void init(ServletConfig config)throws ServletException{
		super.init(config);
		db = new DataBaseConnector();
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
	    throws ServletException, IOException {
		String action = action = req.getParameter("action");
		if("apply".equals(action)){
			 rd = getServletContext().getRequestDispatcher("/regpage.jsp");
			 rd.forward(req,resp);
			 return;
		}
		if("confirm".equals(action)){
			rd = getServletContext().getRequestDispatcher("/register.jsp");
			rd.forward(req,resp);
			return;
		}
		if("save".equals(action)){
			String username = addUser(req,resp);
			if(username!=null){
				HttpSession session=req.getSession(true);
				session.setAttribute("username",username);
			/*	rd = getServletContext().getRequestDispatcher("/index.jsp");
				rd.forward(req,resp);*/
				resp.sendRedirect(req.getContextPath()+"/index.jsp");
				return;
			}
		}
	}
	/**
	*����û������Ƿ����Ҫ��
	*/
	public boolean isAccord(HttpServletRequest req, HttpServletResponse resp,
            String username,String password,String confirmpwd,
            String useremail)
            throws ServletException, IOException {
	    boolean accord = true;
	    try{
	    	 if(username==null||username.equals("")){
	 	    	accord = false;
	 	    	throw new ExceptionHandler("�û�������Ϊ��,��������д");
	 	    }
	 		if(password==null||password.equals("")){
	 			accord = false;
	 			throw new ExceptionHandler("���벻��Ϊ�գ����������룡");
	 		}
	 		if(confirmpwd==null||confirmpwd.equals("")){
	 			accord = false;
	 			throw new ExceptionHandler("ȷ�����벻��Ϊ�գ�����������");
	 		}
	 		if(!password.equals(confirmpwd)){
	 			accord = false;
	 			throw new ExceptionHandler("���벻һ��,��������д!");
	 		}
	 		if(useremail==null||useremail==""){
	 			accord = false;
	 			throw new ExceptionHandler("E-Mail����Ϊ��,��������д!");
	 		}
	 		String regEx = "^([a-z0-9_-])+@([a-zZ0-9_-])+(\\.[a-z0-9_-])+[a-z]{2,3}$";
	 		Pattern p = Pattern.compile(regEx);
	 		Matcher m =p.matcher(useremail);
	        if(!m.find()){
	        	accord = false;
	 			throw new ExceptionHandler("E-Mail��ʽ����ȷ,��������д!");
	        }

	    }catch(ExceptionHandler e){
	    	doError(req,resp,message,e);
	    	return false;
	    }
	   return accord;
	}/**
		*������û�
		*/
	public String addUser(HttpServletRequest req,HttpServletResponse resp)
	  throws ServletException,IOException{
		String username = req.getParameter("username").trim();
		String password = req.getParameter("password").trim();
		String confirmpwd = req.getParameter("confirmpwd").trim();
		String useremail = req.getParameter("useremail").trim();
		String usersex = req.getParameter("usersex").trim();
		String userqq = req.getParameter("userqq").trim();
		PreparedStatement pst = null;
		try{
			if(isAccord(req,resp,username,password,confirmpwd,useremail)&&isRegister(req,resp,username)){
				con = db.getConnection();
				String insert = "insert into UserInfo(UserName,UserPassword,UserEmail,UserSex,UserQQ) VALUES(?,?,?,?,?)";
				pst = con.prepareStatement(insert);
				pst.setString(1,username);
				pst.setString(2,password);
				pst.setString(3,useremail);
				pst.setString(4,usersex);
				pst.setString(5,userqq);
				int rowaffect = pst.executeUpdate();
				if(rowaffect==0){
					throw new ExceptionHandler("������");
				}
				if(con!=null)
				con.close();
			}
		}catch(SQLException e){
				e.getMessage();
			}
		catch(ExceptionHandler e){
			doError(req,resp,message,e);
	  		}
		return username;
	}
	/***
	 *
	 * �����û��Ƿ��Ѿ�ע��
	 */
	public boolean isRegister(HttpServletRequest req,HttpServletResponse resp,
			String username) 
		throws ServletException,IOException,SQLException{   
	  	boolean canreg = true;
	  	con = db.getConnection();
	  	String query = "select UserName from UserInfo where UserName =?";
	  	PreparedStatement pst = null;
	  	try{
		  	pst = con.prepareStatement(query);
		  	pst.setString(1,username);
		  	ResultSet rs = pst.executeQuery();;
		  	if(rs.next()){ //
		  		canreg=false;
		  		throw new ExceptionHandler("�Բ���,���û��ѱ�ע��,������ע��!");
		  		}else{
		  			canreg = true;
		  		}
		}catch(ExceptionHandler e){
			doError(req,resp,message,e);
	  		}
		catch(SQLException e){
			doError(req,resp,message,e);
		}
		if(con!=null)
		con.close();
	  	return canreg;
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
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
	  throws ServletException, IOException {
			doGet(req, resp);
	}
}