package com.anhuiU.servlet;

import com.anhuiU.dao.UserDao;

public class CheckUser {
	UserDao ud=new UserDao();


	public String checkUser(String name){
		boolean result;
		String msg;
		
		if(name.equals("")){
			msg="�û�������Ϊ��";
		}
		else{
		
		result=  ud.selectByName(name);
		
		if(result){

			msg= "�û����ѱ�ע��";

		}
		else{

			msg="�û�������ʹ��";
		}
		}
		return msg;
	}


   

}
