package com.callor.memo.persistance;

import java.util.List;

import com.callor.memo.model.MemoVO;

public interface MemoDao extends GenericDao<MemoVO, Long>{
	public void create_memo_table();
	public List<MemoVO> findByUsername(String username);
	
}
