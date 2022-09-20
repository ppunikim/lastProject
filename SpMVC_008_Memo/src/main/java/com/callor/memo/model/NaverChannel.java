package com.callor.memo.model;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;

import lombok.ToString;

@ToString
@JacksonXmlRootElement(localName = "rss")
public class NaverChannel {
	
	@JacksonXmlProperty(localName = "channel")
	public NaverXMLParent channel;

}
