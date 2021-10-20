package _03_raiders.model;

import java.io.Serializable;
import java.sql.Clob;
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
@Table(name="Strategy")
public class StrategyBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(columnDefinition = "INT(8) ZEROFILL")
	Integer id;
	
//	@ManyToOne(cascade=CascadeType.ALL)
//	@JoinColumn(name="fk_member_id")
//	private MemberBean memberBean;
	Integer member_id;
	
	Timestamp date;
	Timestamp reviseTime;
	String title;
	Clob content;
	
	@OneToMany(mappedBy="strategyBean", cascade={CascadeType.ALL})
	private Set<StrategyPictureBean> strategyPictureBean = new LinkedHashSet<>();
//	@OneToMany(mappedBy="strategyBean", cascade={CascadeType.ALL})
//	private Set<LoveBean> loveBeans = new LinkedHashSet<>();

	public StrategyBean() {
	}

	public StrategyBean(Integer id, Integer member_id, Timestamp date, Timestamp reviseTime, String title, Clob content,
			Set<StrategyPictureBean> strategyPictureBean) {
		super();
		this.id = id;
		this.member_id = member_id;
		this.date = date;
		this.reviseTime = reviseTime;
		this.title = title;
		this.content = content;
		this.strategyPictureBean = strategyPictureBean;
	}

	public StrategyBean(Integer id, Integer member_id, Timestamp date, Timestamp reviseTime, String title,
			Clob content) {
		super();
		this.id = id;
		this.member_id = member_id;
		this.date = date;
		this.reviseTime = reviseTime;
		this.title = title;
		this.content = content;
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

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public Timestamp getReviseTime() {
		return reviseTime;
	}

	public void setReviseTime(Timestamp reviseTime) {
		this.reviseTime = reviseTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Clob getContent() {
		return content;
	}

	public void setContent(Clob content) {
		this.content = content;
	}

	public Set<StrategyPictureBean> getStrategyPictureBean() {
		return strategyPictureBean;
	}

	public void setStrategyPictureBean(Set<StrategyPictureBean> strategyPictureBean) {
		this.strategyPictureBean = strategyPictureBean;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("StrategyBean [id=");
		builder.append(id);
		builder.append(", member_id=");
		builder.append(member_id);
		builder.append(", date=");
		builder.append(date);
		builder.append(", reviseTime=");
		builder.append(reviseTime);
		builder.append(", title=");
		builder.append(title);
		builder.append(", content=");
		builder.append(content);
		builder.append("]");
		return builder.toString();
	}


	

}
