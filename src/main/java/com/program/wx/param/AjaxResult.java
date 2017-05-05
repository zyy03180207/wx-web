package com.program.wx.param;

import com.alibaba.fastjson.JSONObject;

public class AjaxResult extends JSONObject {
	private static final long serialVersionUID = 1L;
	public AjaxResult(){
		this.setMesg("");
		this.setSucc(false);
	}
	public boolean isSucc() {
		return this.getBoolean("succ");
	}
	public void setSucc(boolean succ) {
		this.put("succ", succ);
	}
	public String getMesg() {
		return this.getString("mesg");
	}
	public void setMesg(String mesg) {
		this.put("mesg", mesg);
	}
	public void setData(JSONObject data) {
		this.put("data", data);
	}
	public void setPage(JSONObject page) {
		this.put("page", page);
	}
	
	public void setHmac(String hmac) {
		this.put("hmac", hmac);
	}
	public String getHmac(String hmac) {
		return this.getString("hmac");
	}
	
	/**
	 * 回应类型，只允许在拦截器位置进行使用
	 * @param type
	 */
	public void setType(String type) {
		this.put("type", type);
	}
	public String getType(String type) {
		return this.getString("type");
	}
}
