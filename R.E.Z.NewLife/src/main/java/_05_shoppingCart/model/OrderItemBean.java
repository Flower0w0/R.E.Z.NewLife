package _05_shoppingCart.model;

import java.io.Serializable;
import java.sql.Date;

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
@Table(name="OrderItem")
public class OrderItemBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(columnDefinition = "INT(8) ZEROFILL")
	Integer id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="fk_order_id")
	private OrderBean orderBean;
	
//	@ManyToOne(cascade=CascadeType.ALL)
//	@JoinColumn(name="fk_newproduct_id")
//	private NewProductBean newProductBean;
//	
//	@ManyToOne(cascade=CascadeType.ALL)
//	@JoinColumn(name="fk_oldproduct_id")
//	private OldProductBean oldProductBean;
	
	Date leaseDate;
	String type;
	@Column(columnDefinition = "DECIMAL(6,0)")
	Integer price;
	@Column(columnDefinition = "DECIMAL(3,1) default 1.0")
	Double discount;
	Integer count;
	@Column(columnDefinition = "DECIMAL(6,0)")
	Integer buyPrice;
	@Column(columnDefinition = "DECIMAL(6,0)")
	Integer subtotal;
	
	Integer newProductId;
	String newProductName;
	Integer oldProductId;
	String oldProductName;
	
	public OrderItemBean() {
	}

	public OrderItemBean(Integer id, OrderBean orderBean, Date leaseDate, String type, Integer price, Double discount,
			Integer count, Integer buyPrice, Integer subtotal, Integer newProductId, String newProductName,
			Integer oldProductId, String oldProductName) {
		super();
		this.id = id;
		this.orderBean = orderBean;
		this.leaseDate = leaseDate;
		this.type = type;
		this.price = price;
		this.discount = discount;
		this.count = count;
		this.buyPrice = buyPrice;
		this.subtotal = subtotal;
		this.newProductId = newProductId;
		this.newProductName = newProductName;
		this.oldProductId = oldProductId;
		this.oldProductName = oldProductName;
	}

	public OrderItemBean(Integer id, Date leaseDate, String type, Integer price, Double discount, Integer count,
			Integer buyPrice, Integer subtotal, Integer newProductId, String newProductName, Integer oldProductId,
			String oldProductName) {
		super();
		this.id = id;
		this.leaseDate = leaseDate;
		this.type = type;
		this.price = price;
		this.discount = discount;
		this.count = count;
		this.buyPrice = buyPrice;
		this.subtotal = subtotal;
		this.newProductId = newProductId;
		this.newProductName = newProductName;
		this.oldProductId = oldProductId;
		this.oldProductName = oldProductName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public OrderBean getOrderBean() {
		return orderBean;
	}

	public void setOrderBean(OrderBean orderBean) {
		this.orderBean = orderBean;
	}

	public Date getLeaseDate() {
		return leaseDate;
	}

	public void setLeaseDate(Date leaseDate) {
		this.leaseDate = leaseDate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getBuyPrice() {
		return buyPrice;
	}

	public void setBuyPrice(Integer buyPrice) {
		this.buyPrice = buyPrice;
	}

	public Integer getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(Integer subtotal) {
		this.subtotal = subtotal;
	}

	public Integer getNewProductId() {
		return newProductId;
	}

	public void setNewProductId(Integer newProductId) {
		this.newProductId = newProductId;
	}

	public String getNewProductName() {
		return newProductName;
	}

	public void setNewProductName(String newProductName) {
		this.newProductName = newProductName;
	}

	public Integer getOldProductId() {
		return oldProductId;
	}

	public void setOldProductId(Integer oldProductId) {
		this.oldProductId = oldProductId;
	}

	public String getOldProductName() {
		return oldProductName;
	}

	public void setOldProductName(String oldProductName) {
		this.oldProductName = oldProductName;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OrderItemBean [id=");
		builder.append(id);
		builder.append(", leaseDate=");
		builder.append(leaseDate);
		builder.append(", type=");
		builder.append(type);
		builder.append(", price=");
		builder.append(price);
		builder.append(", discount=");
		builder.append(discount);
		builder.append(", count=");
		builder.append(count);
		builder.append(", buyPrice=");
		builder.append(buyPrice);
		builder.append(", subtotal=");
		builder.append(subtotal);
		builder.append(", newProductId=");
		builder.append(newProductId);
		builder.append(", newProductName=");
		builder.append(newProductName);
		builder.append(", oldProductId=");
		builder.append(oldProductId);
		builder.append(", oldProductName=");
		builder.append(oldProductName);
		builder.append("]");
		return builder.toString();
	}


	

	
}
