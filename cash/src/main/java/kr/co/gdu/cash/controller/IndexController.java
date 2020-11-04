package kr.co.gdu.cash.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.gdu.cash.service.IndexService;

@Controller
public class IndexController {
	
	@Autowired private IndexService IndexService;	// @Service로 만든 객체를 주입
	
	@GetMapping(value= {"/","/index"})
	public String index(Model model) {	// requestAttribute 역할
		Map<String, Object> map = IndexService.getNoticeListAndInOutList();
		model.addAttribute("noticeList", map.get("noticeList"));	// model은 오브젝트 타입이라 형변환하지 않음
		model.addAttribute("inOutList", map.get("inOutList"));		// 자바는 리턴타입을 하나로만(map) 받으니 뷰로 보낼때 두개로 쪼개서 보냄
		return "index";
	}	
}
