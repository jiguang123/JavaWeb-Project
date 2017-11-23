package com.xaccp.service;

import java.util.List;

import com.xaccp.dao.ComplainInfoDAO;
import com.xaccp.po.ComplainInfo;

public class ComplainInfoService {
	
	private ComplainInfoDAO complainInfodao;

	public ComplainInfoDAO getComplainInfodao() {
		return complainInfodao;
	}

	public void setComplainInfodao(ComplainInfoDAO complainInfodao) {
		this.complainInfodao = complainInfodao;
	}
	
	/**
	 * ��ѯ���е�Ͷ��
	 * @return
	 */
	public List fingAllComplain(){
		return complainInfodao.findAllComplain();
	}
	
	/**
	 * ɾ��
	 * @param ciids
	 */
	public void bulkDeleteComplain(int ...ciids){
		for (int i = 0; i < ciids.length; i++) {
			ComplainInfo ci=complainInfodao.findById(ciids[i]);
			complainInfodao.delete(ci);
		}
	}
	
	/**
	 * ���Ͷ��
	 *
	 */
	public void saveComplain(ComplainInfo ci){
		if(ci!=null){
			complainInfodao.save(ci);
		}
	}
}