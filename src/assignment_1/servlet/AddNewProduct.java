package assignment_1.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import assignment_1.model.Products;
import assignment_1.model.ProductsInfo;
import assignment_1.model.Users;

/**
 * Servlet implementation class AddNewProduct
 */
@WebServlet("/AddNewProduct")
public class AddNewProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productName = request.getParameter("productname");
		int price = Integer.parseInt(request.getParameter("price"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String description = request.getParameter("Description");
		int category = Integer.parseInt(request.getParameter("category"));
		String productimage = request.getParameter("productimage");
		HttpSession session = request.getSession();
		Users aUser = (Users)session.getAttribute("userBean");
		int id = aUser.getID();
		
		Products aProduct = new Products(productName,category,price,quantity,id,description,productimage);  
				
		aProduct.addProducts(aProduct);
		Products aProduct2 = new Products();
		
			ArrayList<Products> productResult = new ArrayList<Products>();
			productResult = aProduct2.returnProductsBySellerID(id);
				request.setAttribute("productResult", productResult);
				RequestDispatcher dispatcher = request.getRequestDispatcher("ManageProducts.jsp");
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
