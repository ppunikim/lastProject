package com.callor.memo.persistance;

import com.callor.memo.model.BookVO;

public interface BookDao extends GenericDao<BookVO, String>{
	public void create_book_table();

}
