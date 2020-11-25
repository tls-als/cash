package kr.co.gdu.cash.vo;

import lombok.Data;

@Data
public class Comment {
	private int commentId;
	private int noticeId;
	private String commentContent;
}
