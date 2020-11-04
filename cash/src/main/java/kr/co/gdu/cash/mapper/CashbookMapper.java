package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

// @Controller, @Servicem, @Mapper, @Repository : 스테레오타입 <- @Conpoment를 상속
@Mapper	// 인터페이스의 구현체의 클래스 객체를 생성
public interface CashbookMapper {
	int insertCashbook(Cashbook cashbook); // select를 제외한 모든 값은 마이바티스에서 int를 리턴
	List<Map<String, Object>> selectCashInOutList();
	int selectSumCashbookPriceByInOut(Map<String, Object> map);
	List<Map<String, Object>> selectCashListByMonth(Map<String, Object> map);
	List<Cashbook> selectCashbookListByDay(Map<String, Object> map);	// 연,달,일
}
