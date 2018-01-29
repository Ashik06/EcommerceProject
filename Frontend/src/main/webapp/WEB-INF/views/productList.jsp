<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
/* div.gallery {
    margin: 5px;
    border: 1px solid #ccc;
    float:right;
    width: 180px;
}
div.gallery:hover {
    border: 1px solid #777;
}
div.gallery img {
    
    width: 100%;
    height: auto;
   
}
div.desc {
    padding: 15px;
    text-align: center;
}
 */
.img {
    position: relative;
    float: left;
    width:  160px;
    height: 200px;
    background-position: 200% 200%;
    background-repeat:   no-repeat;
    background-size:     cover;
    margin-left:7em;
    padding-top:3em;
}
 </style>
</head>
<body>
<c:forEach items="${productList}" var="product" >
<div class="img" >
<a href="productdescription?productid=${product.productid}">
<img src="resources/images/product/${product.productid}.jpg" width="200" height="200">
</a>
Name : ${product.productName}
price : ${product.price}
</div>
</c:forEach>
</body>
</html>