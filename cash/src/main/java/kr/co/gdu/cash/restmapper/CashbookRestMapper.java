package kr.co.gdu.cash.restmapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface CashbookRestMapper {
	Map<String, Object> selectTotalPricebByMonth(Map<String, Object> map);	// 월별 수입/지출 통계
	Map<String, Object> selectTotalPriceByYear(int year);	// 1년간 수입/지출 합계
}
