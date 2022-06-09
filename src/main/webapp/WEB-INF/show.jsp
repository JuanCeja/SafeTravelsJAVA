<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Expense Details</h1>
<p>Expense Name: <strong><c:out value="${expense.expense }"/></strong> </p>
<p>Vendor: <strong><c:out value="${expense.vendor }"/></strong></p>
<p>Amount Spent: <strong><c:out value="${expense.amount }"/></strong></p>
<a href="/expenses">Go Back to Expenses</a>
</body>
</html>