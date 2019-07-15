package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.GroupVO;
import vo.Group_InfoVO;

@Repository
public class GroupDAO {
	@Autowired
	SqlSession session=null;
	
	public boolean create(GroupVO vo) {
		boolean result =true;
		if(session.insert("GroupMapper.insertGroup",vo)!=1) {
			System.out.println("group table 삽입 에러");
			result=false;
		}
		return result;
	}
	
	public List<Group_InfoVO> ListAllGroup(){
		List<Group_InfoVO> list =null;
		String statement = "GroupMapper.ListAllGroup"; 
		list=session.selectList(statement);
		return list;
	}
	public List<Group_InfoVO> search(String key, String field){
		List<Group_InfoVO> list;
		String statement = "GroupMapper.searchInfo";
		 Map<String, String> parameters = new HashMap<String, String>();
		 parameters.put("key", key);
		 parameters.put("field", field);
		list = session.selectList(statement, parameters);
		return list;

	} 
}
