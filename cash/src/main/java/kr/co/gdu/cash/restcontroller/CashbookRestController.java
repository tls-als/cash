package kr.co.gdu.cash.restcontroller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.CashbookRestService;


@RestController
public class CashbookRestController {
	@Autowired CashbookRestService cashbookRestService;	// 서비스 객체 주입
	// 연간 최대 지출/최저 지출 통계
	@GetMapping("/admin/chart7")
	public Map<String, Object> getMaxAndMinOutlayByYear(@RequestParam(name = "year") int year, HttpSession session) {
		return cashbookRestService.maxAndMinOutlayByYear(year, session);
	}
	// 연간 최대 수입/최저 수입 통계
	@GetMapping("/admin/chart6")
	public Map<String, Object> getMaxAndMinIncomeByYear(@RequestParam(name = "year") int year, HttpSession session) {
		return cashbookRestService.maxAndMinIncomeByYear(year, session);
	}
	// 월별 평균 수입을 구하는 컨트롤러
	@GetMapping("/admin/chart5")
	public Map<String, Object> getAvgOutlayByMonth(@RequestParam(name = "year") int year, HttpSession session) {
		return cashbookRestService.avgOutlaybyMonth(year, session);
	}
	// 월별 평균 수입을 구하는 컨트롤러
	@GetMapping("/admin/chart4")
	public Map<String, Object> getAvgIncomeByMonth(@RequestParam(name = "year") int year, HttpSession session) {
		return cashbookRestService.avgIncomebyMonth(year, session);
	}
	// 1년간 월별 지출 구하는 컨트롤러
	@GetMapping("/admin/chart3")
	public Map<String, Object> getCashbookOutlayPriceByMonth(
			@RequestParam(name = "year", required = true) int year, HttpSession session) {
		return cashbookRestService.cashbookOutlayPriceByMonth(year, session);
	}
	// 1년간 월별 수입 구하는 컨트롤러
	@GetMapping("/admin/chart2") 
	public Map<String, Object> getCashbookIncomePriceByMonth(
			@RequestParam(name = "year", required = true) int year, HttpSession session) {
		System.out.println(year + ": RequestParam 연도");
		return cashbookRestService.cashbookIncomePriceByMonth(year, session);
	}
	// 1년간 수입/지출 합계를 구하는 컨트롤러
	@GetMapping("/admin/chart1")
	public Map<String, Object> getCashbookTotalPriceByYear(
			@RequestParam(name = "year", required = true) int year, HttpSession session) {	// 매개변수 받아오기
		return cashbookRestService.cashbookTotalPriceByYear(year, session);
	}
}
