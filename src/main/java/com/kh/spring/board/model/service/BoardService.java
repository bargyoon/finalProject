package com.kh.spring.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.board.model.dto.Board;

public interface BoardService {

	void insertBoard(List<MultipartFile> files, Board board);

	List<Map<String,Object>> selectBoard(Map<String, Object> commandMap);

}
