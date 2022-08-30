package com.callor.memo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.memo.model.ApiDTO;
import com.callor.memo.service.ApiPlaceService;
import com.callor.memo.service.ApiService;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping(value="/dosung")
@Slf4j
public class DosungController {
	private final ApiService apiServiceQuery;
	private final ApiPlaceService apiPlaceService;
	public DosungController(ApiService apiServiceQuery, ApiPlaceService apiPlaceService) {
		this.apiServiceQuery = apiServiceQuery;
		this.apiPlaceService = apiPlaceService;
	}
	
	@RequestMapping(value= {"/",""}, method=RequestMethod.GET)
	public String home(HttpSession session) {
String queryString = apiServiceQuery.queryString();
		
		List<ApiDTO> foods = apiServiceQuery.getFoodItems(queryString);
		session.setAttribute("fullApi", foods);
		
		return "dosung/home";
	}
	
	
	@RequestMapping(value="/{title}/result", method=RequestMethod.GET)
	public String result(@PathVariable("title") String title, HttpSession session, Model model, String queryString) {
		List<ApiDTO> apiList = apiServiceQuery.findByCat(queryString,title,"Place");
		model.addAttribute("api",apiList);
		log.debug("도성쓰" + title);
		
		ArrayList<ApiDTO> allList = (ArrayList<ApiDTO>)session.getAttribute("fullApi"); 
		model.addAttribute("RANDOM", apiServiceQuery.random(allList));
		return "api/api-food";
	}

}
