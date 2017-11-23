package com.xaccp.service;

import java.util.List;

import com.xaccp.dao.OrderAccessorilyDAO;
import com.xaccp.dao.OrderInfoDAO;
import com.xaccp.po.OrderInfo;

public class OrderService {

	private OrderAccessorilyDAO orderAcessDao;
	private OrderInfoDAO orderInfoDao;
	
	public OrderAccessorilyDAO getOrderAcessDao() {
		return orderAcessDao;
	}
	public void setOrderAcessDao(OrderAccessorilyDAO orderAcessDao) {
		this.orderAcessDao = orderAcessDao;
	}
	public OrderInfoDAO getOrderInfoDao() {
		return orderInfoDao;
	}
	public void setOrderInfoDao(OrderInfoDAO orderInfoDao) {
		this.orderInfoDao = orderInfoDao;
	}
	
	/**
	 * ��ѯ���ж�������
	 * @return
	 */
	public List findAllOrder(){
		return orderInfoDao.findAllOrder();
	}
	
	/**
	 * ��ѯ���ж�������
	 * @return
	 */
	public List findAllOrderAccessrily(){
		return orderAcessDao.findAllOrderAccessrily();
	}
	
	/**
	 * ����ҵ��ѯ���� 
	 * @param enterid
	 * @return
	 */
	public List findOrderByEnter(int enterid){
		return orderInfoDao.findOrderByEnter(enterid);
	}
	
	/**
	 * ���û���ѯ����
	 * @param uid
	 * @return
	 */
	public List findOrderByUser(int uid){
		return orderInfoDao.findOrderByUser(uid);
	}
	
	/**
	 * ��Ӷ���
	 * @param oi
	 */
	public void addOrder(OrderInfo oi){
		orderInfoDao.save(oi);
	}
	
	/**
	 * ɾ������
	 * @param oid
	 */
	public void deleteOrder(int oid){
		OrderInfo oi=orderInfoDao.findById(oid);
		orderInfoDao.delete(oi);
	}
	
	/**
	 * �޸Ķ���״̬
	 * @param oid
	 */
	public void updateOrderState(int oid){
		OrderInfo oi=orderInfoDao.findById(oid);
		oi.setOState(2);
		orderInfoDao.merge(oi);
	}
}