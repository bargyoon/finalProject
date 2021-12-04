package com.kh.spring.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.board.model.dto.Board;
import com.kh.spring.board.model.dto.BoardComment;
import com.kh.spring.board.model.repository.BoardRepository;
import com.kh.spring.common.util.FileDTO;
import com.kh.spring.common.util.FileUtil;
import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.member.model.dto.Member;
import com.kh.spring.member.model.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

	private final BoardRepository boardRepository;
	private final MemberRepository memberRepository;

	public void insertBoard(List<MultipartFile> files, Board board) {
		board.setUserIdx(10);
		board.setNickname("mynick");
		boardRepository.insertBoard(board);

		for (MultipartFile multipartFile : files) {
			if (!multipartFile.isEmpty()) {
				FileUtil fileUtil = new FileUtil();
				boardRepository.insertFileInfo(fileUtil.fileUpload(multipartFile));
			}
		}

	}

	public List<Map<String, Object>> selectBoard(Map<String, Object> commandMap, Paging pageUtil) {
		List<Map<String, Object>> commandList = boardRepository.selectBoard(commandMap, pageUtil);
	

		return commandList;
	}

	public Map<String, Object> selectBoardByIdx(int bdIdx) {
		Board board = new Board();
		board = boardRepository.selectBoardByIdx(bdIdx);
		boardRepository.updateBoardViewCnt(bdIdx);
		List<FileDTO> files = boardRepository.selectFileInfoByIdx(bdIdx);
		List<BoardComment> childComment = boardRepository.selectChildCommentByIdx(bdIdx);
		List<BoardComment> parentComment = boardRepository.selectParentCommentByIdx(bdIdx);
		
		int commentCnt = boardRepository.selectCommentCntByIdx(bdIdx);
		return Map.of("board", board, "files", files, "pcomment", parentComment,"chcomment",childComment, "commentCnt", commentCnt);
	}

	public int selectBoardListCnt(Map<String, Object> commandMap) {

		return boardRepository.selectBoardCnt(commandMap);
	}

	public void updateBoard(List<MultipartFile> files, Board board, List<Integer> flIdxs) {

		boardRepository.updateBoard(board);
		for (MultipartFile multipartFile : files) {
			if (!multipartFile.isEmpty()) {
				FileUtil fileUtil = new FileUtil();
				FileDTO fileDTO = fileUtil.fileUpload(multipartFile);
				fileDTO.setTypeIdx(Integer.toString(board.getBdIdx()));
				boardRepository.insertFileInfoWithIdx(fileDTO);
			}
		}
		if (flIdxs != null) {
			for (Integer flIdx : flIdxs) {
				boardRepository.deleteFileInfoByIdx(flIdx);
			}
		}

	}

	public void insertComment(BoardComment boardComment) {
		boardComment.setUserIdx(10);
		boardComment.setNickname("mynick");
		boardRepository.insertComment(boardComment);
		if(boardComment.getPrIdx() == 0) {
			boardRepository.updatePrIdx();
		}

	}
	
	public int selectCommentListCnt(Map<String, Object> commandMap) {
		
		return boardRepository.selectCommentCnt(commandMap);
	}
	

	public List<Map<String, Object>> selectCommentList(Map<String, Object> commandMap, Paging pageUtil) {
		
		return boardRepository.selectCommentList(commandMap, pageUtil);
	}
	
	
}
