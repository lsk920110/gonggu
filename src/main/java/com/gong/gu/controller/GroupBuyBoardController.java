package com.gong.gu.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gong.gu.service.GroupBuyBoardService;


//공구게시판

@Controller
public class GroupBuyBoardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired GroupBuyBoardService service;

	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * home(Model model) { logger.info("헬로우 JSP");
	 * 
	 * return "home"; }
	 */
	
}
