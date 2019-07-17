package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.NoticeVO;

@Repository
public class NoticeDAO {
	@Autowired
	SqlSession session=null;
	
	public boolean writeNotice(NoticeVO vo) {
		boolean result=true;
		if(session.insert("NoticeMapper.writeNotice",vo)!=1) {
			result=false;
		}
		return result;
	}
	
	public List<NoticeVO> noticeList(int gid){
		List<NoticeVO> list;
		list= session.selectList("NoticeMapper.ListAll",gid);
		return list;
	}
	
	public boolean deleteNotice(int nid) {
		boolean result= true;
		if(session.delete("NoticeMapper.deleteNotice",nid)!=1) {
			result=false;
		}
		return result;
	}
}
