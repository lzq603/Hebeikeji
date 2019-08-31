package com.hbkj.test;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.hbkj.dao.OrganizationDao;
import com.hbkj.model.Organization;

class OrganizationDaoTest {
	
	OrganizationDao organizationDao = null;
	
	@BeforeEach
	void setUp() throws Exception {
		organizationDao = new OrganizationDao();
	}

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	void testAddOrganization() {
		Organization organization = new Organization("李国强", "324867651546545", "黎噶啥", "13547845678", "123");
		int id = organizationDao.addOrganization(organization);
		assertTrue(id > 0);
	}

	@Test
	void testLoadOrganization() {
		Organization organization = organizationDao.loadOrganization(1);
		assertEquals("百度", organization.getName());
	}

	@Test
	void testUpdateOrganization() {
		Organization organization = organizationDao.loadOrganization(2);
		organization.setName("阿里巴巴");
		organizationDao.updateOrganization(organization);
		assertEquals("阿里巴巴", organization.getName());
	}

}
