package com.callor.memo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.callor.memo.model.BookVO;
import com.callor.memo.persistance.BookDao;
import com.callor.memo.service.BookService;

@Service
public class BookServiceImplV1 implements BookService{

	@Autowired
	private BookDao bookDao;

	
	@Autowired
	@Override
	public void create_book_table() {
		bookDao.create_book_table();
	}

	@Override
	public List<BookVO> selectAll() {
		return bookDao.selectAll();
	}

	@Override
	public BookVO findById(String id) {
		return bookDao.findById(id);
	}

	@Override
	public int insert(BookVO vo) {
		bookDao.insert(vo);
		return 0;
	}

	@Override
	public int update(BookVO vo) {
		bookDao.update(vo);
		return 0;
	}

	@Override
	public int delete(String id) {
		bookDao.delete(id);
		return 0;
	}
	
}
