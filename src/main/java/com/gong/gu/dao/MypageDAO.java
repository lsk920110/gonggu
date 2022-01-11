package com.gong.gu.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.gong.gu.dto.MemberDTO;
import com.gong.gu.dto.Order_infoDTO;

public interface MypageDAO {

	ArrayList<Order_infoDTO> orderlist(String loginId);

	ArrayList<HashMap<String, String>> inquirelist(String loginId);

	ArrayList<HashMap<String, String>> requirelist(String loginId);

	String login_temp(String id, String pw);

	MemberDTO myprofile(String loginId);

}
