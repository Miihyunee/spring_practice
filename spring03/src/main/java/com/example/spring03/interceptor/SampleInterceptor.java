package com.example.spring03.interceptor;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.HandlerInterceptor;

public class SampleInterceptor implements HandlerInterceptor {
	// 액션 수행 전에 경유(preHandle : 메인 url 호출 전에 실행)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("pre handle...");
		// true : 메인 액션으로 계속 진행, false : 메인 액션을 실행하지 않고 멈춤
		return true;
	}

	// 액션 수행 후에 경유(postHandle : 메인 url 호출 후에 실행)
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("post handle...");
	}
}
