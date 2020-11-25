package kr.co.gdu.cash.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Comment;

@Mapper
public interface CommentMapper {
	List<Comment> selectCommentList(int noticeId);	// 댓글 조회
	int insertComment(Comment comment);	// 댓글 입력
	int deleteCommentOne(int commentId); // 하나의 댓글 삭제
	int deleteCommentAll(int noticeId);	// 모든 댓글 삭제
}
