package com.callor.memo.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.callor.memo.model.DiaryVO;
import com.callor.memo.persistance.DiaryDao;

public interface DiaryService extends DiaryDao{

	public String fileUp(MultipartFile file) throws Exception;
	public List<DiaryVO> findByAuthor(String username);
}
