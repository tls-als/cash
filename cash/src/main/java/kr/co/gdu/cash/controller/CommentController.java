package kr.co.gdu.cash.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.CommentService;
import kr.co.gdu.cash.vo.Comment;

@Controller
public class CommentController {
	@Autowired CommentService commentService;
	// 하나의 댓글 내용 삭제
	@GetMapping("/admin/deleteComment")
	public String deleteComment(
			@RequestParam(value = "commentId")int commentId,
			@RequestParam(value = "noticeId") int noticeId) {
		commentService.deleteCommentOne(commentId);
		return "redirect:/admin/noticeOne/"+noticeId;
	}
	// 댓글 내용 입력
	@PostMapping("/admin/addComment")
	public String addComment(Comment comment) {	// 커맨드 객체
		System.out.println(comment.getNoticeId() + ": 공지 넘버");
		System.out.println(comment.getCommentContent() + ": 댓글내용");
		commentService.insertComment(comment);
		return "redirect:/admin/noticeOne/"+comment.getNoticeId();
	}
}
