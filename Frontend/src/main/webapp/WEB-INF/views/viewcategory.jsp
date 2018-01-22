<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<center>List Of Category</center>
	<table cellspacing="10">
		<tr>
			<th>S.No</th>
			<th>Category id</th>
			<th>CategoryName</th>
			<th>CategoryDescription</th>
			<th>EDIT</th>
			<th>DELETE</th>
		</tr>
		<c:forEach items="${categoryList}" var="category" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${category.id}</td>
				<td>${category.categoryName}</td>
				<td>${category.description}</td>
				<td><a href="editCategory?categoryId=${category.id}">EDIT</a></td>
				<td><a href="deleteCategory?categoryId=${category.id}">DELETE</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>