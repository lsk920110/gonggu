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

import com.gong.gu.service.InquireBoardService;



//문의게시판 관련

@Controller
public class InquireBoardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired InquireBoardService service;

	
	// 문의글쓰기 페이지 요청
	 @RequestMapping(value = "/inqwriteForm", method = RequestMethod.GET) 
	 public String home(Model model) { 
		 logger.info("문의글쓰기 페이지 요청");
		 return "inqwriteForm";
	}
	 
	// 문의글쓰기 요청
	 @RequestMapping(value = "/inqwrite", method = RequestMethod.POST) 
	 public String inqwrite(Model model, MultipartFile[] photos, @RequestParam HashMap<String, String> params) { 
		 logger.info("문의글쓰기 요청 : {}", params);
		 logger.info("업로드 할 파일의 수 : {}",photos.length);
		 return service.inqwrite(photos,params);
	}
	 
	
	 // 문의글 수정페이지 요청
	 @RequestMapping(value = "/inqupdateForm", method = RequestMethod.GET) 
	 public String inqupdateForm(Model model) { 
		 logger.info("문의글 수정페이지 요청");
		 return "inqupdateForm"; 
	}
	 
	 
	// 문의글 수정 요청
	 @RequestMapping(value = "/inqupdate", method = RequestMethod.POST) 
	 public String inqupdate(Model model, MultipartFile[] photos, 
			 @RequestParam HashMap<String, String> params) { 
		 logger.info("문의글 수정 요청 : {}", params);
		 logger.info("업로드 할 파일 : {}",photos);
		 return service.inqupdate(photos,params);
	}
	 

	 
	 
	 
	 
	
	
}
