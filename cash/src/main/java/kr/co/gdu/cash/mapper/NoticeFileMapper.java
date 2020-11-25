package kr.co.gdu.cash.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Noticefile;

@Mapper
public interface NoticeFileMapper {
	int insertNoticeFile(Noticefile noticefile);	// 공지 파일 입력
	int deleteFile(int noticeId);	// 공지 삭제시 해당 아이디로 파일들 삭제
	int modifyFile(int noticefileId);	// 삭제를 위한 파일업데이트
	List<String> selectfileName(int noticefileId);	// 삭제를 위한 파일이름 조회(noticefileId: 하나의 파일만 삭제)
	List<String> selectfileNameAll(int noticeId);	// noticeId: 모든 파일 삭제를 위함
}
