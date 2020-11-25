package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeForm;

/*
 * Mapper는 Dao의 역할(쿼리를 조회하고 결과값을 반환함)
 * @Mapper => 인터페이스의 구체화된 클래스 객체(빈)을 생성하여 준다.
 * 여기에선 공지리스트의 결과를 가져올 수 있는 List타입의 메서드만 작성.(xml 마이바티스를 통해 쿼리 조회)
 */
@Mapper
public interface NoticeMapper {
	// 공지사항 수정
	int updateNoticeList(NoticeForm noticeForm);
	// 공지수정을 위한 번호에 따른 공지리스트 가져오기
	Notice selectModifyNoticeList(int noticeId);
	// 공지사항 삭제하기
	int deleteNoticeList(int noticeId);
	// 공지사항 상세보기
	Notice selectDetailNoticeList(int noticeId);
	// index 화면에 최근 공지를 보여주는 메서드(인터페이스-추상메서드)
	List<Notice> selectLatesNoticeList();	// 시작페이지,행의수 매개변수로 담기
	// 공지사항 리스트를 페이지 별로 조회하는 메서드
	List<Notice> selectNoticeListByPage(Map<String, Integer> map);	// 페이징을 위한 시작페이지, 한페이지의 행의수를 받기에 Integer. 검색도 받으려면 Object
	// 공지사항 리스트 전체 수(카운팅)
	int selectNoticeListCount();
	// 공지리스트 추가
	int insertNoticeList(Notice notice); // select를 제외한 모든 값의 리턴은 int(성공한 행의 수를 리턴하기때문)
}
