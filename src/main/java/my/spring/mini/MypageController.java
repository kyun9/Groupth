package my.spring.mini;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	
	@RequestMapping(value="/mypage")
	public String mypage() {
		return "mypage";
	}
}
