
package com.kplant.admin.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kplant.admin.common.vo.PageDTO;
import com.kplant.admin.product.service.ProductService;
import com.kplant.admin.product.vo.ProductVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {

	private ProductService productService;

	// 제품목록 구현하기(페이징 처리 목록 조회)

	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String productList(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("productList 호출 성공");

		List<ProductVO> productList = productService.productList(pvo);
		model.addAttribute("productList", productList);

		// 전체 레코드 수 구현

		int total = productService.productListCnt(pvo);
		model.addAttribute("pageMaker", new PageDTO(total, pvo));

		return "product/productList";
	}

	/**************************************************************
	 * 제품 등록 폼 출력하기
	 **************************************************************/
	@RequestMapping(value = "/insertForm")
	public String insertForm(@ModelAttribute("data") ProductVO pvo) {
		log.info("insertForm 호출 성공");

		return "product/insertForm";
	}

	/**************************************************************
	 * 제품 등록 구현하기(첨부파일을 제외한 입력작업) 참고 : RedirectAttributes 객체는 리다이렉트 시점(return
	 * "redirect:/경로")에 한번만 사용되는 데이터를 전송할 수 있는 addFlashAttribute()라는 기능을 지원한다.
	 * addFlashAttribute() 메서드는 브라우저까지 전송되기는 하지만, URI상에는 보이지 않는 숨겨진 데이터의 형태로 전달된다.
	 **************************************************************/

	@RequestMapping(value = "/productInsert", method = RequestMethod.POST)
	// @PostMapping("/multipleBoardInsert")
	public String productInsert(@ModelAttribute ProductVO pvo, Model model) throws Exception {
		log.info("productInsert 호출 성공");
		log.info("pvo" + pvo);

		int result = 0;
		String url = "";

		result = productService.productInsert(pvo);
		if (result == 1) {
			url = "/product/productList";
		}

		return "redirect:" + url;
	}

	/**************************************************************
	 * 제품 상세보기 구현
	 **************************************************************/

	@RequestMapping(value = "/productDetail", method = RequestMethod.GET)
	// @GetMapping("/multipleBoardDetail")
	public String productDetail(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("productDetail 호출 성공");
		log.info("pvo = " + pvo);

		ProductVO detail = productService.productDetail(pvo);
		model.addAttribute("detail", detail);

		return "product/productDetail";
	}

	/**************************************************************
	 * 글수정 폼 출력하기
	 * 
	 * @param : b_num
	 * @return : BoardVO
	 *************************************************************/
	@RequestMapping(value = "/updateForm")
	public String updateForm(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("updateForm 호출 성공");
		log.info("p_num = " + pvo.getPrd_num());

		ProductVO updateData = productService.updateForm(pvo);

		model.addAttribute("updateData", updateData);
		return "product/updateForm";
	}

	/**************************************************************
	 * 제품 수정 구현하기(첨부파일을 제외한 수정작업)
	 * 
	 * @param : BoardVO
	 **************************************************************/
	@RequestMapping(value = "/productUpdate", method = RequestMethod.POST)
	public String productUpdate(@ModelAttribute ProductVO pvo, RedirectAttributes ras) throws Exception {
		log.info("productUpdate 호출 성공");

		int result = 0;
		String url = "";
		log.info("pvo" + pvo);

		result = productService.productUpdate(pvo);
		ras.addFlashAttribute("data", pvo);

		if (result == 1) {
			url = "/product/productDetail";
		} else {
			url = "/product/updateForm";
		}

		return "redirect:" + url;
	}

	/**************************************************************
	 * 제품삭제 구현하기(첨부파일을 제외한 삭제작업)
	 * 
	 * @throws Exception
	 * @throws IOException
	 **************************************************************/
	@RequestMapping(value = "/productDelete")
	public String productDelete(@ModelAttribute ProductVO pvo, RedirectAttributes ras) throws Exception {
		log.info("productDelete 호출 성공");

		// 아래 변수에는 입력 성공에 대한 상태값 담습니다.(1 or 0)
		int result = 0;
		String url = "";

		result = productService.productDelete(pvo.getPrd_num());

		if (result == 1) {
			url = "/product/productList";
		} else {
			ras.addFlashAttribute("data", pvo);
			url = "/product/productDetail";
		}
		return "redirect:" + url;
	}

}
