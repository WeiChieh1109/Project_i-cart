package DAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.Product;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class CarDAO
 */
public class CarDAO {
	private String jdbcURL = "jdbc:mysql://localhost:3306/market?useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "12345678";

	private static final String INSERT_CAR_SQL = "INSERT INTO car" + "  (name,type,price,intro,weight,gender) VALUES "
			+ " (?, ?, ?, ?, ?, ?);";
	private static final String SELECT_ALL_USERS = "select * from car";
	private static final String SELECT_USER_BY_WEIGHT = "select name,type,price,intro,weight,gender,pic from car where weight =?";
	private static final String DELETE_USERS_SQL = "delete from car where name = ?;";
	
	public CarDAO() {
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
		System.out.println(INSERT_CAR_SQL);

		try (Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CAR_SQL)) {
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getType());
			preparedStatement.setInt(3, user.getPrice());
			preparedStatement.setString(4, user.getIntro());
			preparedStatement.setInt(5, user.getWeight());
			preparedStatement.setString(6, user.getGender());
//			preparedStatement.setString(7, user.getPicBase64());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	private void printSQLException(SQLException e) {
		
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
				users.add(new Product(name, type, price, intro,weight,gender,picture));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return users;
	}
	
	public Product selectUser(String id) {
		Product user = null;
		try (Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_WEIGHT);) {
			preparedStatement.setString(1, id);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				 String name = rs.getString("name");
				 String type = rs.getString("type");
				 int price = rs.getInt("price");
				 String intro = rs.getString("intro");
				 int weight = rs.getInt("weight");
				 String gender = rs.getString("gender");
				 String pic = rs.getString("pic");
				user = new Product(name, type, price, intro,weight,gender,pic);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return user;
	}
	
	public boolean deleteUser(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getConnection();
			PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}
}