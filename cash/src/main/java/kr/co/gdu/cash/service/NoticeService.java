package kr.co.gdu.cash.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.vo.Notice;

@Service	// IndexService 클래스의 객체를 하나 만듦
@Transactional
public class NoticeService {
	@Autowired private NoticeMapper noticeMapper;	// 스프링이 갖고 있는 객체 중에 NoticeMapper의 객체를 찾아서 noticeMapper에 주입
	@Autowired private CashbookMapper cashbookMapper;
	// 공지 수정 메서드
	public int setUpdateNoticeList(Notice notice) {	
		return noticeMapper.updateNoticeList(notice);
	}
	// 공지 수정폼에 출력하는 공지리스트
	public List<Notice> getSelectModifyNoticeList(int noticeId) {
		List<Notice> noticeList = noticeMapper.selectModifyNoticeList(noticeId);
		System.out.println(noticeList + "<<= 수정폼을 위한 공지리스트");
		return noticeList;
	}
	// 공지 삭제
	public int setDeleteNoticeList(int noticeId) {
		return noticeMapper.deleteNoticeList(noticeId);
	}
	// 공지사항 상세보기
	public List<Notice> getSelectDetailNoticeList(int noticeId) {
		List<Notice> list = noticeMapper.selectDetailNoticeList(noticeId);
		return list;
	}
	// 공지사항 추가
	public int setinsertNotice(Notice notice) {	// select를 제외한 모든 값의 리턴은 int(성공한 행의 수를 리턴하기때문)
		return noticeMapper.insertNoticeList(notice);
	}
	// 공지리스트 전체 수
	public int getNoticeListCount() {
		int listCnt = noticeMapper.selectNoticeListCount();
		System.out.println("공지리스트 전체 카운팅 데이터: "+ listCnt);
		return listCnt;
	}
	// 공지리스트를 페이지별로 조회한 데이터를 넘김
	public List<Notice> getNoticeListByPage(int currentPage, int rowPerPage) {	// 매개변수로 넘어온 값을 가공처리
		// currentPage,rowPerPage -> beginPage 가공
		int beginRow = (currentPage-1)*rowPerPage;	// 페이지별 시작하는 페이지 변수 beginPage
		System.out.println("NoticeService: getNoticeListByPage: beginPage: "+ beginRow);
		Map<String, Integer> map = new HashMap<String, Integer>();	// beginPage(시작페이지), rowPerPage(한페이지 행수) 값을 넘기기 위함
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		// noticeMapper를 호출
		List<Notice> noticeList = noticeMapper.selectNoticeListByPage(map);	// Mapper의 결과가 List이기에 list로 받음
		System.out.println("NoticeService: getNoticeListByPage: 공지 페이징 리스트: " + noticeList);	// 디버깅
		return noticeList;
	}
	
	// 인덱스화면에서 보여지는 공지사항과 가계부 => 차후 수정: 로그인에서 보여지는 공지리스트와 중복
	public Map<String, Object> getNoticeListAndInOutList() {
		List<Notice> noticeList = noticeMapper.selectLatesNoticeList();	// 공지리스트를(5개) 출력하는 결과값 호출
		List<Map<String, Object>> inOutList = cashbookMapper.selectCashInOutList();	// 가계 정보를 호출	=> 따로 분리 추가 작업 필요
		Map<String, Object> map = new HashMap<String, Object>();	// 공지와 가계 데이터를 담기 위한 map객체 생성
		map.put("noticeList", noticeList);
		map.put("inOutList", inOutList);
		return map;
	}
	
	// 로그인화면에서 보여지는 공지사항
	public List<Notice> getNoticeList() {		
		return noticeMapper.selectLatesNoticeList();
	}
	
}
