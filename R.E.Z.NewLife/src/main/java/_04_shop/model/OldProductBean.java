package _04_shop.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Clob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;
@Entity
@Table(name="OldProduct")
public class OldProductBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(columnDefinition = "INT(8) ZEROFILL")
	Integer id;
	
	String name;
	String brand;
	@Column(columnDefinition = "DECIMAL(6,0)")
	Integer acqprice;
	@Column(columnDefinition = "DECIMAL(6,0)")
	Integer price;
	@Column(columnDefinition = "DECIMAL(6,0)")
	Integer leasePrice;
	@Column(columnDefinition = "DECIMAL(3,1) default 1.0")
	Double discount;
	Clob copy;
	@Column(name = "`desc`")
	Clob desc;
	Blob picture;
	String fileName;
	String mimeType;
	@Column(columnDefinition = "NUMERIC(6,0)")
	Integer stock;
	Blob bgpicture;
	String bgfileName;
	Blob levelpicture;
	String levelfileName;
	Blob cnpicture;
	String cnfileName;
	
	@Transient
	MultipartFile productImage;
	
	public MultipartFile getProductImage() {
		return productImage;
	}
	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}
	
	public String getMimeType() {
		return mimeType;
	}

	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}

	public Blob getLevelpicture() {
		return levelpicture;
	}

	public void setLevelpicture(Blob levelpicture) {
		this.levelpicture = levelpicture;
	}

	public String getLevelfileName() {
		return levelfileName;
	}

	public void setLevelfileName(String levelfileName) {
		this.levelfileName = levelfileName;
	}

	public Blob getCnpicture() {
		return cnpicture;
	}

	public void setCnpicture(Blob cnpicture) {
		this.cnpicture = cnpicture;
	}

	public String getCnfileName() {
		return cnfileName;
	}

	public void setCnfileName(String cnfileName) {
		this.cnfileName = cnfileName;
	}

//	@OneToMany(mappedBy="oldProductBean", cascade={CascadeType.ALL})
//	private Set<LoveBean> loveBeans = new LinkedHashSet<>();
//	@OneToMany(mappedBy="oldProductBean", cascade={CascadeType.ALL})
//	private Set<OrderItemBean> orderItemBeans = new LinkedHashSet<>();
	
	public OldProductBean() {
	}

	public OldProductBean(Integer id, String name, String brand, Integer acqprice, Integer price, Integer leasePrice,
			Double discount, Clob copy, Clob desc, Blob picture, String fileName, String mimeType, Integer stock,
			Blob bgpicture, String bgfileName, Blob levelpicture, String levelfileName, Blob cnpicture,
			String cnfileName) {
		super();
		this.id = id;
		this.name = name;
		this.brand = brand;
		this.acqprice = acqprice;
		this.price = price;
		this.leasePrice = leasePrice;
		this.discount = discount;
		this.copy = copy;
		this.desc = desc;
		this.picture = picture;
		this.fileName = fileName;
		this.mimeType = mimeType;
		this.stock = stock;
		this.bgpicture = bgpicture;
		this.bgfileName = bgfileName;
		this.levelpicture = levelpicture;
		this.levelfileName = levelfileName;
		this.cnpicture = cnpicture;
		this.cnfileName = cnfileName;
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

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public Integer getAcqprice() {
		return acqprice;
	}

	public void setAcqprice(Integer acqprice) {
		this.acqprice = acqprice;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getLeasePrice() {
		return leasePrice;
	}

	public void setLeasePrice(Integer leasePrice) {
		this.leasePrice = leasePrice;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Clob getCopy() {
		return copy;
	}

	public void setCopy(Clob copy) {
		this.copy = copy;
	}

	public Clob getDesc() {
		return desc;
	}

	public void setDesc(Clob desc) {
		this.desc = desc;
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

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
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

	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OldProductBean [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", brand=");
		builder.append(brand);
		builder.append(", acqprice=");
		builder.append(acqprice);
		builder.append(", price=");
		builder.append(price);
		builder.append(", leasePrice=");
		builder.append(leasePrice);
		builder.append(", discount=");
		builder.append(discount);
		builder.append(", copy=");
		builder.append(copy);
		builder.append(", desc=");
		builder.append(desc);
		builder.append(", picture=");
		builder.append(picture);
		builder.append(", fileName=");
		builder.append(fileName);
		builder.append(", mimeType=");
		builder.append(mimeType);
		builder.append(", stock=");
		builder.append(stock);
		builder.append(", bgpicture=");
		builder.append(bgpicture);
		builder.append(", bgfileName=");
		builder.append(bgfileName);
		builder.append(", levelpicture=");
		builder.append(levelpicture);
		builder.append(", levelfileName=");
		builder.append(levelfileName);
		builder.append(", cnpicture=");
		builder.append(cnpicture);
		builder.append(", cnfileName=");
		builder.append(cnfileName);
		builder.append(", productImage=");
		builder.append(productImage);
		builder.append("]");
		return builder.toString();
	}


}
