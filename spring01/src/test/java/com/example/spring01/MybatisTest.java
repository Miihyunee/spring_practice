package com.example.spring01;

import org.springframework.beans.factory.annotation.Autowired;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest // 스프링 부트 환경에서 테스트
public class MybatisTest {
	private static final Logger logger = LoggerFactory.getLogger(MybatisTest.class);

	@Autowired
	SqlSession sqlSession;

	@Test
	public void testSession() {
		logger.info("sqlSession : " + sqlSession);
		logger.debug("mybatis 연결 성공");
		logger.info("mybatis 연결 성공");
	}
}