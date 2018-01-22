<%@ include file="navbar.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>Login page</title>
<style type="text/css">
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: Roundest border;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
button {
    background-color: DodgerBlue;
    color: white;
    padding:20px 20px;
    margin: 30px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}
button:hover {
    opacity: 0.8;
}
body {
    background-color: purple;
}
</style>



	<c:url value="/j_spring_security_check" var="action"></c:url>
		<form class="form-signin"
			action="${pageContext.request.contextPath}/check" id="loginForm"
			method="post">
			<h2 class="form-signin-heading">Login</h2>
			<br> <label><b>Email</b></label> <input class="form-control"
				type="text" placeholder="Enter Email Id" name="email"> <br>
			<br> <label><b>Password</b></label> <input class="form-control"
				type="password" placeholder="Enter Password" name="password"
				required> <br> <br>

			<button style="width: 100px; margin-left: 90px;"
				class="btn btn-success btn-outline" type="submit" class="submitbtn">Login</button>
			<div id="inner">
			<c:url value="/all/RegistrationForm" var="register"></c:url>
			<u><a href="${register}">New User?</a></u><br>
	
				 <c:if test="${not empty error}">
				<div class="error"><b>${error}</b></div>
	 			</c:if> 
				<c:if test="${not empty logout}">
			<div class="msg"><b>${logout}</b></div>
				</c:if>	
			<br>
			<br>
			</div>
	</form> 

<%@ include file="footer.jsp" %>
