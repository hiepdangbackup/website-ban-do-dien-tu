package com.example.service;

import com.example.dto.BrandDTO;

import java.util.List;
import java.util.Map;

public interface IBrandService {
    List<BrandDTO> findAll();
    BrandDTO findById(long id);
    BrandDTO insert(BrandDTO featureDTO);
    BrandDTO update(BrandDTO featureDTO);
    void deleteBrand(long[] ids);
    List<BrandDTO> findByProductCategory(String code);
    Map<String, String> getBrands();
}
