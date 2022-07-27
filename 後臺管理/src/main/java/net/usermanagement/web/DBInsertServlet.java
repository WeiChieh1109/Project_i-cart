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
 * Servlet implementation class DBInsertServlet
 */
public class DBInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		int price = Integer.parseInt(request.getParameter("weight"));
		String intro = request.getParameter("intro");
		int weight = Integer.parseInt(request.getParameter("weight"));
		String gender = request.getParameter("gender");
		Part myPart = request.getPart("imgFile");
		InputStream pic = myPart.getInputStream();
		Product newProduct = new Product(name, type, price, intro, weight, gender, pic);
		ProductDAO productDAO = new ProductDAO();
		try {
			productDAO.insertProduct(newProduct);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("DBListServlet");
	}

}
