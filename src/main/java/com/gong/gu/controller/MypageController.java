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
import com.gong.gu.dto.MemberDTO;
import com.gong.gu.dto.Order_infoDTO;
import com.gong.gu.service.MypageService;

//마이페이지 관련

@Controller
public class MypageController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	MypageService service;

	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String home(Model model) { 
		logger.info("헬로우 JSP");
	
		return "redirect:/myorderList"; 
		
	}
	
	@RequestMapping(value = "/myorderList", method = RequestMethod.GET)
	public String myorderList(Model model, HttpSession session) { 
		logger.info("myorderList 요청");
		String loginId = (String)session.getAttribute("loginId");
		
		ArrayList<HashMap<String, String>> orderList = service.orderlist(loginId);
		model.addAttribute("orderList", orderList);
		
		return "myorderList"; 
		
	}
	
	
	@RequestMapping(value = "/myWish", method = RequestMethod.GET)
	public String myWish(Model model,  HttpSession session) { 
		logger.info("myWish 요청");

		return "myWish"; 	
	}

	@RequestMapping(value = "/myRequire", method = RequestMethod.GET)
	public String myRequire(Model model,  HttpSession session) { 
		logger.info("myRequire 요청");
		String loginId = (String)session.getAttribute("loginId");

		ArrayList<HashMap<String, String>> requireList = service.requirelist(loginId);
		model.addAttribute("requireList",requireList);

		return "myRequire"; 	
	}
	 	
	@RequestMapping(value = "/myInquire", method = RequestMethod.GET)
	public String myInquire(Model model,  HttpSession session) { 
		logger.info("myInquire 요청");
		String loginId = (String)session.getAttribute("loginId");

		ArrayList<HashMap<String, String>> inquireList = service.inquirelist(loginId);
		model.addAttribute("inquireList",inquireList);

		return "myInquire"; 	
	}	
	@RequestMapping(value = "/myProfile", method = RequestMethod.GET)
	public String myProfile(Model model,  HttpSession session) { 
		logger.info("myProfile 요청");
		String loginId = (String) session.getAttribute("loginId");
		MemberDTO myProfile = service.myprofile(loginId);
		model.addAttribute("myProfile",myProfile);
		

		return "myProfile"; 	
	}
	

	

	
//	여기서부터는 임시 컨트롤러 메서드입니다.
	@RequestMapping(value = "/temphome", method = RequestMethod.GET)
	public String loginpage_temp(Model model) { 
		logger.info("myProfile 요청");

		return "temphome"; 	
	}
	
	//공구관련 정보이기 때문에, GroupBuy 컨트롤러로 옮겨야함
	@RequestMapping(value = "/orderDetail", method = RequestMethod.GET)
	public String orderDetail(Model model, @RequestParam String order_no, HttpSession session) { 
		logger.info("{} 주문번호 상세 요청",order_no);
		

		
		String loginId = (String) session.getAttribute("loginId"); 
		HashMap<String,String> orderdetail = service.orderDetail(order_no,loginId);
		model.addAttribute("orderdetail",orderdetail);
		model.addAttribute("frompage","myorderList");
		return "orderDetail"; 	
	}
	
	
	@RequestMapping(value = "/orderCancel", method = RequestMethod.GET)
	public String orderCancel(Model model, @RequestParam String order_no) { 
		logger.info("{} order_no 취소요청",order_no);
		int row = service.ordercancel(order_no);
		
		
		return "redirect:/orderDetail?order_no="+order_no; 	
	}
	
	
	//사진등록 관련 임시 요청
	//공구게시판 글쓰기 페이지
	 @RequestMapping(value = "/groupbuywriteForm2", method = RequestMethod.GET) 
	 public String groupbuywriteForm2(Model model) { 
		 logger.info("공구게시판 글쓰기 페이지 요청");
		 return "groupBuyWrite2";
	}
	
	//공구게시판 사진 자식창 요청
	 @RequestMapping(value = "/groupBuyPhoto2", method = RequestMethod.GET) 
	 public String groupBuyPhoto2(Model model) { 
		 logger.info("공구게시판 자식창 요청");
		 HashMap<String, String> photolist = new HashMap<String, String>();
		 model.addAttribute("photolist",photolist);
		 return "groupBuyPhoto2";
	}
	 
	
	//공구 사진 업로드 요청
	 @RequestMapping(value = "/groupbuyPhotowrite2", method = RequestMethod.POST)
		public String groupbuyPhotowrite2(Model model, MultipartFile[] photos) {
			
			logger.info("업로드 할 파일 수 : {}",photos.length);
			ArrayList<String> photolist = service.groupbuyPhotowrite2(photos);
			logger.info("{}",photolist);
			model.addAttribute("photolist",photolist);
			
			
//			return "redirect:/groupbuyPhotowrite2?photolist="+photolist;
			return "groupBuyPhoto2";
		}
	
	 @RequestMapping(value = "/groupbuywrite2", method = RequestMethod.POST) 
	 public String groupbuywrite2(Model model, @RequestParam HashMap<String, String> params, HttpSession session) { 
		 logger.info("공구게시판 글쓰기 페이지 요청");
		 logger.info("{}",params);
		 
		 String board_name = "공구게시판";
		 String loginId = (String) session.getAttribute("loginId");
		 service.groupbuywrite2(loginId, params, board_name);
		 //service.groupbuywrite2();
		 
		 
		 return "/main";
	}	
	 
	 
	 
		@RequestMapping(value = "/loginMain", method = RequestMethod.GET)
		public String loginMain(Model model) {
			logger.info("login page 이동");
			return "login";
		}
		
}
