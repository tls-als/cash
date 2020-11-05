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
	
	// 차후 수정: 리스트가 중복
	public Map<String, Object> getNoticeListAndInOutList() {
		//System.out.println("service:"+noticeMapper.selectLatesNoticeList().get(0));
		List<Notice> noticeList = noticeMapper.selectLatesNoticeList();
		List<Map<String, Object>> inOutList = cashbookMapper.selectCashInOutList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeList", noticeList);
		map.put("inOutList", inOutList);
		return map;
	}
	
	public List<Notice> getNoticeList() {
		
		return noticeMapper.selectLatesNoticeList();
	}
}
