package my.spring.mini;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.UsersDAO;
import dao.Users_GroupDAO;
import vo.Login_InfoVO;
import vo.UsersVO;

@Controller
public class MypageController {
	@Autowired
	UsersDAO usersDAO;
	@Autowired
	Users_GroupDAO ugDAO;
	
	@RequestMapping(value="/mypage", method = RequestMethod.GET)
	public ModelAndView mypage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Login_InfoVO user = (Login_InfoVO) session.getAttribute("loginUser");
		mav.addObject("myGroup", ugDAO.myGroup(user.getUser()));
		mav.addObject("showUser", usersDAO.showUser(user.getUser()));
		mav.setViewName("mypage/myInfo");
		return mav;
	}
	@RequestMapping(value="/mypage/myInfo", method=RequestMethod.POST)
	public ModelAndView doPostMyInfo(UsersVO vo,String action,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Login_InfoVO user = (Login_InfoVO) session.getAttribute("loginUser");
		vo.setUsers_id(user.getUser());
		if(action!=null) {
		if(action.equals("change")) {
		boolean result= usersDAO.change(vo);
		if(result)
			mav.addObject("msg","수정이 완료되었습니다.");
		else
			System.out.println("회원 정보 수정이 실패했습니다.");
		}}
		mav.setViewName("redirect:/mypage");
		return mav;
	}
}
