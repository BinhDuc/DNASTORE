package dnastore.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dnastore.beans.Role;
import dnastore.utils.DBUtils;
import dnastore.utils.MyUtils;

/**
 * Servlet implementation class CreateUser
 */
@WebServlet("/createuser")
@MultipartConfig(maxFileSize = 16177215) // upload file up to 16MB
public class CreateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
        String errorString = null;
        List<Role> list = null; 
        try {
            list = DBUtils.queryRole(conn);
            
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
        // Lưu thông tin vào request attribute trước khi forward sang views.
        request.setAttribute("errorString", errorString);
        request.setAttribute("roleList", list);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/components/createUser.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
		 
        // gets values of text fields
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String gender = request.getParameter("gender");
        String birthday = request.getParameter("birthday");
        String number = request.getParameter("number");
        String roleid = request.getParameter("roleid");
        InputStream inputStream = null;

        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("image");
        if (filePart != null) {
            // debug messages
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }

        String message = null; // message will be sent back to client
        try {
            // constructs SQL statement
            String sql = "INSERT INTO account (username, password, fullname, gender, birthday, number, image, roleid) values (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, fullname);
            statement.setString(4, gender);
            statement.setString(5, birthday);
            statement.setString(6, number);
            statement.setString(8, roleid);
            

            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(7, inputStream);
            }

            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Image is uploaded successfully into the Database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        }
        // sets the message in request scope
        request.setAttribute("Message", message);


        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/submit.jsp");
        dispatcher.forward(request, response);
	}

}
