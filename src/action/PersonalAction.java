package action;

import java.io.File;

import model.Usertable;

import org.apache.struts2.ServletActionContext;

import service.ICommentService;
import service.IPostService;
import service.IUserService;
import utils.FileUtil;
import utils.LogUtil;
import utils.TimeUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PersonalAction extends ActionSupport {
	private static final long serialVersionUID = 3876401743512254779L;
	/** service **/
	private IUserService userService;
	private IPostService postService;
	private ICommentService commentService;

	public void setPostService(IPostService postService) {
		this.postService = postService;
	}

	public void setCommentService(ICommentService commentService) {
		this.commentService = commentService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	private int postid;
	private int commentid;

	public int getPostid() {
		return postid;
	}

	public void setPostid(int postid) {
		this.postid = postid;
	}

	public int getCommentid() {
		return commentid;
	}

	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}

	/** 基本信息注入 **/
	private String sexradio;
	private String qq;
	private String phonenum;
	private String mail;

	public String getSexradio() {
		return sexradio;
	}

	public void setSexradio(String sexradio) {
		this.sexradio = sexradio;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	private ActionContext context = ActionContext.getContext();
	/** 头像设置注入 **/
	private File headportrait;
	private String headportraitFileName;
	private String headportraitContentType;
	private String savePath;

	public String getHeadportraitFileName() {
		return headportraitFileName;
	}

	public void setHeadportraitFileName(String headportraitFileName) {
		this.headportraitFileName = headportraitFileName;
	}

	public String getHeadportraitContentType() {
		return headportraitContentType;
	}

	public void setHeadportraitContentType(String headportraitContentType) {
		this.headportraitContentType = headportraitContentType;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public File getHeadportrait() {
		return headportrait;
	}

	public void setHeadportrait(File headportrait) {
		this.headportrait = headportrait;
	}

	public String deletePost() throws Exception {
		postService.delete(postid);
		return viewPosts();
	}

	public String viewPosts() throws Exception {
		refresh();
		return "deletepostsuccess";
	}

	public String modotherinformation() throws Exception {
		userService.modifyInformation(refresh().getId(), sexradio, qq,
				phonenum, mail);
		return "updateinformationsuccess";
	}

	public String uploadheadportrait() throws Exception {
		String headname = refresh().getId() + "."
				+ FileUtil.getFileSuffix(getHeadportraitFileName());
		String dstPath = ServletActionContext.getServletContext().getRealPath(
				"upload")
				+ "\\head\\" + headname;
		userService.modHeadIcon(refresh().getId(), headname);
		LogUtil.i(FileUtil.getFileSuffix(getHeadportraitFileName()));
		LogUtil.i("上传路径为:" + dstPath);
		LogUtil.i("上传时间:" + TimeUtils.getCurrentTimeInString());
		File dstFile = new File(dstPath);
		FileUtil.copySingleFile(headportrait, dstFile);
		// 刷新个人信息
		refresh();
		return "updateinformationsuccess";
	}

	public String deleteComment() throws Exception {
		commentService.delete(commentid);
		return viewComments();
	}

	public String viewComments() throws Exception {
		refresh();
		return "deletecommentsuccess";
	}

	public String exitServer() throws Exception {
		context.getSession().clear();
		return "login";
	}

	public Usertable refresh() {
		Usertable user = (Usertable) context.getSession().get("user");
		user = userService.findById(user.getId());
		context.getSession().put("user", user);
		return user;
	}
}
