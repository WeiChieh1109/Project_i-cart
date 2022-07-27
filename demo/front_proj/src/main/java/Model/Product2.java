package Model;
import java.sql.Blob;
//jason ¤º®e
/**
 * Product2.java
 * This is a model class represents a Product2 entity
 * @author Ramesh Fadatare
 *
 */
public class Product2 {
	protected String name;
	protected String gender;
	protected String type;
	protected int price;
	protected String intro;
	protected int weight;
	protected Blob pic;
	protected String base64Img;
	
	

	public Product2() {
	}
	
	public Product2(String name) {
		super();
		this.name = name;
	}
	
	public Product2(String name,String base64Img) {
		super();
		this.name = name;
		this.base64Img = base64Img;
	}
	
	public Product2(String name,String type, String base64Img) {
		super();
		this.name = name;
		this.type = type;
		this.base64Img = base64Img;
	}
	
	public Product2(String name, String gender,String type, int price, String intro, int weight) {
		super();
		this.name = name;
		this.gender = gender;
		this.type = type;
		this.price = price;
		this.intro = intro;
		this.weight = weight;
	}
	
	public Product2(String name, String gender,String type, int price, String intro, int weight, String base64Img) {
		super();
		this.name = name;
		this.gender = gender;
		this.type = type;
		this.price = price;
		this.intro = intro;
		this.weight = weight;
		this.base64Img = base64Img;
	}


	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	
	
	public Blob getPic() {
		return pic;
	}

	public void setPic(Blob pic) {
		this.pic = pic;
	}

	public String getBase64Img() {
		return base64Img;
	}

	public void setBase64Img(String base64Img) {
		this.base64Img = base64Img;
	}


}
