package action;

import java.io.File;
import java.util.List;

import model.Usertable;

import org.apache.struts2.ServletActionContext;

import service.IPostPlateService;
import service.IUserService;
import utils.LogUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MainAction extends ActionSupport {

	private static final long serialVersionUID = -5328396697016754112L;
	private IPostPlateService postPlateService;
	private IUserService userService;

	public void setPostPlateService(IPostPlateService postPlateService) {
		this.postPlateService = postPlateService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	@Override
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		Usertable user = (Usertable) context.getSession().get("user");
		if (user == null) {
			return INPUT;
		} else {
			RefleshHeadIcon(user, context);
			List<?> plates = postPlateService.findAll();
			context.getSession().put("PlateList", plates);
			return SUCCESS;
		}
	}

	public void RefleshHeadIcon(Usertable user, ActionContext context) {
		File headicon = new File(ServletActionContext.getServletContext()
				.getRealPath("upload") + "\\head\\" + user.getHead());
		LogUtil.i(headicon.getAbsolutePath());
		if (headicon.isDirectory()) {
			userService.modHeadIcon(user.getId(), "no");
			LogUtil.i("没有头像图片");
		} else {
			if (!headicon.exists()) {
				userService.modHeadIcon(user.getId(), "no");
				LogUtil.i("没有头像图片");
			}
		}
		Usertable usernew = userService.check(user.getUsername(),
				user.getPassword());
		context.getSession().put("user", usernew);
	}
}
