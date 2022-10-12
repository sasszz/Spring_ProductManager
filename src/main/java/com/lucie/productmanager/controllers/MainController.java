package com.lucie.productmanager.controllers;

import com.lucie.productmanager.models.Category;
import com.lucie.productmanager.models.Product;
import com.lucie.productmanager.models.LoginUser;
import com.lucie.productmanager.models.User;
import com.lucie.productmanager.services.CategoryService;
import com.lucie.productmanager.services.ProductService;
import com.lucie.productmanager.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/")
    public String index(Model model) {
        // Bind empty User and LoginUser objects to the JSP to capture the form input
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {

        User user = userService.register(newUser, result);

        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before re-rendering the page.
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }

        session.setAttribute("userId", user.getId());

        return "redirect:/home";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {

        User user = userService.login(newLogin, result);

        if(result.hasErrors() || user==null) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }

        session.setAttribute("userId", user.getId());

        return "redirect:/home";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {

        // Set userId to null and redirect to login/register page
        session.setAttribute("userId", null);

        return "redirect:/";
    }

    @GetMapping("/home")
    public String home(HttpSession session, Model model) {

        Long userId = (Long) session.getAttribute("userId");
        if(userId == null) {
            return "redirect:/logout";
        }

        model.addAttribute("user", userService.findById(userId));

        List<Product> products = productService.allProducts();
        List<Category> categories = categoryService.allCategories();

        model.addAttribute("products", products);
        model.addAttribute("categories", categories);

        return "home.jsp";
    }

    @GetMapping("/new/product")
    public String addProduct(@ModelAttribute("product") Product product, HttpSession session) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        return "newProduct.jsp";
    }

    @PostMapping("/new/product")
    public String addProduct(@Valid @ModelAttribute("product") Product product, BindingResult result, HttpSession session) {

        Long userId = (Long) session.getAttribute("userId");
        if(userId == null) {
            return "redirect:/logout";
        }

        if(result.hasErrors()) {
            return "newProduct.jsp";
        }else {
            productService.addProduct(new Product(product.getName(), product.getDescription(), product.getPrice(), userService.findById(userId)));
            return "redirect:/home";
        }
    }

    @GetMapping("/products/{id}")
    public String showProduct(@PathVariable("id") Long id, HttpSession session, Model model) {

        Long userId = (Long) session.getAttribute("userId");
        if(userId == null) {
            return "redirect:/logout";
        }

        model.addAttribute("user", userService.findById(userId));

        List<Category> categories = categoryService.allCategories();
        model.addAttribute("categories", categories);

        Product product = productService.findById(id);

        model.addAttribute("product", product);
        model.addAttribute("assignedCategories", categoryService.getAssignedProducts(product));
        model.addAttribute("unassignedCategories", categoryService.getUnassignedProducts(product));

        return "showProduct.jsp";
    }

    @PostMapping("/products/{id}")
    public String editProduct(@PathVariable("id") Long id, @RequestParam(value="categoryId") Long catId,  Model model) {
        Product product = productService.findById(id);
        Category category = categoryService.findById(catId);
        product.getCategories().add(category);
        productService.updateProduct(product);
        model.addAttribute("assignedCategories", categoryService.getAssignedProducts(product));
        model.addAttribute("unassignedCategories", categoryService.getUnassignedProducts(product));
        return "redirect:/products/" + id;
    }

    @GetMapping("/products/edit/{id}")
    public String editProduct(@PathVariable("id") Long id, HttpSession session, Model model) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        Product product = productService.findById(id);
        model.addAttribute("product", product);
        return "updateProduct.jsp";
    }

    @PutMapping("/products/edit/{id}")
    public String update(
            @PathVariable("id") Long id,
            @Valid @ModelAttribute("product") Product product,
            BindingResult result,
            HttpSession session) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        if(result.hasErrors()) {
            return "updateBook.jsp";
        }else {
            productService.updateProduct(product);
            return "redirect:/home";
        }
    }

    @RequestMapping("/products/delete/{id}")
    public String deleteProduct(@PathVariable("id") Long id, HttpSession session) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        productService.deleteProduct(productService.findById(id));

        return "redirect:/home";
    }


    @GetMapping("/new/category")
    public String addCategory(@ModelAttribute("category") Category category, HttpSession session) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        return "newCategory.jsp";
    }

    @PostMapping("/new/category")
    public String addNewCategory(@Valid @ModelAttribute("category") Category category, HttpSession session, BindingResult result, Model model) {
        Long userId = (Long) session.getAttribute("userId");

        if(result.hasErrors()) {
            return "newCategory.jsp";
        }else {
            categoryService.addCategory(new Category(category.getName(), userService.findById(userId)));
            return "redirect:/home";
        }

    }

    @GetMapping("/categories/{id}")
    public String showCategory(@PathVariable("id") Long id, HttpSession session, Model model) {

        Long userId = (Long) session.getAttribute("userId");
        if(userId == null) {
            return "redirect:/logout";
        }

        model.addAttribute("user", userService.findById(userId));

        Category category = categoryService.findById(id);
        model.addAttribute("assignedProducts", productService.getAssignedCategories(category));
        model.addAttribute("unassignedProducts", productService.getUnassignedCategories(category));
        model.addAttribute("category", categoryService.findById(id));
        return "showCategory.jsp";
    }

    @PostMapping("/categories/{id}")
    public String editAddCategory(@PathVariable("id") Long id, @RequestParam(value="productId") Long productId, Model model) {
        Category category = categoryService.findById(id);
        Product product = productService.findById(productId);
        category.getProducts().add(product);
        categoryService.updateCategory(category);
        model.addAttribute("assignedProducts", productService.getAssignedCategories(category));
        model.addAttribute("unassignedProducts", productService.getUnassignedCategories(category));
        return "redirect:/categories/" + id;
    }

    @PostMapping("/categories/remove/{id}")
    public String editRemoveCategory(@PathVariable("id") Long id, @RequestParam(value="productId2") Long productId2, Model model) {
        Category category = categoryService.findById(id);
        Product product = productService.findById(productId2);
        category.getProducts().remove(product);
        categoryService.updateCategory(category);
        model.addAttribute("assignedProducts", productService.getAssignedCategories(category));
        model.addAttribute("unassignedProducts", productService.getUnassignedCategories(category));
        return "redirect:/categories/" + id;
    }

    @GetMapping("/categories/edit/{id}")
    public String editCategory(@PathVariable("id") Long id, HttpSession session, Model model) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        Category category = categoryService.findById(id);
        model.addAttribute("category", category);
        return "updateCategory.jsp";
    }

    @PutMapping("/categories/edit/{id}")
    public String updateCategory(
            @PathVariable("id") Long id,
            @Valid @ModelAttribute("category") Category category,
            BindingResult result,
            HttpSession session) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        if(result.hasErrors()) {
            return "updateCategory.jsp";
        }else {
            categoryService.updateCategory(category);
            return "redirect:/home";
        }
    }

    @RequestMapping("/categories/delete/{id}")
    public String deleteBook(@PathVariable("id") Long id, HttpSession session) {

        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        categoryService.deleteCategory(categoryService.findById(id));

        return "redirect:/home";
    }

}
