package com.kplant.admin.common.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

@ControllerAdvice
@Log4j
public class CommonExceptionAdvice {
	// @ExceptionHandler는 ()로 받아온 예외 타입을 처리
	@ExceptionHandler(Exception.class)
	public String exceptionMethod(Exception ex, Model model) {
		log.error("Exception ..." + ex.getMessage());
		model.addAttribute("exception", ex);
		log.error(model);
		
		ex.printStackTrace();
		
		return "error/error_page";
	}
	
	// 매핑 정보나 파일을 찾지 못했을 경우에 대한 예외 처리
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex) {
		log.error("Exception ... Error404");
		return "error/custom404";
	}
}
