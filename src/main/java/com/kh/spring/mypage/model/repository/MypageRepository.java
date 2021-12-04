package com.kh.spring.mypage.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.spring.board.model.dto.Board;
import com.kh.spring.board.model.dto.BoardComment;
import com.kh.spring.common.util.FileDTO;
import com.kh.spring.mypage.model.dto.MypageSearchSet;
import com.kh.spring.mypage.model.dto.Pet;
import com.kh.spring.mypage.model.dto.Vaccination;
import com.kh.spring.mypage.model.dto.VaccineInfo;
import com.kh.spring.mypage.validator.UpdateMemberForm;

@Mapper
public interface MypageRepository {
	
	void updateMemberDynamicQuery(UpdateMemberForm form);
	
	@Select("select * from pet where user_idx = #{userIdx} order by pet_idx desc")
	List<Pet> selectPetByUserIdx(int userIdx);
	
	@Insert("insert into pet(pet_idx, name, specify, gender, age, user_idx)"
			+ " values(sc_pet_idx.nextval, #{name}, #{specify}, #{gender}, #{age}, #{userIdx})")
	void insertPet(Pet pet);
	
	@Insert("insert into file_info(fl_idx, type_idx, origin_file_name, rename_file_name, save_path)"
			+ " values(sc_file_idx.nextval, sc_pet_idx.currval, #{originFileName}, #{renameFileName}, #{savePath})")
	void insertFile(FileDTO file);
	
	@Select("select * from vaccine_info order by vi_idx")
	List<VaccineInfo> selectAllVaccineInfo();
	
	@Select("select cycle from vaccineInfo where vi_idx = #{viIdx}")
	int selectCycle(int viIdx);
	
	@Insert("insert into vaccination(vc_idx, pet_idx, vi_idx, date, user_idx)"
			+ " values(sc_vc_idx.nextval, #{petIdx}, #{viIdx}, #{date}, #{userIdx})") 
	void insertVaccination(Vaccination vaccination);

	int selectBoardCommentCnt(MypageSearchSet searchSet);

	List<BoardComment> selectBoardComment(Map<String, Object> map);

	int selectBoardCnt(MypageSearchSet searchSet);
	
	List<Board> selectBoard(Map<String, Object> map);

	
}
