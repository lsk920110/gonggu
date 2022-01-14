package com.gong.gu.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gong.gu.service.RequestBoardService;


//요청게시판 관련

@Controller
public class RequestBoardController {
	
	@Autowired RequestBoardService service;

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	
	// 요청글쓰기 페이지 요청
	 @RequestMapping(value = "/reqwriteForm", method = RequestMethod.GET) 
	 public String ReqwriteForm(Model model) { 
		 logger.info("요청글쓰기 페이지 요청"); 
		 return "reqwriteForm";
	 }
	 

	 
	 
	 
}
