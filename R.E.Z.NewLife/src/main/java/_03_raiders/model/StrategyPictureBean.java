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
@Table(name="StrategyPicture")
public class StrategyPictureBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(columnDefinition = "INT(8) ZEROFILL")
	Integer id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="fk_strategy_id")
	private StrategyBean strategyBean;
	
	Blob picture;
	String fileName;
	Blob bgpicture;
	String bgfileName;
	
	public StrategyPictureBean() {
	}

	public StrategyPictureBean(Integer id, StrategyBean strategyBean, Blob picture, String fileName, Blob bgpicture,
			String bgfileName) {
		super();
		this.id = id;
		this.strategyBean = strategyBean;
		this.picture = picture;
		this.fileName = fileName;
		this.bgpicture = bgpicture;
		this.bgfileName = bgfileName;
	}

	public StrategyPictureBean(Integer id, Blob picture, String fileName, Blob bgpicture,
			String bgfileName) {
		super();
		this.id = id;
		this.picture = picture;
		this.fileName = fileName;
		this.bgpicture = bgpicture;
		this.bgfileName = bgfileName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public StrategyBean getStrategyBean() {
		return strategyBean;
	}

	public void setStrategyBean(StrategyBean strategyBean) {
		this.strategyBean = strategyBean;
	}

	public Blob getPicture() {
		return picture;
	}

	public void setPicture(Blob picture) {
		this.picture = picture;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Blob getBgpicture() {
		return bgpicture;
	}

	public void setBgpicture(Blob bgpicture) {
		this.bgpicture = bgpicture;
	}

	public String getBgfileName() {
		return bgfileName;
	}

	public void setBgfileName(String bgfileName) {
		this.bgfileName = bgfileName;
	}
	
}
