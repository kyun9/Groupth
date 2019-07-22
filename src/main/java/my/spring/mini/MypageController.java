package my.spring.mini;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.FieldDAO;
import dao.MypageDAO;
import dao.UsersDAO;
import dao.Users_GroupDAO;
import service.ImageUploadService;
import vo.Login_InfoVO;
import vo.UsersVO;

@Controller
public class MypageController {
	@Autowired
	UsersDAO usersDAO;
	@Autowired
	Users_GroupDAO ugDAO;
	@Autowired
	FieldDAO Fielddao;
	@Autowired
	MypageDAO mypageDAO;
	@Autowired
	private ImageUploadService imageUploadService;
	
	@RequestMapping(value="/mypage", method = RequestMethod.GET)
	public ModelAndView mypage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Login_InfoVO user = (Login_InfoVO) session.getAttribute("loginUser");
		mav.addObject("myGroup", ugDAO.myGroup(user.getUser()));
		mav.addObject("showUser", usersDAO.showUser(user.getUser()));
		mav.addObject("field", Fielddao.ListAllType());
		mav.setViewName("mypage/myInfo");
		return mav;
	}
	@RequestMapping(value="/mypage/myInfo", method=RequestMethod.POST)
	public ModelAndView doPostMyInfo(UsersVO vo,String action,HttpSession session, MultipartFile image) throws IOException {
		ModelAndView mav = new ModelAndView();
		Login_InfoVO user = (Login_InfoVO) session.getAttribute("loginUser");
		vo.setUsers_id(user.getUser());
		String fileName=image.getOriginalFilename();
		if(!fileName.equals("")) {
			vo.setImg(fileName);
			imageUploadService.getUsersImagePath(image);
		}else {
			vo.setImg("smile.png");
		}
		if(action!=null) {
			if(action.equals("change")) {
				usersDAO.change(vo);
			}
			else if(action.equals("addInfo")) {
				usersDAO.addInfo(vo);
			}
		}
		mav.setViewName("redirect:/mypage");
		return mav;
	}
	
	@RequestMapping(value="/mypage/deleteGroup", method=RequestMethod.GET)
	public ModelAndView deleteGroup(String gid, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Login_InfoVO user = (Login_InfoVO) session.getAttribute("loginUser");
		mypageDAO.deleteGroup(gid,user.getUser());
		
		mav.setViewName("redirect:/mypage");
		return mav;
	}
}
