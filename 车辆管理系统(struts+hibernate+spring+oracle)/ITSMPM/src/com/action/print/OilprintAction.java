package com.action.print;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.print.PrintServices;

public class OilprintAction extends ActionSupport {

	//��ʼ�����еĳ����ĳ��ƺ�
	private PrintServices printServices;
	private List carselect;
	private String selectAction;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		selectAction="selectoil";
		carselect=printServices.seCarnmAll();
		return SUCCESS;
	}
	//ά����Ϣ
	public String repar() throws Exception {
		// TODO Auto-generated method stub
		selectAction="selectrepar";
		carselect=printServices.seCarnmAll();
		return SUCCESS;
	}
	//������Ϣ
	public String mam() throws Exception {
		// TODO Auto-generated method stub
		selectAction="selectmainm";
		carselect=printServices.seCarnmAll();
		return SUCCESS;
	}
	//������Ϣ
	public String insrm() throws Exception {
		// TODO Auto-generated method stub
		selectAction="selectinsrm";
		carselect=printServices.seCarnmAll();
		return SUCCESS;
	}
	//�����Ϣ
	public String feesm() throws Exception {
		// TODO Auto-generated method stub
		selectAction="selectfeesm";
		carselect=printServices.seCarnmAll();
		return SUCCESS;
	}
	//�����Ϣ
	public String annum() throws Exception {
		// TODO Auto-generated method stub
		selectAction="selectannum";
		carselect=printServices.seCarnmAll();
		return SUCCESS;
	}
	//Υ����Ϣ
	public String violm() throws Exception {
		// TODO Auto-generated method stub
		selectAction="selectviolm";
		carselect=printServices.seCarnmAll();
		return SUCCESS;
	}
	
	
	
	public String getSelectAction() {
		return selectAction;
	}

	public void setSelectAction(String selectAction) {
		this.selectAction = selectAction;
	}

	public PrintServices getPrintServices() {
		return printServices;
	}
	public void setPrintServices(PrintServices printServices) {
		this.printServices = printServices;
	}
	public List getCarselect() {
		return carselect;
	}
	public void setCarselect(List carselect) {
		this.carselect = carselect;
	}
	

}
