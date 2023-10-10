package mycart;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Helper {

	public static String get10Words(String desc) {
		String[] str = desc.split(" ");

		if(str.length > 10) {
			String rs = "";

			for(int i = 0; i <= 10; i++) {

				rs= rs+str[i]+" ";
			}
			return(rs + "...");
		}else{
			return(desc + "...");

		}
	}
	
	public static Map<String,Long> getCounts(SessionFactory factory){
		Session session =factory.openSession();
		String q1="Select count(*) from Users";
		String q2="Select count(*) from Product";
		Query query1=session.createQuery(q1);
		Query query2=session.createQuery(q2);
		long userCount=(long) query1.list().get(0);
		long productCount=(long) query2.list().get(0);
		System.out.println(userCount+" "+productCount);
		Map<String,Long> map=new HashMap<>();
		map.put("usercount",userCount);
		map.put("productcount",productCount);
		session.close();
		return map;
	}
	

}
