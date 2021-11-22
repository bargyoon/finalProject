package com.kh.spring.market.model.service;

import org.springframework.stereotype.Service;

import com.kh.spring.market.model.repository.ShopRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ShopServiceImpl implements ShopService{

	private final ShopRepository shopRepository;
}
