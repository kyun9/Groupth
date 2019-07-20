package my.spring.mini;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.FieldDAO;
import dao.UsersDAO;
import vo.Login_InfoVO;

@Controller
public class MatchController {
	@Autowired
	UsersDAO usersDAO;
	@Autowired
	FieldDAO Fielddao;
	
	@RequestMapping(value="/match",  method = RequestMethod.GET)
	public ModelAndView match(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Login_InfoVO user = (Login_InfoVO) session.getAttribute("loginUser");
		mav.addObject("matchInfo", usersDAO.matchInfo(user.getUser_name()));
		mav.addObject("field", Fielddao.ListAllType());
		mav.setViewName("match/match");
		return mav;
	}
}
