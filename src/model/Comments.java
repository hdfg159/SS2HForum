package model;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "comments", catalog = "experiment")
public class Comments implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 2031622074335575499L;
	private Integer id;
	// private Integer userid;
	private Usertable user;
	// private Integer postid;
	private Posts post;
	// private Integer plateid;
	private Postplate plate;
	private String date;
	private String content;

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	// @Column(name = "userid", nullable = false)
	// public Integer getUserid() {
	// return this.userid;
	// }
	//
	// public void setUserid(Integer userid) {
	// this.userid = userid;
	// }

	// @Column(name = "postid", nullable = false)
	// public Integer getPostid() {
	// return this.postid;
	// }
	//
	// public void setPostid(Integer postid) {
	// this.postid = postid;
	// }

	// @Column(name = "plateid", nullable = false)
	// public Integer getPlateid() {
	// return this.plateid;
	// }
	//
	// public void setPlateid(Integer plateid) {
	// this.plateid = plateid;
	// }

	@Column(name = "date", nullable = false, length = 100)
	public String getDate() {
		return this.date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Column(name = "content", nullable = false, length = 500)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@ManyToOne
	@JoinColumn(name = "userid")
	public Usertable getUser() {
		return user;
	}

	public void setUser(Usertable user) {
		this.user = user;
	}

	@ManyToOne
	@JoinColumn(name = "plateid")
	public Postplate getPlate() {
		return plate;
	}

	public void setPlate(Postplate plate) {
		this.plate = plate;
	}

	@ManyToOne
	@JoinColumn(name = "postid")
	public Posts getPost() {
		return post;
	}

	public void setPost(Posts post) {
		this.post = post;
	}

}