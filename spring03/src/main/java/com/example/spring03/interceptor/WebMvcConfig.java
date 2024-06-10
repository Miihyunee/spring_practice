package com.example.spring03.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration // 환경설정 관련 bean
public class WebMvcConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		InterceptorRegistration reg1 = registry.addInterceptor(new SampleInterceptor());
		// url에 shop이 들어가면 경유
		reg1.addPathPatterns("/shop/**");

		InterceptorRegistration reg2 = registry.addInterceptor(new LoginInterceptor());
		reg2.addPathPatterns("/shop/cart/insert.do");
		reg2.addPathPatterns("/shop/cart/list.do");

		InterceptorRegistration reg3 = registry.addInterceptor(new AdminInterceptor());
		reg3.addPathPatterns("/shop/product/write.do");
		reg3.addPathPatterns("/shop/product/insert.do");
	}
}
