package kr.co.gdu.cash.restmapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CashbookRestMapper {
	Map<String, Object> selectTotalPriceByYear(int year);	// 1년간 수입/지출 합계
}
