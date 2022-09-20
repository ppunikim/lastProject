package com.callor.memo.service.impl;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Collections;
import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.callor.memo.config.NaverConfig;
import com.callor.memo.config.QualifierConfig;
import com.callor.memo.model.NaverChannel;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;


@Service(QualifierConfig.SERVICE.NAVER_V2)
public class NaverServiceImplV2 extends NaverServiceImplV1{
	
	@Override
	public List<Object> getNaver(String queryString) {

		URI restURI = null; //역할은 같지만, url보다 향상된 버젼이다.
		try {
			restURI = new URI(queryString);
		} catch (URISyntaxException e) {
			return null;
		}
		
		//springframework 버젼으로 가져오기
		//http 프로토콜에 보안 정보를 세팅하여 네이버로 전송할 준비를 하는 것이다.
		HttpHeaders headers = new HttpHeaders();
		headers.set(NaverConfig.HEADER.ID, NaverConfig.NAVER_CLIENT_ID);
		headers.set(NaverConfig.HEADER.SEC, NaverConfig.NAVER_CLIENT_SEC);
		
		headers.setAccept(Collections.singletonList(MediaType.APPLICATION_XML)); 
		
		RestTemplate restTemp = new RestTemplate();
		HttpEntity<String> entity = new HttpEntity<String>("parameter", headers); //보내는 용도
		
			ResponseEntity<String> resData = null;	//받는 용도
			resData = restTemp.exchange(
						restURI,
						HttpMethod.GET,
						entity,
						String.class );
			
			System.out.println("=".repeat(100));
			System.out.println(resData.getBody());
			System.out.println("=".repeat(100));
			
			String xmlString = resData.getBody();
			
			//xml 문자열을 VO 객체로 변환하기 위한 도구
			ObjectMapper xmlMapper = new XmlMapper();
			try {
				NaverChannel naverChannel = xmlMapper.readValue(xmlString, NaverChannel.class);
				
				return naverChannel.channel.item;
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			
			//return resData.getBody().items;
			return null;
			
	}//end getNaverBook

}
