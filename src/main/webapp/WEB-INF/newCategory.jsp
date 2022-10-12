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
        <div class="col d-flex flex-column align-items-center justify-content-center">
            <div class="card mt-5 text-center mb-3 p-3">
                <div class="card-body">
                    <h5 class="card-title title text-dark">New Category</h5>
                    <form:form action="/new/category" method="post" modelAttribute="category">
                        <div class="row mt-4">
                            <div class="col">
                                <form:label path="name">Name</form:label>
                                <form:input class="form-control" path="name"/>
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="col d-flex flex-column">
                                <form:errors path="name" class="text-danger"/>
                            </div>
                        </div>
                        <input class="btn btn-outline-light w-50 title align-self-center" type="submit" value="Submit"/>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>