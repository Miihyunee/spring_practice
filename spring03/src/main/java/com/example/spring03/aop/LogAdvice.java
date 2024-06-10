package com.example.spring03.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Component // spring 에서 관리하는 bean
@Aspect // aop를 지원하는 어드바이스 클래스
public class LogAdvice {
	/*
	 * @Around("execution(* com.example.spring03.controller..*Controller.*(..))" +
	 * " || execution( * com.example.spring03.service..*Impl.*(..))" +
	 * " || execution( * com.example.spring03.model..*Impl.*(..))")
	 */	 
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {
		// before 작업
		long start = System.currentTimeMillis();
		// 메인 액션 실행
		Object result = joinPoint.proceed();
		// after 작업
		String type = joinPoint.getSignature().getDeclaringTypeName();
		String name = "";
		if (type.indexOf("Controller") != -1) {// 클래스 이름에 Controller 가 있는지?
			name = "Controller\t: ";
		} else if (type.indexOf("Service") != -1) {// 클래스 이름에 Service 가 있는지?
			name = "Service\t: ";
		} else if (type.indexOf("DAO") != -1) {// 클래스 이름에 DAO 가 있는지?
			name = "DAO\t: ";
		}
		System.out.println(name + type + "." + joinPoint.getSignature().getName() + "()");
		System.out.println(Arrays.toString(joinPoint.getArgs()));
		long end = System.currentTimeMillis();
		long time = end - start;
		System.out.println("실행시간 : " + time);
		return result;
	}
}
