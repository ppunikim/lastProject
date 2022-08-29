package com.callor.memo.model;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class ApiDTO {
	// 부산광역시 맛집정보 api를 이용하려한다.
	/* DTO : Data Transfer Object
	 * 역할은 VO와 같다.
	 */

	@JsonProperty("UC_SEQ")
	private String UC_SEQ;	//콘텐츠ID
	
	@JsonProperty("MAIN_TITLE")
	private String MAIN_TITLE;
	
	@JsonProperty("GUGUN_NM")
	private String GUGUN_NM; 		//구군
	
	@JsonProperty("PLACE")
	private String PLACE;
	
	@JsonProperty("CNTCT_TEL")
	private String CNTCT_TEL;
	
	@JsonProperty("TITLE")
	private String TITLE; 
	
	@JsonProperty("SUBTITLE")
	private String SUBTITLE;
	
	@JsonProperty("ADDR1")
	private String ADDR1;
	
	@JsonProperty("HOMEPAGE_URL")
	private String HOMEPAGE_URL;
	
	@JsonProperty("USAGE_DAY_WEEK_AND_TIME")
	private String USAGE_DAY_WEEK_AND_TIME;	//운영시간 및 시간
	
	@JsonProperty("RPRSNTV_MENU")
	private String RPRSNTV_MENU;	//대표메뉴
	
	@JsonProperty("MAIN_IMG_NORMAL")
	private String MAIN_IMG_NORMAL;
	
	@JsonProperty("MAIN_IMG_THUMB")
	private String MAIN_IMG_THUMB;
	
	@JsonProperty("ITEMCNTNTS")
	private String ITEMCNTNTS;		//상세내용

}
