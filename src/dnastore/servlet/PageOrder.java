package dnastore.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import java.util.Properties;
import java.util.TreeMap;

import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dnastore.beans.Account;
import dnastore.beans.Cart;
import dnastore.beans.Order;
import dnastore.beans.OrderDetail;
import dnastore.beans.Product;
import dnastore.utils.DBUtils;
import dnastore.utils.MyUtils;

/**
 * Servlet implementation class PageOrder
 */
@WebServlet("/checkout")
public class PageOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		 
        // Kiểm tra người dùng đã đăng nhập (login) chưa.
        Account loginedUser = MyUtils.getLoginedUser(session);
 
        // Nếu chưa đăng nhập (login).
        if (loginedUser == null) {
            // Redirect (Chuyển hướng) tới trang login.
            response.sendRedirect(request.getContextPath() + "/dangnhap");
            return;
        }
        // Lưu thông tin vào request attribute trước khi forward (chuyển tiếp).
        request.setAttribute("user", loginedUser);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/PageOrder.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		Connection conn = MyUtils.getStoredConnection(request);
		
        String customer = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String payment = request.getParameter("payment");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        HttpSession sesion = request.getSession();
        Cart cart = (Cart) sesion.getAttribute("cart");
        
        final String emailId = "dnastorethongbao@gmail.com";
        final String password = "binhduc123";
        Properties props = new Properties();
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.starttls.enable", true);
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        Session session = Session.getInstance(props,
            new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(emailId, password);
                }
            });
        
        try {
			Date orderdate = new Date();
			String id = "" + orderdate.getTime();
			Account account = new Account();
			account.setUserName(username);
			Order order = new Order(id, account, address, payment, new Timestamp(new Date().getTime()), 0, customer, phone);
			order.setId(id);
			DBUtils.insertOrder(conn, order);
			
			TreeMap<Product, Integer> list = cart.getList();
			for(Map.Entry<Product, Integer> ds : list.entrySet()) {
				Product product = new Product();
				product.setCode(ds.getKey().getCode());
				DBUtils.insertOrderDetail(conn, new OrderDetail(0, order, product, ds.getValue(), ds.getKey().getPrice()*ds.getValue() , ds.getKey().getDiscount()));
				int quantity = ds.getKey().getQuantity() - ds.getValue();
				String code = ds.getKey().getCode();
				String message = null;
				System.out.println("San pham co ma: "+ code +" Con lai: "+ quantity+" san pham");
				try {
					String sql = "update product set quantity=? "
		            		+ "where code=?";
		            PreparedStatement statement = conn.prepareStatement(sql);
		            statement.setInt(1, quantity);
		            statement.setString(2, code);
		            int row = statement.executeUpdate();
		            if (row > 0) {
		                message = "Thanh toan và tru san pham thanh cong";
		            }
				} catch (SQLException ex) {
					message = "ERROR: " + ex.getMessage();
		            ex.printStackTrace();
				}
				// sets the message in request scope
		        request.setAttribute("Message", message);
		        System.out.println(message);
			}
			//send email
			Message messages = new MimeMessage(session);
			messages.setHeader("Content-Type", "text/plain; charset=UTF-8");
            messages.setFrom(new InternetAddress(email));
            messages.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailId));
            MimeBodyPart textPart = new MimeBodyPart();
            Multipart multipart = new MimeMultipart();
            String final_Text = "Có 1 Đơn Hàng Mới, "
            		+ "\nMã đơn hàng: #" + id
            		+ "\nTên khách hàng: "+ customer + "\nSố điện thoại: " + phone
            		+ "\nĐịa chỉ nhận hàng: "+ address + "\nHình thức thanh toán: "+payment;
            String subject = "New Order: #"+ id;
            textPart.setText(final_Text,"utf-8");
            multipart.addBodyPart(textPart);
            messages.setContent(multipart);
            messages.setSubject(subject);
            Transport.send(messages);
            
			sesion.removeAttribute("cart");
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Success.jsp");
			dispatcher.forward(request, response);

	        
		} catch (Exception e) {
			// TODO: handle exception
		}
        
        
        
	}

}
