package com.callor.memo.model;

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
public class ApiVO {

	private String main_title;
	private String gugun_nm; 		//구군
	private String place;
	private String cntct_tel;
	private String title; 
	private String subtitle;
	private String addr1;
	private String homepage_url;
	private String usage_day_week_and_time;	//운영시간 및 시간
	private String rprsntv_menu;	//대표메뉴
	private String main_img_normal;
	private String main_img_thumb;
	private String itemcntnts;		//상세내용

}
