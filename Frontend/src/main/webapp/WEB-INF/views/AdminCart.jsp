<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>My Cart</center>
<center>List Of Cart</center>
<table cellspacing="20">
<tr>
<th>S.No</th>
<th>productName</th>
<th>quantity</th>
<th>price</th>
<th>total</th>

<th> DELETE</th>
</tr>
<c:forEach items="${cartList}" var="cart" varStatus="status">

<tr>
<td>${status.count}</td>
<td>${cart.productName}</td>
<td>${cart.quantity}</td>
<td>${cart.price}</td>
<td>${cart.total}</td>

<td><a href="deleteCart?cartId=${cart.cartid}">DELETE</a></td>
</tr>
</c:forEach>
<tr>
<td> Grand Total: </td>
<td> ${total}</td> 
</tr>
<tr>
<td><a href="proceed"><button>proceddelivery</button></a>
</td>
<td><a href="#"><button>grand total</button></a>
</td>
</tr>
</table>
</body>
</html>