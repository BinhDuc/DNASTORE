package dnastore.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
 


import dnastore.beans.*;
 
public class DBUtils {

 
    public static Account findUser(Connection conn, //
            String userName, String password) throws SQLException {
 
        String sql = "Select a.username, a.password, a.email, a.fullname, a.gender, "
        		+ "a.birthday, a.phone, a.adress, a.image, a.roleid, b.rolename from account a , role b  "
                + " where b.roleid=a.roleid and a.username = ? and a.password = ?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);
        pstm.setString(2, password);
        ResultSet rs = pstm.executeQuery();
 
        if (rs.next()) {
        	String email = rs.getString("email");
        	String fullname = rs.getString("fullname");
        	String gender = rs.getString("gender");
            String birthday = rs.getString("birthday");
            String phone = rs.getString("phone");
            String adress = rs.getString("adress");
            byte[] image = rs.getBytes("image");
            int roleid = rs.getInt("roleid");
            String rolename = rs.getString("rolename");
            Account user = new Account();
            user.setUserName(userName);
            user.setPassword(password);
            user.setEmail(email);
            user.setFullname(fullname);
            user.setGender(gender);
            user.setBirthday(birthday);
            user.setPhone(phone);
            user.setAdress(adress);
            user.setImage(image);
            user.setRoleid(roleid);
            user.setRolename(rolename);
            return user;
        }
        return null;
    }
 
    public static Account findUser(Connection conn, String userName) throws SQLException {
 
        String sql = "Select a.username, a.password, a.email, a.fullname, a.gender, "
        		+ "a.birthday, a.phone, a.adress, a.image, a.roleid, b.rolename from account a , role b "
                + " where b.roleid=a.roleid and a.username = ? ";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);
        ResultSet rs = pstm.executeQuery();
 
        if (rs.next()) {
        	String password = rs.getString("password");
        	String email = rs.getString("email");
        	String fullname = rs.getString("fullname");
        	String gender = rs.getString("gender");
            String birthday = rs.getString("birthday");
            String phone = rs.getString("phone");
            String adress = rs.getString("adress");
            byte[] image = rs.getBytes("image");
            int roleid = rs.getInt("roleid");
            String rolename = rs.getString("rolename");
            Account user = new Account();
            user.setUserName(userName);
            user.setPassword(password);
            user.setEmail(email);
            user.setFullname(fullname);
            user.setGender(gender);
            user.setBirthday(birthday);
            user.setPhone(phone);
            user.setAdress(adress);
            user.setImage(image);
            user.setRoleid(roleid);
            user.setRolename(rolename);
            return user;
        }
        return null;
    }
    public static List<Account> queryAccount(Connection conn) throws SQLException {
        String sql = "Select a.username, a.password, a.email, a.fullname, a.gender, "
        		+ "a.birthday, a.phone, a.adress, a.image, a.roleid, b.rolename "
        		+ "from account a , role b where b.roleid=a.roleid and( a.roleid=1 or a.roleid=2)";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<Account> lista = new ArrayList<Account>();
        while (rs.next()) {
        	String userName = rs.getString("username");
        	String password = rs.getString("password");
        	String email = rs.getString("email");
            String fullname = rs.getString("fullname");
            String gender = rs.getString("gender");
            String birthday = rs.getString("birthday");
            String phone = rs.getString("phone");
            String adress = rs.getString("adress");
            byte[] image = rs.getBytes("image");
            int roleid = rs.getInt("roleid");
            String rolename = rs.getString("rolename");
            Account user = new Account();
            user.setUserName(userName);
            user.setPassword(password);
            user.setEmail(email);
            user.setFullname(fullname);
            user.setGender(gender);
            user.setBirthday(birthday);
            user.setPhone(phone);
            user.setAdress(adress);
            user.setImage(image);
            user.setRoleid(roleid);
            user.setRolename(rolename);
            lista.add(user);
        }
        return lista;
    }
    public static List<Account> queryUser(Connection conn) throws SQLException {
        String sql = "Select a.username, a.password, a.email, a.fullname, a.gender, "
        		+ "a.birthday, a.phone, a.adress, a.image, a.roleid, b.rolename "
        		+ "from account a , role b where b.roleid=a.roleid and a.roleid=3";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<Account> lista = new ArrayList<Account>();
        while (rs.next()) {
        	String userName = rs.getString("username");
        	String password = rs.getString("password");
        	String email = rs.getString("email");
            String fullname = rs.getString("fullname");
            String gender = rs.getString("gender");
            String birthday = rs.getString("birthday");
            String phone = rs.getString("phone");
            String adress = rs.getString("adress");
            byte[] image = rs.getBytes("image");
            int roleid = rs.getInt("roleid");
            String rolename = rs.getString("rolename");
            Account user = new Account();
            user.setUserName(userName);
            user.setPassword(password);
            user.setEmail(email);
            user.setFullname(fullname);
            user.setGender(gender);
            user.setBirthday(birthday);
            user.setPhone(phone);
            user.setAdress(adress);
            user.setImage(image);
            user.setRoleid(roleid);
            user.setRolename(rolename);
            lista.add(user);
        }
        return lista;
    }
    public static List<Account> queryNewUser(Connection conn) throws SQLException {
        String sql = "Select a.username, a.password, a.email, a.fullname, a.gender, "
        		+ "a.birthday, a.phone, a.adress, a.image, a.roleid, b.rolename "
        		+ "from account a , role b where b.roleid=a.roleid and a.roleid=3 "
        		+ "order by a.username DESC limit 3";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<Account> lista = new ArrayList<Account>();
        while (rs.next()) {
        	String userName = rs.getString("username");
        	String password = rs.getString("password");
        	String email = rs.getString("email");
            String fullname = rs.getString("fullname");
            String gender = rs.getString("gender");
            String birthday = rs.getString("birthday");
            String phone = rs.getString("phone");
            String adress = rs.getString("adress");
            byte[] image = rs.getBytes("image");
            int roleid = rs.getInt("roleid");
            String rolename = rs.getString("rolename");
            Account user = new Account();
            user.setUserName(userName);
            user.setPassword(password);
            user.setEmail(email);
            user.setFullname(fullname);
            user.setGender(gender);
            user.setBirthday(birthday);
            user.setPhone(phone);
            user.setAdress(adress);
            user.setImage(image);
            user.setRoleid(roleid);
            user.setRolename(rolename);
            lista.add(user);
        }
        return lista;
    }
 
    
    
