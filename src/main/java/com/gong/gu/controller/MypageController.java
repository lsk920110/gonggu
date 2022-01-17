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
	public String home(Model model, HttpSession session) { 
		logger.info("헬로우 JSP");
		String page = "redirect:/";
		if(session.getAttribute("loginId") != null) {
			page = "redirect:/myorderList";
		}
	
		return page; 
		
	}
	
	@RequestMapping(value = "/myorderList", method = RequestMethod.GET)
	public String myorderList(Model model, HttpSession session) { 
		logger.info("myorderList 요청");
		String loginId = (String)session.getAttribute("loginId");
		String page = "/";
		if(loginId != null) {
			ArrayList<HashMap<String, String>> orderList = service.orderlist(loginId);
			model.addAttribute("orderList", orderList);	
			page = "myorderList";
		}
		return page; 
		
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
	public String orderDetail(Model model, @RequestParam String order_no, @RequestParam String frompage ,HttpSession session) { 
		logger.info("{} 주문번호 상세 요청",order_no);
		

		
		String loginId = (String) session.getAttribute("loginId"); 
		HashMap<String,String> orderdetail = service.orderDetail(order_no,loginId);
		model.addAttribute("orderdetail",orderdetail);
		model.addAttribute("frompage",frompage);
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
	 
	 
	 	//메인페이지에서 로그인페이지로 연결
		@RequestMapping(value = "/loginMain", method = RequestMethod.GET)
		public String loginMain(Model model) {
			logger.info("login page 이동");
			return "login";
		}
		
		
		//공구상세 -> 공구신청버튼 -> 주문자정보확인
		@RequestMapping(value = "/orderConfirmPage", method = RequestMethod.GET)
		public String orderConfirmPage(Model model, HttpSession session) {
			logger.info("orderConfirmPage 이동");
			//구매수량
			String order_quantity = "15";			
			//board_no (공구게시글)
			int board_no = 49;
			//sessionId
			String loginId = (String) session.getAttribute("loginId");
			HashMap<String, String> confirminfo = service.orderConfirmPage(board_no,loginId);
			confirminfo.put("order_quantity", order_quantity);
			logger.info("모델에 태우기 전 마지막 확인 {}",confirminfo);
			model.addAttribute("confirminfo",confirminfo);
			
			return "orderConfirm";
		}		
		
		
	 	//주문요청 -> DB저장 -> detail 페이지로 연결
		@RequestMapping(value = "/orderRequest", method = RequestMethod.GET)
		public String orderRequest(Model model, @RequestParam HashMap<String, String> params, HttpSession session) {
			logger.info("주문신청 중입니다.(DB로) {}",params);
			String loginId = (String) session.getAttribute("loginId");
			Order_infoDTO orderDTO = new Order_infoDTO();
			orderDTO = service.orderrequest(params,loginId);
			model.addAttribute("order_no",orderDTO.getOrder_no());
			model.addAttribute("loginId",loginId);
			model.addAttribute("frompage","groupbuy_detail");
			
			return "redirect:/orderDetail";
		}
		
		
		@RequestMapping(value = "/groupbuy_detail", method = RequestMethod.GET)
		public String groupbuy_detail(Model model, @RequestParam HashMap<String, String> params, HttpSession session) {
			logger.info("임시 공구 detail입니다.");
			
			return "groupbuy_detail_temp";
		}	
		
		
		
		@RequestMapping(value = "/emailPage", method = RequestMethod.GET)
		public String emailPage(Model model) {
			logger.info("email입니다.");
			
			return "emailPage";
		}		

		
		
		
		@RequestMapping(value="/overlayemail" , method = RequestMethod.GET)
		@ResponseBody
		public HashMap<String, Object> overlayemail(@RequestParam String email) {
			logger.info("email 중복조회 : {}",email);
			HashMap<String, Object> emailIdentify = service.emailIdentify(email);
			return emailIdentify;
		}
		
		
		@RequestMapping(value="/profileupdate" , method = RequestMethod.GET)
		@ResponseBody
		public HashMap<String, Object> profileupdate(@RequestParam HashMap<String, String> userupdate) {
			logger.info("프로필 업데이트 요청을 받았습니다. {}",userupdate);
			return service.profileUpdate(userupdate);		
		}
		
		
		@RequestMapping(value = "/adminuserlist", method = RequestMethod.GET)
		public String adminuserlist(Model model) {
			logger.info("adminuserlist 입니다.");

			model.addAttribute("adminuserlist",service.adminuserlist());
			
			
			return "adminuserlist";
		}		
		
}
