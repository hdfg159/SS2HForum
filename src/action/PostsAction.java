package action;

import java.util.List;

import model.Posts;
import model.Usertable;
import service.IPostPlateService;
import service.IPostService;
import utils.LogUtil;
import utils.TimeUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PostsAction extends ActionSupport {
	private static final long serialVersionUID = -1795179344300987163L;
	private int plateid;
	private int postid;

	public int getPlateid() {
		return plateid;
	}

	public void setPlateid(int plateid) {
		this.plateid = plateid;
	}

	public int getPostid() {
		return postid;
	}

	public void setPostid(int postid) {
		this.postid = postid;
	}

	/** 帖子信息 **/
	private String title;
	private String content;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	private ActionContext context = ActionContext.getContext();

	private IPostService postService;
	private IPostPlateService postPlateService;

	public void setPostPlateService(IPostPlateService postPlateService) {
		this.postPlateService = postPlateService;
	}

	public void setPostService(IPostService postService) {
		this.postService = postService;
	}

	public String displayPosts() throws Exception {
		context.getSession().put("nowppppp", plateid);
		refreshPosts(plateid);
		return "displaypostssuccess";
	}

	public String deletePost() throws Exception {
		postService.delete(postid);
		// 刷新帖子
		refreshPosts((Integer) context.getSession().get("nowppppp"));
		return "displaypostssuccess";
	}

	public String top() throws Exception {
		postService.top(postid);
		refreshPosts((Integer) context.getSession().get("nowppppp"));
		return "displaypostssuccess";
	}

	public String addPost() throws Exception {
		Usertable user = (Usertable) context.getSession().get("user");
		int plid = (Integer) context.getSession().get("nowppppp");

		Posts postt = new Posts();
		postt.setContent(content);
		postt.setTitle(title);
		postt.setUser(user);
		postt.setPlate(postPlateService.findById(plid));
		postt.setPostdate(TimeUtils.getCurrentTimeInString());
		postService.save(postt);
		refreshPosts(plid);
		LogUtil.i("插入帖子成功");
		return "displaypostssuccess";
	}

	public void refreshPosts(int id) {
		List<Posts> posts = postService.findPlateInAll(id);
		context.getSession().put("displaypost", posts);
	}
}
