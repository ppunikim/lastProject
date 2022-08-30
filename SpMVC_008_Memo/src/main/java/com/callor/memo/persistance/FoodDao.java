package com.callor.memo.persistance;

import java.util.List;

import com.callor.memo.model.UserFoodVO;

public interface FoodDao extends GenericDao<UserFoodVO, Long>{

	public void create_food_table();
	public List<UserFoodVO> findByGugun(String gugun_nm);	
}
