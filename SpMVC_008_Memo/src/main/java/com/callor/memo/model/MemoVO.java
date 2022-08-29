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
public class MemoVO {

	private long m_seq;
	private String m_username;
	private String m_date;
	private String m_time;
	private String m_memo;
	private String m_image;
	private String m_up_image;
	
}
