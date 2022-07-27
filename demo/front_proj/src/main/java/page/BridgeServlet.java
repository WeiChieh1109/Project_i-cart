package page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DAO.ProductDAO;
import Model.Product;

/**
 * Servlet implementation class BridgeServlet
 */
public class BridgeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BridgeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("BridgeServlet worked !");
		List<String> typeList = new ArrayList<String>();
		ProductDAO myDao = new ProductDAO();
		Product genderAgeProduct =myDao.selectGenderAge();
//		try {
//			myDao.deleteGenderAge();
//		} catch (SQLException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		String gender = genderAgeProduct.getGender();
		int age = genderAgeProduct.getAge();
		if (age>50 || age <= 10) {
			typeList.add("保健食品");
			typeList.add("家具");
			typeList.add("酒");
			List<Product> products = myDao.selectedProductsByType(typeList);
			System.out.println("products age 40 up = " + products);
			try {
				myDao.insertAdcount(products);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//			mySession.setAttribute("adProducts", products);
			request.setAttribute("adProducts", products);
		} else if (10<age && age<=50 && gender.equals("Male")) {
			typeList.add("刮鬍刀");
			typeList.add("洗面乳");
			List<Product> products = myDao.selectedProductsByType(typeList);
			System.out.println("products Male = " + products);
			try {
				myDao.insertAdcount(products);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("adProducts", products);
//			mySession.setAttribute("adProducts", products);
		} else if ( 10<age && age<40 && gender.equals("Female")) {
			typeList.add("化妝品");
			typeList.add("衛生棉");
			List<Product> products = myDao.selectedProductsByType(typeList);
			System.out.println("products female = " + products);
			try {
				myDao.insertAdcount(products);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("adProducts", products);
//			mySession.setAttribute("adProducts", products);
		} else {
			System.out.println("Print else");
		}
		
		System.out.println("TypeList = " + typeList);
		System.out.println("Age = " + age);
		System.out.println("Gender: " + gender );
		request.getRequestDispatcher("bigASS.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
