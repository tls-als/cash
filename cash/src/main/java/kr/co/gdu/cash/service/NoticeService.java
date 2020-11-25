package kr.co.gdu.cash.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.mapper.CommentMapper;
import kr.co.gdu.cash.mapper.NoticeFileMapper;
import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeForm;
import kr.co.gdu.cash.vo.Noticefile;

@Service	// IndexService 클래스의 객체를 하나 만듦
@Transactional
public class NoticeService {
	// PATH = "C:\\sts_workspace\\maven.1604968242477\\cash\\src\\main\\webapp\\upload\\"
	private final String PATH = "C:\\sts_workspace\\maven.1606311163765\\cash\\src\\main\\webapp\\upload\\";
	
	@Autowired private NoticeMapper noticeMapper;	// 스프링이 갖고 있는 객체 중에 NoticeMapper의 객체를 찾아서 noticeMapper에 주입
	@Autowired private CashbookMapper cashbookMapper;
	@Autowired private NoticeFileMapper noticeFileMapper;
	@Autowired private CommentMapper commentMapper;
	
	// 파일 삭제를 위한 메서드
	public void modifyfile(int noticefileId) {
		// 테이블에서 파일이름 지우기
		noticeFileMapper.modifyFile(noticefileId);
		// 폴더에서 파일 지우기
		List<String> fileNames = noticeFileMapper.selectfileName(noticefileId);
		for(String f : fileNames) {
			File file = new File(PATH+f);
			if(file.exists()) {
				file.delete();
			}
		}		
	}
	// 공지 수정 메서드
	public void setUpdateNoticeList(NoticeForm noticeForm) {	
		noticeMapper.updateNoticeList(noticeForm);	// 내용 수정
		// 파일 추가 수정
		List<Noticefile> noticefiles = null;	// 선택된 파일을 담을 리스트변수
		if(noticeForm.getNoticefile() != null) {
			noticefiles = new ArrayList<Noticefile>();
			for(MultipartFile mf : noticeForm.getNoticefile()) {
				Noticefile nf = new Noticefile();
				nf.setNoticeId(noticeForm.getNoticeId());
				int p = mf.getOriginalFilename().lastIndexOf(".");
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				String filename = UUID.randomUUID().toString().replace("-", "");
				nf.setNoticefileName(filename+ext);
				nf.setNoticefileSize(mf.getSize());
				nf.setNoticefileType(mf.getContentType());
				noticefiles.add(nf);
				try {
					mf.transferTo(new File(PATH+filename+ext));
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		if(noticefiles != null) {
			for(Noticefile nf : noticefiles) {
				noticeFileMapper.insertNoticeFile(nf);
			}
		}	
	}
	// 공지 수정폼에 출력하는 공지리스트
	public Notice getSelectModifyNoticeList(int noticeId) {
		return noticeMapper.selectModifyNoticeList(noticeId);
	}
	// 공지 삭제
	public int setDeleteNoticeList(int noticeId) {
		// 댓글 삭제하기
		commentMapper.deleteCommentAll(noticeId);
		// 파일 삭제작업: 테이블에서 파일이름 지우기
		noticeFileMapper.deleteFile(noticeId);
		// 파일 삭제작업: 폴더에서 파일 지우기
		List<String> fileNames = noticeFileMapper.selectfileNameAll(noticeId);
		for(String f : fileNames) {
			File file = new File(PATH+f);
			if(file.exists()) {
				file.delete();
			}
		}
		return noticeMapper.deleteNoticeList(noticeId);	// 공지내용 삭제
	}
	// 공지사항 상세보기
	public Notice getSelectDetailNoticeList(int noticeId) {
		return noticeMapper.selectDetailNoticeList(noticeId);
	}
	// 공지사항 추가
	public void setinsertNotice(NoticeForm noticeForm) {	// select를 제외한 모든 값의 리턴은 int(성공한 행의 수를 리턴하기때문)
		Notice notice = new Notice();
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		noticeMapper.insertNoticeList(notice);	// notice 테이블에 제목, 내용 입력하기(key)
		
		// 파일 테이블에 파일 추가하기
		List<Noticefile> fileList = null;	// noticefile 타입의 리스트 변수
		if(noticeForm.getNoticefile() != null) {	// 파일이 선택되있을 시
			fileList = new ArrayList<Noticefile>();	// 리스트 객체 생성
			for(MultipartFile mf : noticeForm.getNoticefile()) {	// 선택된 파일 가져오기
				Noticefile noticefile = new Noticefile();	// noticefile 객체 생성
				noticefile.setNoticeId(notice.getNoticeId());	// key값 셋팅
				int point = mf.getOriginalFilename().lastIndexOf(".");	// 마지막 점 위치
				String ext = mf.getOriginalFilename().substring(point).toLowerCase(); // 확장자 가져오기
				String fileName = UUID.randomUUID().toString().replace("-", "");	// 랜덤 파일명 가져오기
				noticefile.setNoticefileName(fileName+ext);	// 파일명
				noticefile.setNoticefileType(mf.getContentType());	//파일타입
				noticefile.setNoticefileSize(mf.getSize());	// 사이즈
				fileList.add(noticefile);	// 리스트에 담기
				// 예외처리
				try {
					mf.transferTo(new File(PATH+fileName+ext));
				} catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		if(fileList != null) {
			for(Noticefile nf : fileList) {
				noticeFileMapper.insertNoticeFile(nf);
			}
		}
	}
	// 공지리스트 전체 수
	public int getNoticeListCount() {
		int listCnt = noticeMapper.selectNoticeListCount();
		System.out.println("공지리스트 전체 카운팅 데이터: "+ listCnt);
		return listCnt;
	}
	// 공지리스트를 페이지별로 조회한 데이터를 넘김
	public List<Notice> getNoticeListByPage(int currentPage, int rowPerPage) {	// 매개변수로 넘어온 값을 가공처리
		// currentPage,rowPerPage -> beginPage 가공
		int beginRow = (currentPage-1)*rowPerPage;	// 페이지별 시작하는 페이지 변수 beginPage
		System.out.println("NoticeService: getNoticeListByPage: beginPage: "+ beginRow);
		Map<String, Integer> map = new HashMap<String, Integer>();	// beginPage(시작페이지), rowPerPage(한페이지 행수) 값을 넘기기 위함
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		// noticeMapper를 호출
		List<Notice> noticeList = noticeMapper.selectNoticeListByPage(map);	// Mapper의 결과가 List이기에 list로 받음
		System.out.println("NoticeService: getNoticeListByPage: 공지 페이징 리스트: " + noticeList);	// 디버깅
		return noticeList;
	}
	
	// 인덱스화면에서 보여지는 공지사항과 가계부 => 차후 수정: 로그인에서 보여지는 공지리스트와 중복
	public Map<String, Object> getNoticeListAndInOutList() {
		List<Notice> noticeList = noticeMapper.selectLatesNoticeList();	// 공지리스트를(5개) 출력하는 결과값 호출
		List<Map<String, Object>> inOutList = cashbookMapper.selectCashInOutList();	// 가계 정보를 호출	=> 따로 분리 추가 작업 필요
		Map<String, Object> map = new HashMap<String, Object>();	// 공지와 가계 데이터를 담기 위한 map객체 생성
		map.put("noticeList", noticeList);
		map.put("inOutList", inOutList);
		return map;
	}
	
	// 로그인화면에서 보여지는 공지사항
	public List<Notice> getNoticeList() {		
		return noticeMapper.selectLatesNoticeList();
	}
	
}
