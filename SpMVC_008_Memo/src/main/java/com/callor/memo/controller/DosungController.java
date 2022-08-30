package com.callor.memo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping(value="/dosung")
@Slf4j
public class DosungController {
	
	@RequestMapping(value= {"/",""}, method=RequestMethod.GET)
	public String home() {
		
		return "dosung/home";
	}

}
