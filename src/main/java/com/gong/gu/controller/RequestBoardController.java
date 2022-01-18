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
import org.springframework.web.multipart.MultipartFile;

import com.gong.gu.dto.BoardDTO;
import com.gong.gu.dto.PhotoDTO;
import com.gong.gu.service.RequestBoardService;


//요청게시판 관련

@Controller
public class RequestBoardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired RequestBoardService service;
	


	
	// 요청글쓰기 페이지 요청
	 @RequestMapping(value = "/reqwriteForm", method = RequestMethod.GET) 
	 public String ReqwriteForm(Model model , HttpSession session) { 
		 logger.info("요청글쓰기 페이지 요청");
		 String page = "redirect:/RequestBoardlist";
		 if(session.getAttribute("loginId") != null) {
			 page = "reqwriteForm";
		 }
		 
		 return page;
	 }
	 
	 
	// 요청글쓰기 요청
	 @RequestMapping(value = "/reqwrite", method = RequestMethod.POST) 
	 public String reqwrite(Model model, MultipartFile[] photos, 
			@RequestParam HashMap<String, String> params) { 
		 logger.info("요청글쓰기 요청 : {}", params);
		 logger.info("업로드 할 파일의 수 : {}",photos.length);
		 return service.reqwrite(photos,params);
		}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	 
	
	 
/*	 
	 //요청글 리스트
	 @RequestMapping(value = "/RequestBoardlist", method = RequestMethod.GET)
	 public String InquireBoardlist(Model model) {		
		 logger.info("list 요청");
		 
		 ArrayList<BoardDTO> list = service.list();
		logger.info("글의 수 : {}",list.size());
		model.addAttribute("size", list.size());
		model.addAttribute("list", list);		
		return "RequestBoardlist";
		
	}
*/		
	 
	//2. 요청글 리스트
     @RequestMapping(value = "/RequestBoardlist", method = RequestMethod.GET)
     public String RequestBoardlist(Model model) {      
        logger.info("요청글 list 요청");
        
        ArrayList<HashMap<String, String>> RequestList = service.RequestList();
         logger.info("글의 수 : {}",RequestList.size());
         model.addAttribute("size", RequestList.size());//왜 넣으신 거지??
         model.addAttribute("RequestList", RequestList);  
       return "RequestBoardlist";
       
    }
	 
		
		//요청글 상세보기
		
		@RequestMapping(value = "/RequestBoardDetail", method = RequestMethod.GET)
		public String RequestBoardDetail(Model model, @RequestParam String board_no) {		
			logger.info("detail 요청 : {}",board_no);
			
			BoardDTO dto = service.detail(board_no);
			logger.info("dto : {}",dto.getBoard_content());
			model.addAttribute("info", dto);
			
			ArrayList<PhotoDTO> photos = service.photolist(board_no);
			logger.info("사진수 : {}", photos.size());
			model.addAttribute("photos", photos);
			return "RequestBoardDetail";
		}		
		
		// 요청글 비노출
		
		@RequestMapping(value = "/RequestBoardexposure", method = RequestMethod.GET)
		public String RequestBoardexposure(Model model, @RequestParam String board_no) {		
			logger.info("비노출 요청 : {}",board_no);		
			service.exposure(board_no);		
			return "redirect:/RequestBoardlist";
		}
	 

	 
	 

	 
	 
	 
}
