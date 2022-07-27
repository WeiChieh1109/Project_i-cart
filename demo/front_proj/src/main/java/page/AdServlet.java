package page;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import DAO.ProductDAO;
import Model.Product;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html ; charset=utf-8");
		ProductDAO myDao = new ProductDAO();
		int age =Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
//		HttpSession mySession = request.getSession();
//		mySession.setAttribute("gender", gender);
//		int age= 50;
//		String gender = "female";
		try {
			myDao.deleteGenderAge();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			myDao.insertGenderAge(gender, age);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("Age = " + age);
		System.out.println("Gender: " + gender );
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}