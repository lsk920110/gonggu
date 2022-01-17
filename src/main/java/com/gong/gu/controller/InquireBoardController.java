package com.gong.gu.controller;


import java.util.ArrayList;
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

import com.gong.gu.dto.BoardDTO;
import com.gong.gu.dto.PhotoDTO;
import com.gong.gu.service.InquireBoardService;



//문의게시판 관련

@Controller
public class InquireBoardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired InquireBoardService service;

	
	// 문의글쓰기 페이지 요청
	 @RequestMapping(value = "/inqwriteForm", method = RequestMethod.GET) 
	 public String inqwriteForm(Model model) { 
		 logger.info("문의글쓰기 페이지 요청");
		 return "inqwriteForm";
	}
	 
	// 문의글쓰기 요청
	 @RequestMapping(value = "/inqwrite", method = RequestMethod.POST) 
	 public String inqwrite(Model model, MultipartFile[] photos, 
			 @RequestParam HashMap<String, String> params) { 
		 logger.info("문의글쓰기 요청 : {}", params);
		 logger.info("업로드 할 파일의 수 : {}",photos.length);
		 return service.inqwrite(photos,params);
	}
	 
	
	 // 문의글 수정페이지 요청
	 @RequestMapping(value = "/inqupdateForm", method = RequestMethod.GET) 
	 public String inqupdateForm(Model model, @RequestParam String board_no) { 
		 logger.info("inqupdateForm : {}",board_no);
		 HashMap<String, String> inqboardetail = service.inqupdateForm(board_no);
		 ArrayList<PhotoDTO> photolist = service.photolist(board_no);
		 
		 model.addAttribute("inqboardetail",inqboardetail);
		 model.addAttribute("photolist",photolist);
		 
		 return "inqupdateForm";
	}
	 
	 
	// 문의글 수정 요청
	 @RequestMapping(value = "/inqupdate", method = RequestMethod.GET) 
	 public String inqupdate(Model model, MultipartFile[] photos, 
			 @RequestParam HashMap<String, String> params) { 
		 logger.info("문의글 수정 요청 : {}", params);
		 logger.info("업로드 할 파일 : {}",photos);
		 return service.inqupdate(photos,params);
	}
	 
	 
	 //문의글 리스트
	 @RequestMapping(value = "/inquireBoardList", method = RequestMethod.GET)
	 public String inquireBoardlist(Model model) {		
		 logger.info("list 요청");
		 
		ArrayList<BoardDTO> list = service.list();
		logger.info("글의 수 : {}",list.size());
		model.addAttribute("size", list.size());
		model.addAttribute("list", list);		
		return "inquireBoardList";
		
	}
		
		
		//문의글 상세보기
		
		@RequestMapping(value = "/inquireBoardDetail", method = RequestMethod.GET)
		public String inquireBoardDetail(Model model, @RequestParam String board_no) {		
			logger.info("detail 요청 : {}",board_no);
			
			BoardDTO dto = service.detail(board_no);
			logger.info("dto : {}",dto.getBoard_content());
			model.addAttribute("info", dto);
			
			ArrayList<PhotoDTO> photos = service.photolist(board_no);
			logger.info("사진수 : {}", photos.size());
			model.addAttribute("photos", photos);
			return "inquireBoardDetail";
		}		
		
		// 문의글 비노출
		
		@RequestMapping(value = "/inquireBoardexposure", method = RequestMethod.GET)
		public String inquireBoardexposure(Model model, @RequestParam String board_no) {		
			logger.info("비노출 요청 : {}",board_no);		
			service.exposure(board_no);		
			return "redirect:/inquireBoardList";
		}
	 

	
	
	
}
