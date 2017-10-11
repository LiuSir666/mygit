package com.zhiyou100.model;

import java.util.Date; // sql.Date 和 util.Date 可以相互转换

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Coupon {

	private Long id;
	
	private String title;
	
	private String desc;
	
	// 客户端发送给服务器的时间格式
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	// 服务器发送给客户端的时间格式
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Shanghai") 
	private Date startTime;
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Shanghai")
	private Date endTime;
	
	private int number;

	@Override
	public String toString() {
		return "Coupon [id=" + id + ", title=" + title + ", desc=" + desc + ", startTime=" + startTime + ", endTime="
				+ endTime + ", number=" + number + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}
}
