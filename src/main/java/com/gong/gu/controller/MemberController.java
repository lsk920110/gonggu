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

import com.gong.gu.service.MemberService;

//로그인,회원가입관련 컨트롤러
@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MemberService service;

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
        HashMap<String, String> success = service.login(user_id,user_pw);     
        logger.info("로그인 성공 여부:{}", success);
        HashMap<String, Object> map = new HashMap<String, Object>();    
        /*if (success != null) {
        	map.put("success", success);    
        } else {
        	map.put("success", "일치하는 정보가 없습니다.");
        }*/ 
        if (success != null) {
        	map.put("success", success); 
        	map.put("loginId",success.get("user_id"));
        	map.put("admin", success.get("user_admin"));     
        	session.setAttribute("loginId", success.get("user_id"));
        	session.setAttribute("admin", success.get("user_admin"));
        logger.info("로그인 아이디 : {} / 관리자여부 : {}",success.get("user_id"),success.get("user_admin"));
        }else{
			/* map.put("success",null);*/
		}
        return map;
	}
	
	//로그아웃 
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model, HttpSession session) {
		logger.info("로그아웃 요청"); 
		session.removeAttribute("loginId");
		session.removeAttribute("admin");
		return "redirect:/";
	}

	//중복아이디 체크 overlay == id
	@RequestMapping(value = "/overlay", method = RequestMethod.GET)
	@ResponseBody 
	public HashMap<String, Object> overlay(@RequestParam String user_id) {
		logger.info("중복 아이디 체크:{}",user_id);
		return service.overlay(user_id);
	}
	
	//회원가입 
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	@ResponseBody 
	public HashMap<String, Object> join(@RequestParam HashMap<String, String> param) {
		logger.info("회원가입 요청:{}",param);
		return service.join(param);
	}
	
	//비밀번호  찾기 
	@RequestMapping(value = "/pwfind", method = RequestMethod.GET)
	public String pwfind(Model model) {
		logger.info("pwfind page 이동");
		return "pwfind";
	}
	
	//리스트 페이지 실제 구현될 페이지가 아님 , 로그아웃 기능 확인을 위해 만듬 
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
	//아이디 찾기 페이지로 
	@RequestMapping(value = "/idfind")
	public String idfind(Model model) {
		logger.info("idfind page 이동");
		return "idfind";
		
	}
	//아이디 찾기 기능 구현 
	@RequestMapping(value = "/findid")
    @ResponseBody 
    public HashMap<String, Object> findid(
            @RequestParam String user_name, @RequestParam String user_birth,
            @RequestParam String user_email, Object user_id, HttpSession session) {
		logger.info("로그인 체크:{} / {}", user_name, user_birth);
		/*이 아래서 부터 진행이 안됨 */
        String success = service.findid(user_name, user_birth, user_email);
        logger.info("아이디 찾기 여부 성공:{}", success);
        HashMap<String, Object> map 
            = new HashMap<String, Object>();
        
        if (success != null) {
        	map.put("success", success);    
        } else {
        	map.put("success", "아이디없음");
        }
        return map;
    }
	
	//비밀번호 찾기 기능 구현 
	@RequestMapping(value = "/findpw")
    @ResponseBody 
    public HashMap<String, Object> findpw(
            @RequestParam String user_id
            ,@RequestParam String user_email, Object user_pw, HttpSession session) {
		logger.info("비밀번호 확인시 필수 정보 체크:{} / {}", user_id, user_email);

        String success = service.findpw(user_id, user_email);
        //success안에는 pw가 들어가 있는 것임 
        logger.info("비밀번호 찾기 여부 성공:{}", success);
        HashMap<String, Object> map 
            = new HashMap<String, Object>();
        
        if (success != null) {
        	map.put("success", success);    
        } else {
        	map.put("success", "일치하는 정보가 없습니다.");
        }
        return map;
    }
	
	
	 
}
