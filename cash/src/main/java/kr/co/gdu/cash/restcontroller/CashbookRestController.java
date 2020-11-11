package kr.co.gdu.cash.restcontroller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.CashbookRestService;


@RestController
public class CashbookRestController {
	@Autowired CashbookRestService cashbookRestService;	// 서비스 객체 주입
	
	// 1년간 수입/지출 합계를 구하는 컨트롤러
	@GetMapping("/admin/chart1")
	public Map<String, Object> getCashbookTotalPriceByYear(
			@RequestParam(name = "year", required = true) int year) {	// 매개변수 받아오기
		return cashbookRestService.cashbookTotalPriceByYear(year);
	}
}
