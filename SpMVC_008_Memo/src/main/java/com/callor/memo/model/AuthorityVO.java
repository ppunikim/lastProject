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
public class AuthorityVO {

	private long seq;
	private String username;
	private String authority;
	
}
