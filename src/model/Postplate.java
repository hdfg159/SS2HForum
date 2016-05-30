package model;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

/**
 * Postplate entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "postplate", catalog = "experiment")
public class Postplate implements java.io.Serializable {

	private static final long serialVersionUID = 1427715249693299854L;
	private Integer id;
	private String platename;
	private Set<Posts> platePosts = new HashSet<Posts>();
	private Set<Comments> plateComments = new HashSet<Comments>();

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

	@Column(name = "platename", nullable = false, length = 100)
	public String getPlatename() {
		return this.platename;
	}

	public void setPlatename(String platename) {
		this.platename = platename;
	}

	@OneToMany(mappedBy = "plate")
	@Cascade(value = { CascadeType.REMOVE })
	public Set<Posts> getPlatePosts() {
		return platePosts;
	}

	public void setPlatePosts(Set<Posts> platePosts) {
		this.platePosts = platePosts;
	}

	@OneToMany(mappedBy = "plate")
	@Cascade(value = { CascadeType.REMOVE })
	public Set<Comments> getPlateComments() {
		return plateComments;
	}

	public void setPlateComments(Set<Comments> plateComments) {
		this.plateComments = plateComments;
	}

}