package net.usermanagement.dao;

import java.io.ByteArrayInputStream;
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
import net.usermanagement.model.Product;

public class ProductDAO {
	private String jdbcURL = "jdbc:mysql://localhost:3306/market?useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "123456789";
	
	private static final String INSERT_PRODUCTS = "INSERT INTO products" + " (name,type,price,intro,weight,gender,pic) VALUES "
			+ " (?, ? , ? , ? , ? ,? ,?);";
	private static final String INSERT_SUMMARY = "INSERT INTO summary" + " (name,type,price,count,time) VALUES "
			+ " (?, ? , ? , 1 , CURRENT_TIMESTAMP);";
	private static final String INSERT_ADCOUNT = "INSERT INTO adcount" + " (name,type,count,time) VALUES "
			+ " (?, ? , 1 , CURRENT_TIMESTAMP);";

	private static final String SELECT_PRODUCTS_BY_NAME = "select name,type,price,intro, weight, gender, pic from products where name =?";
	private static final String SELECT_ALL_PRODUCTS = "select * from products";
	private static final String DELETE_PRODUCTS_BY_NAME_FROM_PRODUCTS = "delete from products where name = ?;";
	private static final String DELETE_PRODUCTS_BY_NAME_FROM_CAR = "delete from car where name = ?;";
	private static final String UPDATE_PRODUCTS_BY_NAME = "update products set type =?, price =? , intro =?, weight =?, gender =?, pic =? where name= ?;";
	private static final String SELECT_PRODUCTS_BY_TYPE = "select name,type,price,intro,weight,gender,pic from products where type =?";
	private static final String COUNT_SUMMARY_BY_TIME_TYPE = "SELECT SUM(count) AS sumcount FROM summary WHERE time BETWEEN ? AND DATE_ADD(?,INTERVAL 1 DAY) AND type =?;";
	private static final String COUNT_SUMMARY_BY_TIME = "SELECT SUM(count) AS sumcount FROM summary WHERE time BETWEEN ? AND DATE_ADD(?,INTERVAL 1 DAY);";
	private static final String COUNT_ADCOUNT_BY_TIME_TYPE = "SELECT SUM(count) AS sumcount FROM adcount WHERE time BETWEEN ? AND DATE_ADD(?,INTERVAL 1 DAY) AND type =?;";
	private static final String COUNT_ADCOUNT_BY_TIME = "SELECT SUM(count) AS sumcount FROM adcount WHERE time BETWEEN ? AND DATE_ADD(?,INTERVAL 1 DAY);";
	
	public ProductDAO() {
		// TODO Auto-generated constructor stub
	}
	
	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	public void insertProduct(Product product) throws SQLException {
		System.out.println(INSERT_PRODUCTS);
		// try-with-resource statement will auto close the connection.
		// "INSERT INTO products" + " (name,type,price,intro,weight,gender,pic) VALUES "+ " (?, ? , ? , ? , ? ,? ,?);"
		try (Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCTS)) {
			preparedStatement.setString(1, product.getName());
			preparedStatement.setString(2, product.getType());
			preparedStatement.setInt(3, product.getPrice());
			preparedStatement.setString(4, product.getIntro());
			preparedStatement.setInt(5, product.getWeight());
			preparedStatement.setString(6, product.getGender());
			preparedStatement.setBlob(7, product.getPic());
			System.out.println("Insertproduct case , getPic = " + product.getPic());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}
	
	public void insertSummary(Product product) throws SQLException {
		System.out.println(INSERT_SUMMARY);
		// try-with-resource statement will auto close the connection.
		// "INSERT INTO summary" + " (name,type,price,count,time) VALUES " + " (?, ? , ? , ? , CURRENT_TIMESTAMP);"
		try (Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SUMMARY)) {
			preparedStatement.setString(1, product.getName());
			preparedStatement.setString(2, product.getType());
			preparedStatement.setInt(3, product.getPrice());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}
	
	public void insertAdcount(List<Product> products) throws SQLException {
		System.out.println(INSERT_ADCOUNT);
		// try-with-resource statement will auto close the connection.
		// "INSERT INTO adcount" + " (name,type,count,time) VALUES " + " (?, ? , ? , CURRENT_TIMESTAMP);"
//		for(int k=1 ; k<13 ; k++) {
//		for (int j=1 ; j<50; j++) {
//			int myRandom =(int) (Math.random()*(31)+1);
		
		for (int i=0 ; i< products.size() ; i++) {
			try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ADCOUNT)) {
				preparedStatement.setString(1, products.get(i).getName());
				preparedStatement.setString(2, products.get(i).getType());
				System.out.println(preparedStatement);
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
				printSQLException(e);
			}
		}
