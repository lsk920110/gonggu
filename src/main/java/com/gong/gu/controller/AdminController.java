package com.gong.gu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gong.gu.service.AdminService;


@Controller
public class AdminController {
   
   private Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @Autowired AdminService service;
   
	@RequestMapping(value = "/MainSlider", method = RequestMethod.GET)
	public String MainSlider(Model model) {
		logger.info("이벤트 슬라이드 불러오기");

		return "MainSlider";
	}
	
	@RequestMapping(value = "/header", method = RequestMethod.GET)
	public String header(Model model, HttpSession session) {
		logger.info("헤더 불러오기");
		String loginId = (String) session.getAttribute("loginId");
		String adminYN = (String) session.getAttribute("admin");
		if(loginId == null) {
			loginId = "unuser";
		} else {
			loginId = "user";
		}
		if( adminYN == null) {
			adminYN = "U";
		}
		model.addAttribute("loginId",loginId);
		model.addAttribute("adminYN",adminYN);
		
		
		return "header";
	}
	
	@RequestMapping(value = "/footer", method = RequestMethod.GET)
	public String footer(Model model) {
		logger.info("풋터 불러오기");

		return "footer";
	}
	

	//1. 전체 주문리스트 요청하기
	@RequestMapping(value = "/adminOrderList", method = RequestMethod.GET)
	public String adminOrderList(Model model, HttpSession session , @RequestParam String currpage) {
		logger.info("전체주문내역 리스트 불러오기");
		
//		ArrayList<HashMap<String, String>> adOrderList = service.adOrderList();
//		logger.info("가져온 리수트 수 : {}", adOrderList.size());
//		model.addAttribute("adOrderList", adOrderList);
		String loginId = (String)session.getAttribute("loginId");
		String page = "/";
		
		int currPage = Integer.parseInt(currpage);	//호출을 요청할 페이지
		int pagePerCnt = 10; //한 페이지당 몇개씩? 10개씩
		
		if(loginId != null) {
			//1.총 패이지 갯수인 range가 필요함
			int range = service.adorder_rangecall(currPage,pagePerCnt);
			//2.리스트가 필요함(10개밖에 안들어있음)
			ArrayList<HashMap<String, String>> listCall = service.adorder_listCall(currPage,pagePerCnt);
			model.addAttribute("pages",range);
			model.addAttribute("adOrderList",listCall);
			model.addAttribute("nowpage",currpage);
			page = "adminOrderList";			
		}

		return page;
	}

	//2. 전체 문의 게시글
	@RequestMapping(value = "/adminInquiry", method = RequestMethod.GET)
	public String adminInquiry(Model model,HttpSession session , @RequestParam String currpage) {
		logger.info("전체 문의 게시글 리스트 불러오기");
		String loginId = (String)session.getAttribute("loginId");		
		String page = "/";
		
		int currPage = Integer.parseInt(currpage);	//호출을 요청할 페이지
		int pagePerCnt = 10; //한 페이지당 몇개씩? 10개씩
		
		if(loginId != null) {
			//1.총 패이지 갯수인 range가 필요함
			int range = service.adInq_rangecall(currPage,pagePerCnt);
			//2.리스트가 필요함(10개밖에 안들어있음)
			ArrayList<HashMap<String, String>> listCall = service.adInqr_listCall(currPage,pagePerCnt);
			model.addAttribute("pages",range);
			model.addAttribute("adInquiry",listCall);
			model.addAttribute("nowpage",currpage);
			page = "adminInquiry";			
		}

		return page;		
		
		
		
//		ArrayList<HashMap<String, String>> adInquiry = service.adInquiry();
//		logger.info("가져온 리수트 수 : {}", adInquiry.size());
//		model.addAttribute("adInquiry", adInquiry);
//		model.addAttribute("length",adInquiry.size());
//		return "adminInquiry";
	}
	
