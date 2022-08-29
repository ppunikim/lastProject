package com.callor.memo.service.impl;

import com.callor.memo.service.LambdaService;

public class LambdaServiceText {

	public static void main(String[] args) {
		
		
	/*  Java 8 에서 상요하는 functional interface라는 개념
	 *  LamdaService interface 에 한 개의 method만 존재할 경우, 별도의 class를 선언하지 않고, 
	 *  직접 Lamda코드를 사용해 객체를 생성해, 생성된 객체의 mehtod를 사용할 수 있다. 
	 */
	LambdaService lService = (nation, name, num) -> {
			return nation + name + num;
		};
		String result = lService.getObject("뿌니","귀여워",100);
		System.out.println(result);
		
		
		
		
	}//end main
}//end class
