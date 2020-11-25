package kr.co.gdu.cash.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.CommentService;
import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeForm;

@Controller
public class NoticeController {
	@Autowired private NoticeService noticeService;	// noticeService 객체 주입
	@Autowired private CommentService commentService;
	
	// 공지목록.  뷰에 데이터를 보내기 위해 model 사용
	@GetMapping("/admin/noticeList/{currentPage}")
	public String noticeList(Model model,
			@PathVariable(value="currentPage") int currentPage) {	// request.getParameter
		int rowPerPage = 10;	// 한 페이지에서 보여질 행의 갯수
		// noticeService 호출
		List<Notice> noticeList = noticeService.getNoticeListByPage(currentPage, rowPerPage);	// RequestParam으로 넘어온 매개변수를 같이 담아서 서비스 호출
		int noticeCnt = noticeService.getNoticeListCount();	// 공지리스트의 전체 행의 수
		int lastPage = noticeCnt/rowPerPage;
		if(noticeCnt%rowPerPage != 0) {	// 마지막 페이지 구하기
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
	
	// 공지입력액션(넘겨질 값이 없음 -> model 안씀)
	@PostMapping("/admin/addNotice")
	public String addNotice(NoticeForm noticeForm) {	// 커맨드객체(스프링에서 vo타입의 변수와 이름을 알아서 맞추어줌)
		noticeService.setinsertNotice(noticeForm);
		return "redirect:/admin/noticeList/1";
	}
	
	// 공지 상세 보기(넘겨질 값이 있음 -> model 사용.)
	@GetMapping("/admin/noticeOne/{noticeId}")
	public String noticeOne(Model model,
			@PathVariable(value = "noticeId") int noticeId) {
		// noticeService 호출
		model.addAttribute("notice", noticeService.getSelectDetailNoticeList(noticeId));	// 공지 상세 내용 넘기기
		model.addAttribute("comment", commentService.selectCommentList(noticeId));	// 댓글 조회 넘기기
		return "noticeOne";
	}
	
	// 공지삭제
	@GetMapping("/admin/removeNotice/{noticeId}")
	public String removeNotice(
			@PathVariable(value = "noticeId") int noticeId) {
		noticeService.setDeleteNoticeList(noticeId);
		return "redirect:/admin/noticeList/1";
	}
	
	// 공지수정폼(list 가져와야 함)
	@GetMapping("/admin/modifyNotice/{noticeId}")
	public String modifyNotice(Model model, 
			@PathVariable(value = "noticeId") int noticeId) {
		model.addAttribute("notice", noticeService.getSelectModifyNoticeList(noticeId));
		return "modifyNotice";
	}	
	// 공지수정액션
	@PostMapping("/admin/modifyNotice")
	public String modifyNotice(NoticeForm noticeForm) {	// 커맨드객체
		noticeService.setUpdateNoticeList(noticeForm);
		return "redirect:/admin/noticeOne/"+noticeForm.getNoticeId();	// 상세보기로 다시 이동
	}	
	// 파일 삭제
	@GetMapping("/admin/deleteFile")
	public String modifyFile(
			@RequestParam(value = "noticeId") int noticeId,
			@RequestParam(value = "noticefileId") int noticefileId) {
		noticeService.modifyfile(noticefileId);
		return "redirect:/admin/modifyNotice/"+noticeId;
	}

}
