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
<legend> supplier</legend>
<form action="afteredit" action="post">
Id:<br>
  <input type="text" name="supplierid"value="${supplier.supplierid}" readonly="true"><br>
  name:<br>
  <input type="text" name="name" value="${supplier.name}"><br>
   phoneNo:<br>
  <input type="text" name="mobileno" value="${supplier.mobileno}"><br>
  emailId:<br><input type="text" name="emailId"  value="${supplier.emailId}"><br>
 address:<br><input type="text" name="address" value="${supplier.address}"><br>
  <input type="submit" name="submit">
</form>
</fieldset>
</body>
</html>