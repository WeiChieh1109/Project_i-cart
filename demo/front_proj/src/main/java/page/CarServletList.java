package page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAO.CarDAO;
import DAO.UserDAO;
import Model.Product;


import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class CarServletList
 */
public class CarServletList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CarServletList() {
        super();
        // TODO Auto-generated constructor stub
    }

    private CarDAO carDAO;
    
    public void init() {
    	carDAO = new CarDAO();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		List<Product> listUser = carDAO.selectAllUsers();
		int total = 0;
		for(int i=0 ; i<listUser.size();i++) {
			int cost =listUser.get(i).getPrice();
			total = total+ cost;
		}
		request.setAttribute("total", total);
		request.setAttribute("listUser", listUser);
		jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
