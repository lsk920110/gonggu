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
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MemberDAO dao;

	public HashMap<String, Object> overlay(String user_id) {
		logger.info("중복 체크 서비스 도착!!");
		HashMap<String, Object> map = new HashMap<String, Object>();
		String overlayId  = dao.overlay(user_id);
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

	public HashMap<String, String> login(String user_id, String user_pw) {
		return dao.login(user_id, user_pw);
	}
	
	public String findid(String user_name, String user_birth, String user_email) {
		return dao.findid(user_name, user_birth, user_email);
	}

	public String findpw(String user_id, String user_email) {
		return dao.findpw(user_id, user_email);
	}

	public int temppw(String user_id, String user_email, String user_pw) {
		return dao.temppw(user_id,user_email,user_pw);

	}

}
