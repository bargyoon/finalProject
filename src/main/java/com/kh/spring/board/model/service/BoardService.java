package com.kh.spring.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.board.model.dto.Board;
import com.kh.spring.board.model.dto.BoardComment;
import com.kh.spring.common.util.pagination.Paging;

public interface BoardService {

	void insertBoard(List<MultipartFile> files, Board board);

	List<Map<String,Object>> selectBoard(Map<String, Object> commandMap, Paging pageUtil);

	Map<String,Object> selectBoardByIdx(int bdIdx);

	int selectBoardListCnt(Map<String, Object> commandMap);

	void updateBoard(List<MultipartFile> files, Board board, List<Integer> flIdxs);

	void insertComment(BoardComment boardComment);

}
