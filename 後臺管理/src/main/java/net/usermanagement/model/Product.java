package net.usermanagement.model;

import java.io.InputStream;

public class Product {
	protected int price;
	protected int weight;
	protected String name;
	protected String type;
	protected String intro;
	protected String gender;
	protected InputStream pic;
	protected String picBase64;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}
	
	public Product(String name, String type , int price , String intro , int weight , String gender , InputStream pic ) {
		this.name = name;
		this.type = type;
		this.price = price;
		this.intro = intro;
		this.weight = weight;
		this.gender = gender;
		this.pic = pic;
	}
	public Product(String name, String type , int price , String intro , int weight , String gender , String picBase64 ) {
		this.name = name;
		this.type = type;
		this.price = price;
		this.intro = intro;
		this.weight = weight;
		this.gender = gender;
		this.picBase64 = picBase64;
	}
	
	public Product(String name, String type , int price , String intro , int weight , String gender ,InputStream pic , String picBase64 ) {
		this.name = name;
		this.type = type;
		this.price = price;
		this.intro = intro;
		this.weight = weight;
		this.gender = gender;
		this.pic = pic;
		this.picBase64 = picBase64;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
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

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public InputStream getPic() {
		return pic;
	}

	public void setPic(InputStream pic) {
		this.pic = pic;
	}

	public String getPicBase64() {
		return picBase64;
	}

	public void setPicBase64(String picBase64) {
		this.picBase64 = picBase64;
	}
	
	
}
