package com.gong.gu.dto;

import java.sql.Date;

public class replyDTO {
	private int reply_no;
	private String user_id;
	private int board_no;
	private String reply_commnet;
	private Date reply_date;
	private String reply_del;
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getReply_commnet() {
		return reply_commnet;
	}
	public void setReply_commnet(String reply_commnet) {
		this.reply_commnet = reply_commnet;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	public String getReply_del() {
		return reply_del;
	}
	public void setReply_del(String reply_del) {
		this.reply_del = reply_del;
	}
	
	
	

}
