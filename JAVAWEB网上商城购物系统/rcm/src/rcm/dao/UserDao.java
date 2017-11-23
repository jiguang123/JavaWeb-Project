package rcm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import rcm.entity.User;

public class UserDao {

	public void saveUser(User user){
		//����һ���µ��û���¼��ע���û�ʹ��
		String sql = "insert into user(user_name,pwd) values(?,?)";
		Connection conn = DataBaseUtils.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getPwd());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public User findUser(String username, String pwd){
		//�����û���������������ݿ⣬�����û���¼ 
		String sql = "select * from user where user_name=? and pwd=?";
		Connection conn = DataBaseUtils.getConnection();
		User user = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				user = new User();
				user.setUserName(rs.getString("user_name"));
				user.setPwd(rs.getString("pwd"));
				user.setId(rs.getInt("id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
}
