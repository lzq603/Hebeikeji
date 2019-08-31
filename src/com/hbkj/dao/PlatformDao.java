package com.hbkj.dao;

import com.hbkj.model.Dean;
import com.hbkj.model.Organization;
import com.hbkj.model.Platform;
import com.hbkj.model.User;
import com.hbkj.util.DBUtil;
import com.sun.xml.internal.bind.v2.model.core.ID;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;

public class PlatformDao {

    public void addPlatform(Platform platform){

        //保存成员类数据
        DeanDao deanDao = new DeanDao();
        OrganizationDao organizationDao = new OrganizationDao();
        platform.getDean().setId(deanDao.addDean(platform.getDean()));
        platform.getOrganization().setId(organizationDao.addOrganization(platform.getOrganization()));

        Connection con = DBUtil.getConnection();
        String sql = "INSERT INTO `platform_info` (`Puserid`, `Porganizationid`, `Pdeanid`, `Pgrade`, `Pdistrict`, `Pform`, `Punite`, `Pjjjgj`, `Pindustry`, `Psubject`, `Pgjdw`, `Pwebsite`, `Pweburl`, `Paddress`, `Ppostcode`,`Pstatus`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//        String sql = "INSERT INTO platform_info VALUES (platform_auto_increment.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1,platform.getUser().getId());
            ps.setInt(2,platform.getOrganization().getId());
            ps.setInt(3,platform.getDean().getId());
            ps.setInt(4,platform.getGrade());
            ps.setString(5,platform.getDistrict());
            ps.setInt(6,platform.getForm());
            ps.setBoolean(7,platform.isUnite());
            ps.setBoolean(8,platform.isJjjgj());
            ps.setString(9,platform.getIndustry());
            ps.setString(10,platform.getSubject());
            //将共建单位数组用分号连接
            String gjdw = "";
            if (platform.getGjdw() != null) {
                for (String g : platform.getGjdw()) {
                    gjdw += (g + ";");
                }
            }
            ps.setString(11,gjdw);
            ps.setString(12,platform.getSitename());
            ps.setString(13,platform.getWebsite());
            ps.setString(14,platform.getAddr());
            ps.setString(15,platform.getPostcode());
            ps.setInt(16,platform.getStatus());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(ps);
            DBUtil.close(con);
        }
    }

    public Platform loadPlatform(int id){

        UserDao userDao = new UserDao();
        DeanDao deanDao = new DeanDao();
        OrganizationDao organizationDao = new OrganizationDao();

        Connection con = DBUtil.getConnection();
        String sql = "SELECT * FROM platform_info WHERE id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        Platform platform = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1,id);
            System.out.println("sql");
            System.out.println(ps.toString());
            rs = ps.executeQuery();
            while (rs.next()) {

                platform = new Platform();

                User user = userDao.loadUser(rs.getInt("Puserid"));
                Dean dean = deanDao.loadDean(rs.getInt("Pdeanid"));
                Organization organization = organizationDao.loadOrganization(rs.getInt("Porganizationid"));

                platform.setId(rs.getInt("id"));
                platform.setUser(user);
                platform.setDean(dean);
                platform.setOrganization(organization);
                platform.setGrade(rs.getInt("Pgrade"));
                platform.setDistrict(rs.getString("Pdistrict"));
                platform.setForm(rs.getInt("Pform"));
                platform.setUnite(rs.getBoolean("Punite"));
                platform.setJjjgj(rs.getBoolean("Pjjjgj"));
                platform.setIndustry(rs.getString("Pindustry"));
                platform.setSubject(rs.getString("Psubject"));
                platform.setGjdw(rs.getString("Pgjdw").split(";"));
                platform.setSitename(rs.getString("Pwebsite"));
                platform.setWebsite(rs.getString("Pweburl"));
                platform.setAddr(rs.getString("Paddress"));
                platform.setPostcode(rs.getString("Ppostcode"));
                platform.setStatus(rs.getInt("Pstatus"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DBUtil.close(rs);
            DBUtil.close(ps);
            DBUtil.close(con);
        }
        return platform;
    }

    public Platform loadPlatformByUserid(int userid){

        UserDao userDao = new UserDao();
        DeanDao deanDao = new DeanDao();
        OrganizationDao organizationDao = new OrganizationDao();

        Connection con = DBUtil.getConnection();
        String sql = "SELECT * FROM platform_info WHERE Puserid = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        Platform platform = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1,userid);
            rs = ps.executeQuery();
            while (rs.next()) {

                platform = new Platform();

                User user = userDao.loadUser(rs.getInt("Puserid"));
                Dean dean = deanDao.loadDean(rs.getInt("Pdeanid"));
                Organization organization = organizationDao.loadOrganization(rs.getInt("Porganizationid"));

                platform.setId(rs.getInt("id"));
                platform.setUser(user);
                platform.setDean(dean);
                platform.setOrganization(organization);
                platform.setGrade(rs.getInt("Pgrade"));
                platform.setDistrict(rs.getString("Pdistrict"));
                platform.setForm(rs.getInt("Pform"));
                platform.setUnite(rs.getBoolean("Punite"));
                platform.setJjjgj(rs.getBoolean("Pjjjgj"));
                platform.setIndustry(rs.getString("Pindustry"));
                platform.setSubject(rs.getString("Psubject"));
                platform.setGjdw(rs.getString("Pgjdw").split(";"));
                platform.setSitename(rs.getString("Pwebsite"));
                platform.setWebsite(rs.getString("Pweburl"));
                platform.setAddr(rs.getString("Paddress"));
                platform.setPostcode(rs.getString("Ppostcode"));
                platform.setStatus(rs.getInt("Pstatus"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DBUtil.close(rs);
            DBUtil.close(ps);
            DBUtil.close(con);
        }
        return platform;
    }
    //更新
    public void updatePlatform(Platform platform){

        DeanDao deanDao = new DeanDao();
        OrganizationDao organizationDao = new OrganizationDao();
        deanDao.updateDean(platform.getDean());
        organizationDao.updateOrganization(platform.getOrganization());
        
        Connection con = DBUtil.getConnection();
        String sql = "UPDATE `platform_info` SET `Pgrade`=?, `Pdistrict`=?, `Pform`=?, `Punite`=?, `Pjjjgj`=?, `Pindustry`=?, `Psubject`=?, `Pgjdw`=?, `Pwebsite`=?, `Pweburl`=?, `Paddress`=?, `Ppostcode`=?, `Pstatus`=? WHERE (`id`=?)";
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1,platform.getGrade());
            ps.setString(2,platform.getDistrict());
            ps.setInt(3,platform.getForm());
            ps.setBoolean(4,platform.isUnite());
            ps.setBoolean(5,platform.isJjjgj());
            ps.setString(6,platform.getIndustry());
            ps.setString(7,platform.getSubject());
            //将共建单位数组用分号连接
            String gjdw = "";
            if (platform.getGjdw() != null) {
                for (String g : platform.getGjdw()) {
                    gjdw += (g + ";");
                }
            }
            ps.setString(8,gjdw);
            ps.setString(9,platform.getSitename());
            ps.setString(10,platform.getWebsite());
            ps.setString(11,platform.getAddr());
            ps.setString(12,platform.getPostcode());
            ps.setInt(13,platform.getStatus());
            
            System.out.println(platform.getStatus());
            
            ps.setInt(14,platform.getId());

            System.out.println(ps.toString());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(ps);
            DBUtil.close(con);
        }
    }

    public List<Platform> loadAll() {
		// TODO Auto-generated method stub
		Connection connection = DBUtil.getConnection();
		
		String sql = "select * from platform_info";		
		ResultSet resultSet = null;
		PreparedStatement preparedStatement = null;
		List<Platform> platforms = new ArrayList<Platform>();
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				UserDao userDao = new UserDao();
				OrganizationDao organizationDao = new OrganizationDao();
				DeanDao deanDao = new DeanDao();
				User user = userDao.loadUser(resultSet.getInt("Puserid"));
				Organization organization = organizationDao.loadOrganization(resultSet.getInt("Porganizationid"));
				Dean dean = deanDao.loadDean(resultSet.getInt("Pdeanid"));
				
				Platform platform = new Platform();
				platform.setId(resultSet.getInt("id"));
				platform.setUser(user);
				platform.setOrganization(organization);
				platform.setDean(dean);
				platform.setGrade(resultSet.getInt("Pgrade"));
				platform.setDistrict(resultSet.getString("Pdistrict"));
				platform.setForm(resultSet.getInt("Pform"));
				platform.setUnite(resultSet.getBoolean("Punite"));
				platform.setJjjgj(resultSet.getBoolean("Pjjjgj"));
				platform.setIndustry(resultSet.getString("Pindustry"));
				platform.setSubject(resultSet.getString("Psubject"));
				platform.setGjdw(resultSet.getString("Pgjdw").split(";"));
				platform.setSitename(resultSet.getString("Pwebsite"));
				platform.setWebsite(resultSet.getString("Pweburl"));
				platform.setAddr(resultSet.getString("Paddress"));
				platform.setPostcode(resultSet.getString("Ppostcode"));
				platform.setStatus(resultSet.getInt("Pstatus"));
				platforms.add(platform);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
            DBUtil.close(preparedStatement);
            DBUtil.close(connection);
        }
		
		return platforms;
	}
    
    public List<Platform> loadByCatagory(String subject){
    	
    	Connection con = DBUtil.getConnection();
    	
    	String sql = "SELECT * FROM platform_info WHERE Psubject LIKE ?";
    	PreparedStatement ps = null;
    	ResultSet rs = null;
    	List<Platform> platforms = new ArrayList<Platform>();
    	try {
			ps = con.prepareStatement(sql);
			ps.setString(1, subject + "%");
			rs = ps.executeQuery();
			while(rs.next()) {
				
				UserDao userDao = new UserDao();
				OrganizationDao organizationDao = new OrganizationDao();
				DeanDao deanDao = new DeanDao();
				User user = userDao.loadUser(rs.getInt("Puserid"));
				Organization organization = organizationDao.loadOrganization(rs.getInt("Porganizationid"));
				Dean dean = deanDao.loadDean(rs.getInt("Pdeanid"));
				
				Platform platform = new Platform();
				platform.setId(rs.getInt("id"));
				platform.setUser(user);
				platform.setOrganization(organization);
				platform.setDean(dean);
				platform.setGrade(rs.getInt("Pgrade"));
				platform.setDistrict(rs.getString("Pdistrict"));
				platform.setForm(rs.getInt("Pform"));
				platform.setUnite(rs.getBoolean("Punite"));
				platform.setJjjgj(rs.getBoolean("Pjjjgj"));
				platform.setIndustry(rs.getString("Pindustry"));
				platform.setSubject(rs.getString("Psubject"));
				platform.setGjdw(rs.getString("Pgjdw").split(";"));
				platform.setSitename(rs.getString("Pwebsite"));
				platform.setWebsite(rs.getString("Pweburl"));
				platform.setAddr(rs.getString("Paddress"));
				platform.setPostcode(rs.getString("Ppostcode"));
				platform.setStatus(rs.getInt("Pstatus"));
				platforms.add(platform);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(rs);
            DBUtil.close(ps);
            DBUtil.close(con);
        }
    	
    	
		return platforms;
    }
    
    public List<Platform> loadByMuti(int grade,int jjjgj,String name){
    	
    	Connection con = DBUtil.getConnection();
    	
    	String sql = "SELECT * FROM platform WHERE Pgrade=? AND Pjjjgj=? AND platform_name LIKE ?";
    	PreparedStatement ps = null;
    	ResultSet rs = null;
    	List<Platform> platforms = new ArrayList<Platform>();
    	try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, grade);
			ps.setInt(2, jjjgj);
			ps.setString(3, name + "%");
			rs = ps.executeQuery();
			while(rs.next()) {
				UserDao userDao = new UserDao();
				OrganizationDao organizationDao = new OrganizationDao();
				DeanDao deanDao = new DeanDao();
				User user = userDao.loadUser(rs.getInt("Puserid"));
				Organization organization = organizationDao.loadOrganization(rs.getInt("Porganizationid"));
				Dean dean = deanDao.loadDean(rs.getInt("Pdeanid"));
				
				Platform platform = new Platform();
				platform.setId(rs.getInt("Pid"));
				platform.setUser(user);
				platform.setOrganization(organization);
				platform.setDean(dean);
				platform.setGrade(rs.getInt("Pgrade"));
				platform.setDistrict(rs.getString("Pdistrict"));
				platform.setForm(rs.getInt("Pform"));
				platform.setUnite(rs.getBoolean("Punite"));
				platform.setJjjgj(rs.getBoolean("Pjjjgj"));
				platform.setIndustry(rs.getString("Pindustry"));
				platform.setSubject(rs.getString("Psubject"));
				platform.setGjdw(rs.getString("Pgjdw").split(";"));
				platform.setSitename(rs.getString("Pwebsite"));
				platform.setWebsite(rs.getString("Pweburl"));
				platform.setAddr(rs.getString("Paddress"));
				platform.setPostcode(rs.getString("Ppostcode"));
				platform.setStatus(rs.getInt("Pstatus"));
				platforms.add(platform);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return platforms;
	}	
    
    public List<Platform> loadWhere(String where) {
		// TODO Auto-generated method stub
		Connection connection = DBUtil.getConnection();
		
		String sql = "select * from platform_info WHERE " + where;		
		System.out.println(sql);
		ResultSet resultSet = null;
		PreparedStatement preparedStatement = null;
		List<Platform> platforms = new ArrayList<Platform>();
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				UserDao userDao = new UserDao();
				OrganizationDao organizationDao = new OrganizationDao();
				DeanDao deanDao = new DeanDao();
				User user = userDao.loadUser(resultSet.getInt("Puserid"));
				Organization organization = organizationDao.loadOrganization(resultSet.getInt("Porganizationid"));
				
				Dean dean = deanDao.loadDean(resultSet.getInt("Pdeanid"));
				
				Platform platform = new Platform();
				platform.setId(resultSet.getInt("id"));
				platform.setUser(user);
				platform.setOrganization(organization);
				platform.setDean(dean);
				platform.setGrade(resultSet.getInt("Pgrade"));
				platform.setDistrict(resultSet.getString("Pdistrict"));
				platform.setForm(resultSet.getInt("Pform"));
				platform.setUnite(resultSet.getBoolean("Punite"));
				platform.setJjjgj(resultSet.getBoolean("Pjjjgj"));
				platform.setIndustry(resultSet.getString("Pindustry"));
				platform.setSubject(resultSet.getString("Psubject"));
				platform.setGjdw(resultSet.getString("Pgjdw").split(";"));
				platform.setSitename(resultSet.getString("Pwebsite"));
				platform.setWebsite(resultSet.getString("Pweburl"));
				platform.setAddr(resultSet.getString("Paddress"));
				platform.setPostcode(resultSet.getString("Ppostcode"));
				platform.setStatus(resultSet.getInt("Pstatus"));
				platforms.add(platform);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
            DBUtil.close(preparedStatement);
            DBUtil.close(connection);
        }
		
		return platforms;
	}
}
