<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<style>
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color:purple ;
}

li {
	float: left;
}

li a, .dropbtn {
	display: inline-block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	background-color: purple;
}

li a:hover, .dropdown:hover .dropbtn {
	background-color: red;
}

li.dropdown {
	display: purple;
	
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: white;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
	background-color: purple;

}

.dropdown-content a:hover {
	background-color: #f1f1f1
}

.dropdown:hover .dropdown-content {
	display: block;
	
}

</style>
</head>
<body>

	<ul>
		<li><a href="${pageContext.request.contextPath}/home">Home</a></li>
		<li><a href="${pageContext.request.contextPath}/product">Products</a></li>

		<c:if test="${pageContext.request.userPrincipal.name==null}">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${pageContext.request.contextPath}/login"><i
						class="fa fa-sign-in" aria-hidden="true"></i> Log In</a></li>
				<li><a href="${pageContext.request.contextPath}/register"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>

			</ul>
		</c:if>
		<c:if test="${pageContext.request.userPrincipal.name!=null}">
			<security:authorize access="hasRole('ROLE_ADMIN')">
				<ul class="nav navbar-nav navbar-left">
					<div class="dropdown">
						<button class="dropbtn">
								

		
				<i class="fa fa-bars" aria-hidden="true"></i> 	Admin control
							
							<div class="dropdown-content">
								<a href="category">
									<i class="fa fa-list"  aria-hidden="true"></i> Category
								</a> <a href="supplier"><i
									class="fa fa-users" aria-hidden="true"></i> Supplier </a> <a
									href="Product"><i
									class="fa fa-product-hunt" aria-hidden="true"></i> Product </a> <a
									href="${pageContext.request.contextPath}/admin/productlist"><i
									class="fa fa-list" aria-hidden="true"></i> Product List</a>
							</div>
						</button>
					</div>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<div class="dropdown">
						<button class="dropbtn">Welcome:${pageContext.request.userPrincipal.name}</button>
						<div class="dropdown-content">

							<a href="${pageContext.request.contextPath}/logout"><i
								class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
						</div>
					</div>
				</ul>
			</security:authorize>

			<security:authorize access="hasRole('ROLE_USER')">
				<ul class="nav navbar-nav navbar-left">
					<li><a href="${pageContext.request.contextPath}/user/prolist"><i
							class="fa fa-list-alt" aria-hidden="true"></i>All Product</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<div class="dropdown">
						<button class="dropbtn">Welcome:${pageContext.request.userPrincipal.name}</button>
						<div class="dropdown-content">
							
                                 <c:if
											test="${pageContext.request.userPrincipal.name != null }">
											<a href="mycart"> My cart</a>
											
										</c:if>
								
								 <a
								href="${pageContext.request.contextPath}/logout"><i
								class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
								
						</div>
					</div>
				</ul>


			</security:authorize>
		</c:if>

	</ul>

</body>
</html>
