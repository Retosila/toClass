package com.bbt.toclass.board.vo;

public class NoticeVO {

	private String notice_id;
	private String notice_sender;
	private String notice_receiver;
	private String notice_receiver_name;
	private String notice_title;
	private String notice_content;
	private String notice_regdate;
	private String notice_moddate;
	
	public String getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_sender() {
		return notice_sender;
	}
	public void setNotice_sender(String notice_sender) {
		this.notice_sender = notice_sender;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_regdate() {
		return notice_regdate;
	}
	public void setNotice_regdate(String notice_regdate) {
		this.notice_regdate = notice_regdate;
	}
	public String getNotice_moddate() {
		return notice_moddate;
	}
	public void setNotice_moddate(String notice_moddate) {
		this.notice_moddate = notice_moddate;
	}
	public String getNotice_receiver() {
		return notice_receiver;
	}
	public void setNotice_receiver(String notice_receiver) {
		this.notice_receiver = notice_receiver;
	}
	public String getNotice_receiver_name() {
		return notice_receiver_name;
	}
	public void setNotice_receiver_name(String notice_receiver_name) {
		this.notice_receiver_name = notice_receiver_name;
	}
	
}
