package control.bean;
/**
 * @�����û���bean
 **/
import java.util.*;
import java.sql.*;
import model.UserModel;
import control.DataBaseConnector;

public class ManageUser {
	private Connection con;
	private DataBaseConnector db;
	/**
	 * ���캯��
	 */
	public ManageUser(){
		db = new DataBaseConnector();
	}
	/**
	 * ����ͨ�û���Ϣд��ģ����
	 * @return 
	 */
	public Vector displayQuery(int noteperpage,int pagecode,
				String condition,String keyfield) 
					throws SQLException{
		con = db.getConnection();
		CallableStatement cst = null;
		String query = "{call sp_getpage(?,?,?,?)}";
		Vector uservector = null;
		try{
			cst = con.prepareCall(query);
			cst.setInt(1,noteperpage);
			cst.setInt(2,pagecode);
			cst.setString(3,condition);
			cst.setString(4,keyfield);
			ResultSet rs = cst.executeQuery();
			uservector = new Vector();
			while(rs.next())
			{ 
				UserModel usermodel = new UserModel();
				usermodel.setUserid(rs.getInt(1));
			  	usermodel.setUsername(rs.getString(2));
			  	usermodel.setPassword(rs.getString(3));
			  	usermodel.setUseremail(rs.getString(4));
			  	usermodel.setUsersex(rs.getString(5));
			  	usermodel.setUserqq(rs.getString(6));
			  	usermodel.setUserRule(rs.getInt(7));
			  	usermodel.setRegtime(rs.getDate(8));
			  	uservector.add(usermodel);
				/*uservector.add("fuck");*/
			}
		}catch(SQLException e){
			e.getMessage();
		 }
		if(con!=null)
		con.close();
		return uservector;
	}
	/**
	 * ���ر��������
	 */
	public int getTotalrow() throws SQLException{
		con = db.getConnection();
		PreparedStatement pst = null;
		String query = "select count(*) from UserInfo";
		int totalrow = 0;
		try{
			pst = con.prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				totalrow = rs.getInt(1);
			}
		}catch(SQLException e){
			e.getMessage();
		}
		if(con!=null)
			con.close();
		return totalrow;
	}
	public int updateUser(String userid,String username,String password,String useremail,
							String usersex,String userqq)throws SQLException{
		con = db.getConnection();
		PreparedStatement pst = null;
		String update = "update UserInfo set UserName=?,UserPassword=?,UserEmail=?,UserSex=?,UserQQ=? where UserID = ?";
		int rowaffect = 0;
		try{
			pst = con.prepareStatement(update);
			pst.setString(1,username);
			pst.setString(2,password);
			pst.setString(3,useremail);
			pst.setString(4,usersex);
			pst.setString(5,userqq);
			pst.setInt(6,Integer.parseInt(userid));
			rowaffect = pst.executeUpdate();
		}catch(SQLException e){
			e.getMessage();
		}
		if(con!=null){
			con.close();
		}
		return rowaffect;
	}
}
