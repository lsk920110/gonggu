package com.gong.gu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gong.gu.dao.AdminDAO;

@Service
public class AdminService {
	@Autowired AdminDAO dao;

}
