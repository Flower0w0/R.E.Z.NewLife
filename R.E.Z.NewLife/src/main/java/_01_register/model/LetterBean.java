package _01_register.model;

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
@Table(name="Letter")
public class LetterBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(columnDefinition = "INT(8) ZEROFILL")
	Integer id;
	
//	@ManyToOne(cascade=CascadeType.ALL)
//	@JoinColumn(name="fk_member_id")
//	private MemberBean memberBean;
	Integer member_id;
	String title;
	Clob content;
	Timestamp date;
	Timestamp reviseTime;
	Integer recipientId;
	
	public LetterBean() {
		super();
	}

	

	public LetterBean(Integer id, Integer member_id, String title, Clob content, Timestamp date, Timestamp reviseTime,
			Integer recipientId) {
		super();
		this.id = id;
		this.member_id = member_id;
		this.title = title;
		this.content = content;
		this.date = date;
		this.reviseTime = reviseTime;
		this.recipientId = recipientId;
	}

	


	public Integer getMember_id() {
		return member_id;
	}



	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}



	public Integer getRecipientId() {
		return recipientId;
	}



	public void setRecipientId(Integer recipientId) {
		this.recipientId = recipientId;
	}



	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public Integer getrecipientId() {
		return recipientId;
	}
	public void setaId(Integer recipientId) {
		this.recipientId = recipientId;
	}



	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("LetterBean [id=");
		builder.append(id);
		builder.append(", member_id=");
		builder.append(member_id);
		builder.append(", title=");
		builder.append(title);
		builder.append(", content=");
		builder.append(content);
		builder.append(", date=");
		builder.append(date);
		builder.append(", reviseTime=");
		builder.append(reviseTime);
		builder.append(", recipientId=");
		builder.append(recipientId);
		builder.append("]");
		return builder.toString();
	}

	
	
	
}
