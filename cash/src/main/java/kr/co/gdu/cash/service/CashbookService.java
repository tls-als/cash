package kr.co.gdu.cash.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.vo.Cashbook;

@Service
@Transactional
public class CashbookService {
	@Autowired private CashbookMapper cashbookMapper;	// 주입(외부 의존성주입)
	// 엑셀파일을 위한 쿼리 조회
	public List<Cashbook> getCashbookListAll() {
		return cashbookMapper.selectCashbookListAll();
	}
	// 가계부 전체 내용을 조회
	public List<Cashbook> getCashbookListByPage(int currentPage, int rowPerPage) {
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		return cashbookMapper.selectCashbookListByPage(map);
	}
	// 가계부 삭제
	public int deleteCashbook(int cashbookId) {
		return cashbookMapper.deleteCashbook(cashbookId);
	}
	// 가계부 수정
	public int updateCashbookList(Cashbook cashbook) {
		return cashbookMapper.updateCashbook(cashbook);
	}
	// 수정폼에서 출력하는 가계부 상세조회 서비스
	public List<Cashbook> getselectDetailCashbookList(int cashbookId) {
		List<Cashbook> cashbookList = cashbookMapper.selectDetailCashbookList(cashbookId);
		return cashbookList;
	}
	// 가계부 내용을 추가하는 서비스
	public int addCashbook(Cashbook cashbook) {
		return cashbookMapper.insertCashbook(cashbook);
	}
	// 일자별 가계부 리스트를 출력하는 서비스
	public List<Cashbook> getCashbookListByDay(int currentYear, int currentMonth, int currentDay) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		map.put("currentDay", currentDay);
		return cashbookMapper.selectCashbookListByDay(map);
	}
	// 수입과 지출의 합계를 조회하는 서비스
	public int getSumCashbookPriceByInOut(String cashbookKind, int currentYear, int currentMonth) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cashbookKind", cashbookKind);
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		int sum = cashbookMapper.selectSumCashbookPriceByInOut(map);	// 매퍼는 매개변수를 하나밖에 입력 받지 못한다.->map으로 서비스의 역할은 컨트롤러나 dao의 매개변수를 가공함.
		return sum;
	}
	// 월별 가계부 내용을 호출하는 메서드
	public List<Map<String, Object>> getCashListByMonth(int currentYear, int currentMonth) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		return cashbookMapper.selectCashListByMonth(map);
	}
}
