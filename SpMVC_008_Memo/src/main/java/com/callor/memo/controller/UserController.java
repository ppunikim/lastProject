package com.callor.memo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.memo.model.UserVO;
import com.callor.memo.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping(value="/user")
@Controller
public class UserController {
	
	
	private UserService userService;
	public UserController(UserService userService) {
		this.userService = userService;
	}

	
	@RequestMapping(value="/join", method =RequestMethod.GET)
	public String join() {
		return "/user/join";
	}
	
	@RequestMapping(value="/join", method =RequestMethod.POST)
	public String join(UserVO userVO) {
		userService.insert(userVO);
		return "redirect:/";
	}
	
	// localhost:8080/context/user/login
	@RequestMapping(value="/login", method =RequestMethod.GET)
	public String login(String error, Model model) {
		model.addAttribute("error",error);
		return null;
	}
	
//	@RequestMapping(value="/login", method=RequestMethod.POST)
//	public String login(UserVO userVO, HttpSession httpSession) {
//		httpSession.setAttribute("USER", userVO);
//		return "redirect:/";
//	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout() {
		return "redirect:/";
	}
	
	@RequestMapping(value="/mypage", method =RequestMethod.GET)
	public String mypage() {
		return "/user/mypage";
	}
	
	
}//end class