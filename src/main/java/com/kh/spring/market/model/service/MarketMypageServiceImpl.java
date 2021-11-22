package com.kh.spring.market.model.service;

import org.springframework.stereotype.Service;

import com.kh.spring.market.model.repository.MarketMypageRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MarketMypageServiceImpl implements MarketMypageService{

	private final MarketMypageRepository mypageRepository;
	
}
