package com.gong.gu.controller;


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

import com.gong.gu.service.MemberService;

//로그인,회원가입관련 컨트롤러
@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MemberService service;
	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * home(Model model) { logger.info("헬로우 JSP");
	 * 
	 * return "home"; }
	 */
	///////////////////////////////////////////////
	
	//홈
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("login page 이동");
		return "login";
	}
	
	//회원가입
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm(Model model) {
		logger.info("회원가입 페이지로 이동"); 
		return "joinForm";
	}
	
	//로그인 페이지 
	@RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody 
    public HashMap<String, Object> login(
            @RequestParam String user_id, @RequestParam String user_pw,
            HttpSession session) {
        logger.info("로그인 체크:{} / {}", user_id, user_pw);
        
        int success = service.login(user_id,user_pw);
        logger.info("로그인 성공 여부:{}", success);
        HashMap<String, Object> map 
            = new HashMap<String, Object>();
        
        if (success>0) {
            session.setAttribute("loginId", user_id);
            map.put("loginId", user_id);
        }
        map.put("success", success);    
        return map;
    }

	//로그아웃 
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model, HttpSession session) {
		logger.info("로그아웃 요청"); 
		session.removeAttribute("loginId");
		return "redirect:/";
	}
	//여기 까지 이상무 
	//중복아이디 체크 overlay == id
	@RequestMapping(value = "/overlay", method = RequestMethod.GET)
	@ResponseBody 
	public HashMap<String, Object> overlay(@RequestParam String id) {
		logger.info("중복 아이디 체크:{}",id);
		return service.overlay(id);
	}
	
	//회원가입 
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	@ResponseBody 
	public HashMap<String, Object> join(@RequestParam HashMap<String, String> param) {
		logger.info("회원가입 요청:{}",param);
		return service.join(param);
	}
	
	//아이디 찾기
	@RequestMapping(value = "/idfind", method = RequestMethod.GET)
	public String idfind(Model model) {
		logger.info("idfind page 이동");
		return "idfind";
	}
	
	//비밀번호  찾기 
	@RequestMapping(value = "/pwfind", method = RequestMethod.GET)
	public String pwfind(Model model) {
		logger.info("pwfind page 이동");
		return "pwfind";
	}
	
	//리스트 페이지
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, HttpSession session) {
		logger.info("list.jsp로 이동");
		
		String page = "redirect:/";
		 String loginId = (String) session.getAttribute("loginId");
		if (loginId != null) {
			logger.info("로그인한 아이디:"+loginId);
			page = "list";
		} 
		return page; 

	} 
	
	
	
	
}