//-------------- Query Product-----------------------------------------------------------------------
    public static List<Product> queryProduct(Connection conn) throws SQLException {
        String sql = "Select a.code, a.name, a.price, a.discount, a.image, a.categoryid , a.note, b.categoryname, b.subid"
        		+ " from product a , category b "
        		+ "where a.categoryid = b.categoryid ";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<Product> list = new ArrayList<Product>();
        while (rs.next()) {
        	String code = rs.getString("code");
            String name = rs.getString("name");
            int price = rs.getInt("price");
            int discount = rs.getInt("discount");
            byte[] image = rs.getBytes("image");
            String note = rs.getString("note");
            String categoryid = rs.getString("categoryid");
            String categoryname = rs.getString("categoryname");
            String subid = rs.getString("subid");
            Product product = new Product();
            product.setCode(code);
            product.setName(name);
            product.setDiscount(discount);
            product.setPrice(price);
            product.setImage(image);
            product.setNote(note);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            product.setSubid(subid);
            list.add(product);
        }
        return list;
    }
    
    public static List<Product> querySaleProduct(Connection conn) throws SQLException {
        String sql = "Select a.code, a.name, a.price, a.discount, a.image, a.categoryid , a.note, b.categoryname, b.subid"
        		+ " from product a , category b "
        		+ "where a.categoryid = b.categoryid and a.discount>0";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Product> list = new ArrayList<Product>();
        while (rs.next()) {
        	String code = rs.getString("code");
            String name = rs.getString("name");
            int price = rs.getInt("price");
            int discount = rs.getInt("discount");
            byte[] image = rs.getBytes("image");
            String note = rs.getString("note");
            String categoryid = rs.getString("categoryid");
            String categoryname = rs.getString("categoryname");
            String subid = rs.getString("subid");
            Product product = new Product();
            product.setCode(code);
            product.setName(name);
            product.setDiscount(discount);
            product.setPrice(price);
            product.setImage(image);
            product.setNote(note);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            product.setSubid(subid);
            list.add(product);
        }
        return list;
    }
    public static List<Product> queryNewProduct(Connection conn) throws SQLException {
        String sql = "Select a.code, a.name, a.price, a.discount, a.image, a.categoryid , a.note, b.categoryname, b.subid "
        		+ "from product a , category b "
        		+ "where a.categoryid=b.categoryid order by a.code DESC limit 8";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Product> list = new ArrayList<Product>();
        while (rs.next()) {
        	String code = rs.getString("code");
            String name = rs.getString("name");
            int price = rs.getInt("price");
            int discount = rs.getInt("discount");
            byte[] image = rs.getBytes("image");
            String note = rs.getString("note");
            String categoryid = rs.getString("categoryid");
            String categoryname = rs.getString("categoryname");
            String subid = rs.getString("subid");
            Product product = new Product();
            product.setCode(code);
            product.setName(name);
            product.setDiscount(discount);
            product.setPrice(price);
            product.setImage(image);
            product.setNote(note);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            product.setSubid(subid);
            list.add(product);
        }
        return list;
    }
    
    public static List<Product> queryRandomProduct(Connection conn) throws SQLException {
        String sql = "Select a.code, a.name, a.price, a.discount, a.image, a.categoryid , a.note, b.categoryname, b.subid "
        		+ "from product a , category b "
        		+ "where a.categoryid=b.categoryid ORDER BY RAND() limit 8";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Product> list = new ArrayList<Product>();
        while (rs.next()) {
        	String code = rs.getString("code");
            String name = rs.getString("name");
            int price = rs.getInt("price");
            int discount = rs.getInt("discount");
            byte[] image = rs.getBytes("image");
            String note = rs.getString("note");
            String categoryid = rs.getString("categoryid");
            String categoryname = rs.getString("categoryname");
            String subid = rs.getString("subid");
            Product product = new Product();
            product.setCode(code);
            product.setName(name);
            product.setDiscount(discount);
            product.setPrice(price);
            product.setImage(image);
            product.setNote(note);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            product.setSubid(subid);
            list.add(product);
        }
        return list;
    }
    public static List<Product> querySameProduct(Connection conn,String categoryid) throws SQLException {
        String sql = "Select a.code, a.name, a.price, a.discount, a.image, a.categoryid , a.note, b.categoryname, b.subid "
        		+ "from product a , category b "
        		+ "where a.categoryid=b.categoryid and a.categoryid=? limit 4";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, categoryid);
        ResultSet rs = pstm.executeQuery();
        List<Product> list = new ArrayList<Product>();
        while (rs.next()) {
        	String code = rs.getString("code");
            String name = rs.getString("name");
            int price = rs.getInt("price");
            int discount = rs.getInt("discount");
            byte[] image = rs.getBytes("image");
            String note = rs.getString("note");
            String categoryname = rs.getString("categoryname");
            String subid = rs.getString("subid");
            Product product = new Product();
            product.setCode(code);
            product.setName(name);
            product.setDiscount(discount);
            product.setPrice(price);
            product.setImage(image);
            product.setNote(note);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            product.setSubid(subid);
            list.add(product);
        }
        return list;
    }
    public static List<Product> queryProductMale(Connection conn) throws SQLException {
        String sql = "Select a.code, a.name, a.price, a.discount, a.image, a.categoryid , a.note, b.categoryname, b.subid "
        		+ "from product a , category b "
        		+ "where a.categoryid=b.categoryid and (b.categoryid = 2 or b.subid = 2)";
 
        PreparedStatement pstm = conn.prepareStatement(sql); 
        ResultSet rs = pstm.executeQuery();
        List<Product> list = new ArrayList<Product>();
        while (rs.next()) {
        	String code = rs.getString("code");
            String name = rs.getString("name");
            int price = rs.getInt("price");
            int discount = rs.getInt("discount");
            byte[] image = rs.getBytes("image");
            String note = rs.getString("note");
            String categoryid = rs.getString("categoryid");
            String categoryname = rs.getString("categoryname");
            String subid = rs.getString("subid");
            Product product = new Product();
            product.setCode(code);
            product.setName(name);
            product.setDiscount(discount);
            product.setPrice(price);
            product.setImage(image);
            product.setNote(note);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            product.setSubid(subid);
            list.add(product);
        }
        return list;
    }
    public static List<Product> queryProductFemale(Connection conn) throws SQLException {
        String sql = "Select a.code, a.name, a.price, a.discount, a.image, a.categoryid , a.note, b.categoryname, b.subid "
        		+ "from product a , category b "
        		+ "where a.categoryid=b.categoryid and (b.categoryid = 1 or b.subid = 1)";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Product> list = new ArrayList<Product>();
        while (rs.next()) {
        	String code = rs.getString("code");
            String name = rs.getString("name");
            int price = rs.getInt("price");
            int discount = rs.getInt("discount");
            byte[] image = rs.getBytes("image");
            String note = rs.getString("note");
            String categoryid = rs.getString("categoryid");
            String categoryname = rs.getString("categoryname");
            String subid = rs.getString("subid");
            Product product = new Product();
            product.setCode(code);
            product.setName(name);
            product.setDiscount(discount);
            product.setPrice(price);
            product.setImage(image);
            product.setNote(note);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            product.setSubid(subid);
            list.add(product);
        }
        return list;
    }
 
    public static Product findProduct(Connection conn, String code) throws SQLException {
        String sql = "Select a.code, a.name, a.price, a.discount, a.image, a.categoryid , a.note, b.categoryname, b.subid "
        		+ "from product a , category b "
        		+ "where a.categoryid=b.categoryid and a.code=?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, code);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {        	
        	String name = rs.getString("name");
            int price = rs.getInt("price");
            int discount = rs.getInt("discount");
            byte[] image = rs.getBytes("image");
            String note = rs.getString("note");
            String categoryid = rs.getString("categoryid");
            String categoryname = rs.getString("categoryname");
            String subid = rs.getString("subid");
            		
            Product product = new Product(code, name, price, discount, image, note, categoryid, categoryname, subid);
            return product;
        }
        return null;
    }
 

    public static void deleteProduct(Connection conn, String code) throws SQLException {
        String sql = "Delete From product where code= ?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        pstm.setString(1, code);
 
        pstm.executeUpdate();
    }
    public static List<Product> queryProductCategory(Connection conn, String categoryid) throws SQLException {
        String sql = "Select a.code, a.name, a.price, a.discount, a.image, a.categoryid , a.note, b.categoryname, b.subid "
        		+ "from product a , category b "
        		+ "where a.categoryid=b.categoryid and a.categoryid=?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, categoryid);
        ResultSet rs = pstm.executeQuery();
        List<Product> list = new ArrayList<Product>();
        while (rs.next()) {
        	String code = rs.getString("code");
            String name = rs.getString("name");
            int price = rs.getInt("price");
            int discount = rs.getInt("discount");
            byte[] image = rs.getBytes("image");
            String note = rs.getString("note");
            String categoryname = rs.getString("categoryname");
            String subid = rs.getString("subid");
            Product product = new Product();
            product.setCode(code);
            product.setName(name);
            product.setDiscount(discount);
            product.setPrice(price);
            product.setImage(image);
            product.setNote(note);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            product.setSubid(subid);
            list.add(product);
        }
        return list;
    }
