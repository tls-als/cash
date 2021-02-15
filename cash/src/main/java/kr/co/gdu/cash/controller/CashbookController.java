package kr.co.gdu.cash.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.service.CashbookService;
import kr.co.gdu.cash.service.CategoryService;
import kr.co.gdu.cash.vo.Cashbook;
import kr.co.gdu.cash.vo.Category;

@Controller	// 컨트롤러 애너테이션 추가하기
public class CashbookController {
	@Autowired private CashbookService cashbookService;
	@Autowired private CategoryService categoryService;
	// 가계부 전체 리스트 조회, 행의 전체 카운트
	@GetMapping("/admin/cashbookList/{currentPage}")
	public String cashbookList(Model model,
			@PathVariable(name = "currentPage", required = true) int currentPage, HttpSession session) {	// 현재 페이지
		int rowPerPage = 20;	// 한 페이지에서 보여질 테이블 행의 수
		int totalCount = cashbookService.getCashbookTotalCount(session);	// 전체 행의 수
		int lastPage = totalCount/rowPerPage;	// 마지막 페이지
		if(totalCount%rowPerPage != 0) {	// 나머지가 있다면 마지막 페이지의 +1
			lastPage += 1;
		}
		// 페이징 네비게이션
		int navPerPage = 10;	// 한 네비게이션에서 출력될 범위(1~10, 21~30..)
		int navStartPage = currentPage-(currentPage%navPerPage) +1;	// 한 페이지에서 시작하는 네비게이션 번호(10단위로 넘어갈 때까지 1을 시작페이지로 고정)
		System.out.println(navStartPage + "=> 네비게이션 시작 페이지");
		int navEndPage = navStartPage+navPerPage-1; // 페이지 단위(10개씩 번호매김)로 끝나는 네비게이션 번호
		System.out.println(navEndPage + "=> 네비게이션 끝 페이지");
		// 현재 네비게이션 위치가 10일때(자동으로 네비게이션 시작번호가 넘어갈 때)
		if(currentPage%navPerPage == 0) {
			navStartPage = navStartPage-navPerPage; 	// currentPage가 이동할 때마다 위코드가 실행기에 navStartPage가 자동으로 넘어가게 됨
			navEndPage = navEndPage-navPerPage;
		}
		
		//System.out.println(totalCount + ": 행의 전체 수 카운트");
		List<Cashbook> list = cashbookService.getCashbookListByPage(currentPage, rowPerPage, session);
		model.addAttribute("lastPage", lastPage);	// 마지막 페이지 번호
		model.addAttribute("list", list);	// 가계부 리스트
		model.addAttribute("navEndPage", navEndPage);	// 네비게이션: 끝나는 번호
		model.addAttribute("navStartPage", navStartPage);	// 네비게이션: 시작 번호
		return "cashbookList";
	}
	// 일별 가계부 내용 삭제
	@GetMapping("/admin/deleteCashbook/{cashbookId}/{currentYear}/{currentMonth}/{currentDay}")
	public String deleteCashbook(Model model, HttpSession session,
			@PathVariable(name = "cashbookId", required = true) int cashbookId,
			@PathVariable(name = "currentYear", required = true) int currentYear,
			@PathVariable(name = "currentMonth", required = true) int currentMonth,
			@PathVariable(name = "currentDay", required = true) int currentDay) {
		cashbookService.deleteCashbook(cashbookId);	// 삭제 메서드 실행
		List<Cashbook> cashbookList = cashbookService.getCashbookListByDay(currentYear, currentMonth, currentDay, session);
		model.addAttribute("cashbookList", cashbookList);	// 일자별 가계 리스트 담기
		model.addAttribute("currentYear", currentYear);		// cashbookByDay 페이지 이동을 위한 날짜 담기
		model.addAttribute("currentMonth", currentMonth);
		model.addAttribute("currentDay", currentDay);
		return "cashbookByDay";	// cashbookByDay으로 포워딩
	}
	// 일별 가계부 내용을 수정
	@GetMapping("/admin/modifyCashbook/{cashbookId}/{currentYear}/{currentMonth}/{currentDay}")
	public String modifyCashbook(Model model,
			@PathVariable(name = "cashbookId", required = true) int cashbookId,
			@PathVariable(name = "currentYear", required = true) int currentYear,
			@PathVariable(name = "currentMonth", required = true) int currentMonth,
			@PathVariable(name = "currentDay", required = true) int currentDay) {
		List<Cashbook> cashbookList = cashbookService.getselectDetailCashbookList(cashbookId);
		model.addAttribute("currentYear", currentYear);
		model.addAttribute("currentMonth", currentMonth);
		model.addAttribute("currentDay", currentDay);
		model.addAttribute("cashbookList", cashbookList);	// 가계부 리스트
		return "modifyCashbook";
	}
	// modifyCashbook폼에서 수정하기 버튼클릭시 일자별가계부로 돌아가기(날짜, 해당날짜 리스트 넘김)
	@PostMapping("/admin/modifyCashbook/{currentYear}/{currentMonth}/{currentDay}")
	// 업데이트 실행을 위한 vo 커맨드객체, 일자가계부 페이지 이동위한 model
	public String setmodifyCashbook(Cashbook cashbook, Model model, HttpSession session,	
			@PathVariable(name = "currentYear", required = true) int currentYear,	// 일자가계부 페이지 이동할 때 넘길 날짜&수정폼에 출력을 위한 날짜값
			@PathVariable(name = "currentMonth", required = true) int currentMonth,
			@PathVariable(name = "currentDay", required = true) int currentDay) {
		cashbookService.updateCashbookList(cashbook);	// 업데이트 실행
		List<Cashbook> cashbookList = cashbookService.getCashbookListByDay(currentYear, currentMonth, currentDay, session);	// 파라메터로 넘어온 값으로 일자별 가계부리스트 조회
		model.addAttribute("cashbookList", cashbookList);	// 일자별 가계 리스트 담기
		model.addAttribute("currentYear", currentYear);		// cashbookByDay 페이지 이동을 위한 날짜 담기
		model.addAttribute("currentMonth", currentMonth);
		model.addAttribute("currentDay", currentDay);
		return "cashbookByDay";	// 포워딩
	}
	// 버튼클릭 post 형태로 요청드러왔을 때 인서트 액션을 실행후 달력으로 이동
	@PostMapping("/admin/addCashbook")
	public String addCashbook(Cashbook cashbook) {	// 커맨드객체(이름과 같은 것을 request.getParamer 값을 만들어줌. cashbook.get). 뷰로 다시 보낼게 없으니 map 사용X
		//System.out.println(cashbook);
		cashbookService.addCashbook(cashbook);
		return "redirect:/admin/cashbookByMonth";	// 리다이렉트(결과물이 없을시) => response.sendRedirect();
	}
	// 가계부 입력 페이지로 넘어가는 메서드. (카테고리 리스트를 model에 담아서 포워딩)
	@GetMapping("/admin/addCashbook/{currentYear}/{currentMonth}/{currentDay}")
	public String addCashbook(Model model,
			@PathVariable(name = "currentYear", required = true) int currentYear,
			@PathVariable(name = "currentMonth", required = true) int currentMonth,
			@PathVariable(name = "currentDay", required = true) int currentDay) {
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("currentYear", currentYear);
		model.addAttribute("currentMonth", currentMonth);
		model.addAttribute("currentDay", currentDay);
		model.addAttribute("categoryList", categoryList);
		return "addCashbook";	// 포워딩(값이 있을시) => forward
	}
	// 일자별 가계부 내용을 출력하는 페이지로 포워딩
	@GetMapping("/admin/cashbookByDay/{target}/{currentYear}/{currentMonth}/{currentDay}")
	public String cashbookByDay(Model model, HttpSession session,
								@PathVariable(name = "target") String target,	// cashbookByMonth에서 request로 보낸 파라매터 매개변수. ByMonth에선 target 값이 없기에 기본값 공백
								@PathVariable(name = "currentYear", required = true) int currentYear,	// required 값은 트루
								@PathVariable(name = "currentMonth", required = true) int currentMonth,
								@PathVariable(name = "currentDay", required = true) int currentDay) {
		// 매개변수로 넘겨진 값으로 날짜를 만들어줌
		Calendar targetDay = Calendar.getInstance();	// 현재 날짜가져오기
		targetDay.set(Calendar.YEAR, currentYear);
		targetDay.set(Calendar.MONTH, currentMonth-1);	// 컴퓨터는 0부터 1월을 카운트하기에 넘어온 매개변수의 달은 -1빼야 컴퓨터가 맞게 계산
		targetDay.set(Calendar.DATE, currentDay);
		// cashbookByDay로부터 target 파라멘터값이 pre이면
		if(target.equals("pre")) {
			targetDay.add(Calendar.DATE, -1);	// 캘린더 API가 알아서 빼줌.
		// cashbookByDay로부터 target 파라멘터값이 next이면	
		}else if(target.equals("next")) {
			targetDay.add(Calendar.DATE, 1);	// 캘린더 API가 알아서 더해줌.
		}
		// cashbookByMonth로 요청했을시 target 값은 없기에 아래 실행
		List<Cashbook> cashbookList = cashbookService.getCashbookListByDay(targetDay.get(Calendar.YEAR), targetDay.get(Calendar.MONDAY)+1, targetDay.get(Calendar.DATE), session);
		model.addAttribute("cashbookList", cashbookList);
		model.addAttribute("currentYear", targetDay.get(Calendar.YEAR)); 
		model.addAttribute("currentMonth", targetDay.get(Calendar.MONDAY)+1);
		model.addAttribute("currentDay", targetDay.get(Calendar.DATE)); // cashbookByMonth에서 request로 보낸 파라매터값이 컨트롤러로 인해 변경되었기에 ${param.~}으로 보내면 month에만 보낸 값만 고정되기에 변경된 값을 모델에 담아 cashbookByDay 보냄
		return "cashbookByDay";
	}
	
