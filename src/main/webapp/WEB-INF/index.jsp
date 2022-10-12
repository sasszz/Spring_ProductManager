<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
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
                    <a class="btn btn-outline-dark text-dark title disabled">We make products fun!</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col">
            <div class="card mt-5 mb-3 p-3">
                <div class="card-body">
                    <h5 class="card-title text-dark text-center title">Register</h5>
                    <form:form action="/register" method="post" modelAttribute="newUser">
                        <div>
                            <div class="form-group mt-4">
                                <form:label path="userName">Username</form:label>
                                <form:input placeholder="Create a username" class="form-control" path="userName"/>
                                <form:errors path="userName" class="text-danger"/>
                            </div>
                            <div class="form-group mt-4">
                                <form:label path="email">Email</form:label>
                                <form:input placeholder="Enter email" class="form-control" path="email"/>
                                <form:errors path="email" class="text-danger"/>
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group mt-4">
                                <form:label path="password">Password</form:label>
                                <form:password placeholder="Password" class="form-control" path="password"/>
                                <form:errors path="password" class="text-danger"/>
                            </div>
                            <div class="form-group mt-4">
                                <form:label path="confirm">Confirm Password</form:label>
                                <form:password placeholder="Confirm Password" class="form-control" path="confirm"/>
                                <form:errors path="confirm" class="text-danger"/>
                            </div>
                        </div>
                        <input class="btn btn-outline-light mt-4 align-self-end" type="submit" value="Register">
                    </form:form>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card mt-5 mb-3 p-3">
                <div class="card-body">
                    <h5 class="card-title text-dark text-center title">Login</h5>
                    <div class="form-group">
                        <form:form action="/login" method="post" modelAttribute="newLogin">
                            <div class="form-group mt-4">
                                <form:label path="email">Email</form:label>
                                <form:input placeholder="Enter email" class="form-control" path="email"/>
                                <form:errors path="email" class="text-danger"/>
                            </div>
                            <div class="form-group mt-4">
                                <form:label class="align-self-start" path="password">Password</form:label>
                                <form:password placeholder="Password" class="form-control" path="password"/>
                                <form:errors path="password" class="text-danger"/>
                            </div>
                            <input class="btn btn-outline-light mt-4 align-self-end" type="submit" value="Login">
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>