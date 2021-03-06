package com.simba.permission.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.simba.framework.util.jdbc.Jdbc;
import com.simba.framework.util.jdbc.Pager;
import com.simba.permission.dao.RoleDao;
import com.simba.permission.model.Role;

@Repository("roleDao")
public class RoleDaoImpl implements RoleDao {

	@Autowired
	private Jdbc jdbc;

	private static final String table = "role";

	@Override
	public void add(Role role) {
		String sql = "insert into " + table + "(name,description) values(?,?)";
		jdbc.updateForBoolean(sql, role.getName(), role.getDescription());
	}

	@Override
	@CacheEvict(cacheNames = "role", key = "#p0.getName()")
	public void update(Role role) {
		String sql = "update " + table + " set description =? where name = ?";
		jdbc.updateForBoolean(sql, role.getDescription(), role.getName());
	}

	@Override
	@CacheEvict(cacheNames = "role", key = "#p0")
	public void delete(String name) {
		String sql = "delete from " + table + " where name = ?";
		jdbc.updateForBoolean(sql, name);
	}

	@Override
	public List<Role> page(Pager page) {
		String sql = "select * from " + table;
		return jdbc.queryForPage(sql, Role.class, page);
	}

	@Override
	@Cacheable(cacheNames = "role", key = "#p0")
	public Role get(String name) {
		String sql = "select * from " + table + " where name = ?";
		return jdbc.query(sql, Role.class, name);
	}

	@Override
	public List<Role> listAll() {
		String sql = "select * from " + table;
		return jdbc.queryForList(sql, Role.class);
	}

}
