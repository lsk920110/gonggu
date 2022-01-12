package com.gong.gu.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gong.gu.dao.MypageDAO;
import com.gong.gu.dto.MemberDTO;
import com.gong.gu.dto.Order_infoDTO;

@Service
public class MypageService {
	@Autowired MypageDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public ArrayList<HashMap<String, String>> orderlist(String loginId) {
		
		ArrayList<HashMap<String, String>> orderList = dao.orderlist(loginId);
		
		
		return orderList;
	}

	public ArrayList<HashMap<String, String>> inquirelist(String loginId) {
		logger.info("서비스에 문의글요청");
		ArrayList<HashMap<String, String>> inquireList = dao.inquirelist(loginId);
		
		return inquireList;
	}

	public ArrayList<HashMap<String, String>> requirelist(String loginId) {
		logger.info("요청게시판관련글 불러와!!");
		ArrayList<HashMap<String, String>> requireList = dao.requirelist(loginId);

		return requireList;
	}

	public String login_temp(String id, String pw) {
		String loginId = dao.login_temp(id,pw);
		
		return loginId;
	}

	public MemberDTO myprofile(String loginId) {
		MemberDTO myProfile = dao.myprofile(loginId);

		return myProfile;
	}

	public HashMap<String, String> orderDetail(String order_no, String loginId) {
		
		
		HashMap<String, String> orderdetail = dao.orderDetail(order_no,loginId);
		
		
		return orderdetail;
	}

	public int ordercancel(String order_no) {
		return dao.ordercancel(order_no);

	}
}
