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

// 부산 명소 api 
public class ApiPlaceDTO {
	
	@JsonProperty("UC_SEQ")
	private Long UC_SEQ;
	
	@JsonProperty("MAIN_TITLE")
	private String MAIN_TITLE;
	
	@JsonProperty("GUGUN_NM")
	private String GUGUN_NM;
	
	@JsonProperty("ADDR1")
	private String ADDR1;
	
	@JsonProperty("HOMEPAGE_URL")
	private String HOMEPAGE_URL;
	
	@JsonProperty("TRFC_INFO")
	private String TRFC_INFO;
	
	@JsonProperty("USAGE_DAY")
	private String USAGE_DAY;
	
	@JsonProperty("HLDY_INFO")
	private String HLDY_INFO;
	
	@JsonProperty("USAGE_DAY_WEEK_AND_TIME")
	private String USAGE_DAY_WEEK_AND_TIME;
	
	@JsonProperty("USAGE_AMOUNT")
	private String USAGE_AMOUNT;
	
	@JsonProperty("MIDDLE_SIZE_RM1")
	private String MIDDLE_SIZE_RM1;
	
	@JsonProperty("MAIN_IMG_THUMB")
	private String MAIN_IMG_THUMB;
	
	@JsonProperty("ITEMCNTNTS")
	private String ITEMCNTNTS;

}
