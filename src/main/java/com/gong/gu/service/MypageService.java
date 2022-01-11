package com.gong.gu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gong.gu.dao.MypageDAO;

@Service
public class MypageService {
	@Autowired MypageDAO dao;
}
