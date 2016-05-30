package action;

import model.Usertable;
import service.IUserService;
import utils.LogUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {

	private static final long serialVersionUID = 7922979648150320921L;
	private ActionContext context = ActionContext.getContext();
	private String username;
	private String pwd;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	/** 注入Service **/
	private IUserService userService;

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public String login() throws Exception {
		Usertable user = userService.check(username, pwd);
		if (user == null) {
			addFieldError("loginerror", "用户名或密码不对");
			LogUtil.i("用户不存在");
			return INPUT;
		} else {
			LogUtil.i("用户存在");
			context.getSession().put("user", user);
			return SUCCESS;
		}
	}

	public String register() throws Exception {
		if (userService.check(username, pwd) == null) {
			Usertable newuser = new Usertable();
			newuser.setUsername(username);
			newuser.setPassword(pwd);
			userService.save(newuser);
			return "registersuccess";
		} else {
			return INPUT;
		}
	}
}
