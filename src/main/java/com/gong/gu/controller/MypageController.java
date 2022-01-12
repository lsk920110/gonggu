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
	

	
	@RequestMapping(value = "/login_temp", method = RequestMethod.GET)
	public String login_temp(Model model, HttpSession session, @RequestParam String id, @RequestParam String pw) { 
		logger.info("로그인 요청");
		String loginId = service.login_temp(id,pw);
		logger.info(loginId);
		session.setAttribute("loginId", loginId);
		model.addAttribute("loginId",loginId);
		return "redirect:/mypage";
	}	
	
//	여기서부터는 임시 컨트롤러 메서드입니다.
	@RequestMapping(value = "/temphome", method = RequestMethod.GET)
	public String loginpage_temp(Model model) { 
		logger.info("myProfile 요청");

		return "temphome"; 	
	}
	
	@RequestMapping(value = "/orderDetail", method = RequestMethod.GET)
	public String orderDetail(Model model, @RequestParam String order_no, HttpSession session) { 
		logger.info("{} 주문번호 상세 요청",order_no);
		

		String loginId = (String) session.getAttribute("loginId");
		HashMap<String, String> orderdetail = service.orderDetail(order_no,loginId);
		
		return "orderDetail"; 	
	}	
	
	
	
	
		
}
