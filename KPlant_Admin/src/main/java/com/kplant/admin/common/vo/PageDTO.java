package com.kplant.admin.common.vo;

import lombok.Getter;
import lombok.ToString;

/**
 * 페이지 번호 구성 로직을 통한 페이지 정보 객체 
 * @author user
 */
@Getter
@ToString
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private CommonVO cvo;
	
	//CommonVO의 다형성을 이용해서 board, gallery 등 자식의 페이징 처리를 구현
	public PageDTO(int total, CommonVO cvo) {
		this.total = total;
		this.cvo = cvo;
		this.endPage = (int)(Math.ceil(cvo.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		/* 실제 끝 페이지 구하기 */
		int realEnd = (int)(Math.ceil((total * 1.0) / cvo.getAmount()));
		
		if(realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		/* 이전(prev), 다음(next) 구하기 */
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}