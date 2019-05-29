package com.internousdev.leo.action;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.leo.dao.CartInfoDAO;
import com.internousdev.leo.dto.CartInfoDTO;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteCartAction extends ActionSupport implements SessionAware {
	private int totalPrice;
	private List<CartInfoDTO> cartInfoDTOList;
	private Collection<String> checkList;
	private Map<String,Object>session;

	public String execute(){
		if(session.isEmpty()){
			return "sessionTimeout";
		}

		String result = ERROR;
		CartInfoDAO cartInfoDAO = new CartInfoDAO();
		int count = 0;
		String userId = null;
		if(session.containsKey("userId")){
			userId = String.valueOf(session.get("userId"));
		}else{
			userId = String.valueOf(session.get("tempUserId"));
		}

		for(String productId:checkList){
			count += cartInfoDAO.deleteCartInfo(productId, userId);
		}
		if(count == checkList.size()){
			cartInfoDTOList = cartInfoDAO.selectCartInfoList(userId);
			totalPrice = cartInfoDAO.totalPrice(userId);

			result = SUCCESS;
		}
		return result;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Collection<String> getCheckList() {
		return checkList;
	}

	public void setCheckList(Collection<String> checkList) {
		this.checkList = checkList;
	}

	public List<CartInfoDTO> getCartInfoDTOList() {
		return cartInfoDTOList;
	}

	public void setCartInfoDTOList(List<CartInfoDTO> cartInfoDTOList) {
		this.cartInfoDTOList = cartInfoDTOList;
	}
	public void setSession(Map<String,Object>session){
		this.session=session;
	}

}
