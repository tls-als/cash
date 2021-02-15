package kr.co.gdu.cash.restmapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface CashbookRestMapper {
	Map<String, Object> selectMaxAndMinOutlayByYear(Map<String, Object> map); // 연간 최고 지출, 최저 지출
	Map<String, Object> selectMaxAndMinIncomeByYear(Map<String, Object> map);  // 연간 최고 수입, 최저 수입
	Map<String, Object> selectAvgIncomeByMonth(Map<String, Object> map); // 월별 평균 수입
	Map<String, Object> selectAvgOutlayByMonth(Map<String, Object> map);	// 월별 평균 지출
	Map<String, Object> selectOutlayPriceByMonth(Map<String, Object> map);	// 월별 지출 통계
	Map<String, Object> selectIncomePriceByMonth(Map<String, Object> map);	// 월별 수입 통계
	Map<String, Object> selectTotalPriceByYear(Map<String, Object> map);	// 1년간 수입/지출 합계
}