	@GetMapping(value="/admin/cashbookByMonth/{target}/{currentYear}/{currentMonth}")	// {"/","/index"}와 동일
	 //index를 요청하면 리턴값은 String으로 리턴. Model은 Map타입
	public String cashbookByMonth(Model model, HttpSession session,
			@PathVariable(name = "target") String target,
			@PathVariable(name = "currentYear") int currentYear,	// request.getParameter
			@PathVariable(name = "currentMonth") int currentMonth) {	// 0~13월까지 넘어올 수 있음. request.getParameter
		// 1. 요청분석
		Calendar currentDay = Calendar.getInstance();	// 오늘 날짜(현재 시스템 날짜) 가져와서 캘린더에 셋팅
		// Calendar API 사용시: currentDay.add(Calendar.Month, -1)
		if(currentYear != -1 && currentMonth != -1) {
			currentDay.set(Calendar.YEAR, currentYear);	// 매개변수로 들어온 값을 캘린더에 셋팅
			currentDay.set(Calendar.MONTH, currentMonth-1);
			if(currentYear == 0) {
				currentDay.add(Calendar.MONTH, 0);
			}
			if(currentYear == 13) {
				currentDay.add(Calendar.MONTH, 0);
			}
		}
		/*
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
		*/
		// 현재 날의 1일을 기준.
		currentDay.set(Calendar.DATE, 1); // 오늘 날의 1일을 구함. 2020년 11월 1일
		
		currentYear = currentDay.get(Calendar.YEAR);	// 캘린더의 셋팅된 연도값 가져오기
		currentMonth = currentDay.get(Calendar.MONTH)+1;	// 캘린더의 셋팅된 월을 가져오기.(캘린더의 1월은 0이라서 1월을 출력하기 위해 +1)
		int lastDay = currentDay.getActualMaximum(Calendar.DATE);	// 현재 캘린더 날짜의 마지막 날짜
		int firstDayOfWeek = currentDay.get(Calendar.DAY_OF_WEEK);	// 이달 1일의 요일을 구함(일:1, 월:2...)
		System.out.println(firstDayOfWeek +"<-1일의 시작 요일");
		
		// 지출, 수입 데이터를 호출하는 부분
		int sumIn = cashbookService.getSumCashbookPriceByInOut("수입", currentYear, currentMonth, session);
		int sumOut = cashbookService.getSumCashbookPriceByInOut("지출", currentYear, currentMonth, session);
		
		// 해당 연도와 달 조건에 따른 수입,지출 호출하는 부분
		List<Map<String, Object>> cashList = cashbookService.getCashListByMonth(currentYear, currentMonth, session);
		
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
