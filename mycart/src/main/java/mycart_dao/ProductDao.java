package mycart_dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.SharedSessionContract;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import mycart_entities.Product;

public class ProductDao {
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		this.factory = factory;
	}
public boolean saveproduct(Product product) {
	boolean f=false;
	try {
		
	Session session=this.factory.openSession();
		Transaction tx=session.beginTransaction();
		
		
		session.save(product);
		
		
		
		tx.commit();
		session.close();
		f=true;
	} catch (Exception e) {
		e.printStackTrace();
		f=false;
	}
	
	return f;
	
}
public List<Product> getAllProducts(){
	
	Session session=this.factory.openSession();
	Query query=session.createQuery("from Product");
	List<Product> list=query.list();
	return list;
}
public List<Product> getAllProductsById(int cid){
	
	Session session=this.factory.openSession();
	Query query=session.createQuery("from Product as p where p.category.categoryId =:id");
	query.setParameter("id", cid);
	List<Product> list=query.list();
	return list;
}
public int deleteProductBypID(int pId) {
	
	Session session=this.factory.openSession();
	String q1="Delete from Product where pId =:id";
	Query query=session.createQuery(q1);
	query.setParameter("id", pId);
	
	Transaction tx =session.beginTransaction();
	
	int count=query.executeUpdate();
	
	
	tx.commit();
	session.close();

	
	return count;
	
	
}
public List<Product> fetchProductById(int pId){
	
	Session session=this.factory.openSession();
	Query query=session.createQuery("from Product  where pId =:id");
	query.setParameter("id", pId);
	List<Product> list=query.list();
	return list;
}


public int updateProdcutById(String pName,String pDesc,int pPrice,int pQuantity,int pDiscount,int pId) {
	
	Session session=this.factory.openSession();
	String q1="update Product set pName=:pName,pDesc=:pDesc,pPrice=:pPrice,PQuantity=:pQuantity,pDiscount=:pDiscount where pId =:pId";
	Query query=session.createQuery(q1);
	query.setParameter("pName", pName);
	query.setParameter("pDesc", pDesc);
	query.setParameter("pPrice", pPrice);
	query.setParameter("pQuantity", pQuantity);
	query.setParameter("pDiscount", pDiscount);
	query.setParameter("pId", pId);
	

	Transaction tx =session.beginTransaction();
	
	int count=query.executeUpdate();
	
	
	tx.commit();
	session.close();

	
	return count;
	
	
}


}
