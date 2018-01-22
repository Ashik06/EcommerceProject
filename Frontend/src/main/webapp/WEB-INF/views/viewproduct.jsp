<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<center>List Of Products</center>
<table cellspacing="10">
<tr>
<th>S.No</th>
<th>Product id</th>
<th>ProductName</th>
<th>ProductDescription</th>
<th>Category</th>
<th>supplier</th>
<th>price</th>
<th>stock</th>
<th>EDIT</th>
<th> DELETE</th>
</tr>
<c:forEach items="${productList}" var="product" varStatus="status">
<tr>
<td>${status.count}</td>
<td>${product.productid}</td>
<td>${product.productName}</td>
<td>${product.productdescription}</td>
<td>${product.category}</td>
<td>${product.supplier}</td>
<td>${product.price}</td>
<td>${product.stock}</td>
<td><a href="editProduct?productId=${product.productid}">EDIT</a></td>
<td><a href="deleteProduct?productId=${product.productid}">DELETE</a></td>
</tr>
</c:forEach>
</table>
</body>
</html>