	//3. 전체 요청 게시글
	@RequestMapping(value = "/adminRequire", method = RequestMethod.GET)
	public String adminRequire(Model model , @RequestParam String currpage) {
		logger.info("전체 요청 게시글 리스트 불러오기");
		
		
		int currPage = Integer.parseInt(currpage);	//호출을 요청할 페이지
		int pagePerCnt = 10; //한 페이지당 몇개씩? 10개씩
		
		//1.총 패이지 갯수인 range가 필요함
		int range = service.adReq_rangecall(currPage,pagePerCnt);
		//2.리스트가 필요함(10개밖에 안들어있음)
		ArrayList<HashMap<String, String>> listCall = service.adReq_listCall(currPage,pagePerCnt);
		model.addAttribute("pages",range);
		model.addAttribute("adRequire",listCall);
		model.addAttribute("nowpage",currpage);				
		
		
		
		
//		ArrayList<HashMap<String, String>> adRequire = service.adRequire();
//		logger.info("가져온 리수트 수 : {}", adRequire.size());
//		model.addAttribute("adRequire", adRequire);
//		return "adminRequire";
		return "adminRequire";
	}
	

	//4. 전체 문의 게시글 변경된 데이터 값 보내기
	@RequestMapping(value = "/adminInquiry_update", method = RequestMethod.POST)
	public String adminInquiry_update(Model model,
			 String boardNo,String exposure, String board_active ,String inquiry_answer, String currpage) {
		
		logger.info("boardNo_게시글번호 : {}", boardNo);
		logger.info("exposure_노출여부 : {}", exposure);
		logger.info("boardActive_활성화여부 : {}", board_active);
		logger.info("inquiryAnswer_답변여부 : {}", inquiry_answer);
		List <Map<String,String>> list = new ArrayList<>();	//?
		String [] boardNos = boardNo.split(",");
		String [] board_actives = board_active.split(",");
		String [] inquiry_answers = inquiry_answer.split(",");
		String [] exposures = exposure.split(",");
		
		for(int i= 0; i<boardNos.length; i++){
			Map<String, String> m = new HashMap<String, String>();
			m.put("boardNo", boardNos[i]);
			m.put("exposure", exposures[i]);
			m.put("board_active", board_actives[i]);
			m.put("inquiry_answer", inquiry_answers[i]);
			list.add(m);
		}
		
		for(Map<String,String> m : list){
			logger.info("받아온 값"+m.toString());
			//logger.info("value 값"+m.get("boardNo"));
			String update_boardNo = m.get("boardNo");
			String update_exposure = m.get("exposure");
			String update_board_active = m.get("board_active");
			String update_inquiry_answer = m.get("inquiry_answer");
			
			logger.info(update_boardNo+"/"+update_exposure+"/"+update_board_active+"/"+update_inquiry_answer);
			
			service.adminInquiry_update(update_boardNo, update_exposure, update_board_active, update_inquiry_answer);

		}
		
		return "redirect:/adminInquiry?currpage="+currpage; 
	}
	
	//5. 전체 요청 게시글 변경된 데이터 값 보내기
	@RequestMapping(value = "/adRequire_update", method = RequestMethod.POST)
	public String adRequire_update(Model model, 
			 String boardNo,String exposure, String board_active ,String inquiry_answer, String currpage) {
		
		logger.info("boardNo_게시글번호 : {}", boardNo);
		logger.info("exposure_노출여부 : {}", exposure);
		logger.info("boardActive_활성화여부 : {}", board_active);
		logger.info("inquiryAnswer_답변여부 : {}", inquiry_answer);
		List <Map<String,String>> list = new ArrayList<>();	//?
		String [] boardNos = boardNo.split(",");
		String [] board_actives = board_active.split(",");
		String [] inquiry_answers = inquiry_answer.split(",");
		String [] exposures = exposure.split(",");
		
		for(int i= 0; i<boardNos.length; i++){
			Map<String, String> m = new HashMap<String, String>();
			m.put("boardNo", boardNos[i]);
			m.put("exposure", exposures[i]);
			m.put("board_active", board_actives[i]);
			m.put("inquiry_answer", inquiry_answers[i]);
			list.add(m);
		}
		
		for(Map<String,String> m : list){
			logger.info("받아온 값"+m.toString());
			//logger.info("value 값"+m.get("boardNo"));
			String update_boardNo = m.get("boardNo");
			String update_exposure = m.get("exposure");
			String update_board_active = m.get("board_active");
			String update_inquiry_answer = m.get("inquiry_answer");
			
			logger.info(update_boardNo+"/"+update_exposure+"/"+update_board_active+"/"+update_inquiry_answer);
			
			service.adRequire_update(update_boardNo, update_exposure, update_board_active, update_inquiry_answer);

		}
		
		return "redirect:/adminRequire?currpage="+currpage; 
	}
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   
   
