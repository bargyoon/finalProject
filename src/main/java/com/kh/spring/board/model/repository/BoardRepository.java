package com.kh.spring.board.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.spring.board.model.dto.Board;
import com.kh.spring.board.model.dto.BoardComment;
import com.kh.spring.common.util.FileDTO;
import com.kh.spring.common.util.pagination.Paging;

@Mapper
public interface BoardRepository {
	
	@Insert("insert into board(bd_idx, user_idx, bd_title, content, category, nickname) values(sc_bd_idx.nextval, #{userIdx}, #{bdTitle}, #{content}, #{category}, #{nickname})")
	void insertBoard(Board board);

	@Insert("insert into file_info(fl_idx, type_idx, origin_file_name, rename_file_name, save_path) "
			+ " values(sc_file_idx.nextval, sc_bd_idx.currval, #{originFileName}, #{renameFileName}, #{savePath})")
	void insertFileInfo(FileDTO fileUpload);
	
	@Insert("insert into file_info(fl_idx, type_idx, origin_file_name, rename_file_name, save_path) "
			+ " values(sc_file_idx.nextval, #{typeIdx}, #{originFileName}, #{renameFileName}, #{savePath})")
	void insertFileInfoWithIdx(FileDTO fileDTO);
	
	List<Map<String, Object>> selectBoard(@Param("commandMap") Map<String, Object> commandMap, @Param("pageUtil")Paging pageUtil);

	@Select("select * from board where bd_idx = ${bdIdx}")
	Board selectBoardByIdx(int bdIdx);

	@Select("select * from file_info where type_idx = ${bdIdx}")
	List<FileDTO> selectFileInfoByIdx(int bdIdx);
	
	
	int selectBoardCnt(@Param("commandMap") Map<String, Object> commandMap);
	@Update("update board set view_count = (select view_count from board where bd_idx = ${bdIdx})+1 where bd_idx = ${bdIdx}")
	void updateBoardViewCnt(int bdIdx);

	@Delete("delete from file_info where fl_idx=${flIdx}")
	void deleteFileInfoByIdx(Integer flIdx);

	@Update("update board set bd_title = #{bdTitle},content = #{content} where bd_idx = #{bdIdx} ")
	void updateBoard(Board board);

	
	void insertComment(BoardComment boardComment);
	
	@Select("select * from board_comment where bd_idx = ${bdIdx}")
	List<BoardComment> selectCommentByIdx(int bdIdx);

	@Select("select count(*) from board_comment where bd_idx = ${bdIdx}")
	int selectCommentCntByIdx(int bdIdx);

	@Update("update board_comment set pr_idx = cm_idx where cm_type = 0 and pr_idx = 0 ")
	void updatePrIdx();

	


	

}
