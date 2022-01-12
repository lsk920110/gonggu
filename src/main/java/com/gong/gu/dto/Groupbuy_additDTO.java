package com.gong.gu.dto;

import java.sql.Date;

public class Groupbuy_additDTO {
	private int board_no;
	private String product_category_name;
	private String groupbuy_state;
	private int groupbuy_target;
	private Date groupbuy_due_date;
	private int groupbuy_unitprice;
	private int groupbuy_max;
	
	

	public void setGroupbuy_max(int groupbuy_max) {
		this.groupbuy_max = groupbuy_max;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getProduct_category_name() {
		return product_category_name;
	}
	public void setProduct_category_name(String product_category_name) {
		this.product_category_name = product_category_name;
	}
	public String getGroupbuy_state() {
		return groupbuy_state;
	}
	public void setGroupbuy_state(String groupbuy_state) {
		this.groupbuy_state = groupbuy_state;
	}
	public int getGroupbuy_target() {
		return groupbuy_target;
	}
	public void setGroupbuy_target(int groupbuy_target) {
		this.groupbuy_target = groupbuy_target;
	}
	public Date getGroupbuy_due_date() {
		return groupbuy_due_date;
	}
	public void setGroupbuy_due_date(Date groupbuy_due_date) {
		this.groupbuy_due_date = groupbuy_due_date;
	}
	public int getGroupbuy_unitprice() {
		return groupbuy_unitprice;
	}
	public void setGroupbuy_unitprice(int groupbuy_unitprice) {
		this.groupbuy_unitprice = groupbuy_unitprice;
	}
	
	public int getGroupbuy_max() {
		return groupbuy_max;
	}
	
	
	
}
