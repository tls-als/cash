package kr.co.gdu.cash.restmapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberRestMapper {
	public String selectMemberId(String id);	// 아이디중복 체크 메서드
}
