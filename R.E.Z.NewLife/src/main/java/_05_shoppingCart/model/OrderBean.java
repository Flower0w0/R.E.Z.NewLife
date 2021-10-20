package _05_shoppingCart.model;

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
@Table(name="`Order`")
public class OrderBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(columnDefinition = "INT(8) ZEROFILL")
	Integer id;
	
//	@ManyToOne(cascade=CascadeType.ALL)
//	@JoinColumn(name="fk_member_id")
//	private MemberBean memberBean;
	Integer member_id;
	String memberName;
	String state;
	Timestamp date;
//	Timestamp reviseTime;
	String delway;
	String deladdress;
	String person;
	String phone;
	String payway;
	@Column(columnDefinition = "DECIMAL(6,0)")
	Integer total;
	@Column(name = "`desc`")
	String desc;
	Integer payornot;
	String payPayment;
	
	@OneToMany(mappedBy="orderBean", cascade={CascadeType.ALL})
	private Set<OrderItemBean> orderItemBeans = new LinkedHashSet<>();

	public OrderBean() {
	}

	public OrderBean(Integer id, Integer member_id, String memberName, String state, Timestamp date, String delway, String deladdress,
			String person, String phone, String payway, Integer total, String desc, Integer payornot, String payPayment, Set<OrderItemBean> orderItemBeans) {
		super();
		this.id = id;
		this.member_id = member_id;
		this.memberName = memberName;
		this.state = state;
		this.date = date;
		this.delway = delway;
		this.deladdress = deladdress;
		this.person = person;
		this.phone = phone;
		this.payway = payway;
		this.total = total;
		this.desc = desc;
		this.payornot = payornot;
		this.payPayment = payPayment;
		this.orderItemBeans = orderItemBeans;
	}

	public OrderBean(Integer id, Integer member_id, String memberName, String state, Timestamp date, String delway, String deladdress,
			String person, String phone, String payway, Integer total, String desc, Integer payornot, String payPayment) {
		super();
		this.id = id;
		this.member_id = member_id;
		this.memberName = memberName;
		this.state = state;
		this.date = date;
		this.delway = delway;
		this.deladdress = deladdress;
		this.person = person;
		this.phone = phone;
		this.payway = payway;
		this.total = total;
		this.desc = desc;
		this.payornot = payornot;
		this.payPayment = payPayment;
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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getDelway() {
		return delway;
	}

	public void setDelway(String delway) {
		this.delway = delway;
	}

	public String getDeladdress() {
		return deladdress;
	}

	public void setDeladdress(String deladdress) {
		this.deladdress = deladdress;
	}

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPayway() {
		return payway;
	}

	public void setPayway(String payway) {
		this.payway = payway;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public Set<OrderItemBean> getOrderItemBeans() {
		return orderItemBeans;
	}

	public void setOrderItemBeans(Set<OrderItemBean> orderItemBeans) {
		this.orderItemBeans = orderItemBeans;
	}	
	
	public String getPayPayment() {
		return payPayment;
	}

	public void setPayPayment(String payPayment) {
		this.payPayment = payPayment;
	}
	
	
	public Integer getPayornot() {
		return payornot;
	}

	public void setPayornot(Integer payornot) {
		this.payornot = payornot;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OrderBean [id=");
		builder.append(id);
		builder.append(", member_id=");
		builder.append(member_id);
		builder.append(", state=");
		builder.append(state);
		builder.append(", date=");
		builder.append(date);
		builder.append(", delway=");
		builder.append(delway);
		builder.append(", deladdress=");
		builder.append(deladdress);
		builder.append(", person=");
		builder.append(person);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", payway=");
		builder.append(payway);
		builder.append(", total=");
		builder.append(total);
		builder.append(", desc=");
		builder.append(desc);
		builder.append("]");
		return builder.toString();
	}


	
	
	
}
