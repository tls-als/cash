package kr.co.gdu.cash.vo;

<<<<<<< HEAD
import java.util.List;

import lombok.Data;

@Data
public class Notice {
	private int noticeId;	
	private String noticeTitle;
	private String noticeContent;
	private String noticeDate;
	private List<Noticefile> fileList;
=======
public class Notice {
	private int noticeId;	
	private String noticeTitle;
	private String noticeContent;
	private String noticeDate;
	
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}
	@Override
	public String toString() {
		return "Notice [noticeId=" + noticeId + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeDate=" + noticeDate + "]";
	}
	
>>>>>>> refs/remotes/origin/master
}
