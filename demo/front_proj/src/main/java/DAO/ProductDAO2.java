package DAO;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import Model.Product2;

public class ProductDAO2 {
	private String jdbcURL = "jdbc:mysql://localhost:3306/market?useSSL=false";
	private String jdbcProductname = "root";
	private String jdbcPassword = "12345678";


	private static final String SELECT_Product_BY_NAME = "select name, gender, type, price, intro, weight, pic from products_jason where name = ?";
	private static final String SELECT_PIC_BY_TYPE = "select name,pic from products_jason where name != ? and type = ? and gender = ?";
	private static final String INSERT_ADCOUNT = "INSERT INTO adcount" + " (name,type,count,time) VALUES" + " (?, ?, ? , CURRENT_TIMESTAMP);";
	
	private static final String DELETE_ALL = "TRUNCATE `market`.`test`";
	private static final String INSERT_AD_NAME = "INSERT INTO test" + " (name,gender, type, price, intro, weight) VALUES" + " (?,?,?,?,?,?);";
	private static final String SELECT_AD_NAME = "select * from test";
	public ProductDAO2() {
		// TODO Auto-generated constructor stub
	}
	
	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcProductname, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}

	
	public Product2 selectProduct(String name) throws IOException {
		Product2 Product = null;
		try (Connection connection = getConnection();
			// "select name,gender,type,price,intro,weight,pic from products where name =?"
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_Product_BY_NAME);) {
			preparedStatement.setString(1, name);
			System.out.println(preparedStatement);
			
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String gender = rs.getString("gender");
				String type = rs.getString("type");
				int price = rs.getInt("price");
				String intro = rs.getString("intro");
				int weight = rs.getInt("weight");
				Blob pic = rs.getBlob("pic");
				InputStream inputStream = pic.getBinaryStream();
			    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			    byte[] buffer = new byte[inputStream.available()];
			    int bytesRead = -1;
			      
			    while ((bytesRead = inputStream.read(buffer)) != -1) {
			    outputStream.write(buffer, 0, bytesRead);
			    }
			      
			    byte[] imageBytes = outputStream.toByteArray();
			    String base64Img = Base64.getEncoder().encodeToString(imageBytes);
			      
			    inputStream.close();
			    outputStream.close();
				
				Product = new Product2(name, gender, type, price, intro, weight, base64Img);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Product;
	}
	
	
	public List<Product2> selectPicByType(String name, String type , String gender) throws IOException {
//		private static final String SELECT_PIC_BY_TYPE = "select name,pic from products where name != ? and type = ? and gender = ?";
		List<Product2> products = new ArrayList<>();
		try (Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PIC_BY_TYPE);) {
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, type);
			preparedStatement.setString(3, gender);
			System.out.println(preparedStatement);
			
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String rec_name = rs.getString("name");
				Blob pic = rs.getBlob("pic");
				InputStream inputStream = pic.getBinaryStream();
			    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			    byte[] buffer = new byte[inputStream.available()];
			    int bytesRead = -1;
			      
			    while ((bytesRead = inputStream.read(buffer)) != -1) {
			    outputStream.write(buffer, 0, bytesRead);
			    }
			      
			    byte[] imageBytes = outputStream.toByteArray();
			    String base64Img = Base64.getEncoder().encodeToString(imageBytes);
			      
			    inputStream.close();
			    outputStream.close();

				products.add(new Product2(rec_name,base64Img));
			}
		} catch (SQLException e) {
			e.printStackTrace();;
		}
		return products;
	}
	
	
	public void insertAdcount(List<Product2> products) throws SQLException{
//		private static final String INSERT_ADCOUNT = "INSERT INTO adcount" + " (name,type,count,time) VALUES" + " (?, ?, ? , CURRENT_TIMESTAMP);";
		System.out.println(INSERT_ADCOUNT);
		
		
		for (int i = 0; i < products.size(); i++) {
			try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ADCOUNT)){
					preparedStatement.setString(1, products.get(i).getName());
					preparedStatement.setString(2, products.get(i).getType());
					preparedStatement.setInt(3, 1);
					System.out.println(preparedStatement);
					preparedStatement.executeUpdate();
			}catch (Exception e) {
						e.printStackTrace();
					}
		}
	}
	
	public void deleteAd() throws SQLException{
		try (Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ALL)){
			preparedStatement.executeUpdate();
		}
	}
	
	public void insertAdName(String name,String gender,String type,int price ,String intro,int weight) throws SQLException{
		try (Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_AD_NAME)){
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, gender);
			preparedStatement.setString(3, type);
			preparedStatement.setInt(4, price);
			preparedStatement.setString(5, intro);
			preparedStatement.setInt(6, weight);
			preparedStatement.executeUpdate();
		}
	}
	
	public Product2 selectAdName() throws SQLException{
		Product2 product = null;
		try (Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_AD_NAME)){
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				String name = rs.getString("name");
				String type = rs.getString("type");
				String intro = rs.getString("intro");
				int price = rs.getInt("price");
				int weight=rs.getInt("weight");
				String gender =rs.getString("gender");
				product = new Product2(name,gender,type,price,intro,weight);
			}
		}
		return product;
	}
	
}