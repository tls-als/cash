package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

// @Controller, @Servicem, @Mapper, @Repository : 스테레오타입 <- @Conpoment를 상속
@Mapper	// 인터페이스의 구현체의 클래스 객체를 생성
public interface CashbookMapper {
	int insertCashbook(Cashbook cashbook); // select를 제외한 모든 값은 마이바티스에서 int를 리턴
	List<Map<String, Object>> selectCashInOutList(String loginId);	// 수입,지출을 조회하는 메서드
	int selectSumCashbookPriceByInOut(Map<String, Object> map);	// 수입,지출 총합계를 조회하는 메서드
	List<Map<String, Object>> selectCashListByMonth(Map<String, Object> map);	// 달별 가계를 조회하는 메서드
	List<Cashbook> selectCashbookListByDay(Map<String, Object> map);	// 일별 가계를 조회하는 매서드(매개변수: 연달일)
	List<Cashbook> selectDetailCashbookList(int cashbookId); // 수정폼에서 출력하기 위한 가계부 상세 내용 조회
	int updateCashbook(Cashbook cashbook);	// 가계부 수정을 위한 메서드
	int deleteCashbook(int cashbookId);		// 가계부 삭제하는 메서드
	List<Cashbook> selectCashbookListByPage(Map<String, Object> map);	// 전체 가계부리스트 출력하는 메서드(beginRow, rowPerPage)
	List<Cashbook> selectCashbookListAll(); // 엑셀파일
	int pagingCashbookTotalCount(String loginId);	// 페이징을 위한 가계부 총 행의 수
	
}
