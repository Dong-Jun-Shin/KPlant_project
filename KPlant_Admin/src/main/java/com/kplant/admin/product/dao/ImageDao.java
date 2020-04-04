package com.kplant.admin.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kplant.admin.product.vo.ProductImageVO;

public interface ImageDao {

	public List<ProductImageVO> imageList(ProductImageVO ivo);

	public int multipleImageInsert(@Param("images") List<ProductImageVO> images);

	public int imageInsert(ProductImageVO ivo);

	public int imageUpdate(ProductImageVO ivo);

	public int imageDelete(int i_num);
}
