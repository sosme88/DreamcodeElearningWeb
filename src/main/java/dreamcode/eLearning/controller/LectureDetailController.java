package dreamcode.eLearning.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dreamcode.eLearning.domain.LectureDetail;
import dreamcode.eLearning.service.LectureDetailService;

/**
 * @author 09162 김범종
 * LectureDetailController 입니다.
 */
@Controller
@RequestMapping("detail")
public class LectureDetailController {

	@Autowired
	private LectureDetailService lectureDetailService;
	
	/**
	 * 강의 디테일을 등록해주는 method
	 */
	@RequestMapping("register.do")
	@ResponseBody
	public LectureDetail register(LectureDetail lectureDetail){
		Integer id = lectureDetailService.registerLectureDetail(lectureDetail);
		LectureDetail unfinishedDetail = lectureDetailService.findLectureDetail(id);
		return unfinishedDetail;
	}
	
	/**
	 * 강의 디테일을 수정해주는 method
	 */
	@RequestMapping("modify.do")
	@ResponseBody
	public String modify(LectureDetail lectureDetail){
		lectureDetailService.modifyLectureDetail(lectureDetail);
		return "{\"result\":\"success\"}";
	}
	
	/**
	 * 강의 디테일을 지워주는 method
	 */
	@RequestMapping("remove.do")
	@ResponseBody
	public Integer register(Integer id){
		lectureDetailService.removeLectureDetail(id);
		return id;
	}
}