//  ------Query Category-------------------------------------------------------------------------------    
    public static List<Category> queryAllCategory(Connection conn) throws SQLException {
        String sql = "Select categoryid, categoryname, subid from category";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<Category> listct = new ArrayList<Category>();
        while (rs.next()) {
        	String categoryid = rs.getString("categoryid");
            String categoryname = rs.getString("categoryname");
            String subid = rs.getString("subid");
            Category category = new Category();
            category.setCategoryId(categoryid);
            category.setCategoryname(categoryname);
            category.setSubid(subid);
            listct.add(category);
        }
        return listct;
    }
    public static List<Category> queryFemaleCategory(Connection conn) throws SQLException {
        String sql = "Select categoryid, categoryname, subid from category where subid=1";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<Category> listct = new ArrayList<Category>();
        while (rs.next()) {
        	String categoryid = rs.getString("categoryid");
            String categoryname = rs.getString("categoryname");
            String subid = rs.getString("subid");
            Category category = new Category();
            category.setCategoryId(categoryid);
            category.setCategoryname(categoryname);
            category.setSubid(subid);
            listct.add(category);
        }
        return listct;
    }
    public static List<Category> queryMaleCategory(Connection conn) throws SQLException {
        String sql = "Select categoryid, categoryname, subid from category where subid=2";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<Category> listct = new ArrayList<Category>();
        while (rs.next()) {
        	String categoryid = rs.getString("categoryid");
            String categoryname = rs.getString("categoryname");
            String subid = rs.getString("subid");
            Category category = new Category();
            category.setCategoryId(categoryid);
            category.setCategoryname(categoryname);
            category.setSubid(subid);
            listct.add(category);
        }
        return listct;
    }
    public static List<Category> queryCategory(Connection conn, String subid) throws SQLException {
        String sql = "Select categoryid, categoryname, subid from category where subid=?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, subid);
        ResultSet rs = pstm.executeQuery();
        List<Category> listct = new ArrayList<Category>();
        while (rs.next()) {
        	String categoryid = rs.getString("categoryid");
            String categoryname = rs.getString("categoryname");
            Category category = new Category();
            category.setCategoryId(categoryid);
            category.setCategoryname(categoryname);
            category.setSubid(subid);
            listct.add(category);
        }
        return listct;
    }
