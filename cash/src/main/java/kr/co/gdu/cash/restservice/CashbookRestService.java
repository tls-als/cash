package kr.co.gdu.cash.restservice;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.restmapper.CashbookRestMapper;


@Service
@Transactional
public class CashbookRestService {
	@Autowired CashbookRestMapper cashbookRestMapper;	// 매퍼 객체 주입
	// 연간 최대 수입/최저 수입 통계
	public Map<String, Object> maxAndMinIncomeByYear(int year) {
		return cashbookRestMapper.selectMaxAndMinIncomeByYear(year);
	}
	// 월별 평균 지출 통계를 받아오는 메서드
	public Map<String, Object> avgOutlaybyMonth(int year) {
		return cashbookRestMapper.selectAvgOutlayByMonth(year);
	}
	// 월별 평균 수입 통계를 받아오는 메서드
	public Map<String, Object> avgIncomebyMonth(int year) {
		return cashbookRestMapper.selectAvgIncomeByMonth(year);
	}
	// 월별 지출 통계를 받아오는 메서드
	public Map<String, Object> cashbookOutlayPriceByMonth(int year) {
		return cashbookRestMapper.selectOutlayPriceByMonth(year);
	}
	// 월별 수입 통계를 받아오는 메서드
	public Map<String, Object> cashbookIncomePriceByMonth(int year) {
		return cashbookRestMapper.selectIncomePriceByMonth(year);
	}
	// 1년간 수입/지출 합계를 받아오는 메서드
	public Map<String, Object> cashbookTotalPriceByYear(int year) {
		return cashbookRestMapper.selectTotalPriceByYear(year);	// 쿼리 조회값 반환
	}
}
