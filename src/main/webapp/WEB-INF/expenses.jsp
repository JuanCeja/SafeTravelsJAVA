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
	<h1>Safe Travels</h1>
	<table>
		<thead>
			<tr>
				<td>Expense</td>
				<td>Vendor</td>
				<td>Amount</td>
				<td>Actions</td>
				<td>Delete</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${expenses}" var="expense">
				<tr>
					<td> <a href="/expense/show/${expense.id }"><c:out value="${expense.expense}" /></a></td>
					<td><c:out value="${expense.vendor}" /></td>
					<td>$ <c:out value="${expense.amount}" />
					</td>
					<td><a href="/expenses/edit/${expense.id }">edit</a></td>
					
					<td> <form action="/expense/delete/${expense.id}" method="post">
						    <input type="hidden" name="_method" value="delete">
						    <input type="submit" value="Delete">
					</form></td>
					
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<h1>Add an expense:</h1>
	<form:form action="/expenses/create" method="post"
		modelAttribute="newExpense">
		<p>
			<form:label path="expense">Expense</form:label>
			<form:errors path="expense" />
			<form:input path="expense" />
		</p>
		<p>
			<form:label path="vendor">Vendor</form:label>
			<form:errors path="vendor" />
			<form:textarea path="vendor" />
		</p>
		<p>
			<form:label path="amount">Amount</form:label>
			<form:errors path="amount" />
			<form:input path="amount" />
		</p>
		<input type="submit" value="Submit" />
	</form:form>

</body>
</html>