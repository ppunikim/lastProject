package com.callor.memo.model;

import java.util.List;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;


public class NaverXMLParent {
	
	public String title;
	public String link;
	public String description;
	public String lastBuildDate;
	public String total;
	public String start;
	public String display;

	@JacksonXmlElementWrapper(localName = "item")
	public List<Object> item ;  
}