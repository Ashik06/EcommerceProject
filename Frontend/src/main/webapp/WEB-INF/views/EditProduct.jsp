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
<fieldset>
<legend>Product</legend>
  <form action="AfterEdit" method="post">
  product id:<input class="form-control" type="text" name="productid" value="${product.productid}" readonly="true"><br>
  
  product Name:
  <input class="form-control" type="text" name="productName" value="${product.productName}"><br>
  Product Description:
  <input class="form-control" type="text" name="productdescription" value="${product.productdescription}"><br>
   
   Category:<select name="category">
   <option value="">select your category</option>
   	<c:forEach items="${categoryList}" var="category">
<option value="${category.categoryName}">${category.categoryName}</option>
</c:forEach>
</select><br>
Supplier:<select name="supplier">
   <option value="">select your supplier</option>
   <c:forEach items="${supplierList}" var="supplier">	
   <option value="${supplier.name}">${supplier.name}</option>
   </c:forEach>
</select><br>
Price:
<input class="form-control" type="text" name="price" value="${product.price}"><br>
stock:
<input class="form-control" type="text" name="Stock" value="${product.stock}"><br>
<input type="submit" name="submit">
</form>
</fieldset>
</body>
</html>