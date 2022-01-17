package com.gong.gu.controller;


import java.util.HashMap;

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
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired RequestBoardService service;
	


	
	// 요청글쓰기 페이지 요청
	 @RequestMapping(value = "/reqwriteForm", method = RequestMethod.GET) 
	 public String ReqwriteForm(Model model) { 
		 logger.info("요청글쓰기 페이지 요청"); 
		 return "reqwriteForm";
	 }
	 
	 
	// 요청글쓰기 요청
	 @RequestMapping(value = "/reqwrite", method = RequestMethod.POST) 
	 public String inqwrite(Model model, MultipartFile[] photos, 
			 @RequestParam HashMap<String, String> params) { 
		 logger.info("요청글쓰기 요청 : {}", params);
		 logger.info("업로드 할 파일의 수 : {}",photos.length);
		 return service.reqwrite(photos,params);
	}
	
	 
	 
	 
	 

	 
	 
	 
}
