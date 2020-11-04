package kr.co.gdu.cash.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Notice;

/*
 * Mapper는 Dao의 역할(쿼리를 조회하고 결과값을 반환함)
 * @Mapper => 인터페이스의 구체화된 클래스 객체(빈)을 생성하여 준다.
 * 여기에선 공지리스트의 결과를 가져올 수 있는 List타입의 메서드만 작성.(xml 마이바티스를 통해 쿼리 조회)
 */
@Mapper
public interface NoticeMapper {
	// index 화면에 최근 5개의 공지를 보여주는 메서드(인터페이스-추상메서드)
	List<Notice> selectLatesNoticeList();
}
