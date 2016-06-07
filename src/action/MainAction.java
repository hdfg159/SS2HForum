package action;

import java.io.File;

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
			refleshHeadIcon(user, context);
			context.getSession().put("PlateList", postPlateService.findAll());
			return SUCCESS;
		}
	}

	public void refleshHeadIcon(Usertable user, ActionContext context) {
		File headicon = new File(ServletActionContext.getServletContext()
				.getRealPath("upload") + "\\head\\" + user.getHead());
		LogUtil.i(headicon.getAbsolutePath());
		if (headicon.isDirectory()) {
			userService.modHeadIcon(user.getId(), "no");
		} else {
			if (!headicon.exists()) {
				userService.modHeadIcon(user.getId(), "no");
			}
		}
		context.getSession().put("user", userService.findById(user.getId()));
	}
}
