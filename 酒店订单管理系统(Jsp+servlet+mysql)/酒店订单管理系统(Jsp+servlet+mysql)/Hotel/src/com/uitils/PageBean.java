package com.uitils;

import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

public class PageBean{
	
	private int thisPage=1; //��ǰҳ�� 
	private int sumPage;  //�ܵ�ҳ��
	private int pageRow=5;  //ÿҳ������
	private int sumSava;  //����������¼
	private String sql;  //ִ�е����
	private List<Map<String,Object>> map;  //���ؼ�
	public int getThisPage() {
		return thisPage;
	}
	public void setThisPage(int thisPage) {
		this.thisPage = thisPage;
	}
	public int getSumPage() {
		return sumPage;
	}
	public void setSumPage(int sumPage) {
		this.sumPage = sumPage;
	}
	
	public int getPageRow() {
		return pageRow;
	}
	public void setPageRow(int pageRow) {
		this.pageRow = pageRow;
	}
	public int getSumSava() {
		return sumSava;
	}
	public void setSumSava(int sumSava) {
		this.sumSava = sumSava;
	}
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
	public List<Map<String, Object>> getMap() {
		return map;
	}
	public void setMap(List<Map<String, Object>> map) {
		this.map = map;
	}
	
	

}
