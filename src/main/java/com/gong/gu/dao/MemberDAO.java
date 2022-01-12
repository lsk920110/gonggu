package com.gong.gu.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.gong.gu.dto.MemberDTO;

public interface MemberDAO {
	
	String overlay(String user_id);

	int join(HashMap<String, String> param);

	int login(String user_id, String user_pw);

}
