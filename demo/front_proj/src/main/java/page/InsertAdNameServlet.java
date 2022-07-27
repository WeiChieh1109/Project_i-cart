//package page;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//import java.io.IOException;
//import java.sql.SQLException;
//
//import DAO.ProductDAO;
//import DAO.ProductDAO2;
//
///**
// * Servlet implementation class InsertAdNameServlet
// */
//public class InsertAdNameServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public InsertAdNameServlet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//    private ProductDAO2 productDAO2;
//	
//	public void init() {
//		productDAO2 = new ProductDAO2();
//	} 
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////		String name = "ÀY¥Ö²b¤Æ¬~¾vºë";
////		String name = request.getParameter("name");
////		String gender = "male";
//		HttpSession session = request.getSession();
//		String name = (String) session.getAttribute("name");
//		System.out.println("session:"+name);
////		session.setAttribute("gender", gender);
//		try {
//			productDAO2.deleteAd();
//			productDAO2.insertAdName(name);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//
//}