//  ------Query Role-------------------------------------------------------------------------------
    public static List<Role> queryRole(Connection conn) throws SQLException {
        String sql = "Select roleid, rolename from role ";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<Role> listr = new ArrayList<Role>();
        while (rs.next()) {
        	int roleid = rs.getInt("roleid");
            String rolename = rs.getString("rolename");
            Role role = new Role();
            role.setRoleid(roleid);;
            role.setRolename(rolename);
            listr.add(role);
        }
        return listr;
    }
    
//    ------Query Slide-------------------------------------------------------------------------------
    
    public static List<Slide> querySlide(Connection conn) throws SQLException {
        String sql = "Select id, title, slidename, content, background from slide ";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Slide> list = new ArrayList<Slide>();
        while (rs.next()) {
        	String id = rs.getString("id");
            String title = rs.getString("title");
            String slidename = rs.getString("slidename");
            String content = rs.getString("content");
            byte[] background = rs.getBytes("background");
            Slide slide = new Slide();
            slide.setId(id);
            slide.setTitle(title);
            slide.setSlideName(slidename);
            slide.setContent(content);
            slide.setBackground(background);
            list.add(slide);
        }
        return list;
    }
    public static Slide findSlide(Connection conn, String id) throws SQLException {
        String sql = "Select id, title, slidename, content, background "
        		+ "from slide "
        		+ "where id=?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, id);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {        	
        	String title = rs.getString("title");
            byte[] background = rs.getBytes("background");
            String slidename = rs.getString("slidename");
            String content = rs.getString("content");
            		
            Slide slide = new Slide(id,title,slidename,content,background);
            return slide;
        }
        return null;
    }
    public static void deleteSlide(Connection conn, String id) throws SQLException {
        String sql = "Delete From slide where id= ?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        pstm.setString(1, id);
 
        pstm.executeUpdate();
    }
    
//    Query Order
    public static void insertOrder(Connection conn, Order order) throws SQLException {
        String sql = "Insert into orders values (?,?,?,?,?,?,?,?)";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        pstm.setString(1, order.getId());
        pstm.setString(2, order.getUsername().getUserName());
        pstm.setString(3, order.getAddress());
        pstm.setString(4, order.getPayment());
        pstm.setTimestamp(5, order.getOrderdate());
        pstm.setInt(6, order.getStatus());
        pstm.setString(7, order.getCustomer());
        pstm.setString(8, order.getPhone());
 
        pstm.executeUpdate();
    }
    public static void insertOrderDetail(Connection conn, OrderDetail order_detail) throws SQLException {
        String sql = "Insert into order_details values (?,?,?,?,?,?)";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        pstm.setInt(1, order_detail.getId());
        pstm.setString(2, order_detail.getOrders_id().getId());
        pstm.setString(3, order_detail.getProduct_id().getCode());
        pstm.setInt(4, order_detail.getQuantity());
        pstm.setDouble(5, order_detail.getTotal_price());
        pstm.setInt(6, order_detail.getCoupon());
 
        pstm.executeUpdate();
    }
 
}
