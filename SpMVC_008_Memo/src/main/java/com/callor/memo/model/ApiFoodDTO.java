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
public class ApiFoodDTO {
	// 부산광역시 맛집정보 api를 이용하려한다.
	/* DTO : Data Transfer Object
	 * 역할은 VO와 같다.
	 */

	@JsonProperty("UC_SEQ")
	private Long UC_SEQ;	//콘텐츠ID
	
	@JsonProperty("MAIN_TITLE")
	private String MAIN_TITLE;
	
	@JsonProperty("GUGUN_NM")
	private String GUGUN_NM; 		//구군
	
	@JsonProperty("ADDR1")
	private String ADDR1;
	
	@JsonProperty("CNTCT_TEL")
	private String CNTCT_TEL;
	
	@JsonProperty("USAGE_DAY_WEEK_AND_TIME")
	private String USAGE_DAY_WEEK_AND_TIME;	//운영시간 및 시간
	
	@JsonProperty("MAIN_IMG_THUMB")
	private String MAIN_IMG_THUMB;
	
	@JsonProperty("ITEMCNTNTS")
	private String ITEMCNTNTS;		//상세내용
	
	private String usercheck;

}
