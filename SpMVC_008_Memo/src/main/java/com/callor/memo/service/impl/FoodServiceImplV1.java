package com.callor.memo.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.callor.memo.model.ApiVO;
import com.callor.memo.persistance.ApiDao;
import com.callor.memo.service.FoodService;

@Service
public class FoodServiceImplV1 implements FoodService{

	
	private final ApiDao apiDao;
	public FoodServiceImplV1(ApiDao apiDao) {
		this.apiDao = apiDao;
	}


	@Override
	public void create_food_table() {
		apiDao.create_food_table();
	}

	@Override
	public List<ApiVO> selectAll() {
		return apiDao.selectAll();
	}

	@Override
	public List<ApiVO> findByGugun(String gugun_nm) {
		return apiDao.findByGugun(gugun_nm);
	}


	@Override
	public ApiVO findById(String uc_seq) {
		return apiDao.findById(uc_seq);
	}

	@Override
	public int insert(ApiVO vo) {
		apiDao.insert(vo);
		return 0;
	}

	@Override
	public int update(ApiVO vo) {
		apiDao.update(vo);
		return 0;
	}

	@Override
	public int delete(String uc_seq) {
		apiDao.delete(uc_seq);
		return 0;
	}


}
