package kr.co.gdu.cash.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import kr.co.gdu.cash.service.CashbookService;
import kr.co.gdu.cash.vo.Cashbook;

@Controller
@Scope("singleton")	// default값(원래 생략된 것). 처음 실행할 때 한번만 객체를 만들고 그것만 계속 씀
public class ExcelCashbookController {
	@GetMapping(path = "/admin/cashbookListExcel", produces = "application/vnd.ms-excel")
	public String cashbookListExcel() {
		return "cashbookExcelView";	// 엑셀 파일 이름
	}
}

// 내부 클래스(public은 첫번째 클래스에만) => 자바파일안엔 하나지만 컴파일될 때 따로.
@Component("cashbookExcelView")	// 컴포넌트는 그냥 객체만 만들어줌. 객체 이름은 안 적으면 클래스 이름과 동일하게 만들고 앞에 문자만 소문자로 바뀜
@Scope("prototype")	// 컴포넌트타입의 스코프의 디폴트값은 "singleton", 새로 갱신될 때마다 객체를 새로 만들어 줌(리스트의 내용이 바뀔 수 있기 때문)
class CashbookExcelView extends AbstractXlsView{	// AbstractXlsView를 상속받아 엑셀뷰를 만듦
	@Autowired CashbookService cashbookService;
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,	// Workbook(파일을 받음)을 이용하기 위해 lib 추가해야 됨
			HttpServletResponse response) throws Exception {
		response.setHeader("Content-Disposition","attachment;filename=\"cashbook.xls\"");	// 파일로 만들어져야함을 기재(응답포지션,파일명)
		List<Cashbook> cashbookList = cashbookService.getCashbookListAll();
		Sheet sheet = workbook.createSheet();	// 워크북에 시트를 만듦
		Row titleRow = sheet.createRow(0);	// 첫번째 행 생성
		titleRow.createCell(0).setCellValue("cashbook_id");
		titleRow.createCell(1).setCellValue("cashbook_kind");
		titleRow.createCell(2).setCellValue("category_name");
		titleRow.createCell(3).setCellValue("cashbook_price");
		titleRow.createCell(4).setCellValue("cashbook_content");
		titleRow.createCell(5).setCellValue("cashbook_date");
		titleRow.createCell(6).setCellValue("create_date");
		titleRow.createCell(7).setCellValue("update_date");
		
		for(int i=1; i<cashbookList.size(); i++) {
			Row row = sheet.createRow(i);
			row.createCell(0).setCellValue(cashbookList.get(i).getCashbookId());
			row.createCell(1).setCellValue(cashbookList.get(i).getCashbookKind());
			row.createCell(2).setCellValue(cashbookList.get(i).getCategoryName());
			row.createCell(3).setCellValue(cashbookList.get(i).getCashbookPrice());
			row.createCell(4).setCellValue(cashbookList.get(i).getCashbookContent());
			row.createCell(5).setCellValue(cashbookList.get(i).getCashbookDate());
			row.createCell(6).setCellValue(cashbookList.get(i).getCreateDate());
			row.createCell(7).setCellValue(cashbookList.get(i).getUpdateDate());
		}
		/*
		int rowNum = 1;
		for(Cashbook c : cashbookList) {
			Row row = sheet.createRow(rowNum);
			row.createCell(0).setCellValue(c.getCashbookId());
			row.createCell(1).setCellValue(c.getCashbookKind());
			row.createCell(2).setCellValue(c.getCategoryName());
			row.createCell(3).setCellValue(c.getCashbookPrice());
			row.createCell(4).setCellValue(c.getCashbookContent());
			row.createCell(5).setCellValue(c.getCashbookDate());
			row.createCell(6).setCellValue(c.getCreateDate());
			row.createCell(7).setCellValue(c.getUpdateDate());
			rowNum += 1;
		}
		*/
	}
}