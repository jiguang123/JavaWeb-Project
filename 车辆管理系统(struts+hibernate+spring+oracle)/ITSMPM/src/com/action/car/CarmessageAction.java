package com.action.car;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.car.CarService;
//���ã���ѯ���г�����Ϣ
public class CarmessageAction extends ActionSupport {

	private CarService carService;
	private List message;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		List l=new ArrayList();
		l=carService.getCarbstbAll();
		setMessage(l);
		return SUCCESS;
	}
	public CarService getCarService() {
		return carService;
	}
	public void setCarService(CarService carService) {
		this.carService = carService;
	}
	public List getMessage() {
		return message;
	}
	public void setMessage(List message) {
		this.message = message;
	}

}
