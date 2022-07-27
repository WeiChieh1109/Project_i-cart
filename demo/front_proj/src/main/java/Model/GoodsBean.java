package Model;


public class GoodsBean {
	private int id,price,num;
	private String name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public GoodsBean(int id, int price, int num, String name) {
		super();
		this.id = id;
		this.price = price;
		this.num = num;
		this.name = name;
		
	} 
	
}
