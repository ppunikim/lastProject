package com.callor.memo.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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

@Slf4j
@Controller
public class HomeController {

	private final ApiFoodService apiFoodService;
	private final ApiPlaceService apiPlaceService;
	private final FoodService foodService;

	public HomeController(@Qualifier(QualifierConfig.SERVICE.API_FOOD1) ApiFoodService apiFoodService,
			@Qualifier(QualifierConfig.SERVICE.API_PLACE1) ApiPlaceService apiPlaceService,
			@Qualifier(QualifierConfig.SERVICE.USER_FOOD1) FoodService foodService) {
		this.apiFoodService = apiFoodService;
		this.apiPlaceService = apiPlaceService;
		this.foodService = foodService;
	}

	@RequestMapping(value = "/")
	public String home() {
		return "home";
	}

	@RequestMapping(value = "/api/home", method = RequestMethod.GET)
	public String api_home(HttpSession session) {

		List<ApiFoodDTO> foods = apiFoodService.getFoodItems();
		session.setAttribute("fullApi", foods);

		List<ApiPlaceDTO> placeList = apiPlaceService.getPlaceItems();
		session.setAttribute("fullPlace", placeList);

		return "dosung/home";
	}

// json 타입으로 받아오는 방법
//	@ResponseBody
//	@RequestMapping(value="/api/json", method=RequestMethod.GET, produces = "application/json;charset=UTF-8")
//	public List<ApiDTO> json() {
//		String queryString = apiServiceQuery.queryString();
//		List<ApiDTO> foods = apiServiceQuery.getFoodItems(queryString);
//		return foods;
//	}

