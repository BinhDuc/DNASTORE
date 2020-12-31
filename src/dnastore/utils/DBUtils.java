package dnastore.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
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
    public static void deleteUser(Connection conn, String userName) throws SQLException {
        String sql = "Delete From account where username= ?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        pstm.setString(1, userName);
 
        pstm.executeUpdate();
    }
    
    
//-------------- Query Product-----------------------------------------------------------------------
    public static List<Product> queryProduct(Connection conn) throws SQLException {
        String sql = "Select a.code, a.name, a.price, a.discount, a.image, a.categoryid , a.note, a.quantity, b.categoryname, b.subid"
        		+ " from product a , category b "
        		+ "where a.categoryid = b.categoryid and a.quantity>0";
 
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
            int quantity = rs.getInt("quantity");
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
            product.setQuantity(quantity);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            product.setSubid(subid);
            list.add(product);
        }
        return list;
    }
    public static List<Product> queryAllProduct(Connection conn) throws SQLException {
        String sql = "Select a.code, a.name, a.price, a.discount, a.image, a.categoryid , a.note, a.quantity, b.categoryname, b.subid"
        		+ " from product a , category b "
        		+ "where a.categoryid = b.categoryid";
 
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
            int quantity = rs.getInt("quantity");
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
            product.setQuantity(quantity);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            product.setSubid(subid);
            list.add(product);
        }
        return list;
    }
    public static List<Product> querySaleProduct(Connection conn) throws SQLException {
        String sql = "Select a.code, a.name, a.price, a.discount, a.image, a.categoryid , a.note, a.quantity, b.categoryname, b.subid"
        		+ " from product a , category b "
        		+ "where a.categoryid = b.categoryid and a.discount>0 and a.quantity>0 order by a.code DESC";
 
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
            int quantity = rs.getInt("quantity");
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
            product.setQuantity(quantity);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            product.setSubid(subid);
            list.add(product);
        }
        return list;
    }
    public static List<Product> queryNewProduct(Connection conn) throws SQLException {
        String sql = "Select a.code, a.name, a.price, a.discount, a.image, a.categoryid , a.note, a.quantity, b.categoryname, b.subid "
        		+ "from product a , category b "
        		+ "where a.categoryid=b.categoryid and a.quantity>0 order by a.code DESC limit 8";
 
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
            int quantity = rs.getInt("quantity");
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
            product.setQuantity(quantity);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            product.setSubid(subid);
            list.add(product);
        }
        return list;
    }
    
    public static List<Product> queryRandomProduct(Connection conn) throws SQLException {
        String sql = "Select a.code, a.name, a.price, a.discount, a.image, a.categoryid , a.note, a.quantity, b.categoryname, b.subid "
        		+ "from product a , category b "
        		+ "where a.categoryid=b.categoryid and a.quantity>0 ORDER BY RAND() limit 8";
 
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
            int quantity = rs.getInt("quantity");
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
            product.setQuantity(quantity);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            product.setSubid(subid);
            list.add(product);
        }
        return list;
    }
    public static List<Product> querySameProduct(Connection conn,String categoryid) throws SQLException {
        String sql = "Select a.code, a.name, a.price, a.discount, a.image, a.categoryid , a.note, a.quantity, b.categoryname, b.subid "
        		+ "from product a , category b "
        		+ "where a.categoryid=b.categoryid and a.quantity>0 and a.categoryid=? limit 4";
 
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
            int quantity = rs.getInt("quantity");
            String categoryname = rs.getString("categoryname");
            String subid = rs.getString("subid");
            Product product = new Product();
            product.setCode(code);
            product.setName(name);
            product.setDiscount(discount);
            product.setPrice(price);
            product.setImage(image);
            product.setNote(note);
            product.setQuantity(quantity);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            product.setSubid(subid);
            list.add(product);
        }
        return list;
    }
    public static List<Product> queryProductMale(Connection conn) throws SQLException {
        String sql = "Select a.code, a.name, a.price, a.discount, a.image, a.categoryid , a.note, a.quantity, b.categoryname, b.subid "
        		+ "from product a , category b "
        		+ "where a.categoryid=b.categoryid and a.quantity>0 and (b.categoryid = 2 or b.subid = 2) order by a.code DESC";
 
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
            int quantity = rs.getInt("quantity");
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
            product.setQuantity(quantity);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            product.setSubid(subid);
            list.add(product);
        }
        return list;
    }
    public static List<Product> queryProductFemale(Connection conn) throws SQLException {
        String sql = "Select a.code, a.name, a.price, a.discount, a.image, a.categoryid , a.note, a.quantity, b.categoryname, b.subid "
        		+ "from product a , category b "
        		+ "where a.categoryid=b.categoryid and a.quantity>0 and (b.categoryid = 1 or b.subid = 1) order by a.code DESC";
 
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
            int quantity = rs.getInt("quantity");
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
            product.setQuantity(quantity);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            product.setSubid(subid);
            list.add(product);
        }
        return list;
    }
    
    public static List<Product> searchProduct(Connection conn,String q) throws SQLException {
        String sql = "Select a.code, a.name, a.price, a.discount, a.image, a.categoryid , a.note, a.quantity, b.categoryname, b.subid"
        		+ " from product a , category b "
        		+ "where a.categoryid = b.categoryid and a.quantity>0 and a.name like ? order by a.code DESC";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, q);
        ResultSet rs = pstm.executeQuery();
        List<Product> list = new ArrayList<Product>();
        while (rs.next()) {
        	String code = rs.getString("code");
            String name = rs.getString("name");
            int price = rs.getInt("price");
            int discount = rs.getInt("discount");
            byte[] image = rs.getBytes("image");
            String note = rs.getString("note");
            int quantity = rs.getInt("quantity");
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
            product.setQuantity(quantity);
            product.setCategoryId(categoryid);
            product.setCategoryname(categoryname);
            product.setSubid(subid);
            list.add(product);
        }
        return list;
    }
    
    
    public static Product findProduct(Connection conn, String code) throws SQLException {
        String sql = "Select a.code, a.name, a.price, a.discount, a.image, a.categoryid , a.note, a.quantity, b.categoryname, b.subid "
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
            int quantity = rs.getInt("quantity");
            String categoryid = rs.getString("categoryid");
            String categoryname = rs.getString("categoryname");
            String subid = rs.getString("subid");
            		
            Product product = new Product(code, name, price, discount, image, note, quantity, categoryid, categoryname, subid);
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
        String sql = "Select a.code, a.name, a.price, a.discount, a.image, a.categoryid , a.note, a.quantity, b.categoryname, b.subid "
        		+ "from product a , category b "
        		+ "where a.categoryid=b.categoryid and a.quantity>0 and a.categoryid=? order by a.code DESC";
 
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
            int quantity = rs.getInt("quantity");
            String categoryname = rs.getString("categoryname");
            String subid = rs.getString("subid");
            Product product = new Product();
            product.setCode(code);
            product.setName(name);
            product.setDiscount(discount);
            product.setPrice(price);
            product.setImage(image);
            product.setNote(note);
            product.setQuantity(quantity);
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
    public static Category findCategory(Connection conn, String categoryid) throws SQLException {
        String sql = "Select categoryid, categoryname, subid "
        		+ "from category "
        		+ "where categoryid=?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, categoryid);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {        	
        	String categoryname = rs.getString("categoryname");
            String subid = rs.getString("subid");
            		
            Category category = new Category(categoryid,categoryname,subid);
            return category;
        }
        return null;
    }
    public static void deleteCategory(Connection conn, String categoryid) throws SQLException {
        String sql = "Delete From category where categoryid= ?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        pstm.setString(1, categoryid);
 
        pstm.executeUpdate();
    }
    public static void insertCategory(Connection conn, Category category) throws SQLException {
        String sql = "Insert into category(categoryId, categoryname, subid) values (?,?,?)";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, category.getCategoryId());
        pstm.setString(2, category.getCategoryname());
        pstm.setString(3, category.getSubid());
        pstm.executeUpdate();
    }
    public static void updateCategory(Connection conn, Category category) throws SQLException {
        String sql = "Update category set categoryname =?, subid=? where categoryid=? ";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        pstm.setString(3, category.getCategoryId());
        pstm.setString(1, category.getCategoryname());
        pstm.setString(2, category.getSubid());
        pstm.executeUpdate();
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
        String sql = "Select id, title, slidename, content, background from slide order by id DESC";
 
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
    
    public static List<OrderDetail> queryOrderDetail(Connection conn,String orders_id) throws SQLException {
        String sql = "Select a.id, a.orders_id, a.product_id, a.quantity, a.total_price, a.coupon, "
        		+ "b.userid,b.order_address,b.payment,b.order_date,b.status,b.customer,b.phone,c.name,c.price "
        		+ "from order_details a,orders b,product c where a.orders_id=b.id and a.product_id=c.code and orders_id=?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, orders_id);
        ResultSet rs = pstm.executeQuery();
        List<OrderDetail> list = new ArrayList<OrderDetail>();
        while (rs.next()) {
        	int id = rs.getInt("id");
            String product_id = rs.getString("product_id");
            int quantity = rs.getInt("quantity");
            double total_price = rs.getDouble("total_price");
            int coupon = rs.getInt("coupon");
            String userid = rs.getString("userid");
            String order_address = rs.getString("order_address");
            String payment = rs.getString("payment");
            Timestamp  order_date = rs.getTimestamp("order_date");
            int status = rs.getInt("status");
            String customer = rs.getString("customer");
            String phone = rs.getString("phone");
            String name = rs.getString("name");
            int price = rs.getInt("price");
            
            OrderDetail orderdetail = new OrderDetail();
            orderdetail.setId(id);
            
            Order order = new Order();
            Account account = new Account(userid, "", "", "", "", "", "", "", null, 0, "");
            order.setId(orders_id);
            order.setUsername(account);
            order.setAddress(order_address);
            order.setPayment(payment);
            order.setOrderdate(order_date);
            order.setStatus(status);
            order.setCustomer(customer);
            order.setPhone(phone);
            
            orderdetail.setOrders_id(order);
            Product product = new Product(product_id, name, price, 0, null, "", 0, "", "", "");
            orderdetail.setProduct_id(product);
            orderdetail.setQuantity(quantity);
            orderdetail.setTotal_price(total_price);
            orderdetail.setCoupon(coupon);
            list.add(orderdetail);
        }
        return list;
    }
    public static OrderDetail findOrder(Connection conn, String orders_id) throws SQLException {
    	String sql = "Select a.id, a.orders_id, a.product_id, a.quantity, a.total_price, a.coupon, "
        		+ "b.userid,b.order_address,b.payment,b.order_date,b.status,b.customer,b.phone,c.name,c.price "
        		+ "from order_details a,orders b,product c where a.orders_id=b.id and a.product_id=c.code and orders_id=?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, orders_id);
        ResultSet rs = pstm.executeQuery();
        while (rs.next()) {        	
        	int id = rs.getInt("id");
            String product_id = rs.getString("product_id");
            int quantity = rs.getInt("quantity");
            double total_price = rs.getDouble("total_price");
            int coupon = rs.getInt("coupon");
            String userid = rs.getString("userid");
            String order_address = rs.getString("order_address");
            String payment = rs.getString("payment");
            Timestamp  order_date = rs.getTimestamp("order_date");
            int status = rs.getInt("status");
            String customer = rs.getString("customer");
            String phone = rs.getString("phone");
            String name = rs.getString("name");
            int price = rs.getInt("price");
            
            Order order = new Order();
            Account account = new Account(userid, "", "", "", "", "", "", "", null, 0, "");
            order.setId(orders_id);
            order.setUsername(account);
            order.setAddress(order_address);
            order.setPayment(payment);
            order.setOrderdate(order_date);
            order.setStatus(status);
            order.setCustomer(customer);
            order.setPhone(phone);
            Product product = new Product(product_id, name, price, 0, null, "", 0, "", "", "");
            OrderDetail orderdetail = new OrderDetail(id, order, product, quantity, total_price, coupon);
            return orderdetail;
        }
        return null;
    }
    public static List<Order> queryOrder(Connection conn) throws SQLException {
        String sql = "Select id, userid, order_address, payment, order_date, status, customer, phone "
        		+ "from orders order by order_date DESC";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Order> list = new ArrayList<Order>();
        while (rs.next()) {
        	String id = rs.getString("id");
        	String userid = rs.getString("userid");
            String order_address = rs.getString("order_address");
            String payment = rs.getString("payment");
            Timestamp  order_date = rs.getTimestamp("order_date");
            int status = rs.getInt("status");
            String customer = rs.getString("customer");
            String phone = rs.getString("phone");
            
            Order order = new Order();
            Account account = new Account(userid, "", "", "", "", "", "", "", null, 0, "");
            order.setId(id);
            order.setUsername(account);
            order.setAddress(order_address);
            order.setPayment(payment);
            order.setOrderdate(order_date);
            order.setStatus(status);
            order.setCustomer(customer);
            order.setPhone(phone);
            
           
            list.add(order);
        }
        return list;
    }
    public static List<Order> historyOrder(Connection conn,String userid) throws SQLException {
    	String sql = "Select id, userid, order_address, payment, order_date, status, customer, phone "
        		+ "from orders where userid=? order by id DESC";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userid);
        ResultSet rs = pstm.executeQuery();
        List<Order> list = new ArrayList<Order>();
        while (rs.next()) {
        	String id = rs.getString("id");
            String order_address = rs.getString("order_address");
            String payment = rs.getString("payment");
            Timestamp  order_date = rs.getTimestamp("order_date");
            int status = rs.getInt("status");
            String customer = rs.getString("customer");
            String phone = rs.getString("phone");
            
            Order order = new Order();
            Account account = new Account(userid, "", "", "", "", "", "", "", null, 0, "");
            order.setId(id);
            order.setUsername(account);
            order.setAddress(order_address);
            order.setPayment(payment);
            order.setOrderdate(order_date);
            order.setStatus(status);
            order.setCustomer(customer);
            order.setPhone(phone);
            
           
            list.add(order);
        }
        return list;
    }
    
    
    public static List<Order> queryOrderWaiting(Connection conn) throws SQLException {
        String sql = "Select id, userid, order_address, payment, order_date, status, customer, phone "
        		+ "from orders where status=0 order by order_date DESC";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Order> list = new ArrayList<Order>();
        while (rs.next()) {
        	String id = rs.getString("id");
        	String userid = rs.getString("userid");
            String order_address = rs.getString("order_address");
            String payment = rs.getString("payment");
            Timestamp  order_date = rs.getTimestamp("order_date");
            int status = rs.getInt("status");
            String customer = rs.getString("customer");
            String phone = rs.getString("phone");
            
            Order order = new Order();
            Account account = new Account(userid, "", "", "", "", "", "", "", null, 0, "");
            order.setId(id);
            order.setUsername(account);
            order.setAddress(order_address);
            order.setPayment(payment);
            order.setOrderdate(order_date);
            order.setStatus(status);
            order.setCustomer(customer);
            order.setPhone(phone);
            
           
            list.add(order);
        }
        return list;
    }
    public static List<Order> queryOrderDelivery(Connection conn) throws SQLException {
        String sql = "Select id, userid, order_address, payment, order_date, status, customer, phone "
        		+ "from orders where status=1 order by order_date DESC";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Order> list = new ArrayList<Order>();
        while (rs.next()) {
        	String id = rs.getString("id");
        	String userid = rs.getString("userid");
            String order_address = rs.getString("order_address");
            String payment = rs.getString("payment");
            Timestamp  order_date = rs.getTimestamp("order_date");
            int status = rs.getInt("status");
            String customer = rs.getString("customer");
            String phone = rs.getString("phone");
            
            Order order = new Order();
            Account account = new Account(userid, "", "", "", "", "", "", "", null, 0, "");
            order.setId(id);
            order.setUsername(account);
            order.setAddress(order_address);
            order.setPayment(payment);
            order.setOrderdate(order_date);
            order.setStatus(status);
            order.setCustomer(customer);
            order.setPhone(phone);
            
           
            list.add(order);
        }
        return list;
    }
    public static List<Order> queryOrderSuccess(Connection conn) throws SQLException {
        String sql = "Select id, userid, order_address, payment, order_date, status, customer, phone "
        		+ "from orders where status=2 order by order_date DESC";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Order> list = new ArrayList<Order>();
        while (rs.next()) {
        	String id = rs.getString("id");
        	String userid = rs.getString("userid");
            String order_address = rs.getString("order_address");
            String payment = rs.getString("payment");
            Timestamp  order_date = rs.getTimestamp("order_date");
            int status = rs.getInt("status");
            String customer = rs.getString("customer");
            String phone = rs.getString("phone");
            
            Order order = new Order();
            Account account = new Account(userid, "", "", "", "", "", "", "", null, 0, "");
            order.setId(id);
            order.setUsername(account);
            order.setAddress(order_address);
            order.setPayment(payment);
            order.setOrderdate(order_date);
            order.setStatus(status);
            order.setCustomer(customer);
            order.setPhone(phone);
            
           
            list.add(order);
        }
        return list;
    }
    public static List<Doanhthutheongay> doanhthuday(Connection conn) throws SQLException {
        String sql = "Select sum(b.total_price-(b.total_price*b.coupon/100)) total , DATE(a.order_date) ngay "
        		+ "from orders a, order_details b where a.id= b.orders_id and a.status=2 group by DATE(a.order_date) order by ngay desc limit 7";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Doanhthutheongay> list = new ArrayList<Doanhthutheongay>();
        while (rs.next()) {
        	String total = rs.getString("total");
            String ngay = rs.getString("ngay");
            Doanhthutheongay day = new Doanhthutheongay();
            day.setTotal(total);
            day.setNgay(ngay);
            list.add(day);
        }
        return list;
    }
    public static List<Doanhthutheothang> doanhthuMonth(Connection conn) throws SQLException {
        String sql = "Select sum(b.total_price-(b.total_price*b.coupon/100)) total , date_format(a.order_date, \"%Y-%m\") thang "
        		+ "from orders a, order_details b where a.id= b.orders_id and a.status=2 group by Month(a.order_date) order by thang desc limit 12";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Doanhthutheothang> list = new ArrayList<Doanhthutheothang>();
        while (rs.next()) {
        	String total = rs.getString("total");
            String thang = rs.getString("thang");
            Doanhthutheothang day = new Doanhthutheothang();
            day.setTotal(total);
            day.setThang(thang);
            list.add(day);
        }
        return list;
    }
    public static List<Doanhthutheongay> queryDoanhthuday(Connection conn) throws SQLException {
        String sql = "Select CONCAT('₫ ', FORMAT(sum(b.total_price-(b.total_price*b.coupon/100)), 0)) total , DATE(a.order_date) ngay "
        		+ "from orders a, order_details b where a.id= b.orders_id and a.status=2 group by DATE(a.order_date) order by ngay desc";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Doanhthutheongay> list = new ArrayList<Doanhthutheongay>();
        while (rs.next()) {
        	String total = rs.getString("total");
            String ngay = rs.getString("ngay");
            Doanhthutheongay day = new Doanhthutheongay();
            day.setTotal(total);
            day.setNgay(ngay);
            list.add(day);
        }
        return list;
    }
    public static List<Doanhthutheothang> queryDoanhthuMonth(Connection conn) throws SQLException {
        String sql = "Select CONCAT('₫ ', FORMAT(sum(b.total_price-(b.total_price*b.coupon/100)), 0)) total , date_format(a.order_date, \"%Y-%m\") thang "
        		+ "from orders a, order_details b where a.id= b.orders_id and a.status=2 group by Month(a.order_date) order by thang desc";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Doanhthutheothang> list = new ArrayList<Doanhthutheothang>();
        while (rs.next()) {
        	String total = rs.getString("total");
            String thang = rs.getString("thang");
            Doanhthutheothang day = new Doanhthutheothang();
            day.setTotal(total);
            day.setThang(thang);
            list.add(day);
        }
        return list;
    }
    public static List<ProductJson> queryJsonProduct(Connection conn) throws SQLException {
        String sql = "Select code, name, price, discount, quantity"
        		+ " from product "
        		+ "where quantity>0";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<ProductJson> list = new ArrayList<ProductJson>();
        while (rs.next()) {
        	String code = rs.getString("code");
            String name = rs.getString("name");
            int price = rs.getInt("price");
            int discount = rs.getInt("discount");
            int quantity = rs.getInt("quantity");
            ProductJson product = new ProductJson();
            product.setValue(code);
            product.setLabel(name);
            product.setDesc(price);
            product.setDiscount(discount);
            product.setQuantity(quantity);
            list.add(product);
        }
        return list;
    }
}
