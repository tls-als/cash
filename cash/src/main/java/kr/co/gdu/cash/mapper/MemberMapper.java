package kr.co.gdu.cash.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Member;

// Mybatis 매핑XML에 기재된 SQL을 호출하기 위한 인터페이스
@Mapper
public interface MemberMapper {
	public int insertMember(Member member);	// 멤버 추가 메서드
	public Member selectMemberById(String id);	// 매개변수(id)를 가지고 회원정보 조회하는 메서드
}
