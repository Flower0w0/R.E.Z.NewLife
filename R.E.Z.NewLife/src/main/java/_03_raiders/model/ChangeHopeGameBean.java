package _03_raiders.model;

import java.io.Serializable;

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
@Table(name="ChangeHopeGame")
public class ChangeHopeGameBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(columnDefinition = "INT(8) ZEROFILL")
	Integer id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="fk_Change_id")
	private ChangeBean changeBean;
	
	String name;
	@Column(name = "`desc`")
	String desc;
	
	public ChangeHopeGameBean() {
	}

	public ChangeHopeGameBean(Integer id, ChangeBean changeBean, String name, String desc) {
		super();
		this.id = id;
		this.changeBean = changeBean;
		this.name = name;
		this.desc = desc;
	}

	public ChangeHopeGameBean(Integer id, String name, String desc) {
		super();
		this.id = id;
		this.name = name;
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

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	
}
