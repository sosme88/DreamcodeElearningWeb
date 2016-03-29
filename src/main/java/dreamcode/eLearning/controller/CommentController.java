package dreamcode.eLearning.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dreamcode.eLearning.domain.Comment;
import dreamcode.eLearning.domain.User;
import dreamcode.eLearning.service.CommentService;

@Controller
@RequestMapping("comment")
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	/**
	 * 모든 코멘트를 선택해주는 method
	 */
	@RequestMapping("list.do")
	public String selectAll(Model model){
		List<Comment> comments = commentService.findAll();
		model.addAttribute("comments", comments);
		return "/views/manage/manageComments.jsp";
	}
	
	/**
	 * 코멘트를 생성해주는 method
	 */
	@RequestMapping("create.do")
	@ResponseBody
	public Comment register(Comment comment, HttpSession session){
		User loginUser = (User)session.getAttribute("loginUser");
		comment.setProfileImg(loginUser.getProfileImg());
		Integer id = commentService.registerComment(comment);
		Comment resultComment = commentService.findComment(id);
		return resultComment;
	}
	
	/**
	 * 코멘트를 수정해주는 method
	 */
	@RequestMapping("modify.do")
	@ResponseBody
	public String modify(Comment comment){
		commentService.modifyComment(comment);
		return "{\"result\":\"success\"}";
	}
	
	/**
	 * 코멘트를 삭제해주는 method
	 */
	@RequestMapping("remove.do")
	@ResponseBody
	public Integer remove(Integer id){
		commentService.removeComment(id);
		return id;
	}
}
