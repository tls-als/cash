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
	
	// 1년간 수입/지출 합계를 받아오는 메서드
	public Map<String, Object> cashbookTotalPriceByYear(int year) {
		return cashbookRestMapper.selectTotalPriceByYear(year);	// 쿼리 조회값 반환
	}
}
