package model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

/**
 * Usertable entity. @author MyEclipse Persistence Tools
 */
@Entity
@DynamicInsert(true)
@DynamicUpdate(true)
@Table(name = "usertable", catalog = "experiment")
public class Usertable implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 4501430463860019793L;
	private Integer id;
	private String username;
	private String password;
	private Integer rank;
	private Integer plateid;
	private String head;
	private String sex;
	private String qq;
	private String phonenum;
	private String mail;
	/**
	 * 多方数据用Set //
	 * 详情:http://stackoverflow.com/questions/4334970/hibernate-cannot
	 * -simultaneously-fetch-multiple-bags
	 */
	private Set<Posts> userPosts = new HashSet<Posts>();
	private Set<Comments> userComments = new HashSet<Comments>();

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

	@Column(name = "username", length = 50)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password", length = 50)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "rank")
	public Integer getRank() {
		return this.rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	@Column(name = "plateid")
	public Integer getPlateid() {
		return this.plateid;
	}

	public void setPlateid(Integer plateid) {
		this.plateid = plateid;
	}

	@Column(name = "head", length = 500)
	public String getHead() {
		return this.head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	@Column(name = "sex", length = 1)
	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Column(name = "qq")
	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	@Column(name = "phonenum", length = 11)
	public String getPhonenum() {
		return this.phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	@Column(name = "mail", length = 100)
	public String getMail() {
		return this.mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	@Cascade(value = { CascadeType.REMOVE })
	public Set<Posts> getUserPosts() {
		return userPosts;
	}

	public void setUserPosts(Set<Posts> userPosts) {
		this.userPosts = userPosts;
	}

	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	@Cascade(value = { CascadeType.REMOVE })
	public Set<Comments> getUserComments() {
		return userComments;
	}

	public void setUserComments(Set<Comments> userComments) {
		this.userComments = userComments;
	}

}