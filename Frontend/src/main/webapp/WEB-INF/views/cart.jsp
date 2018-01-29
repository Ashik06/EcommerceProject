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
<legend> category</legend>
<form action="addCart">
  username:<br>
  <input type="text" name="name"><br>
  productName:<br>
  <input type="text" name="productName"><br>
    price:<br>
  <input type="text" name=" price"><br>
   total:<br>
  <input type="text" name="total"><br>
   quantity:<br>
  <input type="text" name="quantity"><br>
   status:<br>
  <input type="text" name="status"><br>
  <input type="submit" name="submit" value="new cart">
</form>
</fieldset>
</body>
</html>