package com.callor.memo.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Collections;
import java.util.List;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.callor.memo.config.NaverConfig;
import com.callor.memo.config.QualifierConfig;
import com.callor.memo.model.BookDTO;
import com.callor.memo.model.NaverParent;
import com.callor.memo.model.NewsDTO;
import com.callor.memo.service.NaverService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service(QualifierConfig.SERVICE.NAVER_V1)
public class NaverServiceImplV1 implements NaverService{
	
	protected String cat = "BOOK";

	//naver 에 요청할 queryString 생성 method
	public String queryString(String cat, String search) {
		
		this.cat = cat;
		String queryString = NaverConfig.NAVER_BOOK_URL;
		if(cat.equals("NEWS")) {
			queryString = NaverConfig.NAVER_NEWS_URL;
		}
		String encodeSearch = null;
		try {
			encodeSearch = URLEncoder.encode(search, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			log.debug("URL Encoding 오류발생");
			return null;
		}
		// 이 말은 ~~~book.json?query="내가 가져오고자 하는 말" 이라고 출력에 찍히는 것이다.
		queryString += String.format("?query=%s", encodeSearch);

		queryString += String.format("&display=%d", 7);

		return queryString;
	}// end queryString(네이버 api 사용할 준비)

	
	public String getJasonString(String queryString) {
		// java.net.url 을 import
		URL url = null;
		HttpURLConnection httpCon = null;
		/*
		 * queryString(URL, 요청정보)를 사용하여 NetWork통해서 보낼 데이터로 생성하기
		 */
		try {
			url = new URL(queryString);
			httpCon = (HttpURLConnection) url.openConnection(); // 네이버에 연결해라는 이야기
			httpCon.setRequestMethod("GET");
			httpCon.setRequestProperty(NaverConfig.HEADER.ID, NaverConfig.NAVER_CLIENT_ID);
			httpCon.setRequestProperty(NaverConfig.HEADER.SEC, NaverConfig.NAVER_CLIENT_SEC);

			// naver에게 queryString 정보를 보내고 response해줄 데이터가 있는지 먼저 확인.
			int resCode = httpCon.getResponseCode(); // 나에게 줄 데이터가 있는지 물어보는 것.

			InputStreamReader is = null;
			BufferedReader buffer = null;

			// naver가 200코드를 보내면
			if (resCode == 200) {
				// 데이터를 받아올 통로를 연결하기
				is = new InputStreamReader(httpCon.getInputStream()); // 데이터를 보낼 통로를만들어줘 라는 의미
			} else {
				// 만약 200 코드가 아니면 오류메세지를 받을 통로 연결하기.
				is = new InputStreamReader(httpCon.getErrorStream());
			}
			buffer = new BufferedReader(is);

			String retString = "";
			while (true) {
				String line = buffer.readLine();
				if (line == null)
					break;
				retString += line;
			}
			return retString;

		} catch (MalformedURLException e) {
			log.debug("QueryString 문자열 오류");
			return null;
		} catch (IOException e) {
			log.debug("네트워크 연결 x");
			return null;
		}

	}// end getJasonString

	public List<Object> getNaver(String queryString) {
	//return type 이 List 이다. 이것은 네이버로 불러온 값을 담는 것이다.	
		URI restURI = null; // 역할은 같지만, url보다 향상된 버젼이다.
		try {
			restURI = new URI(queryString); //아까만든 queryString 을 URI 형색으로 만듦.
		} catch (URISyntaxException e) {
			log.debug("URI 문법오류");
			return null;
		}

		// springframework 버젼으로 가져오기
		// http 프로토콜에 보안 정보를 세팅하여 네이버로 전송할 준비를 하는 것이다.
		HttpHeaders headers = new HttpHeaders();
		headers.set(NaverConfig.HEADER.ID, NaverConfig.NAVER_CLIENT_ID);
		headers.set(NaverConfig.HEADER.SEC, NaverConfig.NAVER_CLIENT_SEC);

		// JSON데이터 타입으로 받겠다.
		headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON)); // 깨진 데이터를 정상적으로 받기 위한 코드

		RestTemplate restTemp = new RestTemplate();
		HttpEntity<String> entity = new HttpEntity<String>("parameter", headers); // 보내는 용도

		if (cat.equals("BOOK")) {
			ResponseEntity<NaverParent<BookDTO>> resData = null; // 받는 용도
			resData = restTemp.exchange(restURI, HttpMethod.GET, entity,
					new ParameterizedTypeReference<NaverParent<BookDTO>>() {
					});
			return resData.getBody().items;
		} else if (cat.equals("NEWS")) {
			ResponseEntity<NaverParent<NewsDTO>> resData = null; // 받는 용도
			resData = restTemp.exchange(restURI, HttpMethod.GET, entity,
					new ParameterizedTypeReference<NaverParent<NewsDTO>>() {
					});
			return resData.getBody().items;
		}
		return null;
	}// end getNaverBook


	@Override
	public List<Object> FindByTitle(String title) {
		
		return null;
	}
}
