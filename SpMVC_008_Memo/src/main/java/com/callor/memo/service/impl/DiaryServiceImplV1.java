package com.callor.memo.service.impl;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.callor.memo.model.DiaryVO;
import com.callor.memo.persistance.DiaryDao;
import com.callor.memo.service.DiaryService;

@Service
public class DiaryServiceImplV1 implements DiaryService{
	
	private final String upLoadFolder;
	private final DiaryDao diaryDao;
	public DiaryServiceImplV1(String upLoadFolder, DiaryDao diaryDao) {
		this.upLoadFolder = upLoadFolder;
		this.diaryDao = diaryDao;
	}
	
	@Autowired
	@Override
	public void create_diary_table() {
		diaryDao.create_diary_table();
	}
	@Override
	public List<DiaryVO> selectAll() {
		List<DiaryVO> diaryList = diaryDao.selectAll();
		return diaryList;
	}
	@Override
	public DiaryVO findById(String d_day) {
		DiaryVO diaryVO = diaryDao.findById(d_day);
		return diaryVO;
	}
	@Override
	public int insert(DiaryVO vo) {
		return diaryDao.insert(vo);
	}
	@Override
	public int update(DiaryVO vo) {
		int update = diaryDao.update(vo);
		return update;
	}
	@Override
	public int delete(String id) {
		int delete = diaryDao.delete(id);
		return delete;
	}
	@Override
	public String fileUp(MultipartFile d_file) throws Exception {
		if(d_file == null) {
			return null;
		}
		File dir = new File(upLoadFolder);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		String fileName = d_file.getOriginalFilename();
		String strUUID = UUID.randomUUID().toString();
		fileName = String.format("%s-%s", strUUID, fileName);
		File upFile = new File(upLoadFolder,fileName);
		d_file.transferTo(upFile);
		return fileName;
	}
	@Override
	public List<DiaryVO> findByAuthor(String username) {
		return diaryDao.findByAuthor(username);
	}


	
	
}
