package net.usermanagement.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.usermanagement.model.Product;
import net.usermanagement.dao.ProductDAO;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class DBListServlet
 */
public class DBListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProductDAO productDAO = new ProductDAO();
		List<Product> listProducts = productDAO.selectAllProducts();
		request.setAttribute("listProducts", listProducts);
//		HttpSession mySession = request.getSession();
//		mySession.setAttribute("listProducts", listProducts);
		request.getRequestDispatcher("DashBoardList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
