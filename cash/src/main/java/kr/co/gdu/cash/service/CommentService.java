package kr.co.gdu.cash.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CommentMapper;
import kr.co.gdu.cash.vo.Comment;

@Service
@Transactional
public class CommentService {
	@Autowired CommentMapper commentMapper;	// 매퍼주입
	
	// 댓글 내용 삽일
	public int insertComment(Comment comment) {
		return commentMapper.insertComment(comment);
	}
	// 댓글 내용 조회
	public List<Comment> selectCommentList(int noticeId) {
		return commentMapper.selectCommentList(noticeId);
	}
	// 하나의 댓글 내용 삭제
	public int deleteCommentOne(int commentId) {
		return commentMapper.deleteCommentOne(commentId);
	}
	// 모든 댓글 내용 삭제
	public int deleteCommentAll(int noticeId) {
		return commentMapper.deleteCommentAll(noticeId);
	}
}
