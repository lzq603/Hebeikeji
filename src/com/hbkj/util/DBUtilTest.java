package com.hbkj.util;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class DBUtilTest {

	@BeforeEach
	void setUp() throws Exception {
	}

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	void testGetConnection() {
		Connection connection = DBUtil.getConnection();
		assertNotNull(connection);
	}

	@Test
	void testCloseConnection() throws SQLException {
		Connection connection = DBUtil.getConnection();
		DBUtil.close(connection);
		assertTrue(connection.isClosed());
	}

}
