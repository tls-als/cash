package kr.co.gdu.cash.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.MemberMapper;
import kr.co.gdu.cash.vo.Member;

@Service
@Transactional
public class MemberService {
	@Autowired private MemberMapper memberMapper;	// 회원 조회하는 매퍼 주입.
	// 멤버 추가
	public int addMember(Member member) {
		return memberMapper.insertMember(member);
	}
	
	public Member getMemberById(Member paramMember) {
		Member member = memberMapper.selectMemberById(paramMember);	// 회원 조회 데이터를 vo에 담기
		if(member != null) {
			return member;
		}
		return null;
	}
}
