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
        		+ "from account a , role b where b.roleid=a.roleid";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<Account> lista = new ArrayList<Account>();
        while (rs.next()) {
        	String userName = rs.getString("username");
        	String password = rs.getString("password");
            String fullname = rs.getString("fullname");
            String gender = rs.getString("gender");
            String birthday = rs.getString("birthday");
            String number = rs.getString("number");
            byte[] image = rs.getBytes("image");
            int roleid = rs.getInt("roleid");
            String rolename = rs.getString("rolename");
            Account user = new Account();
            user.setUserName(userName);
            user.setPassword(password);
            user.setFullname(fullname);
            user.setGender(gender);
            user.setBirthday(birthday);
            user.setNumber(number);
            user.setImage(image);
            user.setRoleid(roleid);
            user.setRolename(rolename);
            lista.add(user);
        }
        return lista;
    }
 
    
    
    
    public static List<Product> queryProduct(Connection conn) throws SQLException {
        String sql = "Select a.code, a.image, a.name, a.price, a.categoryid , a.note, b.categoryname from product a , category b where a.categoryid=b.categoryid ";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<Product> list = new ArrayList<Product>();
        while (rs.next()) {
        	String code = rs.getString("code");
            byte[] image = rs.getBytes("image");
            String name = rs.getString("name");
            int price = rs.getInt("price"); 
            String note = rs.getString("note");
            String categoryid = rs.getString("categoryid");
            String categoryname = rs.getString("categoryname");
            Product product = new Product();
            product.setCode(code);
            product.setName(name);
            product.setImage(image);
            product.setPrice(price);
            product.setNote(note);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            list.add(product);
        }
        return list;
    }
    
    public static List<Product> queryNewProduct(Connection conn) throws SQLException {
        String sql = "Select a.code, a.image, a.name, a.price, a.categoryid , a.note, b.categoryname from product a , category b where a.categoryid=b.categoryid order by a.code DESC limit 8";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<Product> list = new ArrayList<Product>();
        while (rs.next()) {
        	String code = rs.getString("code");
            byte[] image = rs.getBytes("image");
            String name = rs.getString("name");
            int price = rs.getInt("price"); 
            String note = rs.getString("note");
            String categoryid = rs.getString("categoryid");
            String categoryname = rs.getString("categoryname");
            Product product = new Product();
            product.setCode(code);
            product.setName(name);
            product.setImage(image);
            product.setPrice(price);
            product.setNote(note);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            list.add(product);
        }
        return list;
    }
    
    public static List<Product> queryRandomProduct(Connection conn) throws SQLException {
        String sql = "Select a.code, a.image, a.name, a.price, a.categoryid , a.note, b.categoryname from product a , category b where a.categoryid=b.categoryid ORDER BY RAND() limit 4";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<Product> list = new ArrayList<Product>();
        while (rs.next()) {
            String code = rs.getString("code");
            byte[] image = rs.getBytes("image");
            String name = rs.getString("name");
            int price = rs.getInt("price"); 
            String note = rs.getString("note");
            String categoryid = rs.getString("categoryid");
            String categoryname = rs.getString("categoryname");
            Product product = new Product();
            product.setCode(code);
            product.setName(name);
            product.setImage(image);
            product.setPrice(price);
            product.setNote(note);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            list.add(product);
        }
        return list;
    }
    public static List<Product> queryProductMale(Connection conn) throws SQLException {
        String sql = "Select a.code, a.image, a.name, a.price, a.categoryid , a.note, b.categoryname from product a , category b where a.categoryid=b.categoryid and b.categoryname like 'Thời Trang Nam'";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<Product> list = new ArrayList<Product>();
        while (rs.next()) {
        	String code = rs.getString("code");
            byte[] image = rs.getBytes("image");
            String name = rs.getString("name");
            int price = rs.getInt("price"); 
            String note = rs.getString("note");
            String categoryid = rs.getString("categoryid");
            String categoryname = rs.getString("categoryname");
            Product product = new Product();
            product.setCode(code);
            product.setName(name);
            product.setImage(image);
            product.setPrice(price);
            product.setNote(note);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            list.add(product);
        }
        return list;
    }
    public static List<Product> queryProductFemale(Connection conn) throws SQLException {
        String sql = "Select a.code, a.image, a.name, a.price, a.categoryid , a.note, b.categoryname from product a , category b where a.categoryid=b.categoryid and b.categoryname like 'Thời Trang Nữ' ";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<Product> list = new ArrayList<Product>();
        while (rs.next()) {
        	String code = rs.getString("code");
            byte[] image = rs.getBytes("image");
            String name = rs.getString("name");
            int price = rs.getInt("price"); 
            String note = rs.getString("note");
            String categoryid = rs.getString("categoryid");
            String categoryname = rs.getString("categoryname");
            Product product = new Product();
            product.setCode(code);
            product.setName(name);
            product.setImage(image);
            product.setPrice(price);
            product.setNote(note);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            list.add(product);
        }
        return list;
    }
 
//    public static Product findProduct(Connection conn, String code) throws SQLException {
//        String sql = "Select a.code, a.image, a.name, a.price, a.categoryid , a.note, b.categoryname from product a , category b where a.categoryid=b.categoryid and a.code=?";
// 
//        PreparedStatement pstm = conn.prepareStatement(sql);
//        pstm.setString(1, code);
//        ResultSet rs = pstm.executeQuery();
// 
//        while (rs.next()) {
//        	byte[] image = rs.getBytes("image");
//        	String name = rs.getString("name");
//            int price = rs.getInt("price");
//            String note = rs.getString("note");
//            String categoryid = rs.getString("categoryid");
//            String categoryname = rs.getString("categoryname");
//            		
//            Product product = new Product(code, image, name, price, note, categoryid, categoryname);
//            return product;
//        }
//        return null;
//    }
 
    public static void updateProduct(Connection conn, Product product) throws SQLException {
        String sql = "Update product set image =?, name =?, price=?, categoryid=?, note=? where code=? ";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        
        pstm.setBytes(1, product.getImage());
        pstm.setString(2, product.getName());
        pstm.setInt(3, product.getPrice());
        pstm.setString(4, product.getCategoryId());
        pstm.setString(5, product.getNote());
        pstm.setString(6, product.getCode());
        pstm.executeUpdate();
    }
 
    public static void insertProduct(Connection conn, Product product) throws SQLException {
        String sql = "Insert into product(image, name, price, categoryid, note) values (?,?,?,?,?)";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        pstm.setBytes(1, product.getImage());
        pstm.setString(2, product.getName());
        pstm.setInt(3, product.getPrice());
        pstm.setString(4, product.getCategoryId());
        pstm.setString(5, product.getNote());
 
        pstm.executeUpdate();
    }
 
    public static void deleteProduct(Connection conn, String code) throws SQLException {
        String sql = "Delete From product where code= ?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        pstm.setString(1, code);
 
        pstm.executeUpdate();
    }
    
    
    public static List<Category> queryCategory(Connection conn) throws SQLException {
        String sql = "Select c.categoryid, c.categoryname from category c ";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<Category> listct = new ArrayList<Category>();
        while (rs.next()) {
        	String categoryid = rs.getString("categoryid");
            String categoryname = rs.getString("categoryname");
            Category category = new Category();
            category.setCategoryId(categoryid);
            category.setCategoryname(categoryname);
            listct.add(category);
        }
        return listct;
    }
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
 
}
