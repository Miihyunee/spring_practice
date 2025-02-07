package com.example.spring03.model.board;

import java.util.List;

public interface BoardDAO {
	List<BoardDTO> list(int start, int end, String search_option, String keyword);

	void insert(BoardDTO dto);

	BoardDTO detail(int idx);

	void increate_hit(int idx);

	void update(BoardDTO dto);

	void delete(int idx);

	int count(String search_option, String keyword);

	List<String> list_attach(int idx);

	void insert_attach(String file_name);

	void update_attach(String file_name, int idx);

	void delete_attach(String file_name);
}
