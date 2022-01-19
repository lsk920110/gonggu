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
import com.gong.gu.service.InquireBoardService;



//문의게시판 관련

@Controller
public class InquireBoardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired InquireBoardService service;

	
	//1.문의글쓰기 페이지 요청
	 @RequestMapping(value = "/inqwriteForm", method = RequestMethod.GET) 
	 public String inqwriteForm(Model model , HttpSession session) { 
		 logger.info("문의글쓰기 페이지 요청");
		 String page= "redirect:/inquireBoardList";
		 
		 if(session.getAttribute("loginId") != null) {
			 page = "inqwriteForm";
		 }
		 
		 
		 return page;
	}
	 
	//2.문의글쓰기 요청
	 @RequestMapping(value = "/inqwrite", method = RequestMethod.POST) 
	 public String inqwrite(Model model,
			 @RequestParam HashMap<String, String> params) { 
		 logger.info("문의글쓰기 요청");
		 logger.info("문의글쓰기 요청 : {}", params);

		 return service.inqwrite(params);
	}
	 
	
	 // 문의글 수정페이지 요청
	 @RequestMapping(value = "/inqupdateForm", method = RequestMethod.GET) 
	 public String inqupdateForm(Model model, @RequestParam String board_no) { 
		 logger.info("inqupdateForm : {}",board_no);
		 HashMap<String, String> inqboardetail = service.inqupdateForm(board_no);
		 //ArrayList<PhotoDTO> photolist = service.photolist(board_no);
		 
		 model.addAttribute("inqboardetail",inqboardetail);
		 //model.addAttribute("photolist",photolist);
		 
		 return "inqupdateForm";
	}
	 
	 
	// 문의글 수정 요청
	 @RequestMapping(value = "/inqupdate", method = RequestMethod.POST) 
	 public String inqupdate(Model model, @RequestParam HashMap<String, String> params) { 
		 logger.info("문의글 수정 요청 : {}", params);
		 return service.inqupdate(params);
	}
	 
////////////////////////////////////////////////////////////////////////////////////////////
	
	//1. 문의글 리스트 요청하기
     @RequestMapping(value = "/inquireBoardList", method = RequestMethod.GET)
     public String inquireBoardList(Model model ,  @RequestParam String currpage) {      
        logger.info("문의글 list 요청");
        
        // ArrayList<HashMap<String, String>> InquiryList = service.InquiryList();
        // logger.info("글의 수 : {}",InquiryList.size());
        // model.addAttribute("size", InquiryList.size());//왜 넣으신 거지??
        // model.addAttribute("InquiryList", InquiryList);      
        // return "inquireBoardList";
        
		String page = "/";
		
		int currPage = Integer.parseInt(currpage);	//호출을 요청할 페이지
		logger.info("currpage : {} " , currpage);
		int pagePerCnt = 10; //한 페이지당 몇개씩? 10개씩
		logger.info("pagePerCnt : {} " , pagePerCnt);
			//1.총 패이지 갯수인 range가 필요함
		
			int range = service.list_rangecall(currPage,pagePerCnt);
			logger.info("range : {} " , range);
			//2.리스트가 필요함(10개밖에 안들어있음)
			ArrayList<HashMap<String, String>> listCall = service.list_listCall(currPage,pagePerCnt);
			model.addAttribute("pages",range);
			model.addAttribute("adOrderList",listCall);
			model.addAttribute("nowpage",currpage);
			page = "adminOrderList";			

		return page;
		
	
			
			
			
        
        
     }
	 
	 
/*	 
	 //문의글 리스트
	 @RequestMapping(value = "/inquireBoardList", method = RequestMethod.GET)
	 public String inquireBoardList(Model model) {		
		 logger.info("list 요청");
		 
		ArrayList<BoardDTO> list = service.list();
		logger.info("글의 수 : {}",list.size());
		model.addAttribute("size", list.size());
		model.addAttribute("list", list);		
		return "inquireBoardList";
		
	}
*/		
     
     
     
     
     
     
     
		
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
