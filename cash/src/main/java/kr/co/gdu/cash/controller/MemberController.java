package kr.co.gdu.cash.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.service.MemberService;
import kr.co.gdu.cash.vo.Member;

@Controller(value = "memberController")	// value, scope는 생략되어 있음
public class MemberController {
	@Autowired private MemberService memberService;
	
	@GetMapping("/admin/addMember")
	public String addMember() {
		return "addMember";
	}
	
	@PostMapping("/admin/addMember")
	public String addMember(Member member) {
		memberService.addMember(member);
		return "redirect:/admin/index";	// 이슈: redirect:/admin/memberList(멤버리스트 만들기)
	}
}
