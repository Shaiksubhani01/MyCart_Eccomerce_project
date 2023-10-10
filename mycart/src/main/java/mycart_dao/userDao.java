package mycart_dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import mycart_entities.Users;

public class userDao {
	private SessionFactory factory;

	public userDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	// get user by email and password

	public Users getUserByEmailAndPassword(String email, String password) {
		Users user = null;
		try {
			String query = "From Users where userEmail =: e and userPassword =: p";
			Session session = factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);
			user = (Users) q.uniqueResult();
			session.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;

	}
	
	
	/*public List<Users> getAllUsers(){
		Session session=this.factory.openSession();
		Query query=session.createQuery("From Users");
		List<Users> list=query.list();
		return list;
	}*/

}
