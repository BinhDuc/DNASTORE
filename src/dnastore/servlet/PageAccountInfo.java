package dnastore.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dnastore.beans.Account;
import dnastore.utils.DBUtils;
import dnastore.utils.MyUtils;

/**
 * Servlet implementation class PageAccountInfo
 */
@WebServlet("/accountInfo")
@MultipartConfig(maxFileSize = 16177215) // upload file up to 16MB
public class PageAccountInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageAccountInfo() {
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
		HttpSession session = request.getSession();
		Account loginedUser = MyUtils.getLoginedUser(session);
		// Nếu chưa đăng nhập (login).
        if (loginedUser == null) {
            // Redirect (Chuyển hướng) tới trang login.
            response.sendRedirect(request.getContextPath() + "/dangnhap");
            return;
        }
        // Lưu thông tin vào request attribute trước khi forward (chuyển tiếp).
        request.setAttribute("user", loginedUser);
        
		String username = (String) request.getParameter("username");
		Account account = null;
		String errorString = null;
		try {
			account = DBUtils.findUser(conn, username);
			
		} catch (SQLException e) {
			 e.printStackTrace();
			 errorString = e.getMessage();
		}
		
     // Lưu thông tin vào request attribute trước khi forward sang views.
        request.setAttribute("errorString", errorString);
        request.setAttribute("account", account);
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/PageAccountInfo.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		Connection conn = MyUtils.getStoredConnection(request);
		 
        // gets values of text fields
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        String gender = request.getParameter("gender");
        String birthday = request.getParameter("birthday");
        String phone = request.getParameter("phone");
        String adress = request.getParameter("adress");
        InputStream inputStream = null;
        
        Part filePart = request.getPart("image");
        if (filePart != null) {
            // debug messages
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }

        String message = null;
        try {
            // constructs SQL statement
            String sql = "Update account set password=?, email =?, fullname=?, gender=?, birthday=?, "
            		+ "phone=?, adress= ?, image=? "
            		+ "where username=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, password);
            statement.setString(2, email);
            statement.setString(3, fullname);
            statement.setString(4, gender);
            statement.setString(5, birthday);
            statement.setString(6, phone);
            statement.setString(7, adress);
            statement.setString(9, username);
            

            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(8, inputStream);
            }

            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Sửa thành công";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        }
        // sets the message in request scope
        request.setAttribute("Message", message);


        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/PageAccountInfo.jsp");
        dispatcher.forward(request, response);
	}

}
