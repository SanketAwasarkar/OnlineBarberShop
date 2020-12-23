package com.app.dao;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.app.pojos.Users;

@Repository
@Transactional // MANDATORY
public class UserDaoImpl implements IUserDao {
	// dependency
	@Autowired // auto wiring by type
	private SessionFactory sf;

	@Override
	public Users auntheticateUser(String email1, String pwd) {
		String jpql = "select u from Users u where u.emailId = :em and u.password=:pa";
		return sf.getCurrentSession().createQuery(jpql, Users.class).setParameter("em", email1).setParameter("pa", pwd)
				.getSingleResult();

	}

	@Override
	public String registerUser(Users user) {
		
		sf.getCurrentSession().persist(user);
		return "User registered successfully : ID "+user.getUserId();
	
	}

	
}