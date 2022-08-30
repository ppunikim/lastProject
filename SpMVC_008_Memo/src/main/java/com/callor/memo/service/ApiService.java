package com.callor.memo.service;

import java.util.List;

import com.callor.memo.model.ApiFoodDTO;

public interface ApiService{

	public String queryService(String hs, String search);
	public List<ApiFoodDTO> apiList();
	
	public String queryString();
	public List<ApiFoodDTO> getFoodItems(String queryString);
//	public List<ApiDTO> findByLocation(String queryString, String search);
	public List<ApiFoodDTO> findByCat(List<ApiFoodDTO> apiList, String search, String cat);
	public List<ApiFoodDTO> random(List<ApiFoodDTO> foods);
}
