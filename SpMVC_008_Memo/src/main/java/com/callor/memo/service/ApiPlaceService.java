package com.callor.memo.service;

import java.util.List;

import com.callor.memo.model.ApiPlaceDTO;

public interface ApiPlaceService {

	public List<ApiPlaceDTO> getPlaceItems();
	public List<ApiPlaceDTO> searchPlaces(List<ApiPlaceDTO> placeList, String search) ;
}
