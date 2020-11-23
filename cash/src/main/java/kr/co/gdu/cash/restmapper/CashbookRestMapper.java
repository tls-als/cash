package kr.co.gdu.cash.restmapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface CashbookRestMapper {
	Map<String, Object> selectMaxAndMinOutlayByYear(int year); // 연간 최고 지출, 최저 지출
	Map<String, Object> selectMaxAndMinIncomeByYear(int year);  // 연간 최고 수입, 최저 수입
	Map<String, Object> selectAvgIncomeByMonth(int year); // 월별 평균 수입
	Map<String, Object> selectAvgOutlayByMonth(int year);	// 월별 평균 지출
	Map<String, Object> selectOutlayPriceByMonth(int year);	// 월별 지출 통계
	Map<String, Object> selectIncomePriceByMonth(int year);	// 월별 수입 통계
	Map<String, Object> selectTotalPriceByYear(int year);	// 1년간 수입/지출 합계
}
