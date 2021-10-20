package _01_register.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Acquisition")
public class AcquisitionBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(columnDefinition = "INT(8) ZEROFILL")
	Integer id;
	
//	@ManyToOne
//	@JoinColumn(name="fk_member_id")
//	private MemberBean memberBean;
	Integer member_id;
	String name;
	Blob gbcoverpic;
	String fileName1;
	Blob gcoverpic;
	String fileName2;
	Blob gbackcoverpic;
	String fileName3;
	Timestamp askdate;
	@Column(columnDefinition="DECIMAL(6,0)")
	Double price;
	Timestamp date;
	String audit;
	
	public AcquisitionBean() {
	}

	



	public AcquisitionBean(Integer id, Integer member_id, String name, Blob gbcoverpic, String fileName1, Blob gcoverpic,
			String fileName2, Blob gbackcoverpic, String fileName3, Timestamp askdate, Double price, Timestamp date,
			String audit) {
		super();
		this.id = id;
		this.member_id = member_id;
		this.name = name;
		this.gbcoverpic = gbcoverpic;
		this.fileName1 = fileName1;
		this.gcoverpic = gcoverpic;
		this.fileName2 = fileName2;
		this.gbackcoverpic = gbackcoverpic;
		this.fileName3 = fileName3;
		this.askdate = askdate;
		this.price = price;
		this.date = date;
		this.audit = audit;
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
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Blob getGbcoverpic() {
		return gbcoverpic;
	}
	public void setGbcoverpic(Blob gbcoverpic) {
		this.gbcoverpic = gbcoverpic;
	}
	public String getFileName1() {
		return fileName1;
	}
	public void setFileName1(String fileName1) {
		this.fileName1 = fileName1;
	}
	public Blob getGcoverpic() {
		return gcoverpic;
	}
	public void setGcoverpic(Blob gcoverpic) {
		this.gcoverpic = gcoverpic;
	}
	public String getFileName2() {
		return fileName2;
	}
	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}
	public Blob getGbackcoverpic() {
		return gbackcoverpic;
	}
	public void setGbackcoverpic(Blob gbackcoverpic) {
		this.gbackcoverpic = gbackcoverpic;
	}
	public String getFileName3() {
		return fileName3;
	}
	public void setFileName3(String fileName3) {
		this.fileName3 = fileName3;
	}
	public Timestamp getAskdate() {
		return askdate;
	}
	public void setAskdate(Timestamp askdate) {
		this.askdate = askdate;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getAudit() {
		return audit;
	}
	public void setAudit(String audit) {
		this.audit = audit;
	}





	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AcquisitionBean [id=");
		builder.append(id);
		builder.append(", member_id=");
		builder.append(member_id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", gbcoverpic=");
		builder.append(gbcoverpic);
		builder.append(", fileName1=");
		builder.append(fileName1);
		builder.append(", gcoverpic=");
		builder.append(gcoverpic);
		builder.append(", fileName2=");
		builder.append(fileName2);
		builder.append(", gbackcoverpic=");
		builder.append(gbackcoverpic);
		builder.append(", fileName3=");
		builder.append(fileName3);
		builder.append(", askdate=");
		builder.append(askdate);
		builder.append(", price=");
		builder.append(price);
		builder.append(", date=");
		builder.append(date);
		builder.append(", audit=");
		builder.append(audit);
		builder.append("]");
		return builder.toString();
	}

	
	
	
	
}
