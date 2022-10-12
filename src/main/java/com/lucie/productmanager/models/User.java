package com.lucie.productmanager.models;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Entity
@Table(name="users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message="Username is required!")
    @Size(min=3, message="Username must be at least 3 characters")
    private String userName;

    @NotEmpty(message="Email is required!")
    @Email(message="Please enter a valid email!")
    private String email;

    @NotEmpty(message="Password is required!")
    @Size(min=8, message="Password must be at least 8 characters long")
    private String password;

    @Transient
    @NotEmpty(message="Confirm Password is required!")
    @Size(min=8, message="Password must be at least 8 characters long")
    private String confirm;

    @Column(updatable=false)
    @OneToMany(mappedBy="user", fetch = FetchType.LAZY)
    private List<Product> products;

    @Column(updatable=false)
    @OneToMany(mappedBy="user", fetch = FetchType.LAZY)
    private List<Product> createdProducts;

    @Column(updatable=false)
    @OneToMany(mappedBy="user", fetch = FetchType.LAZY)
    private List<Category> categories;

    @Column(updatable=false)
    @OneToMany(mappedBy="user", fetch = FetchType.LAZY)
    private List<Product> createdCategories;

    public User() {}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setBooks(List<Product> books) {
        this.products = products;
    }

    public List<Product> getCreatedProducts() {
        return createdProducts;
    }

    public void setCreatedProducts(List<Product> createdProducts) {
        this.createdProducts = createdProducts;
    }
}