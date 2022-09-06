package com.callor.memo.service.impl;

import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

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
import com.callor.memo.model.ApiPlaceDTO;
import com.callor.memo.model.PlaceRoot;
import com.callor.memo.service.ApiPlaceService;
import com.callor.memo.utils.HttpRequestIntercepterV1;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service(QualifierConfig.SERVICE.API_PLACE1)
public class ApiPlaceServiceImplV1 implements ApiPlaceService {

	@Override
	public List<ApiPlaceDTO> getPlaceItems() {
		URI placeURI = null;
		try {
			placeURI = new URI(ApiConfig.PLACE_ALL_URL);
		} catch (Exception e) {
			log.debug("placeURI 불러오기 실패");
		}
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
		HttpEntity<String> headerEntity = new HttpEntity<String>("parameter", headers);
		RestTemplate restTemp = new RestTemplate();
		ResponseEntity<String> resString = null;
		resString = restTemp.exchange(placeURI, HttpMethod.GET, headerEntity, String.class);
		ResponseEntity<PlaceRoot> resPlaceObject = null;
		ClientHttpRequestInterceptor httpIntercept = new ClientHttpRequestInterceptor() {
			@Override
			public ClientHttpResponse intercept(HttpRequest request, byte[] body, ClientHttpRequestExecution execution)
					throws IOException {
				return null;
			}
		};
		restTemp.getInterceptors().add(new HttpRequestIntercepterV1());
		resPlaceObject = restTemp.exchange(placeURI, HttpMethod.GET, headerEntity, PlaceRoot.class);
		return resPlaceObject.getBody().getAttractionKr.item;

		// 리스트로 보여줄 때, 랜덤으로 들어올 수 있도록 처리해주기

	}// end GetPlaceItems

	@Override
	public List<ApiPlaceDTO> searchPlaces(List<ApiPlaceDTO> placeList, String search) {
		List<ApiPlaceDTO> resultList = new ArrayList<ApiPlaceDTO>();
		for (ApiPlaceDTO dto : placeList) {
			if (dto.getGUGUN_NM().contains(search)) {
				resultList.add(dto);
			}
		}
		return resultList;
	}

	@Override
	public List<ApiPlaceDTO> findByCat(ArrayList<ApiPlaceDTO> placeallList, String search) {
		List<ApiPlaceDTO> placeList = new ArrayList<>();
			for (ApiPlaceDTO place : placeallList) {
				if (place.getGUGUN_NM().contains(search)) {
					placeList.add(place);
					continue;
				} else if (place.getITEMCNTNTS().contains(search)) {
					placeList.add(place);
				} 
			}
		return placeList;
	}

}
