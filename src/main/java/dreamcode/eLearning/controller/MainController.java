package dreamcode.eLearning.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dreamcode.eLearning.domain.Lecture;
import dreamcode.eLearning.service.LectureService;

/**
 * @author 09162 김범종
 * 프로젝트 초기 실행 시
 * 바로 실행 되는 controller 입니다.
 */
@Controller
public class MainController {

	@Autowired
	LectureService lectureService;
	
	/**
	 * 시작 시 start.jsp를 거쳐서
	 * index.jsp를 리턴하는 method
	 */
	@RequestMapping("index.do")
	public String welcome(Model model){
		
		List<Lecture> appinventorLectures = lectureService.findAllByCategory("appinventor");
		
		List<Lecture> pythonLectures = lectureService.findAllByCategory("python");
		model.addAttribute("appinventorLectures", appinventorLectures);
		model.addAttribute("pythonLectures", pythonLectures);
		//appinventorLectures
		return "/index.jsp";
	}

}
