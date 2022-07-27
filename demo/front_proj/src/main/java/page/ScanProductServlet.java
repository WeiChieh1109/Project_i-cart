package page;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import DAO.ProductDAO;
import DAO.ProductDAO2;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Model.GoodsBean;
import Model.Product;
import Model.Product2;

/**
 * Servlet implementation class ScanProduct2Servlet
 */
public class ScanProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScanProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private ProductDAO2 ProductDAO2;
    private ProductDAO ProductDAO;
    
    public void init() {
    	ProductDAO2 = new ProductDAO2();
    	ProductDAO = new ProductDAO();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
//			String name = "�ξA������3�M�����G�M�[";
//			String gender = "male";
			
//			String name = request.getParameter("name");
		
//			HttpSession session=request.getSession(false); 
//			String name = (String) session.getAttribute("name");
			Product2 product = ProductDAO2.selectAdName();
			String name = product.getName();
			
//			String gender = "female";
			Product genderAgeProduct =ProductDAO.selectGenderAge();
			String gender = genderAgeProduct.getGender();
//			String gender = (String)session.getAttribute("gender");
			System.out.println("target_name:"+name+" Customer_gender:"+gender);
			
			//Product2 with scan code
			Product2 existingProduct = ProductDAO2.selectProduct(name);
			request.setAttribute("existingProduct", existingProduct);
			String type = existingProduct.getType();
			String product_gender = existingProduct.getGender();
			System.out.println("Select type:"+type+" Product_gender:"+product_gender);
			
			//Products want to recommend
			if(type.equals("���G�M")) {
				String rec_type = "�~����";
				List<Product2> products = ProductDAO2.selectPicByType(name, rec_type, product_gender);	//return name,pic 3�Ӱӫ~
				System.out.println("------------------------------------------------");
				System.out.println("rec_name:"+products.get(0).getName());
				System.out.println("rec_pic:"+products.get(0).getBase64Img());
				System.out.println("------------------------------------------------");
				System.out.println("rec_name:"+products.get(1).getName());
				System.out.println("rec_pic:"+products.get(1).getBase64Img());
				System.out.println("------------------------------------------------");
				System.out.println("rec_name:"+products.get(2).getName());
				System.out.println("rec_pic:"+products.get(2).getBase64Img());
				System.out.println("------------------------------------------------");
				//direct to jsp
				request.setAttribute("existingProduct", existingProduct); //�ؼаӫ~
				
				request.setAttribute("product1_name", products.get(0).getName());
				request.setAttribute("product1_pic", products.get(0).getBase64Img());		//�^�Ǫ���Ʈw
				request.setAttribute("product2_name", products.get(1).getName());
				request.setAttribute("product2_pic", products.get(1).getBase64Img());
				request.setAttribute("product3_name", products.get(2).getName());
				request.setAttribute("product3_pic", products.get(2).getBase64Img());
				
				
				
			}else if(type.equals("�Ƨ��~")){
				String rec_type = "�åʹ�";
				List<Product2> products = ProductDAO2.selectPicByType(name, rec_type, product_gender);	//return name,pic 3�Ӱӫ~
				System.out.println("------------------------------------------------");
				System.out.println("rec_name:"+products.get(0).getName());
				System.out.println("rec_pic:"+products.get(0).getBase64Img());
				System.out.println("------------------------------------------------");
				System.out.println("rec_name:"+products.get(1).getName());
				System.out.println("rec_pic:"+products.get(1).getBase64Img());
				System.out.println("------------------------------------------------");
				System.out.println("rec_name:"+products.get(2).getName());
				System.out.println("rec_pic:"+products.get(2).getBase64Img());
				System.out.println("------------------------------------------------");
				//direct to jsp
				request.setAttribute("existingProduct", existingProduct); //�ؼаӫ~
				
				request.setAttribute("product1_name", products.get(0).getName());
				request.setAttribute("product1_pic", products.get(0).getBase64Img());		//�^�Ǫ���Ʈw
				request.setAttribute("product2_name", products.get(1).getName());
				request.setAttribute("product2_pic", products.get(1).getBase64Img());
				request.setAttribute("product3_name", products.get(2).getName());
				request.setAttribute("product3_pic", products.get(2).getBase64Img());
			}else if(type.equals("�O�����~")){
				String rec_type = "�s";
				List<Product2> products = ProductDAO2.selectPicByType(name, rec_type, product_gender);	//return name,pic 3�Ӱӫ~
				System.out.println("------------------------------------------------");
				System.out.println("rec_name:"+products.get(0).getName());
				System.out.println("rec_pic:"+products.get(0).getBase64Img());
				System.out.println("------------------------------------------------");
				System.out.println("rec_name:"+products.get(1).getName());
				System.out.println("rec_pic:"+products.get(1).getBase64Img());
				System.out.println("------------------------------------------------");
				System.out.println("rec_name:"+products.get(2).getName());
				System.out.println("rec_pic:"+products.get(2).getBase64Img());
				System.out.println("------------------------------------------------");
				//direct to jsp
				request.setAttribute("existingProduct", existingProduct); //�ؼаӫ~
				
				request.setAttribute("product1_name", products.get(0).getName());
				request.setAttribute("product1_pic", products.get(0).getBase64Img());		//�^�Ǫ���Ʈw
				request.setAttribute("product2_name", products.get(1).getName());
				request.setAttribute("product2_pic", products.get(1).getBase64Img());
				request.setAttribute("product3_name", products.get(2).getName());
				request.setAttribute("product3_pic", products.get(2).getBase64Img());
			}else {
				List<Product2> products = ProductDAO2.selectPicByType(name, type, gender);	//return name,pic 3�Ӱӫ~
				System.out.println("------------------------------------------------");
				System.out.println("rec_name:"+products.get(0).getName());
				System.out.println("rec_pic:"+products.get(0).getBase64Img());
				System.out.println("------------------------------------------------");
				System.out.println("rec_name:"+products.get(1).getName());
				System.out.println("rec_pic:"+products.get(1).getBase64Img());
				System.out.println("------------------------------------------------");
				System.out.println("rec_name:"+products.get(2).getName());
				System.out.println("rec_pic:"+products.get(2).getBase64Img());
				System.out.println("------------------------------------------------");
				//direct to jsp
				request.setAttribute("existingProduct", existingProduct); //�ؼаӫ~
				
				request.setAttribute("product1_name", products.get(0).getName());
				request.setAttribute("product1_pic", products.get(0).getBase64Img());		//�^�Ǫ���Ʈw
				request.setAttribute("product2_name", products.get(1).getName());
				request.setAttribute("product2_pic", products.get(1).getBase64Img());
				request.setAttribute("product3_name", products.get(2).getName());
				request.setAttribute("product3_pic", products.get(2).getBase64Img());
			}
			
			
			
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
			}catch (SQLException e) {
				e.printStackTrace();
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
