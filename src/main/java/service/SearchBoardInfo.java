package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import vo.BoardSearchVO;

@Service
public class SearchBoardInfo {
	public BoardSearchVO find(String key, String searchType) {
		BoardSearchVO vo = new BoardSearchVO();

		Map<String, String> map1 = new HashMap<String, String>();
		map1.put("key", key);
		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("searchType", searchType);

		vo.setA(map1);
		vo.setB(map2);

		return vo;
	}
}
