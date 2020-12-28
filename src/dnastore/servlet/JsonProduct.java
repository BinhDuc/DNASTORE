package dnastore.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.google.gson.Gson;
import dnastore.beans.ProductJson;
import dnastore.utils.DBUtils;
import dnastore.utils.MyUtils;

/**
 * Servlet implementation class JsonProduct
 */
@WebServlet("/JsonProduct")
public class JsonProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JsonProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		Connection conn = MyUtils.getStoredConnection(request);
		List<ProductJson> list = null;
		try {
			list = DBUtils.queryJsonProduct(conn); 
		} catch (Exception e) {
			// TODO: handle exception
		}
		Gson gson = new Gson();
		String jsonString = gson.toJson(list);
		response.setContentType("application/json");
		response.getWriter().write(jsonString);
		System.out.print("ProductJson: "+jsonString);
	}

}
