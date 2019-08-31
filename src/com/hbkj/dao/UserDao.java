package com.hbkj.dao;

import com.hbkj.model.User;
import com.hbkj.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    public User addUser(User user){

        Connection con = DBUtil.getConnection();
        String sql = "INSERT INTO users(username,password,platform_name,platform_no,approval_date,approval_number,field) VALUES (?,?,?,?,?,?,?)";
        //        String sql = "INSERT INTO users VALUES (user_auto_increment.nextval, ?, ?, ?, ?,  TO_TIMESTAMP(?, 'SYYYY-MM-DD HH24:MI:SS:FF7'), ?, ?)";
        PreparedStatement ps = null;
        System.out.println("sql:" + sql);
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1,user.getUsername());
            ps.setString(2,user.getPassword());
            ps.setString(3,user.getPlatformName());
            ps.setString(4,user.getPlatformNo());
            ps.setString(5,user.getApprovalDate().toString());
            ps.setString(6,user.getApprovalNum());
            ps.setString(7,user.getField());
//            System.out.println(ps);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return user;
    }

    public User loadUser(String username,String password){

        Connection con = DBUtil.getConnection();
        String sql = "SELECT * FROM users WHERE username = ? and password = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1,username);
            ps.setString(2,password);
            rs = ps.executeQuery();
            while (rs.next()){      //查询到用户
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPlatformName(rs.getString("platform_name"));
                user.setPlatformNo(rs.getString("platform_no"));
                user.setApprovalDate(rs.getTimestamp("approval_date"));
                user.setApprovalNum(rs.getString("approval_number"));
                user.setPassword(rs.getString("password"));
                user.setField(rs.getString("field"));
                return user;
            }
        } catch (SQLException e) {      //出错
            e.printStackTrace();
        }
        //查询失败
        return user;
    }

    public List<User> loadUser(String username){

        Connection con = DBUtil.getConnection();
        String sql = "SELECT * FROM users WHERE username = ?";
        PreparedStatement ps = null;
        List<User> users = new ArrayList<User>();
        ResultSet rs = null;
        try {
            User user = new User();
            ps = con.prepareStatement(sql);
            ps.setString(1,username);
            rs = ps.executeQuery();
            while (rs.next()){
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPlatformName(rs.getString("platform_name"));
                user.setPlatformNo(rs.getString("platform_no"));
                user.setApprovalDate(rs.getTimestamp("approval_date"));
                user.setApprovalNum(rs.getString("approval_number"));
                user.setPassword(rs.getString("password"));
                user.setField(rs.getString("field"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public User loadUser(int id){

        Connection con = DBUtil.getConnection();
        String sql = "SELECT * FROM users WHERE id = ?";
        PreparedStatement ps = null;
        User user = null;
        ResultSet rs = null;
        try {
            user = new User();
            ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next()){
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPlatformName(rs.getString("platform_name"));
                user.setPlatformNo(rs.getString("platform_no"));
                user.setApprovalDate(rs.getTimestamp("approval_date"));
                user.setApprovalNum(rs.getString("approval_number"));
                user.setPassword(rs.getString("password"));
                user.setField(rs.getString("field"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
