package _03_raiders.model;

import java.io.Serializable;
import java.sql.Clob;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="News")
public class NewsBean implements Serializable {
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
	String title;
	Clob content;
	Timestamp reviseTime;
	
	public NewsBean() {
	}

	

	public NewsBean(Integer id, Integer member_id, Timestamp date, String title, Clob content, Timestamp reviseTime) {
		super();
		this.id = id;
		this.member_id = member_id;
		this.date = date;
		this.title = title;
		this.content = content;
		this.reviseTime = reviseTime;
	}



	public Integer getMember_id() {
		return member_id;
	}



	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
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

	public Timestamp getReviseTime() {
		return reviseTime;
	}

	public void setReviseTime(Timestamp reviseTime) {
		this.reviseTime = reviseTime;
	}



	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("NewsBean [id=");
		builder.append(id);
		builder.append(", member_id=");
		builder.append(member_id);
		builder.append(", date=");
		builder.append(date);
		builder.append(", title=");
		builder.append(title);
		builder.append(", content=");
		builder.append(content);
		builder.append(", reviseTime=");
		builder.append(reviseTime);
		builder.append("]");
		return builder.toString();
	}

	
	
	
}
