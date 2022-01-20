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
		 String page = "redirect:/RequestBoardlist?currpage=1&loginYN=N";
		 
		 if(session.getAttribute("loginId") != null) {
			 page = "reqwriteForm";
			 model.addAttribute("loginYN","Y");

		 } else {

		 }
		 
		 return page;
	 }
	 
	 
	// 요청글쓰기 요청
	 @RequestMapping(value = "/reqwrite", method = RequestMethod.POST) 
	 public String reqwrite(Model model, 
			@RequestParam HashMap<String, String> params) { 
		 logger.info("요청글쓰기 요청 : {}");
		 logger.info("요청글쓰기 요청 : {}", params);
		 
		 return service.reqwrite(params);
		}
	 
	 
	 
	 // 요청글 수정페이지 요청
	 @RequestMapping(value = "/requpdateForm", method = RequestMethod.GET) 
	 public String requpdateForm(Model model, @RequestParam String board_no) { 
		 logger.info("requpdateForm : {}",board_no);
		 HashMap<String, String> RequestBoardDetail = service.requpdateForm(board_no);
		 
		 model.addAttribute("RequestBoardDetail", RequestBoardDetail);
		 
		return "requpdateForm";
	}
	 
	 
	 // 요청글 수정 요청
	 @RequestMapping(value = "/requpdate", method = RequestMethod.POST) 
	 public String inqupdate(Model model, @RequestParam HashMap<String, String> params) { 
		 logger.info("문의글 수정 요청 : {}", params);
		 return service.requpdate(params);
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
	     public String RequestBoardlist(Model model , @RequestParam String currpage) {      
	        logger.info("요청글 list 요청");
	        
	        
//	        ArrayList<HashMap<String, String>> RequestList = service.RequestList();
//	        logger.info("글의 수 : {}",RequestList.size());
//	         model.addAttribute("size", RequestList.size());//왜 넣으신 거지??
//	         model.addAttribute("RequestList", RequestList);  
//	         return "RequestBoardlist";
	        
	        String page = "/";
	        int currPage = Integer.parseInt(currpage);	//호출을 요청할 페이지
	        logger.info("currPage 선언");
			int pagePerCnt = 10; //한 페이지당 몇개씩? 10개씩
			
				//1.총 패이지 갯수인 range가 필요함
				int range = service.RequestBoardlist_rangecall(currPage,pagePerCnt);
				
				//2.리스트가 필요함(10개밖에 안들어있음)
				ArrayList<HashMap<String, String>> listCall = service.RequestBoardlist_listCall(currPage,pagePerCnt);
				model.addAttribute("pages",range);
				model.addAttribute("RequestBoardlist",listCall);
				model.addAttribute("nowpage",currpage);
				logger.info("listcall : {}" , listCall);
				logger.info("currPage : {}" , currPage);
				logger.info("pagePerCnt : {} ", pagePerCnt);
				logger.info("range : {} " , range);
				
				page = "RequestBoardlist";			

			return page;
	        
	       
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
			return "redirect:/RequestBoardlist?currpage=1";
		}
	 

	 
	 

	 
	 
	 
}
