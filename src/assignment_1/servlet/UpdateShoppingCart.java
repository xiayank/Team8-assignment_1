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
import assignment_1.model.ShoppingCartBean;

/**
 * Servlet implementation class UpdateShoppingCart
 */
@WebServlet("/UpdateShoppingCart")
public class UpdateShoppingCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateShoppingCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Products aProduct = new Products();
		System.out.println( "xx");
		ArrayList<ShoppingCartBean> shoppingCartList = null;
		if(session.getAttribute("shoppingCartList") == null){
			shoppingCartList = new ArrayList<ShoppingCartBean>();
			//session.setAttribute("shoppingCartList", shoppingCartList);
			//System.out.println("session null");
		}else{
			//System.out.println("session exits");
			shoppingCartList = (ArrayList<ShoppingCartBean>) session.getAttribute("shoppingCartList");
		}
		
		String stringDeleteID = request.getParameter("deleteID");
		
		//Execute delete function
		if(stringDeleteID != null){
			int DeleteID = Integer.parseInt(stringDeleteID);
			for(ShoppingCartBean aShoppingCartItem :shoppingCartList ){
				int existID = aShoppingCartItem.getaProduct().getID();
				if(existID == DeleteID){
					shoppingCartList.remove(aShoppingCartItem);
					break;
				}
				
			}
			
		}else{
			//execute add product function
		
		//get ID of the product which has been click to add to cart
		int id = Integer.parseInt(request.getParameter("ID"));
		
		//get request quantity
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		//if the product exist in cart now, add the quantity 
		boolean addedBefore = false;
		for(ShoppingCartBean aShoppingCartItem :shoppingCartList ){
			int existID = aShoppingCartItem.getaProduct().getID();
			if(existID == id){
				int existQuantity = aShoppingCartItem.getRequestQuantity();
				aShoppingCartItem.setRequestQuantity(quantity + existQuantity);
				addedBefore = true;
				break;
			}
		}
		
		if(!addedBefore){
			//get the product by ID
			aProduct =aProduct.returnProductsByID(id);
			ShoppingCartBean aShoppingCart = new ShoppingCartBean(aProduct, quantity);
			shoppingCartList.add(aShoppingCart);
			}
		}// finish add function
		
		
		//check the available quantity, the quantity at most equal to available quantity
		for(ShoppingCartBean aShoppingCartItem :shoppingCartList ){
			int aAvailableQuantity = aShoppingCartItem.getaProduct().getAvailableQuantity(); 
			//System.out.println(aAvailableQuantity);
			//System.out.println(aShoppingCartItem.getRequestQuantity());
			if(aAvailableQuantity <= aShoppingCartItem.getRequestQuantity()){
				aShoppingCartItem.setRequestQuantity(aAvailableQuantity);
			}else{
				
			}
			
		}
		
		int sum = 0;
		//calculate the total cost
		for(ShoppingCartBean aShoppingCartItem :shoppingCartList ){
			sum  +=  aShoppingCartItem.getRequestQuantity() * aShoppingCartItem.getaProduct().getPrice();
		}
		//System.out.println(sum);
		session.setAttribute("totalCost", sum);
		
		session.setAttribute("shoppingCartList", shoppingCartList);
		session.setAttribute("showOrderDetail", shoppingCartList);
		//System.out.println(quantity);
		RequestDispatcher dispatcher = request.getRequestDispatcher("ShoppingCart.jsp");
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
