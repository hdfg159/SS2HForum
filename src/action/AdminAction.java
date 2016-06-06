package action;

import java.util.List;

import model.Usertable;
import service.IUserService;
import utils.LogUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private ActionContext context = ActionContext.getContext();

	private String username;
	private String password;
	private int plateId;
	private int id;

	public int getPlateId() {
		return plateId;
	}

	public void setPlateId(int plateId) {
		this.plateId = plateId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	private IUserService userService;

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public String setPlateAdmin() throws Exception {
		int plateid = (Integer) context.getSession().get("plateIdAdmin");
		userService.plateAdmin(id, plateid);
		refreshuserinfolist();
		return "setplateadminsuccess";
	}

	public String setAdmin() throws Exception {
		userService.webAdmin(id);
		refreshuserinfolist();
		return "addsuccess";
	}

	public String addUser() throws Exception {
		Usertable user = new Usertable();
		user.setUsername(username);
		user.setPassword(password);
		userService.save(user);
		refreshuserinfolist();
		LogUtil.i("成功插入用户信息");
		return "addsuccess";
	}

	public String deleteUser() throws Exception {
		userService.delete(id);
		refreshuserinfolist();
		return "addsuccess";
	}

	public String AgetUserList() throws Exception {
		refreshuserinfolist();
		return "addsuccess";
	}

	public String PgetUserList() throws Exception {
		context.getSession().put("plateIdAdmin", plateId);
		refreshuserinfolist();
		return "setplateadminsuccess";
	}

	public void refreshuserinfolist() {
		List<Usertable> usersList = userService.findAll();
		context.getSession().put("userlist", usersList);
	}
}
