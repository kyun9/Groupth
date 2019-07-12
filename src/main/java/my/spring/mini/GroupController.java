package my.spring.mini;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GroupController {

	@RequestMapping(value="/group")
	public String group() {
		return "group";
	}
}
