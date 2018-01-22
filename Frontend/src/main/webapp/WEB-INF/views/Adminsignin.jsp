<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
<link rel="text/stylesheet">
li a, .dropbtn {
    display: inline-block;
    color:#E0E0E0;
    text-align:center;
    padding: 14px 16px;
    text-decoration: none;
}
li a:hover, .dropdown:hover.dropbtn {
    background-color:#E0E0E0;
}
li.dropdown {
    display: inline-block;
}
.dropdown-content {
    display: none;
    position: absolute;
    background-color:#E0E0E0;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}
.dropdown-content a {
    color:#E0E0E0;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}
.dropdown-content a:hover {background-color:#E0E0E0 ;}
.dropdown:hover .dropdown-content {
    display: block;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/navbar.jsp" %>
 
<div>
<ul>
    <li class="dropdown"><div class="dropdown">
  <span class="dropbtn">CATEGORY</span>
  <div class="dropdown-content">
      <a href="newCategory" >ADD</a>
      <a href="viewCategory" >VIEW</a>
  </div>
  </div></li>
  <li class="dropdown"><div class="dropdown">
  <span class="dropbtn">SUPPLIER</span>
  <div class="dropdown-content">
   <a href="newSupplier" >add</a>
  <a href="viewSupplier" >view</a>
</div>
</div>
</li>
   <li class="dropdown"><div class="dropdown">
  <span class="dropbtn">PRODUCT</span>
  <div class="dropdown-content">
   <a href="newProduct" >add</a>
  <a href="viewProduct" >view</a>

</div>  
 </div></li>
 </ul>
 </div>
<br><br>
<c:choose>
<c:when test="${not empty addCategoryClicked}">
<%@include file="/WEB-INF/views/category.jsp" %>
 </c:when>
 <c:when test="${not empty viewCategoryClicked}">
<%@include file="/WEB-INF/views/viewcategory.jsp" %>
 </c:when>
 <c:when test="${not empty EditCategoryClicked}">
<%@include file="/WEB-INF/views/EditCategory.jsp" %>
 </c:when>
<c:when test="${not empty addProductClicked}">
<%@include file="/WEB-INF/views/Product.jsp" %>
</c:when>
<c:when test="${not empty viewProductClicked}">
<%@include file="/WEB-INF/views/viewproduct.jsp" %>
 </c:when>
 <c:when test="${not empty EditProductClicked}">
<%@include file="/WEB-INF/views/EditProduct.jsp" %>
 </c:when>
<c:when test="${not empty addSupplierClicked}">
<%@include file="/WEB-INF/views/supplier.jsp" %>
</c:when>
<c:when test="${not empty viewSupplierClicked}">
<%@include file="/WEB-INF/views/viewsupplier.jsp" %>
 </c:when>
 <c:when test="${not empty EditSupplierClicked}">
<%@include file="/WEB-INF/views/EditSupplier.jsp" %>
 </c:when>
<c:otherwise>
<br>
<br>
WELCOME ADMIN!!s
</c:otherwise>
</c:choose>
</body>
</html>