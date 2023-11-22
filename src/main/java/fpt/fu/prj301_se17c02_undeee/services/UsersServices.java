/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.services;

import fpt.fu.prj301_se17c02_undeee.models.Addresses;
import fpt.fu.prj301_se17c02_undeee.models.Users;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class UsersServices extends DBConnect {

    private PreparedStatement pst = null;
    private ResultSet rs = null;
    private String sql = "";

    public Addresses getFirstAddressByUserId(int user_id) {
        Addresses ad = new Addresses();
        sql = "Select * from Addresses where user_id = 5 limit 1";
        try {
            pst = connection.prepareStatement(sql);
//            pst.setInt(1, user_id);
            rs = pst.executeQuery();
            while (rs.next()) {
                ad.setId(rs.getInt(1));
                ad.setUser_id(rs.getInt(2));
                ad.setAddress_detail(rs.getString(3));
                ad.setCreated_at(rs.getDate(4));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return ad;
    }

    public Addresses getAddressByUserId(int user_id, String address) {
        Addresses ad = new Addresses();
        sql = "select * from Addresses where user_id = ? and address_detail = ?";
        try {
            pst = connection.prepareStatement(sql);
            pst.setInt(1, user_id);
            pst.setString(2, address);
            rs = pst.executeQuery();
            while (rs.next()) {
                ad.setId(rs.getInt(1));
                ad.setUser_id(rs.getInt(2));
                ad.setAddress_detail(rs.getString(3));
                ad.setCreated_at(rs.getDate(4));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return ad;
    }

    public void insertAddress(int user_id, String address) {
        sql = "insert into Addresses (user_id, address_detail) values (?, ?)";
        try {
            pst = connection.prepareStatement(sql);
            pst.setInt(1, user_id);
            pst.setString(2, address);
            pst.execute();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public Users checkLogin(String email, String password) {
        try {
            sql = "Select * from Users where email = ? and password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String fullname = rs.getString("fullname");
                String phone = rs.getString("phone");
                String avatar = rs.getString("avatar");
                int role = rs.getInt("role");
                Date created_at = rs.getDate("created_at");
                return new Users(id, email, password, fullname, phone, avatar, role, created_at);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public List<Users> getAllUsers() {
        List<Users> list = new ArrayList<>();
        String query = "SELECT* FROM Users ";
        Statement stm;

        try {
            stm = connection.createStatement();
            ResultSet res = stm.executeQuery(query);
            while (res.next()) {
                Users user = new Users();
                user.setId(res.getInt(1));
                user.setEmail(res.getString(2));
                user.setPassword(res.getString(3));
                user.setFullname(res.getString(4));
                user.setPhone(res.getString(5));
                user.setAvatar(res.getString(6));
                user.setRole(res.getInt(7));

                user.setCreated_at(res.getDate(8));
                list.add(user);
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return list;
    }

    public Users getUserbyID(String id) {
        String query = "SELECT* FROM Users where id =?";
        PreparedStatement preparestatement;
        Users user = null;

        try {
            preparestatement = connection.prepareStatement(query);
            preparestatement.setString(1, id);
            ResultSet res = preparestatement.executeQuery();
            while (res.next()) {
                user = new Users();
                user.setId(res.getInt(1));
                user.setEmail(res.getString(2));
                user.setPassword(res.getString(3));
                user.setFullname(res.getString(4));
                user.setPhone(res.getString(5));
                user.setAvatar(res.getString(6));
                user.setRole(res.getInt(7));
                user.setCreated_at(res.getDate(8));
                return user;
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return null;
    }

    public int updateUsers(String fullname, String password, String phone, String image, int id) {
        try {
            String insertQuery = "UPDATE Users  SET fullname= ?,password = ?,phone=? , avatar =? WHERE id = ?";
            // Táº¡o PreparedStatement
            PreparedStatement preparedStatement;
            preparedStatement = connection.prepareStatement(insertQuery);
            // Thiáº¿t láº­p cÃ¡c tham sá»‘ trong truy váº¥n
            preparedStatement.setString(1, fullname);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, phone);
            preparedStatement.setString(4, image);
            preparedStatement.setInt(5, id);

            // Thá»±c hiá»‡n INSERT
            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted;
        } catch (SQLException ex) {
            System.out.println("error: " + ex.getMessage());
        }
        return 0;
    }

    public boolean registerAccount(String email, String fullname, String phone, String password) {
        boolean result = false;
        try {
            sql = "Insert Into Users(email,fullname,phone,password) Values(?,?,?,?)";
            PreparedStatement stm = connection.prepareCall(sql);
            stm.setString(1, email);
            stm.setString(2, fullname);
            stm.setString(3, phone);
            stm.setString(4, password);

            int rowAffectecs = stm.executeUpdate();
            if (rowAffectecs > 0) {
                result = true;
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return result;
    }
}
