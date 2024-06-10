package com.example.spring04.model;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface GuestbookDAO {

	@Select("SELECT * FROM guestbook ORDER BY idx DESC")
	List<GuestbookDTO> list();

	@Insert("INSERT INTO guestbook (idx, name, email, content) VALUES (guestbook_seq.nextval, #{name}, #{email}, #{content})")
	void insert(GuestbookDTO dto);

	@Select("SELECT * FROM guestbook WHERE idx = #{idx}")
	GuestbookDTO view(int idx);

	@Update("UPDATE guestbook SET name = #{name}, email=#{email}, content=#{content} WHERE idx=#{idx}")
	void update(GuestbookDTO dto);

	@Delete("DELETE FROM guestbook WHERE idx = #{idx}")
	void delete(int idx);
}
