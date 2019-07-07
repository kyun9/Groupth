package my.spring.mini;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.UsersDAO;
import vo.UsersVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	UsersDAO dao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value="/login", method= RequestMethod.GET)
	public String login() {
		System.out.println("login");
		return "login";
	}
	@RequestMapping(value="/login", method= RequestMethod.POST)
	public ModelAndView doLogin(String idVal, String pwdVal) {
		ModelAndView mav = new ModelAndView();
		boolean result = dao.loginUser(idVal, pwdVal);
		if(result)
			mav.addObject("msg", "로그인 성공");
		else
			mav.addObject("msg","로그인 실패");
		
		mav.setViewName("redirect:/");
		return mav;
	}
	@RequestMapping(value="/register", method= RequestMethod.GET)
	public String register() {
		System.out.println("register");
		return "register";
	}
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public ModelAndView doRegister(UsersVO vo) {
		ModelAndView mav = new ModelAndView();
		boolean result= dao.insert(vo);
		if(result)
			mav.addObject("msg","성공적으로 가입되었습니다.");
		else
			mav.addObject("msg","가입에 실패하였습니다.");
		
		mav.setViewName("redirect:/");
		return mav;
	}
}
