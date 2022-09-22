package com.callor.memo.service;

import java.util.List;

public interface NaverService {

	
	public String queryString(String cat, String search);
	public String getJasonString(String queryString);
	public List<Object> getNaver(String queryString);
	public List<Object> todayNews();
	public List<Object> FindByTitle(String title);
}
