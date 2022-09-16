package com.callor.memo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.callor.memo.model.AuthorityVO;
import com.callor.memo.model.UserVO;
import com.callor.memo.persistance.UserDao;
import com.callor.memo.service.UserService;

@Service
public class UserServiceImplV1 implements UserService{

	@Autowired
	private UserDao userDao;
	
	@Override
	public List<UserVO> selectAll() {
		return userDao.selectAll();
	}

	@Override
	public UserVO findById(String VO) {
		return userDao.findById(VO);
	}

	@Override
	public int insert(UserVO vo) {
		return userDao.insert(vo);

	}

	@Override
	public int update(UserVO vo) {

		return userDao.update(vo);
	}

	@Override
	public int delete(String id) {
		return userDao.delete(id);
	}


	@Override
	public List<AuthorityVO> select_role(String username) {
		return userDao.select_role(username);
	}
 
}
