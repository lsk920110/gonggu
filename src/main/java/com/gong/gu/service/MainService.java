package com.gong.gu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gong.gu.dao.MainDAO;

@Service
public class MainService {
	@Autowired MainDAO dao;
}
