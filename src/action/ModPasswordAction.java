package action;

import model.Usertable;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import service.IUserService;
import utils.LogUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.StringLengthFieldValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;
import com.opensymphony.xwork2.validator.annotations.ValidatorType;

@ParentPackage("struts-default")
@Namespace("/user")
public class ModPasswordAction extends ActionSupport {
	private static final long serialVersionUID = 3916035038787201055L;
	private String password;

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

	@Validations(requiredStrings = { @RequiredStringValidator(fieldName = "password", message = "密码不能为空", trim = true, type = ValidatorType.FIELD) }, stringLengthFields = { @StringLengthFieldValidator(fieldName = "password", message = "长度只能为1-50位", minLength = "1", maxLength = "50", type = ValidatorType.FIELD) })
	@Action(value = "ModPasswordAction", results = {
			@Result(name = "success", location = "/index.jsp", type = "redirect"),
			@Result(name = "input", location = "/user/ModPassword.jsp") })
	@Override
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();
		Usertable user = (Usertable) context.getSession().get("user");

		userService.modifyPassword(user.getId(), password);
		LogUtil.i("密码修改成功，清除session数据");
		context.getSession().clear();
		return SUCCESS;
	}

}
