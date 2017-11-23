package com.xaccp.service;

import java.util.List;

import com.xaccp.dao.EnterpriseInfoDAO;
import com.xaccp.po.EnterpriseInfo;

public class EnterpriseInfoService {

	private EnterpriseInfoDAO enterDao;

	public EnterpriseInfoDAO getEnterDao() {
		return enterDao;
	}

	public void setEnterDao(EnterpriseInfoDAO enterDao) {
		this.enterDao = enterDao;
	}
	
	/**
	 * �����ҵ
	 * @param ei
	 */
	public void saveEnterprise(EnterpriseInfo ei){
		enterDao.save(ei);
	}
	
	/**
	 * ��ѯ������ҵ
	 * @return
	 */
	public List findAllEnterpise(){
		return enterDao.findAllEnterprise();
	}
	
	/**
	 * ����ҵ�û������в���
	 * @param EnterName
	 * @return
	 */
	public List findEnterpriseByName(String EnterName){
		return enterDao.findByEName(EnterName);
	}
	
	/**
	 * ����ҵ���û�����������в���
	 * @param ei
	 * @return
	 */
	public EnterpriseInfo findEnterpriseByNameAndPass(EnterpriseInfo ei){
		List list= enterDao.findEntepriseByNameAndPass(ei);
		if(list!=null){
			return (EnterpriseInfo) list.get(0);
		}
		return null;
	}
	
	/**
	 * ɾ����ҵ
	 * @param eids
	 */
	public void bulkDeleteEnterprise(int ...eids){
		for (int i = 0; i < eids.length; i++) {
			EnterpriseInfo ei=enterDao.findById(eids[i]);
			enterDao.delete(ei);
		}
	}
	
	/**
	 * �޸���ҵ
	 * @param ei
	 */
	public void updateEnterprise(EnterpriseInfo ei){
		enterDao.merge(ei);
	}
}