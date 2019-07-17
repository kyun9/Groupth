package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import vo.NoticeVO;

@Repository
public class NoticeDAO {
	@Autowired
	SqlSession session=null;
	
	public boolean writeNotice(NoticeVO vo) {
		boolean result=true;
		System.out.println(vo);
		if(session.insert("NoticeMapper.writeNotice",vo)!=1) {
			result=false;
		}
		
		return result;
	}
}
