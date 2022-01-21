package com.gong.gu.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.gong.gu.dto.MemberDTO;

public interface MemberDAO {
	
	String overlay(String user_id);

	int join(HashMap<String, String> param);

	HashMap<String, String> login(String user_id, String user_pw);
	
	String findid(String user_name, String user_birth, String user_email);

	String findpw(String user_id, String user_email);

	int temppw(String user_id, String user_email, String user_pw);
	   
}
