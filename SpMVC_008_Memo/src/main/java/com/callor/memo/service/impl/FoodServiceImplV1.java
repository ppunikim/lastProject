package com.callor.memo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.callor.memo.config.QualifierConfig;
import com.callor.memo.model.UserFoodVO;
import com.callor.memo.persistance.FoodDao;
import com.callor.memo.service.FoodService;

@Service(QualifierConfig.SERVICE.USER_FOOD1)
public class FoodServiceImplV1 implements FoodService{

	
	private final FoodDao apiDao;
	public FoodServiceImplV1(FoodDao apiDao) {
		this.apiDao = apiDao;
	}

	@Autowired
	@Override
	public void create_food_table() {
		apiDao.create_food_table();
	}

	@Override
	public List<UserFoodVO> selectAll() {
		return apiDao.selectAll();
	}

	@Override
	public List<UserFoodVO> findByGugun(String gugun_nm) {
		return apiDao.findByGugun(gugun_nm);
	}


	@Override
	public UserFoodVO findById(Long uc_seq) {
		return apiDao.findById(uc_seq);
	}

	@Override
	public int insert(UserFoodVO vo) {
		vo.setUsercheck("1");
		apiDao.insert(vo);
		return 0;
	}

	@Override
	public int update(UserFoodVO vo) {
		apiDao.update(vo);
		return 0;
	}

	@Override
	public int delete(Long uc_seq) {
		apiDao.delete(uc_seq);
		return 0;
	}


}
