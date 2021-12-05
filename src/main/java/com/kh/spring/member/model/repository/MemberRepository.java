package com.kh.spring.member.model.repository;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.spring.member.model.dto.Member;

@Mapper
public interface MemberRepository {

	@Select("select * from \"USER\" where user_id =#{userId} and password=#{password}")
	Member selectMemberByUserId(Member member);

	@Insert("insert all "
			+ "into \"USER\"(user_id,password,nickName,email,address,address_detail,user_name,user_idx) "
			+ "values(#{userId},#{password},#{nickName},#{email},#{address},#{addressDetail},#{userName},sc_user_idx.nextval) "
			+ "into \"ADDRESS\"(address,address_detail,user_idx,address_idx) "
			+ "values(#{address},#{addressDetail},sc_user_idx.nextval,sc_address_idx.nextval) "
			+ "SELECT * FROM DUAL")
	void insertMember(Member member);
	
	@Select("select count(*) from \"USER\" where user_id = #{userId}")
	public int idCheck(String userId);
	
	@Select("select count(*) from \"USER\" where nickName = #{nickName}")
	public int nickNameCheck(String nickName);
	
	@Select("select user_id from \"USER\" where email = #{email}")
	Member searchId(Member member);
	
	@Select("select * from \"USER\" where user_id = #{userId} and email = #{email}")
	Member searchPw(Member member);
	
	@Update("update \"USER\" set password=#{password} where user_id=#{userId}")
	void updatePw(Member member);

	@Select("select * from \"USER\" where user_id= #{userId}")
	Member selectMemberById(String userId);

	@Insert("insert all "
			+ "into \"USER\"(user_id,password,nickName,email,address,address_detail,user_name,user_idx) "
			+ "values(#{userId},'1234',#{nickName},#{email},#{address},#{addressDetail},#{userName},sc_user_idx.nextval) "
			+ "into \"ADDRESS\"(address,address_detail,user_idx,address_idx) "
			+ "values(#{address},#{addressDetail},sc_user_idx.nextval,sc_address_idx.nextval) "
			+ "into KAKAO_LOGIN (kakao_id,user_idx) "
			+ "values(#{userId},sc_user_idx.nextval) "
			+ "SELECT * FROM DUAL")
	void insertKakaoMember(Member member);

	@Select("select * from \"USER\" where user_idx = ${userIdx}")
	Member selectMemberByIdx(int userIdx);

}
