package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.GroupVO;

@Repository
public class GroupDAO {
	@Autowired
	SqlSession session=null;
	
	public boolean create(GroupVO vo) {
		boolean result =true;
		
		
		return result;
	}
}
