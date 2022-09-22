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
@Builder
@ToString
public class BookVO {
	
	public String b_isbn;	//PK 번호
	public String b_title;	//도서 제목
	public String b_img;	//도서 이미지
	public String b_author; //저자
	public String b_price;  //도서 가격
	public String b_publisher; //출판사 정보
	public String b_content;//도서 내용
	public String b_evol;	//한줄 도서평
	
	
	
	
}
