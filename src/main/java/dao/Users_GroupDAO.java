package dao;
 
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.UsersVO;

@Repository
public class Users_GroupDAO {
	@Autowired
	SqlSession session=null;
	
	public List<UsersVO> tempMember(int gid){
		List<UsersVO> list; 
		list = session.selectList("TempMemMapper.listTempMember", gid);
		System.out.println(list);
		return list;
	}
}
