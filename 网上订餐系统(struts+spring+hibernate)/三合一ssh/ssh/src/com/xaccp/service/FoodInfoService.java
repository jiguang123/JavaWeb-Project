package com.xaccp.service;

import java.util.List;

import com.xaccp.dao.FoodBigTypeDAO;
import com.xaccp.dao.FoodInfoDAO;
import com.xaccp.dao.FoodSmallTypeDAO;
import com.xaccp.po.FoodBigType;
import com.xaccp.po.FoodSmallType;

public class FoodInfoService {

	private FoodBigTypeDAO bigTypeDao;
	private FoodSmallTypeDAO smallTypeDao;
	private FoodInfoDAO foodInfoDao;
	
	public FoodBigTypeDAO getBigTypeDao() {
		return bigTypeDao;
	}
	public void setBigTypeDao(FoodBigTypeDAO bigTypeDao) {
		this.bigTypeDao = bigTypeDao;
	}
	public FoodInfoDAO getFoodInfoDao() {
		return foodInfoDao;
	}
	public void setFoodInfoDao(FoodInfoDAO foodInfoDao) {
		this.foodInfoDao = foodInfoDao;
	}
	public FoodSmallTypeDAO getSmallTypeDao() {
		return smallTypeDao;
	}
	public void setSmallTypeDao(FoodSmallTypeDAO smallTypeDao) {
		this.smallTypeDao = smallTypeDao;
	}
	
	/**
	 * ��ѯ���в���
	 * @return
	 */
	public List findFoodInfo(){
		return foodInfoDao.findAllFoodInfo();
	}
	
	/**
	 * ��״̬��ѯ����
	 * @param fstate
	 * @return
	 */
	public List findFoodByState(int fstate){
		return foodInfoDao.findFoodByState(fstate);
	}
	
	/**
	 * �����Ͳ�ѯ����
	 * @param typeid
	 * @return
	 */
	public List findFoodByType(int typeid){
		return foodInfoDao.findFoodByType(typeid);
	}
	
	/**
	 * ����ҵ��ѯ����
	 * @param enterid
	 * @return
	 */
	public List findFoodByEnterpise(int enterid){
		return foodInfoDao.findFoodInfoByEnterprise(enterid);
	}
	
	public List findFoodByTerm(String hql,List args){
		return foodInfoDao.findFoodByTerm(hql, args);
	}
	
	/**
	 * ��Ӳ��������
	 * @param fbt
	 */
	public void addFoodBigType(FoodBigType fbt){
		if(fbt!=null){
			bigTypeDao.save(fbt);
		}
	}
	
	/**
	 * �޸Ĳ��������
	 * @param fbt
	 */
	public void updateFoodBigType(FoodBigType fbt){
		bigTypeDao.merge(fbt);
	}
	
	/**
	 * ��Ӳ���С����
	 * @param fst
	 */
	public void addFoodSmalType(FoodSmallType fst){
		if(fst!=null){
			smallTypeDao.save(fst);
		}
	}
	
	/**
	 * �޸Ĳ���С����
	 * @param fst
	 */
	public void updateFoodSmallType(FoodSmallType fst){
		smallTypeDao.merge(fst);
	}
	
	/**
	 * ��ѯ����ǰ10��
	 * @return
	 */
	public List findFoodTop10(){
		List list=foodInfoDao.findAllFoodInfo();
		if(list.size()>0){
			return list;
		}
		return null;
	}
	
	/**
	 * ��ѯ���в��������
	 * @return
	 */
	public List findFoodBigType(){
		return bigTypeDao.findAllBigType();
	}
	
	/**
	 * ��ѯ���в���С����
	 * @return
	 */
	public List findFoodSmallType(){
		return smallTypeDao.findAllSmallType();
	}
}