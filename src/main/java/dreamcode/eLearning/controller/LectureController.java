package dreamcode.eLearning.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dreamcode.eLearning.domain.Comment;
import dreamcode.eLearning.domain.Lecture;
import dreamcode.eLearning.domain.LectureDetail;
import dreamcode.eLearning.service.CommentService;
import dreamcode.eLearning.service.LectureDetailService;
import dreamcode.eLearning.service.LectureService;

/**
 * @author 09162 김범종
 * LectureController 입니다.
 */
@Controller
@RequestMapping("lecture")
public class LectureController {

	@Autowired
	private LectureService lectureService;
	
	@Autowired
	private LectureDetailService lectureDetailService;
	
	@Autowired
	private CommentService commentService;
	
	/**
	 * 강의를 전부 찾아주는 method
	 */
	@RequestMapping("list.do")
	public String selectAll(Model model){
		List<Lecture> allAppinventorLectures = lectureService.findAllByCategory("appinventor");
		List<Lecture> allPythonLectures = lectureService.findAllByCategory("python");
		model.addAttribute("allAppinventorLectures",allAppinventorLectures);
		model.addAttribute("allPythonLectures",allPythonLectures);
		return "/views/manage/manageLectures.jsp";
	}
	
	/**
	 * 선택 된 강의를 control 해주는 method
	 */
	@RequestMapping("selectedLecture.do")
	public String selectedLecture(Integer id, Model model){
		Lecture selectedLecture = lectureService.findLecture(id);
		List<LectureDetail> lectureDetails = lectureDetailService.findAllByLecture(selectedLecture.getId());
		List<Comment> comments = commentService.findAllByLecture(selectedLecture.getId());
		model.addAttribute("selectedLecture", selectedLecture);
		model.addAttribute("lectureDetails", lectureDetails);
		model.addAttribute("comments", comments);
		return "/views/lecture/selectedLecture.jsp";
	}
	
	/**
	 * 카테고리(앱인벤터, 파이썬)에 따라
	 * 강의들을 선택해주는 method
	 */
	@RequestMapping("listByCategory.do")
	public String selectByCategory(String category, Model model){
		List<Lecture> lecturesByCategory = lectureService.findAllByCategory(category);
		
		model.addAttribute("lecturesByCategory", lecturesByCategory);
		model.addAttribute("category", category);
		return "/views/lecture/listByCategory.jsp";
	}
	
	/**
	 * 강의를 등록해주는 method
	 */
	@RequestMapping("register.do")
	public String registerLecture(Lecture lecture, Model model){
		Integer id = lectureService.registerLecture(lecture);
		Lecture unfinishedLecture = lectureService.findLecture(id);
		model.addAttribute("unfinishedLecture", unfinishedLecture);
		return "/views/manage/createLectureDetail.jsp";
	}
	
	/**
	 * 강의를 수정해주는 method
	 */
	@RequestMapping("modify.do")
	@ResponseBody
	public String modifyLecture(Lecture lecture){
		lectureService.modifyLecture(lecture);
		return "{\"result\":\"success\"}";
	}
}
