package com.callor.memo.service;

import java.util.List;

import com.callor.memo.model.ApiFoodDTO;
import com.callor.memo.model.UserFoodVO;

public interface ApiFoodService{

	public String queryService(String hs, String search);
	public List<ApiFoodDTO> apiList();
	
	public String queryString();
	public List<ApiFoodDTO> getFoodItems();
//	public List<ApiDTO> findByLocation(String queryString, String search);
	public List<ApiFoodDTO> findByCat(List<ApiFoodDTO> apiList, String search);
	public List<ApiFoodDTO> random(List<ApiFoodDTO> foods);
	public List<UserFoodVO> findByMyCat(String search);
}
