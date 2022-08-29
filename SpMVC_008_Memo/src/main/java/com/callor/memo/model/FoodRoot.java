package com.callor.memo.model;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.ToString;

@ToString
public class FoodRoot {

	@JsonProperty("getFoodKr")
	public GetFoodKr getFoodKr;
	
}
