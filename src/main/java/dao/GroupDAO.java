package dao;

import java.util.List;

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
		String statement = "GroupMapper.insertGroup";
		if(session.insert(statement,vo)!=1)
			result=false;
		return result;
	}
	
	public List<Group_InfoVO> ListAllGroup(){
		List<Group_InfoVO> list =null;
		String statement = "GroupMapper.ListAllGroup";
		list=session.selectList(statement);
		return list;
	}
}
