package com.example.spring01;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DBConnTest {
	// private static final : log 변경하지 못하도록
	private static final Logger logger = LoggerFactory.getLogger(DBConnTest.class);

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost/web?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=Asia/Seoul";
	String userid = "spring";
	String pwd = "1234";

	@Test // 해당 함수는 JUnit 테스트 대상 함수
	public void testConnection() throws Exception {
		Class.forName(driver);
		try {
			Connection conn = DriverManager.getConnection(url, userid, pwd);
			logger.debug("mysql에 연결되었습니다.");
			logger.info("mysql에 연결되었습니다.");
			logger.warn("mysql에 연결되었습니다.");
			logger.error("mysql에 연결되었습니다.");
			System.out.println("mysql에 연결되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}