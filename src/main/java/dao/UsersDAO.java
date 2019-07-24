package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.UsersVO;

@Repository
public class UsersDAO {
	@Autowired
	SqlSession session = null;

	public boolean insert(UsersVO vo) {
		boolean result = true;
		if (session.insert("UsersMapper.insertUser", vo) != 1)
			result = false;
		return result;
	}

	public UsersVO loginUser(String idVal, String pwdVal) {
		UsersVO user = null;
		user = session.selectOne("UsersMapper.searchLoginId", idVal);
		if (user == null)
			return null;
		if (!user.getPassword().equals(pwdVal))
			return null;
		return user;
	}

	public int idDuplChk(String users_id) throws Exception {
		return session.selectOne("UsersMapper.idCheck", users_id);
	}

	public UsersVO showUser(String idVal) {
		return session.selectOne("UsersMapper.showUser", idVal);
	}

	public boolean addInfo(UsersVO vo) {
		boolean result = true;
		if (vo.getImg().equals("smile.png")) {
			session.update("UsersMapper.addInfoException", vo);
		} else if (session.update("UsersMapper.addInfo", vo) != 1)
			result = false;
		return result;
	}

	public boolean change(UsersVO vo) {
		boolean result = true;
		if (session.update("UsersMapper.changeUser", vo) != 1)
			result = false;
		return result;
	}

	public UsersVO matchInfo(String idVal) {
		return session.selectOne("UsersMapper.matchInfo", idVal);
	}

	public List<UsersVO> allUsersLocation(int range, int field, String lat, String lng) {
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("range", String.valueOf(range));
		parameters.put("field", String.valueOf(field));
		parameters.put("lat", lat);
		parameters.put("lng", lng);
		return session.selectList("UsersMapper.allUsersLocation", parameters);
	}
}