	// 검색창을 위한 코드
	@RequestMapping(value = "/api/search", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public String api(Model model, String search, String cat, HttpSession session) {

		if(cat.equals("Place")) {
			ArrayList<ApiPlaceDTO> placeallList = (ArrayList<ApiPlaceDTO>) session.getAttribute("fullPlace");
			List<ApiPlaceDTO> apiPlaceLists = apiPlaceService.findByCat(placeallList, search);
			model.addAttribute("apiPlace", apiPlaceLists);
			return "dosung/api-place";
		} else if(cat.equals("Food")) {
			List<ApiFoodDTO> foods = apiFoodService.getFoodItems();
			
			List<ApiFoodDTO> apiFoodLists = apiFoodService.findByCat(foods, search); // api 중에서 검색한 결과 리스트
			
			List<UserFoodVO> myLists = apiFoodService.findByMyCat(search); // db 에서 검색한 결과 리스트
			apiFoodLists.addAll(0,myLists);
			
			model.addAttribute("apiFood", apiFoodLists);
//			model.addAttribute("food", myLists);
			return "api/api-food";
		}
 		
		return "redirect:/api/api-home";
	}

	
	
	// 지도 페이지
	@RequestMapping(value = "/api/map", method = RequestMethod.GET)
	public String map() {
		return "api/api-map";
	}

	/*
	 * 맛집 페이지
	 */
	// home 화면 보여주기
	@RequestMapping(value = "/api/food", method = RequestMethod.GET)
	public String api(Model model, HttpSession session, Principal principal) {
		if (principal == null) {
			return "redirect:/";
		}
		
		List<ApiFoodDTO> foods = apiFoodService.getFoodItems();

		//List<ApiFoodDTO> foods = apiFoodService.getFoodItems(queryString);
		List<UserFoodVO> myfoods = foodService.selectAll();
		//session.setAttribute("fullApi", foods);
		
		foods.addAll(0,myfoods);
		model.addAttribute("apiFood", foods);

		return "api/api-food";
	}


	// 자세히 보기 코드
	@RequestMapping(value = "/api/{UC_SEQ}/api-detail", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String api_look(Model model, @PathVariable("UC_SEQ") Long seq, HttpSession session) {

		ArrayList<ApiFoodDTO> allList = (ArrayList<ApiFoodDTO>) session.getAttribute("fullApi");
		for (ApiFoodDTO apiDTO : allList) {
			if (apiDTO.getUC_SEQ().equals(seq)) {
				model.addAttribute("VO", apiDTO);
			}
		}
		return "api/api-food-detail";
	}
	@RequestMapping(value = "/api/{UC_SEQ}/api-place-detail", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String api_place_look(Model model, @PathVariable("UC_SEQ") Long seq, HttpSession session) {

		ArrayList<ApiPlaceDTO> allList = (ArrayList<ApiPlaceDTO>) session.getAttribute("fullPlace");
		for (ApiPlaceDTO apiDTO : allList) {
			if (apiDTO.getUC_SEQ().equals(seq)) {
				model.addAttribute("DETAIL", apiDTO);
			}
		}
		return "api/api-place-detail";
	}

	// CRUD 구현하기

	// 추가화면 home 보여주기
	@RequestMapping(value = "/api/my-food-add", method = RequestMethod.GET)
	public String add() {
		return "api/my-food-detail";
	}

	// 전송 button 누를 때
	@RequestMapping(value = "/api/my-food-add", method = RequestMethod.POST)
	public String add(@ModelAttribute("foodVO") UserFoodVO foodVO) {
		foodService.insert(foodVO);
		return "redirect:/api/food";
	}

	// 내가 추가한 것의 detail 보기
	@RequestMapping(value = "/api/{UC_SEQ}/my-update", method = RequestMethod.GET)
	public String look(Model model, @PathVariable("UC_SEQ") Long seq) {
		UserFoodVO foodVO = foodService.findById(seq);
		model.addAttribute("VO", foodVO);
		return "api/my-food-detail";
	}

	// 수정하기
	@RequestMapping(value = "/api/{UC_SEQ}/my-update", method = RequestMethod.POST)
	public String update(UserFoodVO foodVO) {
		foodService.update(foodVO);
		return "redirect:/api/food";
	}

	// 삭제하기
	@RequestMapping(value = "/api/{UC_SEQ}/my-delete", method = RequestMethod.GET)
	public String delete(@PathVariable("UC_SEQ") Long seq) {
		foodService.delete(seq);
		return "redirect:/api/food";
	}

	/*
	 * 부산 명소 controller
	 */

	@RequestMapping(value = "/api/place", method = RequestMethod.GET)
	public String place(HttpSession session, Model model, Principal principal) {

		// 로그인 되지 않았다면 로그인 페이지로 돌아가라.
		if (principal == null) {
			return "redirect:/";
		}
		/* 조도성주석
		 * // json type 의 데이터를 쓰기 편하게 List 에 담기 List<ApiPlaceDTO> placeList =
		 * apiPlaceService.getPlaceItems();
		 * 
		 */		
		
		// 조도성주석 후 추가한 코드
		ArrayList<ApiPlaceDTO> placeList = (ArrayList<ApiPlaceDTO>) session.getAttribute("fullPlace");
		
		
		
		// 랜덤값을 담을 리스트 만들기
		List<ApiPlaceDTO> ranList = new ArrayList<>();

		// 계속 재시작 되는 것을 방지하기 위해 세션에 담기
		// session.setAttribute("AllPlace", placeList);

		for (int i = 0; i < 2; i++) {

			// 데이터 전체 숫자를 랜덤값으로 만들어서 intRan 에 담기
			int intRan = (int) (Math.random() * placeList.size());

			// 랜덤값이 된 숫자의 전체 VO를 List에 담기
			ranList.add(placeList.get(intRan));
		}
//		log.debug("랜덤값 {}", ranList);
		// 가져온 데이터를 랜덤으로 가져오기
		/*
		 * for(ApiPlaceDTO placeDTO : placeList) {
		 * 
		 * }
		 */

		// jsp 에 담기 위해 model 에 담기(랜덤값 리스트로 담기)
		model.addAttribute("PLACE", ranList);

		/* 조도성주석
		 * return "api/api-place"; 
		 */
		
		return "dosung/api-place";

	}

	@RequestMapping(value = "/api/{UC_SEQ}/place-detail", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public String placeDetail(@PathVariable("UC_SEQ") Long seq, HttpSession session, Model model,
			Principal principal) {

		// 로그인 정보 풀리면 데이터가 null값 들어와서 해주는 것
		if (principal == null) {
			return "redirect:/";
		}

		ArrayList<ApiPlaceDTO> placeList = (ArrayList<ApiPlaceDTO>) session.getAttribute("fullPlace");
		// 세션에 담은 전체 리스트를 get 하기(불러오기)
		/*
		 * : 다음부터는 굳이 2중 빈 공간 만들지 말자. //빈 List 만들기 List<ApiPlaceDTO> apiPlaceList = new
		 * ArrayList<>(); //전체 리스트를 하나하나씩 뜯어보기 for(ApiPlaceDTO placeDTO : placeList) {
		 * //만약 한개씩 뜯어본 데이터의 seq 값이 같다면 if(placeDTO.getUC_SEQ().equals(seq)) { //빈 List에
		 * 주가 apiPlaceList.add(placeDTO); } } log.debug("새로 추가된 데이터{}",apiPlaceList);
		 * //추가된 데이터를 jsp 로 보여주기 위해 model 에 담기 model.addAttribute("DETAIL",
		 * apiPlaceList); //이러면 jsp 에서 forEach 해야만 오류나지않고 가져올 수 있음 : 이 코드는 굳이 새로운 리스트와
		 * 새로운 VO 를 만들어서 리스트에 넣은 것을 VO에 또 넣는 방식이다.
		 */
		for (ApiPlaceDTO apiPlace : placeList) {
			if (apiPlace.getUC_SEQ().equals(seq)) {
				model.addAttribute("apiPlace", apiPlace);
			}
		}
		// 이렇게 코드 짜는 이유는, 짜피 UC_SEQ 값은 1개일 것이기 때문에 굳이 List를 안만들어도 된다.

		return "api/api-place-detail";
	}// end placeDetail

}// end class
