package kr.co.gdu.cash.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class NoticeController {
	@Autowired private NoticeService noticeService;	// noticeService 객체 주입
	// 공지목록.  뷰에 데이터를 보내기 위해 model 사용
	@GetMapping("/admin/noticeList")
	public String noticeList(Model model,
			@RequestParam(value="currentPage",defaultValue = "1") int currentPage,	// request.getParameter
			@RequestParam(value="rowPerPage",defaultValue = "5") int rowPerPage) {
		// noticeService 호출
		List<Notice> noticeList = noticeService.getNoticeListByPage(currentPage, rowPerPage);	// RequestParam으로 넘어온 매개변수를 같이 담아서 서비스 호출
		int noticeCnt = noticeService.getNoticeListCount();	// 공지리스트의 전체 행의 수
		int lastPage = noticeCnt/rowPerPage;
		if(noticeCnt%rowPerPage != 0) {
			lastPage += 1;
		}
		model.addAttribute("currentPage", currentPage);	// 페이징을 하기위해 뷰에 현재페이지 데이터도 보냄
		model.addAttribute("lastPage", lastPage);		// 공지사항 마지막 페이지
		model.addAttribute("noticeList", noticeList);	// 서비스의 결과값(공지리스트)을 model에 담아서 뷰로 보내기
		return "noticeList";	// noticeList.jsp로 포워딩
	}
	// 공지입력폼(mapper,service필요 없음)
	@GetMapping("/admin/addNotice")
	public String addNotice() {
		return "addNotice";
	}
	
	// 공지입력액션
	@PostMapping("/admin/addNotice")
	public String addNotice(Notice notice) {	// 커맨드객체
		noticeService.setinsertNotice(notice);
		return "redirect:/admin/noticeList";
	}
	
	// 공지 상세 보기
	@GetMapping("/admin/noticeOne")
	public String noticeOne(Model model,
			@RequestParam(value = "noticeId") int noticeId) {
		// noticeService 호출
		return "noticeOne";
	}
	/*
	// 공지삭제
	@GetMapping("/admin/removeNotice")
	public String removeNotice(@RequestParam(value = "noticeId") int noticeId) {
		return "redirect:/admin/noticeList";
	}
	// 공지수정폼
	@GetMapping("/admin/modifyNotice")
	public String modifyNotice(Model model, @RequestParam(value = "noticeId") int noticeId) {
		return "modifyNotice";
	}	
	// 공지수정액션
	@PostMapping("/admin/modifyNotice")
	public String modifyNotice(Notice notice) {
		return "redirect:/admin/noticeOne?noticeId="+notice.getNoticeId();	// 상세보기로 다시 이동
	}	
	*/
}
