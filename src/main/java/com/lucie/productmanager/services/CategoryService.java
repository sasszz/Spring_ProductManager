package com.lucie.productmanager.services;

import java.util.List;
import java.util.Optional;

import com.lucie.productmanager.models.Category;
import com.lucie.productmanager.models.Product;
import com.lucie.productmanager.repositories.CategoryRepository;
import org.springframework.stereotype.Service;



@Service
public class CategoryService {
    private final CategoryRepository categoryRepository;

    public CategoryService (CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public List<Category> allCategories(){
        return categoryRepository.findAll();
    }

    public List<Category> getAssignedProducts(Product product){
        return categoryRepository.findAllByProducts(product);
    }

    public List<Category> getUnassignedProducts(Product product){
        return categoryRepository.findByProductsNotContains(product);
    }

    public Category findById(Long id) {
        Optional<Category> optionalCategory = categoryRepository.findById(id);
        if(optionalCategory.isPresent()) {
            return optionalCategory.get();
        }else {
            return null;
        }
    }

    public Category addCategory(Category category) {
        return categoryRepository.save(category);
    }

    public Category updateCategory(Category category) {
        return categoryRepository.save(category);
    }

    public void deleteCategory(Category category) {
        categoryRepository.delete(category);
    }
}