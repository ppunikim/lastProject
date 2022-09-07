package com.callor.memo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.memo.config.QualifierConfig;
import com.callor.memo.model.ApiFoodDTO;
import com.callor.memo.model.ApiPlaceDTO;
import com.callor.memo.model.UserFoodVO;
import com.callor.memo.service.ApiFoodService;
import com.callor.memo.service.ApiPlaceService;
import com.callor.memo.service.FoodService;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping(value="/dosung")
@Slf4j
public class DosungController {
	
	private final ApiFoodService apiFoodService;
	private final ApiPlaceService apiPlaceService;
	private final FoodService foodService;
	public DosungController(@Qualifier(QualifierConfig.SERVICE.API_FOOD1) ApiFoodService apiFoodService,
				@Qualifier(QualifierConfig.SERVICE.API_PLACE1) ApiPlaceService apiPlaceService,
				@Qualifier(QualifierConfig.SERVICE.USER_FOOD1) FoodService foodService) {
		this.apiFoodService = apiFoodService;
		this.apiPlaceService = apiPlaceService;
		this.foodService = foodService;
	}



	@RequestMapping(value= {"/",""}, method=RequestMethod.GET)
	public String home(HttpSession session) {
		
		List<ApiFoodDTO> foods = apiFoodService.getFoodItems();
		session.setAttribute("fullApi", foods);
		
		return "dosung/home";
	}
	
	
	@RequestMapping(value="/{title}/result", method=RequestMethod.GET)
	public String result(@PathVariable("title") String title, HttpSession session, Model model) {
		ArrayList<ApiFoodDTO> allList = (ArrayList<ApiFoodDTO>)session.getAttribute("fullApi"); 
		ArrayList<ApiPlaceDTO> allPlaceList = (ArrayList<ApiPlaceDTO>)session.getAttribute("fullPlace"); 
		List<ApiFoodDTO> resultList = apiFoodService.findByCat(allList,title);
		List<ApiPlaceDTO> resultPlaceList = apiPlaceService.searchPlaces(allPlaceList, title);
		model.addAttribute("api",resultList);
		model.addAttribute("apiPlace",resultPlaceList);
		
		return "dosung/result";
	}
	@RequestMapping(value="/{title}/gotofoods", method=RequestMethod.GET)
	public String gotofoods(@PathVariable("title") String title, HttpSession session, Model model) {
		ArrayList<ApiFoodDTO> allList = (ArrayList<ApiFoodDTO>)session.getAttribute("fullApi"); 
		List<ApiFoodDTO> resultList = apiFoodService.findByCat(allList,title);
		List<UserFoodVO> myfoods = foodService.findByGugun(title);
		
		resultList.addAll(0,myfoods);
		model.addAttribute("apiFood", resultList);
		
//		model.addAttribute("RANDOM", apiFoodService.random(allList));
		return "api/api-food";
	}
	
	@RequestMapping(value="/{title}/gotoplaces", method=RequestMethod.GET)
	public String gotoplaces(@PathVariable("title") String title, HttpSession session, Model model) {
		ArrayList<ApiPlaceDTO> allList = (ArrayList<ApiPlaceDTO>)session.getAttribute("fullPlace"); 
		List<ApiPlaceDTO> resultList = apiPlaceService.searchPlaces(allList, title);
		model.addAttribute("apiPlace",resultList);
		
		return "dosung/api-place";
	}

}
