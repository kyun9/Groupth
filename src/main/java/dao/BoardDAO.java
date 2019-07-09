package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BoardSearchVO;
import vo.BoardVO;


@Repository
public class BoardDAO {
	@Autowired
	SqlSession session= null;
	
	public boolean insert(BoardVO vo) {
		boolean result =true;
		String statement = "BoardMapper.insertBoard";
		if(session.insert(statement,vo)!=1)
			result=false;
		return result;
	}
	
	public boolean update(BoardVO vo) {
		boolean result =true;
		String statement  ="BoardMapper.updateBoard";
		if(session.update(statement,vo)!=1)
			result=false;
		return result;
	}
	
	public boolean delete(int id) {
		boolean result =true;
		String statement ="BoardMapper.deleteBoard";
		if(session.delete(statement,id)!=1)
			result =false;
		return result;
	}
	
	public List<BoardVO> listAll(){
		List<BoardVO> list=null;
		String statement="BoardMapper.listAllBoard";
		list=session.selectList(statement);
		return list;
	}
	
	public BoardVO listOne(int id) {
		BoardVO vo= null;
		String statement="BoardMapper.listOneBoard";
		String c_statement="BoardMapper.updateCount";
		session.update(c_statement,id);
		vo=session.selectOne(statement,id);
		return vo;
	}
	
	public List<BoardVO> listWriter(String writer){
		List<BoardVO> list;
		String statement = "BoardMapper.listWriterBoard";
		list = session.selectList(statement, writer);
		return list;
	}
	
	public List<BoardVO> search(BoardSearchVO vo){
		List<BoardVO> list;
		String statement = "BoardMapper.searchInfo";
		System.out.println(vo.getA());
		System.out.println(vo.getB());
		list = session.selectList(statement, vo);
		return list;

	}

	
	
}
