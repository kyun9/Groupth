package dao;
 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.UsersVO;

@Repository
public class Users_GroupDAO {
	@Autowired
	SqlSession session=null;
	
	public boolean applyGroup(String uid, int gid) {
		boolean result = true;
		int num=0;
		Map<String,String> parameters = new HashMap<String,String>();
		parameters.put("users_id", uid);
		parameters.put("gid", String.valueOf(gid));
		num = session.selectOne("TempMemMapper.checkUser", parameters);
		if(num==0) {
			System.out.println("가입가능");
			if(session.insert("TempMemMapper.applyUser", parameters)!=1) {
				System.out.println("가입은 가능하나 삽입실패");
				result=false;
			}
		}
		else {
			System.out.println("이미 가입함");
			result = false;
		}
		return result;
	}
	
	public List<UsersVO> tempMember(int gid){
		List<UsersVO> list; 
		list = session.selectList("TempMemMapper.listTempMember", gid);
		return list;
	}
	
	public List<UsersVO> currentMember(int gid){
		List<UsersVO> list; 
		list = session.selectList("TempMemMapper.listCurrentMember", gid);
		return list;
	}
}