//		}
//		}
	}
	
	public Product selectProduct(String name) throws IOException {
		Product product = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				// "select name,type,price,intro, weight, gender, pic from products where name =?"
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCTS_BY_NAME);) {
			preparedStatement.setString(1, name);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String type = rs.getString("type");
				int price = rs.getInt("price");
				String intro = rs.getString("intro");
				int weight = rs.getInt("weight");
				String gender = rs.getString("gender");
				Blob picBlob = rs.getBlob("pic");
				InputStream picStream = picBlob.getBinaryStream();
				
				 ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				 byte[] buffer = new byte[picStream.available()];
				 int bytesRead = -1;
				 while ((bytesRead = picStream.read(buffer)) != -1) {
					 outputStream.write(buffer, 0, bytesRead);
				 }
				 byte[] imageBytes = outputStream.toByteArray();
				 String picBase64 = Base64.getEncoder().encodeToString(imageBytes);
				  
				 picStream.close();
				 outputStream.close();
				product = new Product(name, type, price, intro, weight, gender, picBase64);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return product;
	}
	
	public int countSummaryByTimeType(String time ,String type) throws IOException {
		int countTotal = 0;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				//"SELECT SUM(count) AS sumcount FROM `summary` WHERE time BETWEEN ? AND DATE_ADD(?,INTERVAL 1 DAY) AND type =?;"
			PreparedStatement preparedStatement = connection.prepareStatement(COUNT_SUMMARY_BY_TIME_TYPE);) {
			preparedStatement.setString(1, time);
			preparedStatement.setString(2, time);
			preparedStatement.setString(3, type);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();
			// Step 4: Process the ResultSet object.
			// name , type , count(1)
			while (rs.next()) {
				countTotal = rs.getInt("sumcount");
//				countTotal = countTotal + count ;
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return countTotal;
	}
	
	public int countSummaryByTime(String time) throws IOException {
		int countTotal = 0;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				//"SELECT SUM(count) AS sumcount FROM `summary` WHERE time BETWEEN ? AND DATE_ADD(?,INTERVAL 1 DAY) AND type =?;"
			PreparedStatement preparedStatement = connection.prepareStatement(COUNT_SUMMARY_BY_TIME);) {
			preparedStatement.setString(1, time);
			preparedStatement.setString(2, time);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();
			// Step 4: Process the ResultSet object.
			// name , type , count(1)
			while (rs.next()) {
				countTotal = rs.getInt("sumcount");
//				countTotal = countTotal + count ;
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return countTotal;
	}
	
	public int countAdByTimeType(String time ,String type) throws IOException {
		int countTotal = 0;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				//"SELECT count FROM `adcount` WHERE time BETWEEN ? AND DATE_ADD(?,INTERVAL 1 DAY) AND type =?;"
			PreparedStatement preparedStatement = connection.prepareStatement(COUNT_ADCOUNT_BY_TIME_TYPE);) {
			preparedStatement.setString(1, time);
			preparedStatement.setString(2, time);
			preparedStatement.setString(3, type);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();
			// Step 4: Process the ResultSet object.
			// name , type , count(1)
			while (rs.next()) {
				countTotal = rs.getInt("sumcount");
//				countTotal = countTotal + count ;
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return countTotal;
	}
	
	public int countAdByTime(String time ) throws IOException {
		int countTotal = 0;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				//"SELECT SUM(count) FROM adcount WHERE time BETWEEN ? AND DATE_ADD(?,INTERVAL 1 DAY);"
			PreparedStatement preparedStatement = connection.prepareStatement(COUNT_ADCOUNT_BY_TIME);) {
			preparedStatement.setString(1, time);
			preparedStatement.setString(2, time);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();
			// Step 4: Process the ResultSet object.
			// name , type , count(1)
			while (rs.next()) {
				countTotal = rs.getInt("sumcount");
//				countTotal = countTotal + count ;
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return countTotal;
	}
	
	public List<Product> selectAllProducts() throws IOException {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Product> products = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

			// Step 2:Create a statement using connection object
			// "select * from products"
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object. Id, name,class,price,description, weight, url
			while (rs.next()) {
				String name = rs.getString("name");
				String type = rs.getString("type");
				int price = rs.getInt("price");
				String intro = rs.getString("intro");
				int weight = rs.getInt("weight");
				String gender = rs.getString("gender");
				Blob picBlob = rs.getBlob("pic");
				InputStream picStream = picBlob.getBinaryStream();
				 ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				 byte[] buffer = new byte[picStream.available()];
				 int bytesRead = -1;
				  
				 while ((bytesRead = picStream.read(buffer)) != -1) {
				 outputStream.write(buffer, 0, bytesRead);
				 }
				  
				 byte[] imageBytes = outputStream.toByteArray();
				 String picBase64 = Base64.getEncoder().encodeToString(imageBytes);
				  
				 picStream.close();
				 outputStream.close();
				products.add(new Product(name, type, price, intro, weight, gender, picBase64));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return products;
	}
	
public List<Product> selectedProductsByType(List<String> typeList) throws IOException {
		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Product> products = new ArrayList<>();
		// Step 1: Establishing a Connection
		for (int i=0; i< typeList.size() ; i++) {
			try (Connection connection = getConnection();
					// Step 2:Create a statement using connection object
					// "select name,type,price,intro,weight,gender,pic from items where type =?"
					PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCTS_BY_TYPE);) {
					System.out.println(preparedStatement);
					preparedStatement.setString(1, typeList.get(i));
					// Step 3: Execute the query or update query
					ResultSet rs = preparedStatement.executeQuery();
					// Step 4: Process the ResultSet object. Id, name,class,price,description, weight, url
					while (rs.next()) {
						String name = rs.getString("name");
						String type = rs.getString("type");
						int price = rs.getInt("price");
						String intro = rs.getString("intro");
						int weight = rs.getInt("weight");
						String gender = rs.getString("gender");
						Blob picBlob = rs.getBlob("pic");
						InputStream picStream = picBlob.getBinaryStream();
						 ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
						 byte[] buffer = new byte[picStream.available()];
						 int bytesRead = -1;
						  
						 while ((bytesRead = picStream.read(buffer)) != -1) {
						 outputStream.write(buffer, 0, bytesRead);
						 }
						  
						 byte[] imageBytes = outputStream.toByteArray();
						 String picBase64 = Base64.getEncoder().encodeToString(imageBytes);
						  
						 picStream.close();
						 outputStream.close();
						products.add(new Product(name, type, price, intro, weight, gender, picBase64));
					}
				} catch (SQLException e) {
					printSQLException(e);
				}
		}
		return products;
	}
	
public boolean deleteProduct(String name) throws SQLException {
	boolean rowDeleted;
	try (Connection connection = getConnection();
		PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCTS_BY_NAME_FROM_PRODUCTS);) {
		System.out.println(statement);
		statement.setString(1, name);
		rowDeleted = statement.executeUpdate() > 0;
	}
	return rowDeleted;
}

public boolean deleteProductFromCar(String name) throws SQLException {
	boolean rowDeleted;
	try (Connection connection = getConnection();
		PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCTS_BY_NAME_FROM_CAR);) {
		System.out.println(statement);
		statement.setString(1, name);
		rowDeleted = statement.executeUpdate() > 0;
	}
	return rowDeleted;
}

public boolean updateProduct(Product product) throws SQLException {
	boolean rowUpdated;
	// "update items set type =?, price =? , intro =?, weight =?, gender =?, pic =? where name= ?;"
	try (Connection connection = getConnection();
		PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCTS_BY_NAME);) {
		System.out.println(statement);
		statement.setString(1, product.getType());
		statement.setInt(2, product.getPrice());
		statement.setString(3, product.getIntro());
		statement.setInt(4, product.getWeight());
		statement.setString(5, product.getGender());
		if(product.getPic()!=null) {
			System.out.println("Updated getPic != null case ");
			statement.setBlob(6, product.getPic());
		}else if(product.getPic()==null) {
			InputStream pic = new ByteArrayInputStream(product.getPicBase64().getBytes());
			System.out.println("Updated getPic == null case = " + pic);
			statement.setBlob(6, pic);
		}
		statement.setString(7, product.getName());
		rowUpdated = statement.executeUpdate() > 0;
	}
	return rowUpdated;
}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
	
}
