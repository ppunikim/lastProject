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
public class DiaryVO {

	private String d_day;
	private String d_mor;
	private String d_aft;
	private String d_din;
	private String d_mwrite;
	private String d_awrite;
	private String d_dwrite;
	private String d_tom;
	private String d_happy;
	private String d_today;
}
