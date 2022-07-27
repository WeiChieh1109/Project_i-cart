package page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import DAO.ProductDAO;
import Model.Product;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;
@MultipartConfig

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO;
	
	public void init() {
		productDAO = new ProductDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertProduct(request, response);
				break;
			case "/delete":
				deleteProduct(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateProduct(request, response);
				break;
			default:
				listProducts(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void listProducts(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Product> listProducts = productDAO.selectAllProducts();
		request.setAttribute("listProducts", listProducts);
//		HttpSession mySession = request.getSession();
//		mySession.setAttribute("listProducts", listProducts);
		request.getRequestDispatcher("DashBoardList.jsp").forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("user-form.jsp").forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		String name = request.getParameter("name");
		Product existingProduct = productDAO.selectProduct(name);
		request.setAttribute("product", existingProduct);
		request.getRequestDispatcher("user-form.jsp").forward(request, response);
	}

	private void insertProduct(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException, ServletException {
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		int price = Integer.parseInt(request.getParameter("price"));
		String intro = request.getParameter("intro");
		int weight = Integer.parseInt(request.getParameter("weight"));
		String gender = request.getParameter("gender");
		Part myPart = request.getPart("imgFile");
		InputStream pic = myPart.getInputStream();
		Product newProduct = new Product(name, type, price, intro, weight, gender, pic);
		productDAO.insertProduct(newProduct);
		response.sendRedirect("list");
	}

	private void updateProduct(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException, ServletException {
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		int price = Integer.parseInt(request.getParameter("price"));
		String intro = request.getParameter("intro");
		int weight = Integer.parseInt(request.getParameter("weight"));
		String gender = request.getParameter("gender");
		Part myPart = request.getPart("imgFile");
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
			productDAO.updateProduct(product);
//		}
		response.sendRedirect("list");
	}

	private void deleteProduct(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		String name = request.getParameter("name");
		productDAO.deleteProduct(name);
		response.sendRedirect("list");

	}

}
