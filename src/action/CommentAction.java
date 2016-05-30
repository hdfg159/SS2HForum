package action;

import java.util.List;

import model.Comments;
import model.Posts;
import model.Usertable;
import service.ICommentService;
import service.IPostPlateService;
import service.IPostService;
import utils.TimeUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CommentAction extends ActionSupport {

	private static final long serialVersionUID = 4527927082595036701L;
	private ActionContext context = ActionContext.getContext();

	private int commentid;
	private String lcomment;
	private int postid;

	public int getCommentid() {
		return commentid;
	}

	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}

	public String getLcomment() {
		return lcomment;
	}

	public void setLcomment(String lcomment) {
		this.lcomment = lcomment;
	}

	public int getPostid() {
		return postid;
	}

	public void setPostid(int postid) {
		this.postid = postid;
	}

	/** service **/
	private ICommentService commentService;
	private IPostService postService;
	private IPostPlateService postPlateService;

	public void setPostService(IPostService postService) {
		this.postService = postService;
	}

	public void setCommentService(ICommentService commentService) {
		this.commentService = commentService;
	}

	public void setPostPlateService(IPostPlateService postPlateService) {
		this.postPlateService = postPlateService;
	}

	public String postDetailComment() throws Exception {
		Posts posts = postService.findById(postid);
		context.getSession().put("PostDetail", posts);
		List<Comments> comments = commentService.findPostInAll(postid);
		context.getSession().put("Postcomments", comments);
		return SUCCESS;
	}

	public String addComment() throws Exception {
		Usertable user = (Usertable) context.getSession().get("user");
		Comments comment = new Comments();
		comment.setContent(lcomment);
		comment.setDate(TimeUtils.getCurrentTimeInString());
		Posts post = (Posts) context.getSession().get("PostDetail");
		setPostid(post.getId());
		// comment.setUserid(user.getId());
		// comment.setPlateid((Integer) context.getSession().get("nowppppp"));
		// comment.setPostid(post.getId());
		comment.setUser(user);
		comment.setPost(post);
		comment.setPlate(postPlateService.findById((Integer) context
				.getSession().get("nowppppp")));
		commentService.save(comment);
		return postDetailComment();
	}

	public String deleteComment() throws Exception {
		commentService.delete(commentid);
		Posts post = (Posts) context.getSession().get("PostDetail");
		setPostid(post.getId());
		return postDetailComment();
	}
}
