package com.xaccp.service;

import java.util.List;

import com.xaccp.dao.CreditDAO;
import com.xaccp.po.Credit;

public class CreditService {

	private CreditDAO creditDao;

	public CreditDAO getCreditDao() {
		return creditDao;
	}

	public void setCreditDao(CreditDAO creditDao) {
		this.creditDao = creditDao;
	}
	
	/**
	 * ��ѯ���л���
	 * @return
	 */
	public List findAllCredit(){
		return creditDao.findAllCredit();
	}
	
	/**
	 * ��ѯ�ҵĻ���
	 * @param uid
	 * @return
	 */
	public List findMyCredit(int uid){
		return creditDao.findMyCedit(uid);
	}
	
	/**
	 * ��ӻ���
	 * @param credit
	 */
	public void saveCredit(Credit credit){
		if(credit!=null){
			creditDao.save(credit);
		}
	}
	
	/**
	 * �޸Ļ���
	 * @param credit
	 */
	public void updateCredit(Credit credit){
		creditDao.merge(credit);
	}
}