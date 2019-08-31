package com.hbkj.dao;

import com.hbkj.model.Organization;
import com.hbkj.util.DBUtil;

import java.sql.*;

public class OrganizationDao {

    public int addOrganization(Organization organization){

        Connection con = DBUtil.getConnection();
        String sql = "INSERT INTO `organization` (`name`, `usci`, `faren_name`, `telephone`, `type`) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement ps = null;
        ResultSet rs = null;
        int id = 0;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1,organization.getName());
            ps.setString(2,organization.getUsci());
            ps.setString(3,organization.getFarenName());
            ps.setString(4,organization.getTelephone());
            ps.setString(5,organization.getType());
            ps.executeUpdate();
            ps.close();
          //------------------------------------------//获取自增ID；
            sql = "select max(id) from organization";
            ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				id = rs.getInt(1);
			}
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }finally {
            DBUtil.close(rs);
            DBUtil.close(ps);
            DBUtil.close(con);
        }
        return id;
    }

    public Organization loadOrganization(int id){

        Connection con = DBUtil.getConnection();
        String sql = "SELECT * FROM organization WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        Organization organization = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next()){
                organization = new Organization();
                organization.setId(rs.getInt("id"));
                organization.setName(rs.getString("name"));
                organization.setUsci(rs.getString("usci"));
                organization.setFarenName(rs.getString("faren_name"));
                organization.setTelephone(rs.getString("telephone"));
                organization.setType(rs.getString("type"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DBUtil.close(rs);
            DBUtil.close(ps);
            DBUtil.close(con);
        }
        return organization;
    }

    public Organization updateOrganization(Organization organization){

        Connection con = DBUtil.getConnection();
        String sql = "UPDATE organization SET name=?, usci=?, faren_name=?, telephone=?, type=? WHERE (id=?)";
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1,organization.getName());
            ps.setString(2,organization.getUsci());
            ps.setString(3,organization.getFarenName());
            ps.setString(4,organization.getTelephone());
            ps.setString(5,organization.getType());
            ps.setInt(6,organization.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(ps);
            DBUtil.close(con);
        }
        return organization;
    }

}
