package com.callor.memo.persistance;

import java.util.List;

import com.callor.memo.model.DiaryVO;

public interface DiaryDao extends GenericDao<DiaryVO, String>{
	public void create_diary_table();
	public List<DiaryVO> findByAuthor(String username);	
}
