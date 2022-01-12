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

import com.gong.gu.service.GroupBuyBoardService;


//공구게시판

@Controller
public class GroupBuyBoardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired GroupBuyBoardService service;
	
	//공구게시판 글쓰기 페이지
	 @RequestMapping(value = "/groupbuywriteForm", method = RequestMethod.GET) 
	 public String groupbuywriteForm(Model model) { 
		 logger.info("공구게시판 글쓰기 페이지 요청");
		 return "groupBuyWrite";
	}
	
	
	//공구게시판 작성완료
	@RequestMapping(value = "/groupbuywrite", method = RequestMethod.POST)
	public String groupbuywrite(Model model, MultipartFile[] photos,
			@RequestParam HashMap<String, String> params) {
		

		logger.info("글쓰기 작성 요청 : {}",params);
		logger.info("업로드 할 파일 수 : {}",photos.length);

		return service.groupbuywrite(photos,params); //상세보기로 가야하는데 마이바티스에서 내가 방금 insert한 특정 idx를 가져오게 할것임.
		//서비스에있는 write메서드 호출, 업로드한 파일과 전달한 parameter를 보낸다.
	}
	 
	
}
