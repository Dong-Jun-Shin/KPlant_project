package com.kplant.admin.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kplant.admin.common.file.FileUploadUtil;
import com.kplant.admin.product.dao.ImageDao;
import com.kplant.admin.product.dao.ProductDao;
import com.kplant.admin.product.vo.ProductImageVO;
import com.kplant.admin.product.vo.ProductVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ProductServiecImpl implements ProductService{

	@Setter(onMethod_=@Autowired)
	private ProductDao productDao;
	
	@Setter(onMethod_=@Autowired)
	private ImageDao imageDao;
	
	@Override
	//제품목록 구현
	public List<ProductVO> productList(ProductVO pvo){
		List<ProductVO> list = null;
		list = productDao.productList(pvo);
		return list;
	}
	
	@Override
	// 전체 레코드 수 구현
	public int productListCnt(ProductVO pvo) {
		return productDao.productListCnt(pvo);
	}
	
	//제품 등록
	@Transactional
	@Override
	public int productInsert(ProductVO pvo) throws Exception{
		int result = 0;
		List<String> fileName = FileUploadUtil.MultipleFileUpload(pvo.getImages().get(0).getFiles(), "product");
		ProductImageVO ivo = null;
		
		if(!fileName.isEmpty()) {
				//pvo.setPrd_num(productDao.productNumber());
				result = productDao.productInsert(pvo);
				pvo.getImages().clear();
				
				for(int i=0; i < fileName.size(); i++) {
					ivo = new ProductImageVO();
					ivo.setPrd_num(pvo.getPrd_num());
					ivo.setI_file(fileName.get(i));
					pvo.getImages().add(ivo);
				}
				imageDao.multipleImageInsert(pvo.getImages());
			}
			return result;
		}
		
		// 제품 상세 구현
		@Override
		public ProductVO productDetail(ProductVO pvo) {
			ProductVO detail = null;
			detail = productDao.productDetail(pvo);
			if(detail!=null){
				detail.setPrd_name(detail.getPrd_name().toString().replaceAll("\n", "<br>"));
			}
			return detail;
		}
		//제품 수정 폼
		@Override
		public ProductVO updateForm(ProductVO pvo) {
			ProductVO detail = null;
			detail = productDao.productDetail(pvo);
			return detail;
		}
		
		// 제품 수정 구현
		@Transactional
		@Override
		public int productUpdate(ProductVO pvo) throws Exception {
			int result = 0;
			List<ProductImageVO> multiple =  pvo.getImages();
			log.info("pvo" + pvo);
			result = productDao.productUpdate(pvo);
			
			if(!multiple.isEmpty()) {
	        	for(ProductImageVO ivo: multiple) {
	        		// 기존 존재하는 파일 수정
		        	if(ivo.getFiles().get(0).getSize() > 0 && ivo.getI_num()!=0) {
		        		FileUploadUtil.fileDelete(ivo.getI_file());
		        		
		        		ivo.setI_file(FileUploadUtil.fileUpload(ivo.getFiles().get(0), "product"));
		        		result = imageDao.imageUpdate(ivo);
		        	}
		        	// 추가 입력 작업
		        	if(ivo.getPrd_num() == "" && ivo.getI_file()=="") {
		        		ivo.setI_file(FileUploadUtil.fileUpload(ivo.getFiles().get(0), "product"));
		        		ivo.setPrd_num(pvo.getPrd_num());
		        		result = imageDao.imageInsert(ivo);
		        	}
	        	}
	    	}
			return result;
		}
		
		//제품 삭제 구현
		@Transactional
		@Override
		public int productDelete(String prd_num) throws Exception{
			int result = 0;
			ProductImageVO ivo = new ProductImageVO();
			ivo.setPrd_num(prd_num);
			List<ProductImageVO> imageList = imageDao.imageList(ivo);
			
			if(imageList.size() > 0){
				for(int i=0; i<imageList.size(); i++) {
					ProductImageVO vo = imageList.get(i);
					FileUploadUtil.fileDelete(vo.getI_file());
					imageDao.imageDelete(vo.getI_num());
				}
			}
			
			result = productDao.productDelete(prd_num);
			return result;
		}
		
		
		
		
		
}
