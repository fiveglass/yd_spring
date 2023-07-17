package com.yedam.web.borad.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BoardVO {
	private int bno;
	private String title;
	private String contents;
	private String writer;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updateDate;
	private String image;
}
