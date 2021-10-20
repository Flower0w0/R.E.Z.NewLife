package _01_register.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="Member")
public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(columnDefinition = "INT(8) ZEROFILL")
	Integer id;
	String memberId;
	String password;
	@Column(columnDefinition = "datetime")
	Date birthday;
	String name;
	String nickName;
	String phone;
	String email;
	String address;
	Blob memberImage;
	String fileName;
	@Column(name = "`rank`", columnDefinition = "varchar(255) default 'member'")
	String rank;
	Timestamp registerTime;
	Timestamp reviseTime;
	String mimeType;
	String token;

	
	@Transient
	MultipartFile memberMultipartFile;
	
	@Transient
	String password1;
	

//	@OneToMany(mappedBy="memberBean", cascade={CascadeType.ALL}, fetch = FetchType.EAGER)
//	private Set<AcquisitionBean> acquisitionBeans = new LinkedHashSet<>();
//	@OneToMany(mappedBy="memberBean", cascade={CascadeType.ALL}, fetch = FetchType.EAGER)
//	private Set<NewsBean> newsBeans = new LinkedHashSet<>();
//	@OneToMany(mappedBy="memberBean", cascade={CascadeType.ALL}, fetch = FetchType.EAGER)
//	private Set<LetterBean> letterBeans = new LinkedHashSet<>();
//	@OneToMany(mappedBy="memberBean", cascade={CascadeType.ALL}, fetch = FetchType.EAGER)
//	private Set<LoveBean> loveBeans = new LinkedHashSet<>();
//	@OneToMany(mappedBy="memberBean", cascade={CascadeType.ALL}, fetch = FetchType.EAGER)
//	private Set<ChangeBean> changeBeans = new LinkedHashSet<>();
//	@OneToMany(mappedBy="memberBean", cascade={CascadeType.ALL}, fetch = FetchType.EAGER)
//	private Set<StrategyBean> strategyBeans = new LinkedHashSet<>();
//	@OneToMany(mappedBy="memberBean", cascade={CascadeType.ALL}, fetch = FetchType.EAGER)
//	private Set<OrderBean> orderBeans = new LinkedHashSet<>();
	
	public MemberBean() {
	}

public MemberBean(Integer id, String memberId, String password, Date birthday, String name, String nickName,
		String phone, String email, String address, Blob memberImage, String fileName, String rank,
		Timestamp registerTime, Timestamp reviseTime, String mimeType, String token) {
	super();
	this.id = id;
	this.memberId = memberId;
	this.password = password;
	this.birthday = birthday;
	this.name = name;
	this.nickName = nickName;
	this.phone = phone;
	this.email = email;
	this.address = address;
	this.memberImage = memberImage;
	this.fileName = fileName;
	this.rank = rank;
	this.registerTime = registerTime;
	this.reviseTime = reviseTime;
	this.mimeType = mimeType;
	this.token = token;
}







public String getToken() {
	return token;
}

public void setToken(String token) {
	this.token = token;
}

public Integer getId() {
	return id;
}


public void setId(Integer id) {
	this.id = id;
}


public String getMemberId() {
	return memberId;
}


public void setMemberId(String memberId) {
	this.memberId = memberId;
}


public String getPassword() {
	return password;
}


public void setPassword(String password) {
	this.password = password;
}


public Date getBirthday() {
	return birthday;
}


public void setBirthday(Date birthday) {
	this.birthday = birthday;
}


public String getName() {
	return name;
}


public void setName(String name) {
	this.name = name;
}


public String getNickName() {
	return nickName;
}


public void setNickName(String nickName) {
	this.nickName = nickName;
}


public String getPhone() {
	return phone;
}


public void setPhone(String phone) {
	this.phone = phone;
}


public String getEmail() {
	return email;
}


public void setEmail(String email) {
	this.email = email;
}


public String getAddress() {
	return address;
}


public void setAddress(String address) {
	this.address = address;
}


public Blob getMemberImage() {
	return memberImage;
}


public void setMemberImage(Blob memberImage) {
	this.memberImage = memberImage;
}


public String getFileName() {
	return fileName;
}


public void setFileName(String fileName) {
	this.fileName = fileName;
}


public String getRank() {
	return rank;
}


public void setRank(String rank) {
	this.rank = rank;
}


public Timestamp getRegisterTime() {
	return registerTime;
}


public void setRegisterTime(Timestamp registerTime) {
	this.registerTime = registerTime;
}


public Timestamp getReviseTime() {
	return reviseTime;
}


public void setReviseTime(Timestamp reviseTime) {
	this.reviseTime = reviseTime;
}


public String getMimeType() {
	return mimeType;
}


public void setMimeType(String mimeType) {
	this.mimeType = mimeType;
}


public MultipartFile getMemberMultipartFile() {
	return memberMultipartFile;
}


public void setMemberMultipartFile(MultipartFile memberMultipartFile) {
	this.memberMultipartFile = memberMultipartFile;
}


public String getPassword1() {
	return password1;
}


public void setPassword1(String password1) {
	this.password1 = password1;
}


@Override
public String toString() {
	StringBuilder builder = new StringBuilder();
	builder.append("MemberBean [id=");
	builder.append(id);
	builder.append(", memberId=");
	builder.append(memberId);
	builder.append(", password=");
	builder.append(password);
	builder.append(", birthday=");
	builder.append(birthday);
	builder.append(", name=");
	builder.append(name);
	builder.append(", nickName=");
	builder.append(nickName);
	builder.append(", phone=");
	builder.append(phone);
	builder.append(", email=");
	builder.append(email);
	builder.append(", address=");
	builder.append(address);
	builder.append(", fileName=");
	builder.append(fileName);
	builder.append(", rank=");
	builder.append(rank);
	builder.append(", registerTime=");
	builder.append(registerTime);
	builder.append(", reviseTime=");
	builder.append(reviseTime);
	builder.append(", mimeType=");
	builder.append(mimeType);
	builder.append("]");
	return builder.toString();
}

	

	


//	public String toString() {
//		return "userid=" + memberId + "  password=" + password;
//	}
	

}
