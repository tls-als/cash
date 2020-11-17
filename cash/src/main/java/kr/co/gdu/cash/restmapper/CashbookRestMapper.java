package kr.co.gdu.cash.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

@Mapper
public interface CashbookRestMapper {
	List<Cashbook> selectTotalPricebByMonth(Map<String, Object> map);
	Map<String, Object> selectTotalPriceByYear(int year);	// 1년간 수입/지출 합계
}
