/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.struts.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

import com.service.CarmackBusinessService;
import com.struts.form.CarmackTruckInfoForm;
import com.struts.form.CarmackTruckModelForm;

/**
 * MyEclipse Struts Creation date: 08-16-2008
 * 
 * XDoclet definition:
 * 
 * @struts.action
 */
public class CarmackTruckModelAddAction extends Action {
	/*
	 * Generated Methods
	 */
	private CarmackBusinessService bs;

	public CarmackBusinessService getBs() {
		return bs;
	}

	public void setBs(CarmackBusinessService bs) {
		this.bs = bs;
	}

	/**
	 * Method execute
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 * @throws JSONException
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws JSONException {
		// TODO Auto-generated method stub
		// 获取前台传来的数据
		String str = request.getParameter("data");

		JSONTokener jt = new JSONTokener(str);
		JSONArray jarray = new JSONArray(jt);

		//通过循环，将JSONArray中的JSONObject对象装换成ActionForm对象
		for (int i = 0; i < jarray.length(); i++) {
			JSONObject jo = jarray.getJSONObject(i);
			CarmackTruckModelForm tm = new CarmackTruckModelForm();
			tm.setTMID(jo.getString("TMID"));
			tm.setTMName(jo.getString("TMName"));
			tm.setTMWeight(jo.getString("TMWeight"));
			tm.setTMCubage(jo.getString("TMCubage"));
			tm.setTMPassenger(jo.getString("TMPassenger"));

			//判断ActionForm主键值是否为空，如为空执行增加操作，如不为空执行更新操作
			if (tm.getTMID()==null||tm.getTMID().equals("")) {
				bs.getTruckmodelbu().save(tm);
			}else{
				bs.getTruckmodelbu().update(tm);
			}
		}

		return mapping.findForward("TruckModelSorUOK");
	}
}