package com.kh.spring.board.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.board.model.dto.Board;
import com.kh.spring.board.model.repository.BoardRepository;
import com.kh.spring.common.util.FileDTO;
import com.kh.spring.common.util.FileUtil;
import com.kh.spring.disease.model.repository.DiseaseRepository;
import com.kh.spring.member.model.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	private final BoardRepository boardRepository;
	
	
	public void insertBoard(List<MultipartFile> files, Board board) {
		board.setUserIdx(12);
		boardRepository.insertBoard(board);
		for (MultipartFile multipartFile : files) {
			FileUtil fileUtil = new FileUtil();
			boardRepository.insertFileInfo(fileUtil.fileUpload(multipartFile));
		}
		
	}
	@Override
	public List<Map<String, Object>> selectBoard(Map<String, Object> commandMap) {
		List<Map<String, Object>> commandList = boardRepository.selectBoard(commandMap);
	
		return commandList;
	}

}
