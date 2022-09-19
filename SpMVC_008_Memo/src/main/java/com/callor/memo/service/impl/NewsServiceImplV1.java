package com.callor.memo.service.impl;

import org.springframework.stereotype.Service;

import com.callor.memo.config.QualifierConfig;
import com.callor.memo.service.NewsService;

@Service(QualifierConfig.SERVICE.NEWS_V1)
public class NewsServiceImplV1 implements NewsService {

	@Override
	public String queryString() {
		return null;
	}

}