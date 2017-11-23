package rcm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import rcm.entity.Classify;
import rcm.entity.Frequency;
import rcm.entity.Product;
import rcm.entity.User;

/**
*��Ʒ���ݿ������
*/
public class ProductDao {
	
	//����������Ʒ
	public List<Product> findAllProduct(){
		List<Product> list = new ArrayList<Product>();
		String sql = "select * from product";
		Connection conn = DataBaseUtils.getConnection();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){//����ѯ���ת����Product��ʵ��
				Product p = new Product();
				p.setId(rs.getInt("id"));
				p.setProductName(rs.getString("product_name"));
				p.setClassify(rs.getInt("classify"));
				p.setPicPath(rs.getString("pic"));
				p.setDescrib(rs.getString("describ"));
				p.setPrice(rs.getDouble("price"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{//�ر����ݿ�����
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	
	//���Ҹ��û�����Ʒ���Ƶ��
	public List<Frequency> findFrequency(int userid){
		List<Frequency> list = new ArrayList<Frequency>();
		String sql = "select * from frequency where user_id=? order by times desc";
		Connection conn = DataBaseUtils.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userid);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				Frequency f = new Frequency();
				f.setId(rs.getInt("id"));
				f.setUserId(rs.getInt("user_id"));
				f.setProductId(rs.getInt("product"));
				f.setTimes(rs.getInt("times"));
				list.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	
	/**
	 * �����Ƶ�ʸߵķ�����Ʒ����ǰ��
	 * @param products
	 * @param frequency
	 * @return
	 */
	public List<Product> sort(List<Product> products, List<Frequency> frequency){
		List<Product> ret = new ArrayList<Product>();
		List<Integer> classify = new ArrayList<Integer>();
		for (Frequency frq : frequency) {
			for(Product p : products){
				if(p.getId().equals(frq.getProductId())){
					if(!classify.contains(p.getClassify())){
						classify.add(p.getClassify());//�Է���Ƶ��Ϊ������˳�򽫷�����뼯����
					}
				}
			}
		}
		//��˳�򽫸�Ƶ�����µ���Ʒ�����ݿ��в����
		for(Integer c:classify){
			String sql = "select * from product where classify="+c;
			Connection conn = DataBaseUtils.getConnection();
			try {
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
					Product p = new Product();
					p.setId(rs.getInt("id"));
					p.setProductName(rs.getString("product_name"));
					p.setClassify(rs.getInt("classify"));
					p.setPicPath(rs.getString("pic"));
					p.setDescrib(rs.getString("describ"));
					p.setPrice(rs.getDouble("price"));
					ret.add(p);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				if(conn != null){
					try {
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return ret;
	}
	//���ݲ�����ƷID������Ʒ��������ʾ��Ʒ����
	public Product findProduct(int pid){
		String sql = "select * from product where id="+pid;
		Connection conn = DataBaseUtils.getConnection();
		Product p = null;
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				p = new Product();
				p.setId(rs.getInt("id"));
				p.setProductName(rs.getString("product_name"));
				p.setClassify(rs.getInt("classify"));
				p.setPicPath(rs.getString("pic"));
				p.setDescrib(rs.getString("describ"));
				p.setPrice(rs.getDouble("price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return p;
	}
	
	//���������
	public void addClickTimes(String pid, User user){
		if(user == null){
			return ;
		}
		String sql0 = "select * from frequency where user_id=? and product=?";
		String sql = "insert into frequency(user_id,product,times) values(?,?,?)";
		Connection conn = DataBaseUtils.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql0);
			pstmt.setInt(1, user.getId());
			pstmt.setInt(2, Integer.valueOf(pid));
			ResultSet rs0 = pstmt.executeQuery();
			int times = 0, id=0;
			while(rs0.next()){
				times = rs0.getInt("times");
				id = rs0.getInt("id");
			}
			if(times == 0){//��һ�ε������Ʒ���²���һ����¼
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, user.getId());
				pstmt.setInt(2, Integer.valueOf(pid));
				pstmt.setInt(3, 1);
				pstmt.executeUpdate();
			}else{//��ε������Ʒ���������м�¼
				String sql2 = "update frequency set times=? where id=?";
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, ++times);
				pstmt.setInt(2, id);
				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
