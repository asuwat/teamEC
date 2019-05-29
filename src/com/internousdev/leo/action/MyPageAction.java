package com.internousdev.leo.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.leo.dao.UserInfoDAO;
import com.internousdev.leo.dto.UserInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class MyPageAction extends ActionSupport implements SessionAware {

	private UserInfoDTO userInfoDTO;
	private Map<String,Object>session;

	public String execute(){
		if(session.isEmpty()) {
			return "sessionTimeout";
		}
		UserInfoDAO dao = new UserInfoDAO();

		userInfoDTO = dao.getUserInfo(String.valueOf(session.get("userId")));

		if(userInfoDTO.getUserId() == null) {
			userInfoDTO = null;
		}
		return SUCCESS;
	}
	public UserInfoDTO getUserInfoDTO() {
		return userInfoDTO;
	}
	public void setUserInfoDTO(UserInfoDTO userInfoDTO) {
		this.userInfoDTO = userInfoDTO;
	}
	public Map<String,Object> getSession(){
		return session;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}