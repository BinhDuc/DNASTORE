package dnastore.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dnastore.beans.Account;
import dnastore.utils.DBUtils;
import dnastore.utils.MyUtils;

/**
 * Servlet implementation class AvatarUser
 */
@WebServlet("/AvatarUser")
public class AvatarUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AvatarUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
		Account account = null;
		String username = request.getParameter("username");
		try {
			account = DBUtils.findUser(conn, username);
			if (account == null) {
               // Không có dữ liệu ảnh, chuyển hướng tới một ảnh mặc định.
				response.sendRedirect(request.getContextPath() + "/images/1-removebg-preview.png");
				return;
			}
        // trump.jpg, putin.png
			String imageFileName = account.getUserName();
			
			String contentType = this.getServletContext().getMimeType(imageFileName);
			System.out.println("Content Type: "+ contentType);
			response.setHeader("Content-Type", contentType);
           
			response.setHeader("Content-Length", String.valueOf(account.getImage().length));
         
			response.setHeader("Content-Disposition", "inline; filename=\"" + account.getUserName() + "\"");
			// Ghi dữ liệu ảnh vào Response.
			response.getOutputStream().write(account.getImage());
		} catch (Exception e) {
			 throw new ServletException(e);
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
