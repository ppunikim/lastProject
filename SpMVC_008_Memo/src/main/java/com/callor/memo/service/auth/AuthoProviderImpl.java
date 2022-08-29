package com.callor.memo.service.auth;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.callor.memo.model.AuthorityVO;
import com.callor.memo.model.UserVO;
import com.callor.memo.persistance.UserDao;

@Service("authenticationProvider")
public class AuthoProviderImpl implements AuthenticationProvider{

	@Autowired
	private UserDao userDao;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
						 //null 값 오류를 방지하기 위해 String으로 형변환해주기
		String username = (String)authentication.getPrincipal();	
		String password = (String)authentication.getCredentials();
		
		UserVO userVO = userDao.findById(username);
		if(userVO == null) {
			throw new UsernameNotFoundException(username + "은 없습니다. 회원가입을 먼저 해주세요.");
		}
		if(! (userVO.getPassword().equals(password))) {
			throw new BadCredentialsException("비밀번호 오류입니다. 다시 입력해주세요.");
		}
		
		List<AuthorityVO> authList = userDao.select_role(username);
		List<GrantedAuthority> grantList = new ArrayList<>();
		for(AuthorityVO vo : authList) {
			grantList.add(new SimpleGrantedAuthority(vo.getAuthority()));
		}
		userVO.setAuthorities(grantList);
		
		//사용자 이름과 비번, 권한리스트로 token 발생
		UsernamePasswordAuthenticationToken token = 
				new UsernamePasswordAuthenticationToken(userVO, null, grantList);
		return token;
	
	}//end

	/*
	 * security에서 인증절차를 수행하기 위해 AuthencicationProvider를 상속받으면서
	 * 반드시 supports를 true로 만들어줘야 한다.
	 */
	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return true;
	}
	
}