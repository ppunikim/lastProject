package com.callor.memo.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class GetAttractionKr {

	@JsonProperty("item")
	public List<ApiPlaceDTO> item;
}
