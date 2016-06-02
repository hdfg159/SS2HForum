package action;

import java.util.List;

import model.Posts;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import service.IPostService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;
import com.opensymphony.xwork2.validator.annotations.ValidatorType;

@ParentPackage("struts-default")
@Namespace("/user")
public class SearchAction extends ActionSupport {

	private static final long serialVersionUID = -4675197887580564459L;
	private String search;

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	private IPostService postService;

	public void setPostService(IPostService postService) {
		this.postService = postService;
	}

	@Validations(requiredStrings = { @RequiredStringValidator(fieldName = "search", message = "搜索内容不能为空", trim = true, type = ValidatorType.FIELD) })
	@Action(value = "SearchAction", results = {
			@Result(name = "success", location = "/user/SearchPost.jsp", type = "redirect"),
			@Result(name = "input", location = "/user/Searchpt.jsp") })
	@Override
	public String execute() throws Exception {
		List<Posts> posts = postService.keySearch(search);
		ActionContext context = ActionContext.getContext();
		context.getSession().put("seachposts", posts);

		if (context.getSession().get("nowppppp") != null) {
			context.getSession().remove("nowppppp");
		}
		return SUCCESS;
	}
}
