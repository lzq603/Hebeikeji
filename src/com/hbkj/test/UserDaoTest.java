package com.hbkj.test;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Timestamp;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.hbkj.dao.UserDao;
import com.hbkj.model.User;

class UserDaoTest {

	UserDao userDao = null;
	@BeforeEach
	void setUp() throws Exception {
		userDao = new UserDao();
	}

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	void testAddUser() {
		User user = new User("lzq", "103960", "河北科技创新平台", "102345", new Timestamp(System.currentTimeMillis()), "135245641654", "计算机科学与技术");
		user = userDao.addUser(user);
		assertEquals("lzq", user.getUsername());
	}

	@Test
	void testLoadUserStringString() {
		User user = userDao.loadUser("lzq","103960");
		assertEquals("lzq", user.getUsername());
	}

	@Test
	void testLoadUserString() {
		List<User> users = userDao.loadUser("lzq");
		assertTrue(users.size() >= 1);
	}

	@Test
	void testLoadUserInt() {
		User user = userDao.loadUser(1);
		assertEquals("admin", user.getUsername());
	}

}
