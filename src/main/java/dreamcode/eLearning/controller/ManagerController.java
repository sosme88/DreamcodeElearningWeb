package dreamcode.eLearning.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dreamcode.eLearning.domain.Comment;
import dreamcode.eLearning.domain.Lecture;
import dreamcode.eLearning.domain.LectureDetail;
import dreamcode.eLearning.domain.User;
import dreamcode.eLearning.service.CommentService;
import dreamcode.eLearning.service.LectureDetailService;
import dreamcode.eLearning.service.LectureService;
import dreamcode.eLearning.service.UserService;

/**
 * @author 09162 김범종
 * 관리자 controller 입니다.
 */
@Controller
@RequestMapping("manage")
public class ManagerController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	LectureService lectureService;
	
	@Autowired
	LectureDetailService lectureDetailService;
	
	@Autowired
	CommentService commentService;
	
	/**
	 * 관리 페이지 메인을 반환하는 method
	 */
	@RequestMapping("main.do")
	public String manageMain(){
		return "/views/manage/manageMain.jsp";
	}
	
	/**
	 * 강의를 지워주는 method
	 */
	@RequestMapping("removeLecture.do")
	@ResponseBody
	public Integer removeLecture(Integer lectureId){
		lectureService.removeLecture(lectureId);
		lectureDetailService.removeLectureDetailByLecture(lectureId);
		commentService.removeCommentsByLecture(lectureId);
		return lectureId;
	}
	
	
	/**
	 * 강의를 수정하는 method
	 */
	@RequestMapping("modifyLecture.do")
	public String modify(Integer id, Model model){
		Lecture selectedLecture = lectureService.findLecture(id);
		List<LectureDetail> lectureDetails 
			= lectureDetailService.findAllByLecture(selectedLecture.getId());
		model.addAttribute("selectedLecture",selectedLecture);
		model.addAttribute("lectureDetails", lectureDetails);
		return "/views/manage/selectedLectureManage.jsp";
	}
	
	/**
	 * 유저의 권한을 수정하는 method
	 */
	@RequestMapping("modifyUser.do")
	@ResponseBody
	public String modify(User user){
		User tempUser = userService.findUser(user.getLoginId());
		user.setProfileImg(tempUser.getProfileImg());
		user.setSelfIntroduction(tempUser.getSelfIntroduction());
		userService.modifyUser(user);
		return "{\"result\":\"success\"}";
	}
	
	/**
	 * 유저를 삭제하는 method
	 */
	@RequestMapping("removeUser.do")
	@ResponseBody
	public Integer removeUser(Integer id, String userId){
		userService.removeUser(id);
		commentService.removeCommentsByUser(userId);
		return id;
	}
	
}
