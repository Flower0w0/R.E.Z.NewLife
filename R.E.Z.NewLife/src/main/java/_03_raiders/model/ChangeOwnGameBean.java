package _03_raiders.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name="ChangeOwnGame")
public class ChangeOwnGameBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(columnDefinition = "INT(8) ZEROFILL")
	Integer id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="fk_Change_id")
	private ChangeBean changeBean;
	
	String name;
	Blob gbcoverpic;
	String fileName1;
	Blob gcoverpic;
	String fileName2;
	Blob gbackcoverpic;
	String fileName3;
	@Column(name = "`desc`")
	String desc;
	
	public ChangeOwnGameBean() {
	}

	public ChangeOwnGameBean(Integer id, ChangeBean changeBean, String name, Blob gbcoverpic, String fileName1,
			Blob gcoverpic, String fileName2, Blob gbackcoverpic, String fileName3, String desc) {
		super();
		this.id = id;
		this.changeBean = changeBean;
		this.name = name;
		this.gbcoverpic = gbcoverpic;
		this.fileName1 = fileName1;
		this.gcoverpic = gcoverpic;
		this.fileName2 = fileName2;
		this.gbackcoverpic = gbackcoverpic;
		this.fileName3 = fileName3;
		this.desc = desc;
	}

	public ChangeOwnGameBean(Integer id, String name, Blob gbcoverpic, String fileName1,
			Blob gcoverpic, String fileName2, Blob gbackcoverpic, String fileName3, String desc) {
		super();
		this.id = id;
		this.name = name;
		this.gbcoverpic = gbcoverpic;
		this.fileName1 = fileName1;
		this.gcoverpic = gcoverpic;
		this.fileName2 = fileName2;
		this.gbackcoverpic = gbackcoverpic;
		this.fileName3 = fileName3;
		this.desc = desc;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public ChangeBean getChangeBean() {
		return changeBean;
	}

	public void setChangeBean(ChangeBean changeBean) {
		this.changeBean = changeBean;
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

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	
}
