package com.callor.memo.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.ToString;

@ToString
public class GetFoodKr {
	
	@JsonProperty("header")
	public Header header;
	
	@JsonProperty("item")
	public List<ApiFoodDTO> item;
	
	@ToString
	public class Header {
		public String code; //": "00",
		public String message; //": "NORMAL_CODE"
	}
	
}
