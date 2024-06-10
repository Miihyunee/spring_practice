package com.example.spring03.controller.upload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class ImageUploadController {

	@PostMapping("imageUpload.do")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(name = "upload") MultipartFile upload) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		OutputStream out = null;
		PrintWriter printWriter = null;
		String fileName = upload.getOriginalFilename();
		byte[] bytes = upload.getBytes();
		ServletContext application = request.getSession().getServletContext();
		// 배포 디렉토리
		String uploadPath = application.getRealPath("/resources/images/");
		out = new FileOutputStream(new File(uploadPath + fileName));
		// 파일 저장
		out.write(bytes);
		printWriter = response.getWriter();
		// json을 만드는 명령어 → {"key" : "value"}
		String fileUrl = request.getContextPath() + "/resources/images/" + fileName;
		printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
		// 버퍼안의 내용들이 전달되면서 비워짐
		printWriter.flush();
	}
}
