package com.callor.memo.service;

import java.util.List;

import com.callor.memo.model.ApiDTO;

public interface ApiService{

	public String queryService(String hs, String search);
	public List<ApiDTO> apiList();
	
	public String queryString();
	public List<ApiDTO> getFoodItems(String queryString);
//	public List<ApiDTO> findByLocation(String queryString, String search);
	public List<ApiDTO> findByCat(String queryString, String search, String cat);
	public List<ApiDTO> random(List<ApiDTO> foods);
}
