package com.lucie.productmanager.repositories;

import java.util.List;

import com.lucie.productmanager.models.Category;
import com.lucie.productmanager.models.Product;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface CategoryRepository extends CrudRepository<Category, Long> {
    List<Category> findAll();
    Category findByIdIs(Long id);
    List<Category> findAllByProducts(Product product);
    List<Category> findByProductsNotContains(Product product);
}