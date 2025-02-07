package com.example.spring03.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 세션 객체 생성
		HttpSession session = request.getSession();
		if (session.getAttribute("userid") == null) {
			// 세션이 없으면 로그인 페이지로 이동
			response.sendRedirect(request.getContextPath() + "/member/login.do?message=nologin");
			// 메인 액션 실행 차단
			return false;
		} else {// 메인 액션을 실행함
			return true;
		}
	}
}
