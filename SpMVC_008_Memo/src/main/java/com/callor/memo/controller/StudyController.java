package com.callor.memo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="/study")
@Controller
public class StudyController {
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public String home() {
		return "study/s-home";
	}
	
	@RequestMapping(value="/one", method=RequestMethod.GET)
	public String one() {
		return "study/s1";
	}
	@RequestMapping(value="/two", method=RequestMethod.GET)
	public String two() {
		return "study/s2";
	}
	@RequestMapping(value="/three", method=RequestMethod.GET)
	public String three() {
		return "study/s3";
	}
	@RequestMapping(value="/four", method=RequestMethod.GET)
	public String four() {
		return "study/s4";
	}
	@RequestMapping(value="/five", method=RequestMethod.GET)
	public String five() {
		return "study/s5";
	}
	@RequestMapping(value="/six", method=RequestMethod.GET)
	public String six() {
		return "study/s6";
	}
	@RequestMapping(value="/seven", method=RequestMethod.GET)
	public String seven() {
		return "study/s7";
	}
}
