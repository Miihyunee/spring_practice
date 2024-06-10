package com.example.spring03.controller.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.spring03.model.message.MessageDTO;
import com.example.spring03.service.message.MessageService;

@RestController
@RequestMapping("/messages/*")
public class MessageController {

	@Autowired
	MessageService service;

	@PostMapping("/")
	public ResponseEntity<String> addMessage(@RequestBody MessageDTO dto) {
		ResponseEntity<String> entity = null;
		try {
			service.insertMessage(dto);
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
