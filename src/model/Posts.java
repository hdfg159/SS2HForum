package model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

/**
 * Posts entity. @author MyEclipse Persistence Tools
 */
@Entity
@DynamicUpdate(true)
@DynamicInsert(true)
@Table(name = "posts", catalog = "experiment")
public class Posts implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1527949636687260294L;
	private Integer id;
	private Integer position;
	// private Integer plateid;
	private Postplate plate;
	// private Integer userid;
	private Usertable user;
	private String postdate;
	private String title;
	private String content;
	private Set<Comments> postComments = new HashSet<Comments>();

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

	@Column(name = "position", nullable = false)
	public Integer getPosition() {
		return this.position;
	}

	public void setPosition(Integer position) {
		this.position = position;
	}

	// @Column(name = "plateid", nullable = false)
	// public Integer getPlateid() {
	// return this.plateid;
	// }
	//
	// public void setPlateid(Integer plateid) {
	// this.plateid = plateid;
	// }

	// @Column(name = "userid", nullable = false)
	// public Integer getUserid() {
	// return this.userid;
	// }
	//
	// public void setUserid(Integer userid) {
	// this.userid = userid;
	// }

	@Column(name = "postdate", length = 1000)
	public String getPostdate() {
		return this.postdate;
	}

	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}

	@Column(name = "title", length = 1000)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "content", length = 5000)
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

	@OneToMany(mappedBy = "post")
	@Cascade(value = { CascadeType.REMOVE })
	public Set<Comments> getPostComments() {
		return postComments;
	}

	public void setPostComments(Set<Comments> postComments) {
		this.postComments = postComments;
	}

}