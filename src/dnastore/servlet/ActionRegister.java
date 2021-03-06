package dnastore.servlet;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dnastore.filter.SHA256Hash;
import dnastore.utils.MyUtils;

/**
 * Servlet implementation class ActionRegister
 */
@WebServlet("/dangky")
public class ActionRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		Connection conn = MyUtils.getStoredConnection(request);
		String username = request.getParameter("username");
		String passwordStr = request.getParameter("password");
        String password = "";
        String email = request.getParameter("email");
        String roleid = request.getParameter("roleid");
        try {
        	password = SHA256Hash.toHexString(SHA256Hash.getSHA(passwordStr));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        System.out.println("mahoaRegister: "+ password);
        String message = null;
        try {
        	String sql = "INSERT INTO account (username, password, email, roleid) values (?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, email);
            statement.setString(4, roleid);
            int row = statement.executeUpdate();
            if (row > 0) {
            	message = "Tạo Tài Khoản Thành Công!";
            }
		} catch (SQLException ex) {
			message = "ERROR" + ex.getMessage();
            ex.printStackTrace();
		}
        request.setAttribute("message", message);
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/PageLogin.jsp");
        dispatcher.forward(request, response);
	}

}