   //5. 전체 공구 게시글
   @RequestMapping(value = "/admingroupbuylist", method = RequestMethod.GET)
   public String admingroupbuylist(Model model, @RequestParam String currpage) {
	    logger.info("전체 공구 게시글 리스트 불러오기");

		int currPage = Integer.parseInt(currpage);	//호출을 요청할 페이지
		int pagePerCnt = 10; //한 페이지당 몇개씩? 10개씩
		
		//1.총 패이지 갯수인 range가 필요함
		int range = service.adgrp_rangecall(currPage,pagePerCnt);
		//2.리스트가 필요함(10개밖에 안들어있음)
		ArrayList<HashMap<String, String>> listCall = service.adgrp_listCall(currPage,pagePerCnt);
		model.addAttribute("pages",range);
		model.addAttribute("adgroupbuylist",listCall);
		model.addAttribute("nowpage",currpage);		
      
      
      
//      ArrayList<HashMap<String, String>> adgroupbuylist = service.adgroupbuylist();
//      logger.info("가져온 리수트 수 : {}", adgroupbuylist.size());
//      model.addAttribute("adgroupbuylist", adgroupbuylist);
      return "admingroupbuylist";
   }

   //6. 전체 공구 게시글 변경된 데이터 값 보내기
   @RequestMapping(value = "/adminGroupbuy_update", method = RequestMethod.POST)
   public String adminGroupbuy_update(Model model, 
		   @RequestParam  HashMap<String, String> params) {
      logger.info("수정요청 요청 : {}", params);

      for(String strKey : params.keySet()) {
    	  if(strKey.equals("currpage")) {
    		  logger.info("currpage 넘어가");
    	  } else {
    		  
    		  String strValue = params.get(strKey);
    		  String exp = strValue.substring(0,1);
    		  String act = strValue.substring(1,2);
    		  String sta = strValue.substring(2);
    		  service.adminGroupbuy_update(strKey,exp,act,sta);
    		  
    		  logger.info(strValue+strKey+'/'+exp+'/'+act+'/'+sta);
    	  }
      }
      

      return "redirect:/admingroupbuylist?currpage="+params.get("currpage");//
   }   
   
   //7.공구취소
   @RequestMapping(value = "/gbcancel", method = RequestMethod.GET)
   public String gbcancel(Model model, 
         @RequestParam String cancelR ,  @RequestParam String board_no) {
      logger.info("{} 게시글 취소요청 {}",board_no, cancelR);
      	int success = service.gbcancel(board_no,cancelR);
      	
      	if(success > 0) {
      		logger.info("{} 취소 완료 , 삭제사유 : {}",board_no,cancelR);      		
      	} else {
      		logger.info("취소 실패");
      	}
      

      return "redirect:/admingroupbuylist";//
   }   
   
   
   //8. 전체 회원 리스트
	@RequestMapping(value = "/adminuserlist", method = RequestMethod.GET)
	public String adminuserlist(Model model) {
		logger.info("adminuserlist 입니다.");

		model.addAttribute("adminuserlist",service.adminuserlist());
		
		
		return "adminuserlist";
	}		
   
}