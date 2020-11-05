package kr.co.gdu.cash.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.CashbookService;
import kr.co.gdu.cash.service.CategoryService;
import kr.co.gdu.cash.vo.Cashbook;
import kr.co.gdu.cash.vo.Category;

@Controller	// 컨트롤러 애너테이션 추가하기
public class CashbookController {
	
	@Autowired private CashbookService cashbookService;
	@Autowired private CategoryService categoryService;
	
	// 버튼클릭 post 형태로 요청드러왔을 때
	@PostMapping("/admin/addCashbook")
	public String addCashbook(Cashbook cashbook) {	// 커맨드객체(이름과 같은 것을 request.getParamer 값을 만들어줌. cashbook.get)
		//System.out.println(cashbook);
		cashbookService.addCashbook(cashbook);
		return "redirect:/admin/cashbookByMonth";	// 리다이렉트(결과물이 없을시) => response.sendRedirect();
	}
	
	@GetMapping("/admin/addCashbook")
	public String addCashbook(Model model,
			@RequestParam(name = "currentYear", required = true) int currentYear,
			@RequestParam(name = "currentMonth", required = true) int currentMonth,
			@RequestParam(name = "currentDay", required = true) int currentDay) {
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		return "addCashbook";	// 포워딩 => forward
	}
	
	@GetMapping("/admin/cashbookByDay")
	public String cashbookByDay(Model model,
								@RequestParam(name = "currentYear", required = true) int currentYear,
								@RequestParam(name = "currentMonth", required = true) int currentMonth,
								@RequestParam(name = "currentDay", required = true) int currentDay) {
		List<Cashbook> cashbookList = cashbookService.getCashbookListByDay(currentYear, currentMonth, currentDay);
		model.addAttribute("cashbookList", cashbookList);
		return "cashbookByDay";
	}
	
	@GetMapping(value="/admin/cashbookByMonth")	// {"/","/index"}와 동일
	public String cashbookByMonth(Model model, //index를 요청하면 리턴값은 String으로 리턴. Model은 Map타입
			@RequestParam(name = "currentYear", defaultValue = "-1") int currentYear,	// request.getParameter
			@RequestParam(name = "currentMonth", defaultValue = "-1") int currentMonth) {	// 0~13월까지 넘어올 수 있음. request.getParameter
		// 1. 요청분석
		Calendar currentDay = Calendar.getInstance();	// 오늘 날짜(현재 시스템 날짜)
		// request로 넘어온 값이 있을 시(이전달,다음달)
		if(currentYear != -1 && currentMonth != -1) {
			// currentYear도 값이 넘어오고, currentMonth도 값이 넘어오면
			if(currentMonth == 0) {	// 1월 전으로 이동시
				currentYear -= 1;
				currentMonth = 12;
			}
			if(currentMonth == 13) { // 12월 이후로 이동시
				currentYear += 1;
				currentMonth = 1;
			}
			currentDay.set(Calendar.YEAR, currentYear);	// 캘린더의 현재 날짜의 연도를 request로 넘어온 currentYear로 변경
			currentDay.set(Calendar.MONTH, currentMonth-1); // 캘린더의 현재 날짜의 달을 request로 넘어온 currentMonth 값으로 저장 캘린더의 월은 0~11까지임. 캘린더에 1월을 저장할 때 0으로		
		}
		// 현재 날의 1일을 기준.
		currentDay.set(Calendar.DATE, 1); // 오늘 날의 1일을 구함. 2020년 11월 1일
		
		currentYear = currentDay.get(Calendar.YEAR);	// 캘린더의 셋팅된 연도값 가져오기
		currentMonth = currentDay.get(Calendar.MONTH)+1;	// 캘린더의 셋팅된 월을 가져오기.(캘린더의 1월은 0이라서 1월을 출력하기 위해 +1)
		int lastDay = currentDay.getActualMaximum(Calendar.DATE);	// 현재 캘린더 날짜의 마지막 날짜
		int firstDayOfWeek = currentDay.get(Calendar.DAY_OF_WEEK);	// 이달 1일의 요일을 구함(일:1, 월:2...)
		System.out.println(firstDayOfWeek +"<-1일의 시작 요일");
		
		// 지출, 수입 데이터를 호출하는 부분
		int sumIn = cashbookService.getSumCashbookPriceByInOut("수입", currentYear, currentMonth);
		int sumOut = cashbookService.getSumCashbookPriceByInOut("지출", currentYear, currentMonth);
		
		// 해당 연도와 달 조건에 따른 수입,지출 호출하는 부분
		List<Map<String, Object>> cashList = cashbookService.getCashListByMonth(currentYear, currentMonth);
		
		// 3. 뷰 모델 추가
		/*
		 *  1) 보여질 것 : 월, 마지막 일(31일?, 30일?, 윤달 경우), 1일에 해당되는 요일
		 */
		model.addAttribute("currentYear", currentYear);
		model.addAttribute("currentMonth", currentMonth);
		model.addAttribute("lastDay", lastDay);
		model.addAttribute("firstDayOfWeek", firstDayOfWeek);
		
		model.addAttribute("sumIn", sumIn);
		model.addAttribute("sumOut", sumOut);
		
		model.addAttribute("cashList", cashList);
		
		return "cashbookByMonth";	// 이 리턴값은 포워딩임
	}
}
