package com.kh.spring.board.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kh.spring.board.model.dto.Board;
import com.kh.spring.common.util.FileDTO;
import com.kh.spring.common.util.pagination.Paging;

@Mapper
public interface BoardRepository {
	
	@Insert("insert into board(bd_idx, user_idx, bd_title, content, category) values(sc_bd_idx.nextval, #{userIdx}, #{bdTitle}, #{content}, #{category})")
	void insertBoard(Board board);

	@Insert("insert into file_info(fl_idx, type_idx, origin_file_name, rename_file_name, save_path) "
			+ " values(sc_file_idx.nextval, sc_bd_idx.currval, #{originFileName}, #{renameFileName}, #{savePath})")
	void insertFileInfo(FileDTO fileUpload);

	
	List<Map<String, Object>> selectBoard(@Param("commandMap") Map<String, Object> commandMap, @Param("pageUtil")Paging pageUtil);

	@Select("select * from board where bd_idx = ${bdIdx}")
	Board selectBoardByIdx(int bdIdx);

	@Select("select * from file_info where type_idx = ${bdIdx}")
	List<FileDTO> selectFileInfoByIdx(int bdIdx);
	
	@Select("select count(*) from board where category = #{category}")
	int selectBoardCntByCate(String category);

}
