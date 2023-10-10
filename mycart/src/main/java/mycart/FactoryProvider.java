package mycart;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import mycart_entities.Users;

public class FactoryProvider {
	private static SessionFactory factory;
	public static SessionFactory getFactory() 
	{
		try {
			if(factory==null) {
			factory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return factory;
		
	}

}
