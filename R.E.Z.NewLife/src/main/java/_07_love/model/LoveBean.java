package _07_love.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="Love")
public class LoveBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(columnDefinition = "INT(8) ZEROFILL")
	Integer id;
	
//	@ManyToOne(cascade=CascadeType.ALL)
//	@JoinColumn(name="fk_member_id")
//	private MemberBean memberBean;
	Integer member_id;
	
//	
//	@ManyToOne(cascade=CascadeType.ALL)
//	@JoinColumn(name="fk_newproduct_id")
//	private NewProductBean newProductBean;
	Integer newproduct_id;
	String newproduct_name;
	Integer newproduct_price;
	
//	
//	@ManyToOne(cascade=CascadeType.ALL)
//	@JoinColumn(name="fk_oldproduct_id")
//	private OldProductBean oldProductBean;
	Integer oldproduct_id;
	String oldproduct_name;
	Integer oldproduct_price;
	
	
//	@ManyToOne(cascade=CascadeType.ALL)
//	@JoinColumn(name="fk_strategy_id")
//	private StrategyBean strategyBean;
	Integer strategy_id;
	String strategy_name;
	
	String type;
	

	public LoveBean() {
	}


	public LoveBean(Integer id, Integer member_id, Integer newproduct_id, String newproduct_name,
			Integer newproduct_price, Integer oldproduct_id, String oldproduct_name, Integer oldproduct_price,
			Integer strategy_id, String strategy_name, String type) {
		super();
		this.id = id;
		this.member_id = member_id;
		this.newproduct_id = newproduct_id;
		this.newproduct_name = newproduct_name;
		this.newproduct_price = newproduct_price;
		this.oldproduct_id = oldproduct_id;
		this.oldproduct_name = oldproduct_name;
		this.oldproduct_price = oldproduct_price;
		this.strategy_id = strategy_id;
		this.strategy_name = strategy_name;
		this.type = type;
	}

	

	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
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


	public Integer getNewproduct_id() {
		return newproduct_id;
	}


	public void setNewproduct_id(Integer newproduct_id) {
		this.newproduct_id = newproduct_id;
	}


	public String getNewproduct_name() {
		return newproduct_name;
	}


	public void setNewproduct_name(String newproduct_name) {
		this.newproduct_name = newproduct_name;
	}


	public Integer getNewproduct_price() {
		return newproduct_price;
	}


	public void setNewproduct_price(Integer newproduct_price) {
		this.newproduct_price = newproduct_price;
	}


	public Integer getOldproduct_id() {
		return oldproduct_id;
	}


	public void setOldproduct_id(Integer oldproduct_id) {
		this.oldproduct_id = oldproduct_id;
	}


	public String getOldproduct_name() {
		return oldproduct_name;
	}


	public void setOldproduct_name(String oldproduct_name) {
		this.oldproduct_name = oldproduct_name;
	}


	public Integer getOldproduct_price() {
		return oldproduct_price;
	}


	public void setOldproduct_price(Integer oldproduct_price) {
		this.oldproduct_price = oldproduct_price;
	}


	public Integer getStrategy_id() {
		return strategy_id;
	}


	public void setStrategy_id(Integer strategy_id) {
		this.strategy_id = strategy_id;
	}


	public String getStrategy_name() {
		return strategy_name;
	}


	public void setStrategy_name(String strategy_name) {
		this.strategy_name = strategy_name;
	}




	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("LoveBean [id=");
		builder.append(id);
		builder.append(", member_id=");
		builder.append(member_id);
		builder.append(", newproduct_id=");
		builder.append(newproduct_id);
		builder.append(", newproduct_name=");
		builder.append(newproduct_name);
		builder.append(", newproduct_price=");
		builder.append(newproduct_price);
		builder.append(", oldproduct_id=");
		builder.append(oldproduct_id);
		builder.append(", oldproduct_name=");
		builder.append(oldproduct_name);
		builder.append(", oldproduct_price=");
		builder.append(oldproduct_price);
		builder.append(", strategy_id=");
		builder.append(strategy_id);
		builder.append(", strategy_name=");
		builder.append(strategy_name);
		builder.append(", type=");
		builder.append(type);
		builder.append("]");
		return builder.toString();
	}


	
	

	




	

	
	
	
}