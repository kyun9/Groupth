package my.spring.mini;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.BoardDAO;
import vo.BoardVO;
import vo.Login_InfoVO;

@Controller
public class BoardController {
	@Autowired
	BoardDAO dao;

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public ModelAndView doGet(String action, String newsid, String writer, String key, String searchType) {
		ModelAndView mav = new ModelAndView();

		if (action != null) {
			if (action.equals("search")) {
				mav.addObject("list", dao.search(key, searchType));
				mav.setViewName("board");
				return mav;
			} else if (action.equals("listwriter")) {
				mav.addObject("list", dao.listWriter(writer));
				mav.setViewName("board");
				return mav;
			}
		}
		mav.addObject("list", dao.listAll());
		mav.setViewName("board");
		return mav;
	}

	@RequestMapping(value = "/board", method = RequestMethod.POST)
	public ModelAndView doPost(BoardVO vo, String action, String id) {
		ModelAndView mav = new ModelAndView();

		if (action.equals("update")) {
			boolean result = dao.update(vo);
			if (result) {
				mav.addObject("msg", "업데이트 되었습니다.");
			} else {
				mav.addObject("msg", "업데이트 실패하였습니다.");
			}
		}
		mav.addObject("list", dao.listAll());
		mav.setViewName("board");
		return mav;
	}

	@RequestMapping(value = "/board/content", method = RequestMethod.GET)
	public ModelAndView goContent(String action,String bid) {
		ModelAndView mav = new ModelAndView();

		if (action.equals("read")) {
			mav.addObject("listone", dao.listOne(Integer.valueOf(bid)));
		}else if (action.equals("delete")) {
			dao.delete(Integer.valueOf(bid));
			mav.addObject("list", dao.listAll());
			mav.setViewName("redirect:/board");
			return mav;
		}
		mav.setViewName("boardContent");
		return mav;
	}
	
	@RequestMapping(value="/board/content/edit", method=RequestMethod.GET)
	public ModelAndView doGetEdit(BoardVO vo, String action) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("edit");
		return mav;
	}
	@RequestMapping(value="/board/content/edit", method=RequestMethod.POST)
	public ModelAndView doPostEdit(BoardVO vo, String action) {
		ModelAndView mav = new ModelAndView();
		
		if (action.equals("insert")) {
			dao.insert(vo);
		}
		else if(action.equals("update")) {
			dao.update(vo);
		}
		mav.addObject("list", dao.listAll());
		mav.setViewName("redirect:/board");
		return mav;
	}
}
