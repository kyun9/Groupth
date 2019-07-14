package my.spring.mini;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.FieldDAO;

@Controller
public class GroupController {
	@Autowired
	FieldDAO Fielddao;
	
	@RequestMapping(value="/group",  method = RequestMethod.GET)
	public ModelAndView group() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("field", Fielddao.ListAllType());
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
	public ModelAndView doPostCreatGroup() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("group/gEdit");
		return mav;
	}
	
}
