package com.example.spring01.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired // 스프링에서 객체 생성과 연결을 수행함
	SqlSession sqlSession;

	@Override
	public List<MemberDTO> list() {
		return sqlSession.selectList("member.list");
	}

	@Override
	public void insert(MemberDTO dto) {
		sqlSession.insert("member.insert", dto);
	}

	@Override
	public MemberDTO detail(String userid) {
		return sqlSession.selectOne("member.detail", userid);
	}

	@Override
	public void delete(String userid) {
		sqlSession.delete("member.delete", userid);
	}

	@Override
	public void update(MemberDTO dto) {
		sqlSession.update("member.update", dto);
	}

	@Override
	public boolean check_passwd(String userid, String passwd) {
		boolean result = false;
		Map<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		int count = sqlSession.selectOne("member.check_passwd", map);
		if (count == 1)
			result = true;
		return result;
	}

}
