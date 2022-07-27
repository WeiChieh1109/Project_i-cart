package net.usermanagement.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.usermanagement.dao.ProductDAO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class ResultTypeServlet
 */
public class ResultTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResultTypeServlet() {
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		List<Integer> totalAdMonth = new ArrayList<>();
		List<Integer> totalBuyMonth = new ArrayList<>();
		List<Integer> avgSucMonth = new ArrayList<>();
		String month = request.getParameter("month");
		String type = request.getParameter("type");
		String chartName = type + " " + month + "月統計資料";
		for(int i=1 ; i<32 ; i++) {
			String iString = Integer.toString(i);
			String month_day = month + iString ;
			ProductDAO myDAO = new ProductDAO();
			int countAdDay=myDAO.countAdByTimeType(month_day, type);
			int countBuyDay = myDAO.countSummaryByTimeType(month_day, type);
			int avgSucDay = 0;
			if(countAdDay!=0) {
				avgSucDay =  (countBuyDay*100/(countAdDay));
			}
			totalAdMonth.add(countAdDay);
			totalBuyMonth.add(countBuyDay);
			avgSucMonth.add(avgSucDay);
			System.out.println("month String from jsp = " + month_day);
			System.out.println("Total ad count day " + i + " = " + countAdDay);
			System.out.println("Total buy count day " + i + " = " + countBuyDay);
			System.out.println("Avarage success count day " + i + " = " + avgSucDay);
		}
		System.out.println("List count AD of the month = " + totalAdMonth);
		System.out.println("List count buy of the month = " + totalBuyMonth);
		System.out.println("List count avarage success of the month = " + avgSucMonth);
		HttpSession mySesson = request.getSession();
//		mySesson.setAttribute("chartType", type);
		request.setAttribute("chartName", chartName);
		request.setAttribute("totalAdMonth", totalAdMonth);
		request.setAttribute("totalBuyMonth", totalBuyMonth);
		request.setAttribute("avgSucMonth", avgSucMonth);
		request.getRequestDispatcher("DashBoardType.jsp").forward(request, response);
	}

}
