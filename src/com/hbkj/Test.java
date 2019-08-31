package com.hbkj;

import com.hbkj.dao.DeanDao;
import com.hbkj.dao.OrganizationDao;
import com.hbkj.dao.PlatformDao;
import com.hbkj.dao.UserDao;
import com.hbkj.model.Dean;
import com.hbkj.model.Organization;
import com.hbkj.model.Platform;
import com.hbkj.model.User;
import com.hbkj.util.DBUtil;

import java.sql.Connection;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

public class Test {


    public static void main(String[] args){

    	Connection conn = DBUtil.getConnection();
    	//System.out.println(conn);
    	
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Timestamp date = null;
        try {
            date = new Timestamp(sdf.parse("1998-05-01").getTime());
            System.out.println(date.toString());
        } catch (ParseException e) {
            e.printStackTrace();
        }
//        Dean dean = new Dean("王宇","女",date,"学生","软件工程","本科","学士","15131027238","15131027238","iv2013@qq.com");
        DeanDao deanDao = new DeanDao();
        Dean dean = deanDao.loadDean(6);
//        
//        System.out.println(deanDao.addDean(dean));
        //System.out.println(deanDao.loadDean(6).getName());
    	/*PlatformDao platformDao = new PlatformDao();
    	List<Platform> platforms = platformDao.loadByCatagory("13020");
    	System.out.println(platforms.get(0).getUser().getPlatformName());*/
        UserDao userDao = new UserDao();
//        User user = new User("李志强", "103960", "sss", "ffsadf", new Timestamp(System.currentTimeMillis()), "1654", "领域");
//        userDao.addUser(user);
        List<User> users = userDao.loadUser("李志强");
        User user = users.get(0);
        OrganizationDao organizationDao = new OrganizationDao();
//        Organization organization = new Organization("组织名称", "机构代码", "法人姓名", "电话号码", "组织类型");
//        int id = organizationDao.addOrganization(organization);
//        System.out.println(id);
        Organization organization = organizationDao.loadOrganization(6);
        System.out.println(organization.getId());
//        PlatformDao platformDao = new PlatformDao();
//        String[] gjdw = {"dd","bb","sadf"};
//        Platform platform = new Platform(user, organization, dean, 1, "dd", 2, true, false, "ind", "subject", gjdw, "siteme", "site", "sadf", "sd", 1);
//        platformDao.addPlatform(platform);
        //Platform platform = platformDao.loadPlatformByUserid(3);
//        List<Platform> platforms = platformDao.loadAll();
//        for(Platform platform:platforms)
//        	System.out.println(platform.getId());
        
    }

}
