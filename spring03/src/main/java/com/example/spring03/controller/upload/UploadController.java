package com.example.spring03.controller.upload;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UploadController {
	String upload_path = "c:/upload/";

	@GetMapping("/upload/input.do")
	public String input() {
		return "upload/input";
	}

	@PostMapping("/upload/upload.do")
	public ModelAndView upload(@RequestParam(name = "file") MultipartFile file, ModelAndView mav) throws Exception {
		String saveName = file.getOriginalFilename();
		UUID uid = UUID.randomUUID();
		saveName = uid.toString() + "_" + saveName;
		File target = new File(upload_path, saveName);
		FileCopyUtils.copy(file.getBytes(), target);
		mav.setViewName("upload/upload_result");
		mav.addObject("saved_name", saveName);
		return mav;
	}

}
