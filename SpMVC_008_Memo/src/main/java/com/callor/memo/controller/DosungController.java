package com.callor.memo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.memo.model.ApiFoodDTO;
import com.callor.memo.service.ApiPlaceService;
import com.callor.memo.service.ApiFoodService;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping(value="/dosung")
@Slf4j
public class DosungController {
	
	private final ApiFoodService apiServiceQuery;
	public DosungController(ApiFoodService apiServiceQuery) {
		this.apiServiceQuery = apiServiceQuery;
	}


	@RequestMapping(value= {"/",""}, method=RequestMethod.GET)
	public String home(HttpSession session) {
String queryString = apiServiceQuery.queryString();
		
		List<ApiFoodDTO> foods = apiServiceQuery.getFoodItems(queryString);
		session.setAttribute("fullApi", foods);
		
		return "dosung/home";
	}
	
	
	@RequestMapping(value="/{title}/result", method=RequestMethod.GET)
	public String result(@PathVariable("title") String title, HttpSession session, Model model) {
		ArrayList<ApiFoodDTO> allList = (ArrayList<ApiFoodDTO>)session.getAttribute("fullApi"); 
		List<ApiFoodDTO> apiLists = apiServiceQuery.findByCat(allList,title,"Place");
		model.addAttribute("api",apiLists);
		
		model.addAttribute("RANDOM", apiServiceQuery.random(allList));
		return "api/api-food";
	}

}
