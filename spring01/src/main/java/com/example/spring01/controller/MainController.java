package com.example.spring01.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring01.model.PointDTO;
import com.example.spring01.model.ProductDTO;

@Controller
// 현재 클래스가 controller bean 으로 등록
// bean : 서버가 시작할 때 자동으로 등록, single ton, public, static
public class MainController {

	@GetMapping("/") // → http://localhost
	// @GetMapping : get 방식의 Mapping
	// @PostMapping : post 방식의 Mapping
	// @RequestMapping : 모든 방식의 Mapping
	public String main(Model model) {
		model.addAttribute("message", "welcome!");
		return "main"; // view 로 return (return "/WEB-INF/views/main.jsp";)
	}

	@GetMapping("multi_table.do")
	public String multi_table(Model model) {
		return "test/multi_table";
	}

	@PostMapping("table_result.do")
	public String table_result(@RequestParam(value = "num", defaultValue = "3") int num, Model model) {
		String result = "";
		for (int i = 1; i <= 9; i++) {
			result += num + "x" + i + "=" + num * i + "<br>";
		}
		// model 에 저장
		model.addAttribute("result", result);
		return "test/table_result";
	}

	@GetMapping("point.do")
	public String point() {
		return "test/point";
	}

	@PostMapping("point_result.do")
	public String point_result(@ModelAttribute PointDTO dto, Model model) {
		dto.setTotal(dto.getKor() + dto.getEng() + dto.getMat());
		String avg = String.format("%.2f", dto.getTotal() / 3.0);
		dto.setAverage(Double.parseDouble(avg));
		model.addAttribute("dto", dto);
		return "test/point_result";
	}

	@GetMapping("move.do")
	public String move() throws Exception {
		String name = URLEncoder.encode("김철수", "utf-8");
		// redirect:/ → 이 내용이 없으면 forward
		return "redirect:/result.do?name=" + name + "&age=20";
		// return "redirect:/result.do?name=김철수&age=20";
	}

	@GetMapping("result.do")
	public String result(Model model, @RequestParam(name = "name", defaultValue = "noname") String name,
			@RequestParam(name = "age", defaultValue = "10") int age) throws Exception {
		name = URLDecoder.decode(name, "utf-8");
		model.addAttribute("name", name);
		model.addAttribute("age", age);
		return "test/result";
	}

	@GetMapping("mav.do")
	public ModelAndView mav() { // ModelAndView : 데이터+화면
		Map<String, Object> map = new HashMap<>();
		map.put("dto", new ProductDTO("pen", 1000));
		// ModelAndView("화면", "데이터이름", 데이터);
		// map > dto > property
		return new ModelAndView("test/mav_result", "map", map);
	}

	@GetMapping("ajax.do")
	public String ajax() {
		return "test/ajax";
	}

	@GetMapping("background.do")
	public @ResponseBody ProductDTO background() {
		ProductDTO dto = new ProductDTO("TV", 500000);
		return dto;
	}

	@GetMapping("login.do")
	public String login() {
		return "test/login";
	}

	@PostMapping("login_result.do")
	public String login_result(@RequestParam(name = "id") String id, @RequestParam(name = "pw") String pw,
			Model model) {
		String result = "";
		if (id.equals("kim") && pw.equals("1234")) {
			result = "kim님 환영합니다.";
		} else {
			result = "아이디 또는 비밀번호가 틀렸습니다.";
		}
		model.addAttribute("result", result);
		return "test/login_result";
	}

	@GetMapping("ajax_table.do")
	public String ajax_gugu() {
		return "test/ajax_table";
	}

	@PostMapping("ajax_table_result.do")
	public String ajax_gugu_result(@RequestParam(name = "num") int num, Model model) {
		String result = "";
		for (int i = 1; i <= 9; i++) {
			result += num + "x" + i + "=" + num * i + "<br>";
		}
		model.addAttribute("result", result);
		return "test/ajax_table_result";
	}

}
