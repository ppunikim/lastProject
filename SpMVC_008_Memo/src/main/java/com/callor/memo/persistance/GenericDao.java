package com.callor.memo.persistance;

import java.util.List;

public interface GenericDao<VO, PK> {
	
	public List<VO> selectAll();
	public VO findById(PK VO);
	public int insert(VO vo);
	public int update(VO vo);
	public int delete(PK id);
	

}
