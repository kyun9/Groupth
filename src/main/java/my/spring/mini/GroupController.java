package my.spring.mini;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.FieldDAO;
import dao.GroupDAO;
import service.ImageUploadService;
import vo.GroupVO;
import vo.Group_InfoVO;
import vo.Users_GroupVO;

@Controller
public class GroupController {
	@Autowired
	FieldDAO Fielddao;
	@Autowired
	GroupDAO GroupDao;
	@Autowired
	private ImageUploadService imageUploadService;
	
	
	@RequestMapping(value="/group",  method = RequestMethod.GET)
	public ModelAndView group(String action, String field,String key) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("field", Fielddao.ListAllType());
		if (action != null) {
			if (action.equals("search")) {
				mav.addObject("grouplist", GroupDao.search(key, field));
				mav.setViewName("group/group");
				return mav;
			}
		}
		mav.addObject("grouplist", GroupDao.ListAllGroup());
		mav.setViewName("group/group");
		return mav;		
	}
	
	@RequestMapping(value="/group/createGroup", method = RequestMethod.GET)
	public ModelAndView doGetCreatGroup() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("field", Fielddao.ListAllType());
		mav.setViewName("group/gEdit");
		return mav;
	}
	
	@RequestMapping(value="/group/createGroup", method = RequestMethod.POST)
	public ModelAndView doPostCreatGroup(GroupVO vo, String action, MultipartFile image) throws IOException {
		ModelAndView mav = new ModelAndView();
		if (action.equals("insert")) {
			vo.setImg(image.getOriginalFilename());
			imageUploadService.getImagePath(image);
			boolean result = GroupDao.create(vo);
			if(result) 
				System.out.println("그룹 생성 성공");
			else
				System.out.println("그룹 생성 실패");
		}
		mav.setViewName("redirect:/group");
		return mav;
	}
	
	@RequestMapping(value="/group/content", method =RequestMethod.GET)
	public ModelAndView showContent(int gid) {
		ModelAndView mav = new ModelAndView();
		Group_InfoVO vo =GroupDao.showContent(gid);
		mav.addObject("content", vo);
		mav.setViewName("group/content");
		return mav;
	}
}
