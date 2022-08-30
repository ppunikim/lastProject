package com.callor.memo.persistance;

import java.util.List;

import com.callor.memo.model.ApiVO;

public interface ApiDao extends GenericDao<ApiVO, String>{

	public void create_food_table();
	public List<ApiVO> findByGugun(String gugun_nm);	
}
