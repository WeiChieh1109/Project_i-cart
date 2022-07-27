package page;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletInputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import DAO.CarDAO;
import DAO.ProductDAO2;
import DAO.UserDAO;
import Model.Product;
import Model.Product2;

import java.awt.print.Printable;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mysql.cj.Session;

public class check_weight extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public check_weight() {
        super();
    }
    
    private CarDAO carDAO;
	private ProductDAO2 productDAO2;
    public void init() {
    	carDAO = new CarDAO();
    	productDAO2=new ProductDAO2();
    }
    ObjectMapper objectMapper = new ObjectMapper();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.setContentType("text/html;charset=utf-8");
//		ServletInputStream tem = request.getInputStream();//抓變化的重量
//		Product user_unknow = objectMapper.readValue(tem, Product.class);//把變化的重量轉成物件
//		int weight2 = user_unknow.getWeight(); //變化的重量
		Product2 product;
		int weight2 = Integer.parseInt(request.getParameter("weight"));
		System.out.println(weight2);
		try {
			product = productDAO2.selectAdName();
			String name = product.getName();
			String type = product.getType();
			int price = product.getPrice();
			String intro = product.getIntro();
			int weight = product.getWeight();
			String gender = product.getGender();
			
			if(weight2>0) {
				
				if(weight2==weight) {
					Product newUser = new Product(name, type, price, intro, weight, gender);
					try {
						carDAO.insertUser(newUser);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				else {
					System.out.println("plz check code");
				}
			}
			
			if(weight2<0) {
				Product user = carDAO.selectUser(String.valueOf(Math.abs(weight2)));
				try {
					carDAO.deleteUser(Integer.parseInt(user.getName()));
				} catch (NumberFormatException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
//		HttpSession session=request.getSession(false); 
//		String name = (String) session.getAttribute("name");
//		String type = (String) session.getAttribute("type");
//		String price = (String) session.getAttribute("price");
//		String intro = (String) session.getAttribute("intro");
//		String weight = (String) session.getAttribute("weight");
//		String gender = (String) session.getAttribute("gender");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
