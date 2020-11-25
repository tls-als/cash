package kr.co.gdu.cash.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.service.MemberService;
import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Member;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class LoginController {
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private MemberService memberService;
	// 로그인페이지에서 post로 요청될 때
	@PostMapping("/login")
	public String login(Member member, HttpSession session) {	//로그인 액션
		Member loginMember = memberService.getMemberById(member);
		if(loginMember == null) {	// 회원 등록 정보가 없으면 로그인페이지로
			return "redirect:/login";	// 리다이렉트
		}
		session.setAttribute("loginId", loginMember.getId());	// 세션에 아이디 등록 인덱스페이지로
		return "redirect:/admin/index";	
	}
	// 로컬호스트로 처음 접속시
	@GetMapping(value={"/","/login"})	// 해당 루트로 주소 입력시
	public String login(Model model, HttpSession session) {	//로그인 폼
		if(session.getAttribute("loginId") != null) {	// 세션에 아이디 정보 있으면 인덱스로
			return "redirect:/admin/index";
		}
		List<Notice> noticeList = noticeService.getNoticeList();
		model.addAttribute("noticeList", noticeList);	// model에 공지데이터 담아서 login페이지로 같이 보내기
		return "login";	// 포워딩(login.jsp)
	}
	// 로그아웃시
	@GetMapping("/admin/logout")
	public String logout(HttpSession session) {	// 서블릿에 있는 것을 가져와서 사용 가능
		session.invalidate();	// 세션 종료
		return "redirect:/";	// 로그인페이지로 리다이렉트
	}
}
