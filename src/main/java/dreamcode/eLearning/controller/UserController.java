package dreamcode.eLearning.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dreamcode.eLearning.domain.User;
import dreamcode.eLearning.service.CommentService;
import dreamcode.eLearning.service.UserService;

/**
 * @author 09162 김범종
 * UserController 입니다.
 */
@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CommentService commentService;
	
	
	/**
	 * user를 select하는 controller method
	 */
	@RequestMapping("select.do")
	@ResponseBody
	public User select(User user){
		User selectedUser = userService.findUser(user.getLoginId());
		return selectedUser;
	}
	
	/**
	 * 유저가 스스로 탈퇴할 때 호출하는 method
	 */
	@RequestMapping("remove.do")
	public String removeUser(Integer id, String loginId, HttpSession session){
		userService.removeUser(id);
		commentService.removeCommentsByUser(loginId);
		session.invalidate();
		return "/start.jsp";
	}
	
	/**
	 * 로그인 method
	 */
	@RequestMapping("login.do")
	@ResponseBody
	public List<String> login(User user, HttpSession session, HttpServletRequest req){
		
		User loginUser = userService.findUser(user.getLoginId());
		List<String> dataSet = new ArrayList();
		if(loginUser == null){
			dataSet.add("error");
			dataSet.add("아이디가 없습니다.");
			return dataSet;
		}
		else{
			if(loginUser !=null && loginUser.getPassword().equals(user.getPassword()) &&
					loginUser.getLoginId().equals(user.getLoginId())){
				session.setAttribute("loginUser", loginUser);
				String referer = req.getHeader("Referer");
				
				
				dataSet.add("login");
				dataSet.add(referer);
				return dataSet;
			}
			else{
				dataSet.add("error");
				dataSet.add("비밀번호가 틀렸습니다.");
				return dataSet;
			}
		}
		
	}
	
	/**
	 * 로그아웃 method
	 */
	@RequestMapping("logout.do")
	public String logout(HttpSession session, HttpServletRequest req){
		session.invalidate();
		return "/start.jsp";
	}
	
	
	/**
	 * 모든 user를 찾아주는 method
	 */
	@RequestMapping("list.do")
	public String selectAll(Model model){
		List<User> users=userService.findAllUser();
		model.addAttribute("users", users);
		return "/views/manage/manageUsers.jsp";
	}
	
	/**
	 * 유저를 등록해주는 method
	 */
	@RequestMapping("register.do")
	@ResponseBody
	public List<String> register(String loginId, String password, String passwordConfirm,
			String nickname, String email, HttpSession session, HttpServletRequest req) {
		User user = new User();
		user.setLoginId(loginId);
		user.setNickname(nickname);
		List<String> dataSet = new ArrayList();
		if(userService.findUser(user.getLoginId()) != null){
			dataSet.add("error");
			dataSet.add("아이디가 존재합니다.");
			return dataSet;
		}
		else{
			if(password.equals(passwordConfirm)){
				user.setPassword(password);
				user.setEmail(email);
				Integer id = userService.registerUser(user);
				User loginUser = userService.findUser(user.getLoginId());
				session.setAttribute("loginUser", loginUser);
				String referer = req.getHeader("Referer");
				dataSet.add("register");
				dataSet.add(referer);
				return dataSet;
			}
			else{
				dataSet.add("error");
				dataSet.add("비밀번호가 일치하지 않습니다.");
				return dataSet;
			}
		}
	}
	
	
	/**
	 * TO DO
	 * 
	 * 유저가 등록한 email과 loginId를 확인하여
	 * 같으면 해당 email 주소로 비밀번호를 전송해주는 method
	 * 
	 * 메일 서버가 없으므로 TO DO
	 */
	@RequestMapping("findPassword.do")
	@ResponseBody
	public List<String> findPassword(User user){
		User tempUser = userService.findUser(user.getLoginId());
		List<String> dataSet = new ArrayList();
		if(tempUser == null){
			dataSet.add("error");
			dataSet.add("존재하지 않는 아이디 입니다.");
			return dataSet;
		}
		else{
			if(user.getEmail().equals(tempUser.getEmail())){
				dataSet.add("find");
				dataSet.add(user.getEmail());
				dataSet.add("비밀번호를 입력하신 "+user.getEmail()+" 으로 전송하였습니다.");
				return dataSet;
			}
			else{
				dataSet.add("error");
				dataSet.add("입력하신 이메일이 유효하지 않습니다.");
				return dataSet;
			}
		}
	}
	
	
	/**
	 * 마이페이지를 띄워주는 method
	 */
	@RequestMapping("mypage.do")
	public String myPage(){
		return "/views/user/myPage.jsp";
	}
	
	
	/**
	 * 유저가 스스로 개인정보를 바꿀 때 호출하는 method
	 */
	@RequestMapping("modify.do")
	@ResponseBody
	public List<String> modify(String loginId, String password, String passwordConfirm, String nickname, 
			String email, String selfIntroduction, HttpSession session, HttpServletRequest req){
		
		List<String> dataSet = new ArrayList();
		
		if(password.equals(passwordConfirm)){
			User user = userService.findUser(loginId);
			user.setNickname(nickname);
			user.setPassword(password);
			user.setEmail(email);
			user.setSelfIntroduction(selfIntroduction);
			userService.modifyUser(user);
			User loginUser = userService.findUser(user.getLoginId());
			commentService.modifyByUser(loginUser);
			session.setAttribute("loginUser", loginUser);
			String referer = req.getHeader("Referer");
			dataSet.add("success");
			dataSet.add(referer);
			return dataSet;
		}
		else{
			dataSet.add("error");
			dataSet.add("비밀번호가 일치하지 않습니다.");
			return dataSet;
		}
	}
	
	/**
	 * 프로필 이미지를 바꿔주는 method
	 */
	@RequestMapping("modifyProfileImage.do")
	public String upload(HttpSession session, HttpServletRequest req)
	         throws Exception {
		File saveFile = new File("C:/Dev/workspace/DreamcodeElearningWeb/webapp/resources/img/userProfile");
  
	    User loginUser = (User) session.getAttribute("loginUser");
	
	    if (ServletFileUpload.isMultipartContent(req)) {
	
		     DiskFileItemFactory factory = new DiskFileItemFactory(1024 * 100, saveFile);
		
		     ServletFileUpload upload = new ServletFileUpload(factory);
		     upload.setSizeMax(1024*1024);
		     List<FileItem> items = upload.parseRequest(req);
		     for (FileItem item : items) {
		        if (item.isFormField()) {
		
		        } else {
		           if (item.getSize() > 0) {
		    	   String fileName = new File(item.getName()).getName();
		           Date now = new Date();
		           String[] tempName = fileName.split("\\.");
		           String newFileName = tempName[0]+now.getTime()+"."+tempName[tempName.length-1];
		           File uploadedFile = new File(saveFile, newFileName);
		           item.write(uploadedFile);
		           loginUser.setProfileImg(newFileName);
		           userService.modifyUserProfileImg(loginUser);
		           commentService.modifyByUser(loginUser);
		           session.setAttribute("loginUser", loginUser);
		           }
		        }
		     }
    	 }
		  String referer = req.getHeader("Referer");
		  return "redirect:"+referer;
	}
}
