package com.gong.gu.dto;

import java.sql.Date;

public class BoardDTO {
	private int board_no;
	private String user_id;
	private String board_title;
	private String board_content;
	private Date board_date;
	private int bHit;
	private String board_exposure;
	private String board_active;
	private String board_name;
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	public String getBoard_exposure() {
		return board_exposure;
	}
	public void setBoard_exposure(String board_exposure) {
		this.board_exposure = board_exposure;
	}
	public String getBoard_active() {
		return board_active;
	}
	public void setBoard_active(String board_active) {
		this.board_active = board_active;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	
	
	
}
