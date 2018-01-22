<jsp:include page="navbar.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spr"%>

<style>
input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=submit] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
input[type=submit]:hover {
    background-color: #45a049;
}

div {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
</style>



<div class="container">

	<div class="col-lg-8">
		<div class="row">
			<spr:form modelAttribute="user" action="saveRegister"
				name="registerForm" id="registerForm" method="post">
				<div class="col-lg-8">
					<h1>Customer Registration Form</h1>
					<div class="form-group">
						<label>First Name</label>
						<spr:input path="firstname" placeholder="Enter first name"
							class="form-control" />
					</div>

					<div class="form-group">
						<label>Last Name</label>
						<spr:input path="lastname" placeholder="Enter last name"
							class="form-control" />
					</div>

					<div class="form-group">
						<label>Email Id</label>
						<spr:input path="email" placeholder="Enter Email Id"
							class="form-control" />
					</div>

					<div class="form-group">
						<label>Phone No</label>
						<spr:input path="phone" placeholder="Enter phone number"
							class="form-control" />
					</div>
					<div class="form-group">
						<label>Password</label>
						<spr:input type="password" path="password"
							placeholder="Enter password" class="form-control" />
					</div>
					<div class="form-group">

						<label>Address</label>
						<spr:input path="address" placeholder="Enter Address"
							class="form-control" />
					</div>
					<div class="form-group">
						<label>Country</label>
						<spr:input path="country" placeholder="Enter the country"
							class="form-control" />
					</div>

					<button type="submit" class="submitbtn">Submit</button>
					<button type="reset" class="erasebtn">Reset</button>
				</div>

			</spr:form>
		</div>
	</div>
</div>
<div
	style="width: 100%; height: 2px; margin-top: 400px; background: black;"></div>




<jsp:include page="footer.jsp"></jsp:include>