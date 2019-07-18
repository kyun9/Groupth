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
	public UsersVO loginUser(String idVal, String pwdVal) {
		UsersVO user=null;
		String statement="UsersMapper.searchLoginId";
		user=session.selectOne(statement,idVal);
		if(user==null) 
			return null;
		if(!user.getPassword().equals(pwdVal))
			return null;
		return user;
	}
	public int idDuplChk(String users_id)throws Exception{
		String statement="UsersMapper.idCheck";
		System.out.println(session.selectOne(statement,users_id));
		return session.selectOne(statement,users_id);
}
}
