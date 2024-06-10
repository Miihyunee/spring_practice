package com.example.spring02.model;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper // 서버가 시작되면 bean으로 등록
public interface MemoDAO {
	@Select("SELECT * FROM memo ORDER BY idx DESC")
	List<MemoDTO> list();
	// list()가 호출되면 쿼리가 실행, returnType : List<MemoDTO>

	// @Param : mybatis의 #{변수}
	@Insert("INSERT INTO memo (idx, writer, memo) VALUES ((SELECT nvl(MAX(idx)+1,1) FROM memo), #{writer}, #{memo})")
	void insert(@Param("writer") String writer, @Param("memo") String memo);

	@Select("SELECT * FROM memo WHERE idx = #{idx}")
	MemoDTO view(@Param("idx") int idx);

	@Update("UPDATE memo SET writer = #{writer}, memo = #{memo} WHERE idx = #{idx}")
	void update(MemoDTO dto);

	@Delete("DELETE FROM memo WHERE idx=#{idx}")
	void delete(@Param("idx") int idx);
}
