package com.kh.spring.hospital.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.hospital.model.dto.Hospital;

public interface HospitalService {

	public List<Hospital> selectHospitalByLoName(String nameinput);
	
	public Hospital selectHospitalByloNumber(int locationIdx);
	
	public List<Hospital> selectHospitalByAdd(String stringAdd);
	
	
}
