package com.callor.memo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.callor.memo.model.MemoVO;
import com.callor.memo.persistance.MemoDao;
import com.callor.memo.service.FileUpService;
import com.callor.memo.service.MemoService;

@Service
public class MemoServiceImplV1 implements MemoService{
	
	
	@Autowired
	private FileUpService fileUp;
	
	private final MemoDao memoDao;
	public MemoServiceImplV1(MemoDao memoDao, String upLoadFolder) {
		this.memoDao = memoDao;
	}

	
	
	@Autowired
	@Override
	public void create_memo_table() {
		memoDao.create_memo_table();
	}

	@Override
	public List<MemoVO> selectAll() {
		List<MemoVO> memoList = memoDao.selectAll();
		return memoList;
	}

	//	@Override
//	public List<MemoVO> selectAll() {
//		List<MemoVO> memoList = memoDao.selectAll();
//		for(MemoVO memoVO : memoList)  {
//			if(fileUp.fileCheck(memoVO.getM_up_image()) == false) {
//				memoVO.setM_up_image(null);
//			}
//		}
//		return memoList;
//	}

	
	@Override
	public MemoVO findById(Long VO) {
		MemoVO memoVO = memoDao.findById(VO);
		return memoVO;
	}

	@Override
	public int insert(MemoVO vo) {
		int intsert = memoDao.insert(vo);
		return intsert;
	}

	@Override
	public int update(MemoVO vo) {
		int update = memoDao.update(vo);
		return update;
	}

	@Override
	public int delete(Long id) {
		return memoDao.delete(id); 
	}

	@Override
	public List<MemoVO> findByUsername(String username) {
		return memoDao.findByUsername(username);
	}

	@Override
	public int insertAndUpdate(MemoVO memoVO, MultipartFile file) {
		Long m_seq = memoVO.getM_seq();
		if(m_seq != 0) {
			MemoVO updateMemo = memoDao.findById(m_seq);
			String fileName = updateMemo.getM_image();
			if( !fileName.equals(file.getOriginalFilename())) {
				fileUp.fileDelete(updateMemo.getM_up_image());
			}
			String upLoadFileName = fileUp.fileUp(file);
			memoVO.setM_image(file.getOriginalFilename());
			memoVO.setM_up_image(upLoadFileName);
			return memoDao.update(memoVO);
		}
		memoVO.setM_image(file.getOriginalFilename());
		memoVO.setM_up_image(fileUp.fileUp(file));
		return memoDao.insert(memoVO);
	}


}
