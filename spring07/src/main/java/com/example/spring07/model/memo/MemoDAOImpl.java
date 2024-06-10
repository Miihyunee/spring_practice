package com.example.spring07.model.memo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

@Repository
public class MemoDAOImpl implements MemoDAO {

	@Autowired
	MongoTemplate mongoTemplate;

	@Override
	public List<MemoDTO> list() {
		Query query = new Query().with(Sort.by(Sort.Direction.DESC, "post_date"));
		return (List<MemoDTO>) mongoTemplate.find(query, MemoDTO.class, "memo");
	}

	@Override
	public void insert(MemoDTO dto) {
		dto.setPost_date(new Date()); // 현재 날짜 지정
		mongoTemplate.insert(dto, "memo");
	}

	@Override
	public MemoDTO detail(String _id) {
		// _id에 해당하는 도큐먼트 1개를 찾아서 리턴
		return mongoTemplate.findById(_id, MemoDTO.class, "memo");
	}

	@Override
	public void update(MemoDTO dto) {
		Query query = new Query(new Criteria("_id").is(dto.get_id()));
		// 수정할 내용
		Update update = new Update();
		update.set("writer", dto.getWriter());
		update.set("memo", dto.getMemo());
		// update or insert
		mongoTemplate.upsert(query, update, MemoDTO.class, "memo");
	}

	@Override
	public void delete(String _id) {
		// _id에 해당하는 도큐먼트를 찾아서
		Query query = new Query(new Criteria("_id").is(_id));
		// 제거
		mongoTemplate.remove(query, "memo");
	}
}
