package com.example.spring03.service.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.spring03.model.message.MessageDAO;
import com.example.spring03.model.message.MessageDTO;
import com.example.spring03.model.message.PointDAO;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageDAO messageDao;

	@Autowired
	PointDAO pointDao;

	@Transactional // 트랜잭션 처리 대상 method (함수는 하나인데 쿼리는 2개)
	@Override
	public void insertMessage(MessageDTO dto) {
		messageDao.create(dto); // 메시지를 테이블에 저장
		pointDao.updatePoint(dto.getSender(), 10); // 포인트를 부여
	}
}
