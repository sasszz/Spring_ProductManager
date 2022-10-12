<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Manager</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link href="<c:url value="Desktop/BookBroker2/src/main/resources/static/css/bootstrap.min.css" />" rel="stylesheet" type="text/css">
    <link href="<c:url value="Desktop/BookBroker2/src/main/resources/static/css/main.css" />" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-light bg-secondary navbar-expand-lg mr-auto p-3">
    <div class="container">
        <span class="navbar-brand mb-0 h1 title">
            <img src="/imgs/book.png" width="25" height="25" class="d-inline-block align-top" alt="Book">
            Product Manager
        </span>
        <div>
            <ul class="navbar-nav gap-3">
                <li class="nav-item">
                    <a class="btn btn-outline-light title" href="/logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col">
            <div class="card mt-5 text-center mb-3 p-3">
                <div class="card-body">
                    <h3 class="card-title title text-dark">Welcome <c:out value="${user.userName}"></c:out></h3>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <div class="card mt-5 text-center mb-3 p-3">
                <div class="card-body">
                    <h5 class="card-title title text-dark">Products and Categories</h5>
                    <div class="row">
                        <div class="col">
                            <table class="table table-info table-bordered text-center mt-4 align-middle pb-5">
                                <thead>
                                <tr>
                                    <th>Products</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="text-center">
                                    <td>
                                        <ul class="text-center gap-5">
                                            <c:forEach var="product" items="${products}">
                                                <li><a class="btn btn-outline-light btn-sm" href="/products/${product.id}"><c:out value="${product.name}"></c:out></a></li>
                                            </c:forEach>
                                        </ul>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col">
                            <table class="table table-info table-bordered text-center mt-4 align-middle pb-5">
                                <thead>
                                <tr>
                                    <th>Categories</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="text-center">
                                    <td>
                                        <ul class="text-center gap-5">
                                            <c:forEach var="category" items="${categories}">
                                                <li><a class="btn btn-outline-light btn-sm" href="/categories/${category.id}"><c:out value="${category.name}"></c:out></a></li>
                                            </c:forEach>
                                        </ul>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card mt-5 text-center mb-3 p-3">
                <div class="card-body">
                    <h5 class="card-title title"><a class="btn btn-outline-light" href="/new/product">New Product</a></h5>
                </div>
            </div>
            <div class="card mt-5 text-center mb-3 p-3">
                <div class="card-body">
                    <h5 class="card-title title"><a class="btn btn-outline-light" href="/new/category">New Category</a></h5>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col">
        </div>
    </div>
</div>
</body>
</html>