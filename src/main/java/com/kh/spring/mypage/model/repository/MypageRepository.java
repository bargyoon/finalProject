package com.kh.spring.mypage.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.spring.mypage.model.dto.Pet;

@Mapper
public interface MypageRepository {
	
	void updateMemberDynamicQuery(Map<String, Object> commandMap);
	
	@Select("select * from pet where user_idx = #{userIdx} order by pet_idx desc")
	List<Pet> selectPetByUserIdx(int userIdx);
	
	@Insert("insert into pet(pet_idx, name, specify, gender, age, user_idx)"
			+ " values(sc_pet_idx.nextval, #{pet.name}, #{pet.specify}, #{pet.gender}, #{pet.age}, #{userIdx})")
	void insertPetByUserIdx(Map<String, Object> commandMap);
	
//	@Select("select * from board where user_idx = #{userIdx} order by board_idx desc")
//	List<Board> selectBoardByUserIdx(int userIdx);
	
//	@Select("select * from reply where user_idx = #{userIdx} order by reply_idx desc")
//	List<Reply> selectReplyByUserIdx(int userIdx);
	
//	@Select("select * from counseling where user_idx = #{userIdx} order by counseling_idx desc")
//	List<Reply> selectCounselingByUserIdx(int userIdx);
}
