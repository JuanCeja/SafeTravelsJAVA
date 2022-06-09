<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form:form action="/expense/${editExpense.id}" method="post"
		modelAttribute="editExpense">
		<input type="hidden" name="_method" value="put">
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