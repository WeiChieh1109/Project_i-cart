package page;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import DAO.CarDAO;
import Model.GoodsBean;
import Model.Product;

/**
 * Servlet implementation class TestServlet
 */
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CarDAO CarDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	CarDAO = new CarDAO();
    	super.init();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//		List<GoodsBean> LGB=goodsDAO.selectAllGoods();
		if(request.getParameter("account").equals("aaa")) {
			List<Product> CR=CarDAO.selectAllUsers();
			int total=0;
			for(Product goodsBean:CR) {
				total=total+goodsBean.getPrice();
				response.getWriter().append("<tr><th>"+goodsBean.getName()+"</th><th>"+"$"+goodsBean.getPrice()+"</th></tr>"
						);
	
				
			}
			
		}
		if(request.getParameter("account").equals("bbb")) {
			List<Product> CR=CarDAO.selectAllUsers();
			int total=0;
			for(Product goodsBean:CR) {
				total=total+goodsBean.getPrice();		
			}
			response.getWriter().append("²Ö¿n"+total+"¤¸"
					);
			
		}

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
