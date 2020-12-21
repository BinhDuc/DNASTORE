package dnastore.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dnastore.beans.Account;
import dnastore.beans.Slide;
import dnastore.utils.DBUtils;
import dnastore.utils.MyUtils;

/**
 * Servlet implementation class ActionEditSlide
 */

@WebServlet("/editSlide")
@MultipartConfig(maxFileSize = 16177215) // upload file up to 16MB
public class ActionEditSlide extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActionEditSlide() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
		HttpSession session = request.getSession();
		Account loginedUser = MyUtils.getLoginedUser(session);
		// Nếu chưa đăng nhập (login).
        if (loginedUser == null || loginedUser.getRoleid() != 1) {
            // Redirect (Chuyển hướng) tới trang login.
            response.sendRedirect(request.getContextPath() + "/dangnhap");
            return;
        }
        // Lưu thông tin vào request attribute trước khi forward (chuyển tiếp).
        request.setAttribute("user", loginedUser);
        String id = (String) request.getParameter("id");
        Slide slide = null;
        String errorString = null;
        try {
        	slide=DBUtils.findSlide(conn, id);
            
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
     // Lưu thông tin vào request attribute trước khi forward sang views.
        request.setAttribute("errorString", errorString);
        request.setAttribute("slide", slide);
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/EditSlide.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
		// gets values of text fields
		String id = request.getParameter("id");
		String title = request.getParameter("title");
        String slidename = request.getParameter("slidename");
        String content = request.getParameter("content");
        InputStream inputStream = null;
        Part filePart = request.getPart("background");
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
            String sql = "Update slide set title=?, slidename =?, content=?, background=? "
            		+ "where id=?";
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, title);
            statement.setString(2, slidename);
            statement.setString(3, content);
            statement.setString(5, id);
            

            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(4, inputStream);
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
                .getRequestDispatcher("/EditSlide.jsp");
        dispatcher.forward(request, response);
	}

}
