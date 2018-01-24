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
<%@include file="/WEB-INF/views/navbar.jsp" %>

<c:choose>
<c:when test="${not empty productdescription}">
   <%@include file="/WEB-INF/views/productdescription.jsp" %>
</c:when>
<c:when test="${not empty myKartClicked}">
   <%@include file="/WEB-INF/views/mycart.jsp" %>
</c:when>
<c:otherwise><%@include file="/WEB-INF/views/productList.jsp" %>
     </c:otherwise>
    
</c:choose>
</body>


</html>