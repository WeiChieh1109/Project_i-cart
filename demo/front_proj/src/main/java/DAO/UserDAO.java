package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Product;

/**
 * AbstractDAO.java This DAO class provides CRUD database operations for the
 * table users in the database.
 * 
 * @author Ramesh Fadatare
 *
 */
public class UserDAO {
	private String jdbcURL = "jdbc:mysql://localhost:3306/market?useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "12345678";

	private static final String INSERT_USERS_SQL = "INSERT INTO products" + "  (name,type,price,intro,weight,gender,pic) VALUES "
			+ " (?, ?, ?, ?, ?, ?, ?);";
	
	private static final String SELECT_USER_BY_ID = "select name,type,price,intro,weight,gender,pic from products where name =?";
	private static final String SELECT_ALL_USERS = "select * from products";

	public UserDAO() {
	}

	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}

	public void insertUser(Product user) throws SQLException {
		System.out.println(INSERT_USERS_SQL);

		try (Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(3, user.getType());
			preparedStatement.setInt(4, user.getPrice());
			preparedStatement.setString(5, user.getIntro());
			preparedStatement.setInt(6, user.getWeight());
			preparedStatement.setString(2, user.getGender());
			preparedStatement.setString(7, user.getPicBase64());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public Product selectUser(String id) {
		Product user = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				// "select id,name,email,country from users where id =?"
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
			preparedStatement.setString(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				 String name = rs.getString("name");
				 String type = rs.getString("type");
				 int price = rs.getInt("price");
				 String intro = rs.getString("intro");
				 int weight = rs.getInt("weight");
				 String gender = rs.getString("gender");
				 String picture = rs.getString("pic");
				user = new Product(name, type, price, intro,weight,gender,picture);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return user;
	}

	public List<Product> selectAllUsers() {

		List<Product> users = new ArrayList<>();
		try (Connection connection = getConnection();

			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				 String name = rs.getString("name");
				 String type = rs.getString("type");
				 int price = rs.getInt("price");
				 String intro = rs.getString("intro");
				 int weight = rs.getInt("weight");
				 String gender = rs.getString("gender");
				 String picture = rs.getString("pic");
				 System.out.println(picture);
				users.add(new Product(name, type, price,intro,weight,gender,picture));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return users;
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