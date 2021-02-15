package kr.co.gdu.cash.restservice;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.restmapper.CashbookRestMapper;


@Service
@Transactional
public class CashbookRestService {
	@Autowired CashbookRestMapper cashbookRestMapper;	// 매퍼 객체 주입
	// 연간 최대 지출/최저 지출 통계
	public Map<String, Object> maxAndMinOutlayByYear(int year, HttpSession session) {
		Map<String, Object> map = new HashedMap<>();
		map.put("year", year);
		map.put("loginId", session.getAttribute("loginId"));
		return cashbookRestMapper.selectMaxAndMinOutlayByYear(map);
	}
	// 연간 최대 수입/최저 수입 통계
	public Map<String, Object> maxAndMinIncomeByYear(int year, HttpSession session) {
		Map<String, Object> map = new HashedMap<>();
		map.put("year", year);
		map.put("loginId", session.getAttribute("loginId"));
		return cashbookRestMapper.selectMaxAndMinIncomeByYear(map);
	}
	// 월별 평균 지출 통계를 받아오는 메서드
	public Map<String, Object> avgOutlaybyMonth(int year, HttpSession session) {
		Map<String, Object> map = new HashedMap<>();
		map.put("year", year);
		map.put("loginId", session.getAttribute("loginId"));
		return cashbookRestMapper.selectAvgOutlayByMonth(map);
	}
	// 월별 평균 수입 통계를 받아오는 메서드
	public Map<String, Object> avgIncomebyMonth(int year, HttpSession session) {
		Map<String, Object> map = new HashedMap<>();
		map.put("year", year);
		map.put("loginId", session.getAttribute("loginId"));
		return cashbookRestMapper.selectAvgIncomeByMonth(map);
	}
	// 월별 지출 통계를 받아오는 메서드
	public Map<String, Object> cashbookOutlayPriceByMonth(int year, HttpSession session) {
		Map<String, Object> map = new HashedMap<>();
		map.put("year", year);
		map.put("loginId", session.getAttribute("loginId"));
		return cashbookRestMapper.selectOutlayPriceByMonth(map);
	}
	// 월별 수입 통계를 받아오는 메서드
	public Map<String, Object> cashbookIncomePriceByMonth(int year, HttpSession session) {
		Map<String, Object> map = new HashedMap<>();
		map.put("year", year);
		map.put("loginId", session.getAttribute("loginId"));
		return cashbookRestMapper.selectIncomePriceByMonth(map);
	}
	// 1년간 수입/지출 합계를 받아오는 메서드
	public Map<String, Object> cashbookTotalPriceByYear(int year, HttpSession session) {
		Map<String, Object> map = new HashedMap<>();
		map.put("year", year);
		map.put("loginId", session.getAttribute("loginId"));
		return cashbookRestMapper.selectTotalPriceByYear(map);	// 쿼리 조회값 반환
	}
}
