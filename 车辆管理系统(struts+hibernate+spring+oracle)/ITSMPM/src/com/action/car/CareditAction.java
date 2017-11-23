package com.action.car;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.java.Carbstb;
import com.java.Comps;
import com.java.Roletb;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.car.CarService;
import com.service.intface.user.UserService;

public class CareditAction extends ActionSupport {
	private CarService carService;
	private List message;
	public List getMessage() {
		return message;
	}
	public void setMessage(List message) {
		this.message = message;
	}
 
	public String dele() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re = ServletActionContext.getRequest();
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		Carbstb pr=new Carbstb();
		if(a[0]!=null){
			pr = carService.QueryCarbstbById(new Long(a[0].trim()));
			carService.deleCarbstb(pr);
			addActionMessage("����ɾ���ɹ���");
		}else{
			System.out.println("ɾ����Ϣʱ����");
		}
		return SUCCESS;
	}
	public String edit() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re = ServletActionContext.getRequest();
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		Carbstb pr=new Carbstb();
		if(a[0]!=null){
			pr = carService.QueryCarbstbById(new Long(a[0].trim()));
		} 
		List l=new ArrayList();
		l.add(pr);
		setMessage(l);
		return SUCCESS;
	}
	public CarService getCarService() {
		return carService;
	}
	public void setCarService(CarService carService) {
		this.carService = carService;
	}
	  
}
