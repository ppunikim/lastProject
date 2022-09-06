package com.callor.memo.service.impl;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpRequest;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpRequestExecution;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.callor.memo.config.ApiConfig;
import com.callor.memo.config.QualifierConfig;
import com.callor.memo.model.ApiFoodDTO;
import com.callor.memo.model.FoodRoot;
import com.callor.memo.model.GetFoodKr;
import com.callor.memo.model.UserFoodVO;
import com.callor.memo.service.ApiFoodService;
import com.callor.memo.service.FoodService;
import com.callor.memo.utils.HttpRequestIntercepterV1;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service(QualifierConfig.SERVICE.API_FOOD1)
public class ApiFoodServiceImplV1 implements ApiFoodService {

	@Autowired
	private FoodService foodService;

	public String queryService(String hs, String search) {

		String queryString = ApiConfig.API_URL;
		String encodeSearch = null;
		try {
			encodeSearch = URLEncoder.encode(search, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			log.debug("URL Encoding 오류발생");
			return null;
		}
		queryString += String.format("?serviceKey=%s", encodeSearch);
		return queryString;
	}// end queryService

	public List<ApiFoodDTO> apiList() {
		URI uri = null;
		try {
			uri = new URI(ApiConfig.API_FULL_URL);
		} catch (URISyntaxException e) {
			log.debug("URI 오류");
		}

		HttpHeaders headers = new HttpHeaders();

		headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
		HttpEntity<String> entity = new HttpEntity<String>("parameter", headers);

		ResponseEntity<GetFoodKr> fooddata = null;
		RestTemplate resTemp = new RestTemplate();

		fooddata = resTemp.exchange(uri, HttpMethod.GET, entity, GetFoodKr.class);

//		return fooddata.getBody().getFoodKr.item;
		return null;
	}

	@Override
	public String queryString() {

		String queryString = ApiConfig.API_URL;
		String encodeParams = null;

		try {
			encodeParams = "?" + URLEncoder.encode("serviceKey", "UTF-8");
			encodeParams += "=" + ApiConfig.API_CLIENT_ID;

			encodeParams += "&" + URLEncoder.encode("pageNo", "UTF-8");
			encodeParams += "=1";

			encodeParams += "&" + URLEncoder.encode("numOfRows", "UTF-8");
			encodeParams += "=150";

			encodeParams += "&" + URLEncoder.encode("resultType", "UTF-8");
			encodeParams += "=json";

		} catch (UnsupportedEncodingException e) {
			log.debug("encode 오류");
		}

		queryString += encodeParams;
		return queryString;
	}

	@Override
	public List<ApiFoodDTO> getFoodItems() {
		URI foodRestURI = null;

		try {
			foodRestURI = new URI(queryString());
		} catch (URISyntaxException e) {
			log.debug("foodURI 불러오기 실패");
		}

		// API에 JSON type으로 데이터를 요청하기 위한 헤더생성
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

		HttpEntity<String> headerEntity = new HttpEntity<String>("parameter", headers);

		// 데이터를 수신하여 VO로 변환하기 위한 객체 선언
		RestTemplate restTemp = new RestTemplate();

		// String type으로 데이터를 수신하여 어떤 형태롤 데이터가 수신되는지 확인하기 위한 절차
		ResponseEntity<String> resString = null;
		resString = restTemp.exchange(foodRestURI, HttpMethod.GET, headerEntity, String.class);

		// 수신된 데이터를 VO 변환하기
		ResponseEntity<FoodRoot> resFoodObject = null;

		// 인터페이스를 사용하여 객체 생성하기
		// 한번만 사용하고 버릴 클래스, 인스턴스 만들기
		ClientHttpRequestInterceptor httpIntercept = new ClientHttpRequestInterceptor() {
			@Override
			public ClientHttpResponse intercept(HttpRequest request, byte[] body, ClientHttpRequestExecution execution)
					throws IOException {
				return null;
			}
		}; // 방법 1. 변수 있음

		restTemp.getInterceptors().add(new ClientHttpRequestInterceptor() {
			@Override
			public ClientHttpResponse intercept(HttpRequest request, byte[] body, ClientHttpRequestExecution execution)
					throws IOException {
				ClientHttpResponse response = execution.execute(request, body);
				response.getHeaders().setContentType(MediaType.APPLICATION_JSON);
				return response;
			}
		}); // 방법 2. 변수 없음(익명 클래스): 일회용 클래스이다.

		// 인터페이스를 사용하여 Lamda 코드로 주입하기.
		restTemp.getInterceptors().add((request, body, execution) -> {
			ClientHttpResponse response = execution.execute(request, body);
			response.getHeaders().setContentType(MediaType.APPLICATION_JSON);
			return response;
		}); // 방법 3. java1.8 이상에서 사용하는 Lamda 코드, 무명 클래스이다.

		// RestTemplate 이 수신한 데이터를중간에 가로채서 조작하기
		restTemp.getInterceptors().add(new HttpRequestIntercepterV1());

		resFoodObject = restTemp.exchange(foodRestURI, HttpMethod.GET, headerEntity, FoodRoot.class);
		return resFoodObject.getBody().getFoodKr.item;
	}

//	@Override
//	public List<ApiDTO> findByLocation(String queryString, String search) {
//
//		List<ApiDTO> apiList = getFoodItems(queryString()); // 전체데이터
//		List<ApiDTO> resultList = new ArrayList<ApiDTO>(); // 빈 데이터
//		for (ApiDTO vo : apiList) { // 한개씩 데이터를 따져보면
//			if (vo.getGUGUN_NM().contains(search)) { // 구군 값이 입력값과 같으면
//				resultList.add(vo); // 값을 빈 데이터에 추가
//			} 
//		}
//		return resultList;
//	}

	public List<ApiFoodDTO> findByCat(List<ApiFoodDTO> foods, String search) {

		List<ApiFoodDTO> resultList = new ArrayList<>();
		for (ApiFoodDTO vo : foods) {
			if (vo.getGUGUN_NM().contains(search)) {
				resultList.add(vo);
				continue;
			} else if (vo.getITEMCNTNTS().contains(search)) {
				resultList.add(vo);
				continue;
			} else if (vo.getMAIN_TITLE().contains(search)) {
				resultList.add(vo);
			}
		}
		return resultList;
	}

	@Override
	public List<UserFoodVO> findByMyCat(String search) {
		List<UserFoodVO> foodList = foodService.selectAll();
		List<UserFoodVO> blankList = new ArrayList<>();
		for (UserFoodVO userVO : foodList) {
			if (userVO.getGUGUN_NM().contains(search)) {
				blankList.add(userVO);

			} else if (userVO.getMAIN_TITLE().contains(search)) {
				blankList.add(userVO);
			}
		}
		return blankList;
	}

	// 검색한 값이 없다면 예외처리를 해줘야 한다.
	public List<ApiFoodDTO> random(List<ApiFoodDTO> foods) {

		// 랜덤값을 담을 빈 공간의 리스트 만들기
		List<ApiFoodDTO> ranList = new ArrayList<>();

		// 2개의 랜덤값 번호를 intRan 에 담기
		int intRan1 = (int) (Math.random() * foods.size());
		int intRan2 = (int) (Math.random() * foods.size());

		// 빈 공간에 추가하는데, 기존 데이터에서 랜덤값을 가져온다.
		ranList.add(foods.get(intRan1));
		ranList.add(foods.get(intRan2));
		return ranList;
	}

}// end class
