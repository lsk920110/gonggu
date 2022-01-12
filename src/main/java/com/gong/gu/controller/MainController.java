package com.gong.gu.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gong.gu.service.MainService;

//요청게시판 관련

@Controller
public class MainController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	MainService service;

	

	@RequestMapping(value = "/", method = RequestMethod.GET) public String
	main(Model model) { logger.info("헬로우 JSP");
	
	
	
	
	return "main";
	}


}
