package net.usermanagement.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import net.usermanagement.dao.ProductDAO;
import net.usermanagement.model.Product;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
@MultipartConfig
/**
 * Servlet implementation class DBUpdateServlet
 */
public class DBUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		int price = Integer.parseInt(request.getParameter("price"));
		String intro = request.getParameter("intro");
		int weight = Integer.parseInt(request.getParameter("weight"));
		String gender = request.getParameter("gender");
		Part myPart = request.getPart("imgFile");
		ProductDAO productDAO = new ProductDAO();
		System.out.println("Testtttttt updateProductttt");
//		if(myPart!=null) {
			InputStream pic = myPart.getInputStream();
			System.out.println("Testtt myPart!=null case = " + myPart );
//			Product product = new Product(name, type, price, intro, weight, gender, pic);
//			productDAO.updateProduct(product);
//		}else if(myPart==null) {
			String picBase64 = request.getParameter("picBase64");
			System.out.println("Testtt myPart==null case");
			System.out.println("picBase64 passed by user-form = " + picBase64);
			Product product = new Product(name, type, price, intro, weight, gender, pic, picBase64);
			try {
				productDAO.updateProduct(product);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//		}
		response.sendRedirect("DBListServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
