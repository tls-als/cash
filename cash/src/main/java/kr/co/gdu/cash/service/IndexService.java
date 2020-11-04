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
@Transactional	// 트랜잭션 애너테이션
public class IndexService {
	@Autowired private NoticeMapper noticeMapper;	// 스프링이 갖고 있는 객체 중에 NoticeMapper의 객체를 찾아서 IndexService에 주입
	@Autowired private CashbookMapper cashbookMapper;
	
	public Map<String, Object> getNoticeListAndInOutList() {	// 자바에선 하나의 값만 리턴할 수 없기에 Map 이용
		List<Notice> noticeList = noticeMapper.selectLatesNoticeList();	// noticeMapper의 결과값을 가져와서 리스트에 담는다
		List<Map<String, Object>> inOutList = cashbookMapper.selectCashInOutList();	// 수입,지출의 내용을 가져와서 map애 담음
		Map<String, Object> map = new HashMap<String, Object>();	// map객체 생성
		map.put("noticeList", noticeList);	// 각각의 이름으로 Map에 저장
		map.put("inOutList", inOutList);
		return map;	// map 리턴
	}
}
