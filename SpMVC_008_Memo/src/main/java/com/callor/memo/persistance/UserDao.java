package com.callor.memo.persistance;

import java.util.List;

import com.callor.memo.model.AuthorityVO;
import com.callor.memo.model.UserVO;

public interface UserDao extends GenericDao<UserVO, String>{
	
	//tbl_authorities테이블에서 username에 해당하는 ROLE리스트 select하기
	public List<AuthorityVO> select_role(String username);
	
}
