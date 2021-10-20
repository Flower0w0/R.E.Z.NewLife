package _03_raiders.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "`Change`")
public class ChangeBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(columnDefinition = "INT(8) ZEROFILL")
	Integer id;

//	@ManyToOne
//	@JoinColumn(name = "fk_member_id")
//	private MemberBean memberBean;
	Integer member_id;

	@OneToMany(mappedBy = "changeBean", cascade = { CascadeType.ALL })
	private Set<ChangeHopeGameBean> changeHopeGameBeans = new LinkedHashSet<>();
	@OneToMany(mappedBy = "changeBean", cascade = { CascadeType.ALL })
	private Set<ChangeOwnGameBean> changeOwnGameBeans = new LinkedHashSet<>();

	Timestamp Date;

	public ChangeBean() {
	}

	

	public ChangeBean(Integer id, Integer member_id, Set<ChangeHopeGameBean> changeHopeGameBeans,
			Set<ChangeOwnGameBean> changeOwnGameBeans, Timestamp date) {
		super();
		this.id = id;
		this.member_id = member_id;
		this.changeHopeGameBeans = changeHopeGameBeans;
		this.changeOwnGameBeans = changeOwnGameBeans;
		Date = date;
	}



	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}



	public Integer getMember_id() {
		return member_id;
	}



	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}



	public Set<ChangeHopeGameBean> getChangeHopeGameBeans() {
		return changeHopeGameBeans;
	}



	public void setChangeHopeGameBeans(Set<ChangeHopeGameBean> changeHopeGameBeans) {
		this.changeHopeGameBeans = changeHopeGameBeans;
	}



	public Set<ChangeOwnGameBean> getChangeOwnGameBeans() {
		return changeOwnGameBeans;
	}



	public void setChangeOwnGameBeans(Set<ChangeOwnGameBean> changeOwnGameBeans) {
		this.changeOwnGameBeans = changeOwnGameBeans;
	}



	public Timestamp getDate() {
		return Date;
	}



	public void setDate(Timestamp date) {
		Date = date;
	}



	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ChangeBean [id=");
		builder.append(id);
		builder.append(", member_id=");
		builder.append(member_id);
		builder.append(", Date=");
		builder.append(Date);
		builder.append("]");
		return builder.toString();
	}



	
	
	
	
}
