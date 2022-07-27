package page;


import jakarta.servlet.ServletException;
import jakarta.servlet.ServletInputStream;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import DAO.ProductDAO;
import DAO.ProductDAO2;
import DAO.UserDAO;
import Model.Product;
import java.io.IOException;
import java.sql.SQLException;

import com.fasterxml.jackson.databind.ObjectMapper;

public class UserServletInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserServletInsert() {
        super();
    }
    private UserDAO userDAO;
    private ProductDAO2 productDAO2;
    public void init() {
    	userDAO = new UserDAO();
    	productDAO2 = new ProductDAO2();
    }
    

    ObjectMapper objectMapper = new ObjectMapper();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("start");
		ServletInputStream project = request.getInputStream(); //接收條碼
		Product user2 = objectMapper.readValue(project, Product.class); //條碼轉成物件
		System.out.println(user2.getName());
		Product user3 = userDAO.selectUser(user2.getName());
		System.out.println("456:"+user3.getType());
		String name = user3.getName();
		String type = user3.getType();
		int price = user3.getPrice();
		String intro = user3.getIntro();
		int weight = user3.getWeight();
		String gender = user3.getGender();
		String picture = user3.getPicBase64();
		
//		HttpSession session=request.getSession();
//		session.invalidate();
//		session.setAttribute("name", name);
//		session.setAttribute("type",type);
//		session.setAttribute("price",String.valueOf(price));
//		session.setAttribute("intro",intro);
//		session.setAttribute("weight",String.valueOf(weight));
//		session.setAttribute("gender",gender);
//		session.setAttribute("picture", picture);
		try {
			productDAO2.deleteAd();
			productDAO2.insertAdName(name,gender,type,price,intro,weight);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
//		request.getRequestDispatcher("InsertAdNameServlet").forward(request, response);
		
//		System.out.println("insert"+session.getAttribute("name"));
//		request.getRequestDispatcher("check_weight").include(request, response);;//傳送資料比對重量
//		System.out.println(user2.getCode());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
