package kr.co.gdu.cash.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.MemberRestService;

@RestController	// 비동기처리
public class MemberRestController {
	@Autowired MemberRestService memberRestService;
	@PostMapping("/admin/idCheck")
	public String idCheck(@RequestParam(value = "id") String id) {
		String returnId = memberRestService.getMemberId(id);
		if(returnId == null) {
			return "yes";	// yes가 넘어오면 등록가능
		}
		return "no";
	}
}
