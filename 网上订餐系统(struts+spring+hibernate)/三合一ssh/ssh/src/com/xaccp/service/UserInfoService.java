package com.xaccp.service;

import java.util.List;

import com.xaccp.dao.UserInfoDAO;
import com.xaccp.po.UserInfo;

public class UserInfoService {

	private UserInfoDAO userInfoDao;

	public UserInfoDAO getUserInfoDao() {
		return userInfoDao;
	}

	public void setUserInfoDao(UserInfoDAO userInfoDao) {
		this.userInfoDao = userInfoDao;
	}
	
	/**
	 * ��ѯ�����û�
	 * @return
	 */
	public List findAllUser(){
		return userInfoDao.findAllUser();
	}
	
	/**
	 * ���û����û������в�ѯ
	 * @param username
	 * @return
	 */
	public List findUserByUserName(String username){
		return userInfoDao.findByUName(username);
	}
	
	/**
	 * ��id��ѯ�û�
	 * @param uid
	 * @return
	 */
	public UserInfo findUserById(int uid){
		return userInfoDao.findById(uid);
	}
	
	/**
	 * ���û����������ѯ�û�
	 * @param ui
	 * @return
	 */
	public UserInfo findUserByNameAndPass(UserInfo ui){
		List list = userInfoDao.findUserByNameAndPass(ui);
		if(list.size()!=0){
			return (UserInfo) list.get(0);
		}
		return null;
	}
	
	/**
	 * ����û�
	 * @param ui
	 */
	public void addUser(UserInfo ui){
		if(ui!=null){
			userInfoDao.save(ui);
		}
	}
	
	/**
	 * �޸��û�
	 * @param ui
	 */
	public void updateUser(UserInfo ui){
		userInfoDao.merge(ui);
	}
	
	/**
	 * ��ɾ���û�
	 * @param uid
	 */
	public void deleteUser(int uid){
		UserInfo ui=userInfoDao.findById(uid);
		userInfoDao.delete(ui);
	}
	
	/**
	 * ɾ���û�
	 * @param uids
	 */
	public void bukrDeleteUser(int ...uids){
		for (int i = 0; i < uids.length; i++) {
			UserInfo ui=userInfoDao.findById(uids[i]);
			userInfoDao.delete(ui);
		}
	}
}