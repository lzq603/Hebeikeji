package com.hbkj.dao;

import com.hbkj.model.Dean;
import com.hbkj.util.DBUtil;

import java.sql.*;

public class DeanDao {

    public int addDean(Dean dean){

        Connection con = DBUtil.getConnection();
        String sql = "INSERT INTO `dean` (`name`, `sex`, `date`, `job_title`, `major`, `education`, `degree`, `telephone`, `mobilephone`, `email`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//        String sql = "INSERT INTO dean VALUES (dean_auto_increment.nextval, ?, ?, TO_TIMESTAMP(?, 'SYYYY-MM-DD HH24:MI:SS:FF7'), ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = null;
        ResultSet rs = null;
        int id = 0;
        try {
            //ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        	ps = con.prepareStatement(sql);
        	ps.setString(1,dean.getName());
            ps.setString(2,dean.getSex());
            ps.setTimestamp(3, dean.getDate());
//            ps.setString(3,dean.getDate().toString());
            ps.setString(4,dean.getJobTitle());
            ps.setString(5,dean.getMajor());
            ps.setString(6,dean.getEducation());
            ps.setString(7,dean.getDegree());
            ps.setString(8,dean.getTelephone());
            ps.setString(9,dean.getMobilephone());
            ps.setString(10,dean.getEmail());
            ps.executeUpdate();
            ps.close();
//------------------------------------------//获取自增ID；
            sql = "select max(id) from dean";
            ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				id = rs.getInt(1);
			}
            
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(rs);
            DBUtil.close(ps);
            DBUtil.close(con);
        }
        return id;
    }

    public Dean loadDean(int id){

        Connection con = DBUtil.getConnection();
        String sql = "SELECT * FROM dean WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        Dean dean = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next()){
                dean = new Dean();
                dean.setId(rs.getInt("id"));
                dean.setName(rs.getString("name"));
                dean.setSex(rs.getString("sex"));
                dean.setDate(rs.getTimestamp("date"));
                dean.setJobTitle(rs.getString("job_title"));
                dean.setMajor(rs.getString("major"));
                dean.setEducation(rs.getString("education"));
                dean.setDegree(rs.getString("degree"));
                dean.setTelephone(rs.getString("telephone"));
                dean.setMobilephone(rs.getString("mobilephone"));
                dean.setEmail(rs.getString("email"));
            }
            return dean;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(rs);
            DBUtil.close(ps);
            DBUtil.close(con);
        }
        return dean;
    }

    //暂时不用
    public Dean updateDean(Dean dean){

        Connection con = DBUtil.getConnection();
        String sql = "UPDATE dean SET name=?, sex=?, date=?, job_title=?, major=?, education=?, degree=?, telephone=?, mobilephone=?, email=? WHERE (id=?)";
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1,dean.getName());
            ps.setString(2,dean.getSex());
            ps.setTimestamp(3,dean.getDate());
            ps.setString(4,dean.getJobTitle());
            ps.setString(5,dean.getMajor());
            ps.setString(6,dean.getEducation());
            ps.setString(7,dean.getDegree());
            ps.setString(8,dean.getTelephone());
            ps.setString(9,dean.getMobilephone());
            ps.setString(10,dean.getEmail());
            ps.setInt(11,dean.getId());
            System.out.println(ps.toString());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(ps);
            DBUtil.close(con);
        }
        return dean;
    }
}
