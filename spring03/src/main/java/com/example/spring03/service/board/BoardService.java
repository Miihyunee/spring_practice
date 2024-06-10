package com.example.spring03.service.board;

import java.util.List;
import com.example.spring03.model.board.BoardDTO;

public interface BoardService {
	List<BoardDTO> list(int start, int end, String search_option, String keyword);

	void insert(BoardDTO dto);

	BoardDTO detail(int inx);

	void increase_hit(int idx);

	void update(BoardDTO dto);

	void delete(int idx);

	int count(String search_option, String keyword);

	List<String> list_attach(int idx);

	void delete_attach(String file_name);
}
