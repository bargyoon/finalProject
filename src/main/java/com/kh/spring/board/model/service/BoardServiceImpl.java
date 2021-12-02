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
		for (Map<String, Object> map : commandList) {
			int commentCnt = boardRepository.selectCommentCntByIdx(Integer.parseInt(map.get("BD_IDX").toString()));
			map.put("commentCnt", commentCnt);
		}

		return commandList;
	}

	public Map<String, Object> selectBoardByIdx(int bdIdx) {
		Board board = new Board();
		board = boardRepository.selectBoardByIdx(bdIdx);
		boardRepository.updateBoardViewCnt(bdIdx);
		List<FileDTO> files = boardRepository.selectFileInfoByIdx(bdIdx);
		List<BoardComment> comment = boardRepository.selectCommentByIdx(bdIdx);
		int commentCnt = boardRepository.selectCommentCntByIdx(bdIdx);
		return Map.of("board", board, "files", files, "comment", comment, "commentCnt", commentCnt);
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

	public void insertComment(Map<String, Object> jsonMap) {
		jsonMap.put("userIdx", 10);
		jsonMap.put("nickname", "mynick");
		boardRepository.insertComment(jsonMap);

	}

}
