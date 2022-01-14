package com.gong.gu.controller;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gong.gu.service.GroupBuyBoardService;


//공구게시판

@Controller
public class GroupBuyBoardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired GroupBuyBoardService service;
	
	//공구게시판 글쓰기 페이지
	 @RequestMapping(value = "/groupBuyWriteForm", method = RequestMethod.GET) 
	 public String groupBuyWriteForm(Model model) { 
		 logger.info("공구게시판 글쓰기 페이지 요청");
		 return "groupBuyWrite";
	}
	
	
	//공구게시판 작성완료
	@RequestMapping(value = "/groupBuyWrite", method = RequestMethod.POST)
	public String groupBuyWrite(Model model, MultipartFile[] photos,
			@RequestParam HashMap<String, String> params) {
		

		logger.info("글쓰기 작성 요청 : {}",params);
		logger.info("업로드 할 파일 수 : {}",photos.length);

		return service.groupbuywrite(photos,params); //상세보기로 가야하는데 마이바티스에서 내가 방금 insert한 특정 idx를 가져오게 할것임.
		//서비스에있는 write메서드 호출, 업로드한 파일과 전달한 parameter를 보낸다.
	}
	 
	
	//공구게시판 사진 자식창 요청
	 @RequestMapping(value = "/groupBuyPhoto", method = RequestMethod.GET) 
	 public String groupBuyPhoto(Model model) { 
		 logger.info("공구게시판 자식창 요청");
		 return "groupBuyPhoto";
	}
	 
	
	//공구 사진 업로드 요청
	 @RequestMapping(value = "/groupBuyPhotoWrite", method = RequestMethod.POST)
		public String groupBuyPhotoWrite(Model model, MultipartFile[] photos) {
			
			logger.info("업로드 할 파일 수 : {}",photos.length);
			HashMap<String, String> photolist = service.groupbuyPhotowrite(photos);
			logger.info("{}",photolist);
			model.addAttribute("photolist",photolist);
			
			
			return "groupBuyPhoto";
		}
	 
	 
	 //공구 리스트 불러오기	
	 @RequestMapping(value = "/groupBuyList", method = RequestMethod.GET)
		public String myorderList(Model model, HttpSession session) { 
			logger.info("groupBuyList 요청");
			
			//String loginId = (String)session.getAttribute("loginId");
			//logger.info("로그인 아이디 : "+loginId);
			
			String loginId = "admin01";
			if(loginId != null) {
				String wishlist = service.wishlist(loginId);
				logger.info(wishlist);
				model.addAttribute("wishlist", wishlist);
			}
			
			
			ArrayList<HashMap<String, String>> groupBuyList = service.groupBuyList();
			
			model.addAttribute("groupBuyList", groupBuyList);
			
			return "groupBuyList"; 
			
		}
	 
	 
	 
	//카테고리 조회
	@RequestMapping(value = "/categoryCheck", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> categoryCheck(@RequestParam String param) {
		
		logger.info("카테고리 조회 체크:{}",param);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<HashMap<String, String>> groupBuyList = service.categoryCheck(param);		
		
		logger.info("리스트 : {}",groupBuyList);
		
		map.put("list", groupBuyList);
		
		return map;
	}
	
	
}
