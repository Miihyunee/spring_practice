package com.example.springmvc.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.springmvc.model.dto.ProductDTO;

@Controller
public class MainController {

	@RequestMapping("/")
	public String main(Model model) {
		model.addAttribute("message", "홈페이지 방문을 환영합니다.");
		return "main";
	}

	@GetMapping("gugu.do")
	public String multi_table(Model model) {
		return "test/gugu";
	}

	@PostMapping("gugu_result.do")
	public String table_result(@RequestParam(value = "num", defaultValue = "3") int num, Model model) {
		String result = "";
		for (int i = 1; i <= 9; i++) {
			result += num + "x" + i + "=" + num * i + "<br>";
		}
		model.addAttribute("result", result);
		return "test/gugu_result";
	}

	@RequestMapping("test")
	public void test() {

	}

	@RequestMapping("test/doA")
	public String doA(Model model) {
		model.addAttribute("message", "홈페이지 방문을 환영합니다.");
		return "test/doB";
	}

	@RequestMapping("test/doB")
	public void doB() {
		System.out.println("doB called...");
	}

	@RequestMapping("test/doC")
	public ModelAndView doC() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product", new ProductDTO("샤프", 1000));
		return new ModelAndView("test/doC", "map", map);
	}

	@RequestMapping("test/doD")
	public String doD() {
		return "redirect:/test/doE";
	}

	@RequestMapping("test/doE")
	public void doE() {

	}

	@PostMapping("test/doF")
	public @ResponseBody ProductDTO background() {
		ProductDTO dto = new ProductDTO("TV", 500000);
		return dto;
	}
}
