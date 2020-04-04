package com.kplant.admin.order.controller;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kplant.admin.order.service.AdminOrderService;
import com.kplant.admin.order.vo.PaymentVO;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.siot.IamportRestClient.response.PaymentCancelDetail;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/payment/*")
@Log4j
public class PaymentController {
	
	@Setter(onMethod_ = @Autowired)
	private AdminOrderService adminOrderService;
	
	/**
	 * 결제 취소
	 * 
	 * @param request
	 * @param pvo 취소할 pay_num
	 * @return
	 */
	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
	public String cancelOrder(HttpServletRequest request, PaymentVO pvo) {
		log.info("admin/결제취소 호출 성공");
		String result = "false";
		CancelData cancel_data = new CancelData(pvo.getPay_num(), true);
		cancel_data.setReason(pvo.getOdc_cause());
		try {
			IamportClient client = getKey(request);
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
			Payment payment = payment_response.getResponse();
			
			if(payment.getStatus().equals("cancelled")) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				pvo.setPay_date(sdf.format(payment.getCancelledAt()));
				pvo.setPay_status("결제취소");
				
				int num = adminOrderService.paymentUpdate(pvo);
				if(num == 1) result = "success"; 
			}
		} catch (NullPointerException npe) {
			result = "already";
		} catch (IamportResponseException ire) {
			ire.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 결제 내역 조회
	 * 
	 * @param request
	 * @param pvo 조회할 pay_num
	 * @return
	 */
	@RequestMapping(value = "/getPayment", method = RequestMethod.POST)
	public String getPayment(HttpServletRequest request, PaymentVO pvo) {
		log.info("admin/결제내역 조회 호출 성공");
		try {
			IamportClient client =getKey(request);
			IamportResponse<Payment> payment_response = client.paymentByImpUid(pvo.getPay_num());
			Payment payment = payment_response.getResponse();
			
			log.info(payment);
			log.info(pvo.getPay_num().equals(payment_response.getResponse().getImpUid()));
		} catch (IamportResponseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// TODO 필요할 때 가공해서 반환
		return null;
	}
	
	/**
	 * 결제 취소 내역 조회
	 * 
	 * @param request
	 * @param pvo 조회할 pay_num
	 * @return
	 */
	@RequestMapping(value = "/getPayCancelled", method = RequestMethod.POST)
	public String getPayCancelled(HttpServletRequest request, PaymentVO pvo) {
		log.info("admin/결제취소내역 조회 호출 성공");
		try {
			IamportClient client = getKey(request);
			IamportResponse<Payment> cancelled_response = client.paymentByImpUid(pvo.getPay_num());
			
			Payment cancelled = cancelled_response.getResponse();
			PaymentCancelDetail[] cancelDetail = cancelled.getCancelHistory();
			for (PaymentCancelDetail pcd : cancelDetail) {
				log.info(pcd.getPgTid());
				log.info(pcd.getReason());
				log.info(pcd.getReceiptUrl());
				log.info(pcd.getCancelledAt());
			}
		} catch (IamportResponseException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// TODO 필요할 때 가공해서 반환
		return null;
	}
	
	/**
	 * 인증 토큰 발급받는 메서드
	 * @param request
	 * @return
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @throws ParseException
	 */
	public IamportClient getKey(HttpServletRequest request) throws FileNotFoundException, IOException, ParseException {
		//json 읽어오기
		JSONParser parser = new JSONParser();
		JSONObject jo = (JSONObject)parser.parse(new FileReader(
				request.getSession().getServletContext().getRealPath("/")
				+ "/resources/include/json/api_key.json"));
		JSONArray jsonArray = (JSONArray)jo.get("api_key");
		JSONObject key = (JSONObject)jsonArray.get(0);
		
		String imp_key = (String)(key.get("imp_key"));
		String imp_secret = (String)(key.get("imp_secret"));
		
		return new IamportClient(imp_key, imp_secret);
	}
}
