package com.xaccp.service;

import java.util.List;
import com.xaccp.po.ManageInfo;
import com.xaccp.dao.ManageInfoDAO;

public class ManageInfoService {

	private ManageInfoDAO managerInfoDao;

	public ManageInfoDAO getManagerInfoDao() {
		return managerInfoDao;
	}

	public void setManagerInfoDao(ManageInfoDAO managerInfoDao) {
		this.managerInfoDao = managerInfoDao;
	}
	
	/**
	 * ��ѯ���й���Ա
	 * @return
	 */
	public List findAllManager(){
		return managerInfoDao.findAllManager();
	}
	
	/**
	 * ���û����������ѯ����Ա
	 * @param mi
	 * @return
	 */
	public ManageInfo findManagerByNameAndPass(ManageInfo mi){
		List list = managerInfoDao.FindManagerByNameAndPass(mi);
		if(list.size()>0){
			return (ManageInfo)list.get(0);
		}
		return null;
	}
	
	/**
	 * ��ӹ���Ա
	 * @param mi
	 */
	public void addManager(ManageInfo mi){
		managerInfoDao.save(mi);
	}
	
	/**
	 * ��id��ѯ����Ա
	 * @param id
	 * @return
	 */
	public ManageInfo findManagerById(int id){
		return managerInfoDao.findById(id);
	}
	
	/**
	 * ɾ������Ա
	 * @param id
	 */
	public void deleteManaget(int id){
		ManageInfo mi=managerInfoDao.findById(id);
		managerInfoDao.delete(mi);
	}
	
	/**
	 * �޸Ĺ���Ա
	 * @param mi
	 */
	public void updateManager(ManageInfo mi){
		managerInfoDao.merge(mi);
	}
	
	/**
	 * ����ɾ������Ա
	 * @param mids
	 */
	public void bulkDeleteManager(int ...mids){
		for (int i = 0; i < mids.length; i++) {
			ManageInfo mi=managerInfoDao.findById(mids[i]);
			managerInfoDao.delete(mi);
		}
	}
}