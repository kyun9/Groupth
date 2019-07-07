package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.UsersVO;

@Repository
public class UsersDAO {
	@Autowired
	SqlSession session =null;
	
	public boolean insert(UsersVO vo) {
		boolean result = true;
		String statement ="UsersMapper.insertUser";
		if(session.insert(statement,vo)!=1)
			result=false;
		return result;
	}
}
