package mycart_entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;


@Entity
public class Category {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int categoryId;
	private String categoryTittle;
	private String categoryDiscription;
	

	@OneToMany(mappedBy = "category")
	private List<Product> products = new ArrayList<>();
	
	public Category() {
		
	}

	public Category(int categoryId, String categoryTittle, String categoryDiscription) {
		
		this.categoryId = categoryId;
		this.categoryTittle = categoryTittle;
		this.categoryDiscription = categoryDiscription;
	}

	public Category(String categoryTittle, String categoryDiscription ,List<Product> products) {
		
		this.categoryTittle = categoryTittle;
		this.categoryDiscription = categoryDiscription;
		this.products=products;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryTittle() {
		return categoryTittle;
	}

	public void setCategoryTittle(String categoryTittle) {
		this.categoryTittle = categoryTittle;
	}

	public String getCategoryDiscription() {
		return categoryDiscription;
	}

	public void setCategoryDiscription(String categoryDiscription) {
		this.categoryDiscription = categoryDiscription;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryTittle=" + categoryTittle + ", categoryDiscription="
				+ categoryDiscription + "]";
	}
	

}
