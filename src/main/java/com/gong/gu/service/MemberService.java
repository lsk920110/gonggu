package com.gong.gu.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gong.gu.dao.MemberDAO;
import com.gong.gu.dto.MemberDTO;

@Service
public class MemberService {
	@Autowired MemberDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public HashMap<String, Object> overlay(String id) {
		
		logger.info("중복 체크 서비스 도착!!");
		HashMap<String, Object> map = new HashMap<String, Object>();
		String overlayId  = dao.overlay(id);
		logger.info("중복 아아디 여부:{}",overlayId);
		boolean overlay = overlayId == null? false : true;
		map.put("overlay", overlay);
		return map;
	}
	
	public HashMap<String, Object> join(HashMap<String, String> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = dao.join(param);
		map.put("success",row); 
		return map;		
	}

	public int login(String user_id, String user_pw) {
		return dao.login(user_id, user_pw);
	}
	


	
	
}
