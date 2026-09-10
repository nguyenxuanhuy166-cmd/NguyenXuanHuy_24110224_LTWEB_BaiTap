package vn.iotstar.dao;

import java.util.List;
import vn.iotstar.model.Product;

public interface ProductDao {
	void insert(Product product);
	void update(Product product);
	void delete(int productId) throws Exception;
	Product findById(int productId);
	List<Product> findAll();
	List<Product> findAll(int page, int pagesize);
	int count();
}
