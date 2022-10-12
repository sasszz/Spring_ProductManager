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
    <script src="/script.js"></script>
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
                    <a class="btn btn-outline-light title" href="/home">Back to Home</a>
                </li>
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
                    <h5 class="card-title title text-dark"><c:out value="${product.name}"></c:out></h5>
                    <p class="mt-3"><span class="text-primary"><c:out value="${product.user.userName}"></c:out></span> created this product.</span> </p>
                    <h5 class="title text-dark mt-5">Assign Category:</h5>
                    <div class="d-flex flex-column align-items-center justify-content-center">
                        <form action="/products/${id}" method="post">
                            <select name="categoryId" id="categoryId" class="form-select">
                                <c:forEach var="category" items="${unassignedCategories}">
                                    <option value="${category.id}">${category.name}</option>
                                </c:forEach>
                            </select>
                            <input class="btn btn-outline-info title btn-sm mt-3" type="submit" value="Add"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="row">
                <div class="card mt-5 text-center mb-3 p-3">
                    <div class="card-body">
                        <h5 class="title text-dark">Info</h5>
                        <table class="table table-info table-bordered text-center mt-4 align-middle pb-5">
                            <thead>
                            <tr>
                                <th>Price</th>
                                <th>Description</th>
                                <th>Category</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="text-center">
                                <td><fmt:formatNumber type="CURRENCY" value="${product.price}" /></td>
                                <td><c:out value="${product.description}"></c:out></td>
                                <td>
                                    <ul class="text-center gap-5">
                                        <c:forEach var="category" items="${assignedCategories}">
                                            <li><a class="btn btn-outline-light btn-sm" href="/categories/${category.id}"><c:out value="${category.name}"></c:out></a></li>
                                        </c:forEach>
                                    </ul>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="row d-flex flex-row gap-3">
                            <c:if test = "${product.user.id==user.id}">
                                <form action="/products/edit/${product.id}">
                                    <input class="btn btn-outline-warning title btn-sm" type="submit" value="Edit">
                                </form>
                                <form action="/products/delete/${product.id}">
                                    <input class="btn btn-outline-danger title btn-sm" type="submit" value="Delete">
                                </form>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>